-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------
local _, Core = ...
local Class = Core.Class

local HBD = LibStub('HereBeDragons-2.0')
local HBDPins = LibStub('HereBeDragons-Pins-2.0')

-------------------------------------------------------------------------------
------------------------------------- MAP -------------------------------------
-------------------------------------------------------------------------------

--[[

Base class for all maps.

    id (integer): MapID value for this map
    intro (Node): An intro node to display when phased
    phased (boolean): If false, hide all nodes except the intro node.
    settings (boolean): Create a settings panel for this map (default: false).

--]]

local Map = Class('Map', nil,
    {id = 0, intro = nil, phased = true, settings = false})

function Map:Initialize(attrs)
    for k, v in pairs(attrs) do self[k] = v end

    self.nodes = {}
    self.groups = {}
    self.fgroups = {}
    self.settings = self.settings or false

    setmetatable(self.nodes, {
        __newindex = function(nodes, coord, node)
            self:AddNode(coord, node)
        end
    })

    -- auto-register this map
    if Core.maps[self.id] then error('Map already registered: ' .. self.id) end
    Core.maps[self.id] = self
end

function Map:AddNode(coord, node)
    if not Core.IsInstance(node, Core.node.Node) then
        error(format('All nodes must be instances of the Node() class: %d %s',
            coord, tostring(node)))
    end

    if node.fgroup then
        if not self.fgroups[node.fgroup] then
            self.fgroups[node.fgroup] = {}
        end
        local fgroup = self.fgroups[node.fgroup]
        fgroup[#fgroup + 1] = coord
    end

    if node.group ~= Core.groups.QUEST then
        -- Initialize group defaults and UI controls for this map if the group does
        -- not inherit its settings and defaults from a parent map
        if self.settings then Core.CreateGroupOptions(self, node.group) end

        -- Keep track of all groups associated with this map
        if not self.groups[node.group.name] then
            self.groups[#self.groups + 1] = node.group
            self.groups[node.group.name] = true
        end
    end

    rawset(self.nodes, coord, node)

    -- Add node to each parent map ID requested
    if node.parent then
        -- Calculate world coordinates for the node
        local x, y = HandyNotes:getXY(coord)
        local wx, wy = HBD:GetWorldCoordinatesFromZone(x, y, self.id)
        if not (wx and wy) then
            error(
                format('Missing world coords: (%d: %d) => ???', self.id, coord))
        end
        for i, parent in ipairs(node.parent) do
            -- Calculate parent zone coordinates and add node
            local px, py = HBD:GetZoneCoordinatesFromWorld(wx, wy, parent.id)
            if not (px and py) then
                error(format('Missing map coords: (%d: %d) => (%d: ???)',
                    self.id, coord, parent.id))
            end
            local map = Core.maps[parent.id] or Map({id = parent.id})
            map.nodes[HandyNotes:getCoord(px, py)] = Core.Clone(node, {
                pois = (parent.pois or false)
            })
        end
    end
end

function Map:HasEnabledGroups()
    for i, group in ipairs(self.groups) do
        if group:IsEnabled() then return true end
    end
    return false
end

function Map:CanFocus(node)
    if node.focusable then return true end
    if type(node.pois) == 'table' then return true end
    if node.fgroup then
        for i, coord in ipairs(self.fgroups[node.fgroup]) do
            if type(self.nodes[coord].pois) == 'table' then
                return true
            end
        end
    end
    return false
end

function Map:CanDisplay(node, coord, minimap)
    -- Check if the zone is still phased
    if node ~= self.intro and not self.phased then return false end

    -- Minimap may be disabled for this node
    if not node.minimap and minimap then return false end

    -- Node may be faction restricted
    if node.faction and node.faction ~= Core.faction then return false end

    return true
end

function Map:IsNodeEnabled(node, coord, minimap)
    local db = Core.addon.db

    -- Check for dev force enable
    if Core:GetOpt('force_nodes') or Core.dev_force then return true end

    -- Check if we've been hidden by the user
    if db.char[self.id .. '_coord_' .. coord] then return false end

    -- Check if the node is disabled in the current context
    if not self:CanDisplay(node, coord, minimap) then return false end

    -- Check if node's group is disabled
    if not node.group:IsEnabled() then return false end

    -- Check if node's group is checked/unchecked
    if not node.group:GetDisplay(self.id) then return false end

    -- Check for prerequisites and quest (or custom) completion
    return node:IsEnabled()
end

function Map:Prepare()
    for coord, node in pairs(self.nodes) do
        -- prepare each node once to ensure its dependent data is loaded
        if not node._prepared then
            node:Prepare()
            node._prepared = true
        end
    end
end

function Map:SetFocus(node, state, hover)
    local attr = hover and '_hover' or '_focus'
    if node.fgroup then
        for i, coord in ipairs(self.fgroups[node.fgroup]) do
            self.nodes[coord][attr] = state
        end
    else
        node[attr] = state
    end
end

-------------------------------------------------------------------------------
---------------------------- MINIMAP DATA PROVIDER ----------------------------
-------------------------------------------------------------------------------

local MinimapPinsKey = "HandyNotes_Core" .. 'MinimapPins'
local MinimapDataProvider = CreateFrame('Frame', "HandyNotes_Core" .. 'MinimapDP')
local MinimapPinTemplate = "HandyNotes_Core" .. 'MinimapPinTemplate'
local MinimapPinMixin = {}

_G["HandyNotes_Core" .. 'MinimapPinMixin'] = MinimapPinMixin

MinimapDataProvider.facing = GetPlayerFacing()
MinimapDataProvider.pins = {}
MinimapDataProvider.pool = {}
MinimapDataProvider.minimap = true
MinimapDataProvider.updateTimer = 0

function MinimapDataProvider:ReleaseAllPins()
    for i, pin in ipairs(self.pins) do
        if pin.acquired then
            self.pool[pin] = true
            pin.acquired = false
            pin:OnReleased()
            pin:Hide()
        end
    end
end

function MinimapDataProvider:AcquirePin(template, ...)
    local pin = next(self.pool)
    if pin then
        self.pool[pin] = nil -- remove it from the pool
    else
        pin = CreateFrame('Button', "HandyNotes_Core" .. 'Pin' .. (#self.pins + 1),
            Minimap, template)
        pin.provider = self
        pin:OnLoad()
        pin:Hide()
        self.pins[#self.pins + 1] = pin
    end
    pin.acquired = true
    pin:OnAcquired(...)
end

function MinimapDataProvider:RefreshAllData()
    -- Skip refresh if rotate minimap is on and we failed to get a facing value
    if GetCVar('rotateMinimap') == '1' and self.facing == nil then return end

    HBDPins:RemoveAllMinimapIcons(MinimapPinsKey)
    self:ReleaseAllPins()

    local map = Core.maps[HBD:GetPlayerZone()]
    if not map then return end

    for coord, node in pairs(map.nodes) do
        if node._prepared and map:IsNodeEnabled(node, coord, true) then
            -- If this icon has a glow enabled, render it
            local glow = node:GetGlow(map.id, true)
            if glow then
                glow[1] = coord -- update POI coord for this placement
                glow:Render(self, MinimapPinTemplate)
            end

            -- Render any POIs this icon has registered
            if node.pois and (node._focus or node._hover) then
                for i, poi in ipairs(node.pois) do
                    if poi:IsEnabled() then
                        poi:Render(self, MinimapPinTemplate)
                    end
                end
            end
        end
    end
end

function MinimapDataProvider:RefreshAllRotations()
    for i, pin in ipairs(self.pins) do
        if pin.acquired then pin:UpdateRotation() end
    end
end

function MinimapDataProvider:OnUpdate()
    local facing = GetPlayerFacing()
    if facing and facing ~= self.facing then
        self.facing = facing
        self:RefreshAllRotations()
        self.updateTimer = 0
    end
end

function MinimapPinMixin:OnLoad()
    self:SetFrameLevel(Minimap:GetFrameLevel() + 3)
    self:SetFrameStrata(Minimap:GetFrameStrata())
    self.minimap = true
end

function MinimapPinMixin:OnAcquired(poi, ...)
    local mapID = HBD:GetPlayerZone()
    local x, y = poi:Draw(self, ...)
    if GetCVar('rotateMinimap') == '1' then self:UpdateRotation() end
    HBDPins:AddMinimapIconMap(MinimapPinsKey, self, mapID, x, y, true)
end

function MinimapPinMixin:OnReleased()
    if self.ticker then
        self.ticker:Cancel()
        self.ticker = nil
    end
end

function MinimapPinMixin:UpdateRotation()
    -- If the pin has a rotation, its original value will be stored in the
    -- `rotation` attribute. Update to accommodate player facing.
    if self.rotation == nil or self.provider.facing == nil then return end
    self.texture:SetRotation(self.rotation + math.pi * 2 - self.provider.facing)
end

MinimapDataProvider:SetScript('OnUpdate', function()
    if GetCVar('rotateMinimap') == '1' then MinimapDataProvider:OnUpdate() end
end)

Core.addon:RegisterEvent('MINIMAP_UPDATE_ZOOM',
    function(...) MinimapDataProvider:RefreshAllData() end)

Core.addon:RegisterEvent('CVAR_UPDATE', function(_, varname)
    if varname == 'ROTATE_MINIMAP' then MinimapDataProvider:RefreshAllData() end
end)

-------------------------------------------------------------------------------
--------------------------- WORLD MAP DATA PROVIDER ---------------------------
-------------------------------------------------------------------------------

local WorldMapDataProvider = CreateFromMixins(MapCanvasDataProviderMixin)
local WorldMapPinTemplate = "HandyNotes_Core" .. 'WorldMapPinTemplate'
local WorldMapPinMixin = CreateFromMixins(MapCanvasPinMixin)

_G["HandyNotes_Core" .. 'WorldMapPinMixin'] = WorldMapPinMixin

function WorldMapDataProvider:RemoveAllData()
    if self:GetMap() then
        self:GetMap():RemoveAllPinsByTemplate(WorldMapPinTemplate)
    end
end

function WorldMapDataProvider:RefreshAllData(fromOnShow)
    self:RemoveAllData()

    if not self:GetMap() then return end
    local map = Core.maps[self:GetMap():GetMapID()]
    if not map then return end

    for coord, node in pairs(map.nodes) do
        if node._prepared and map:IsNodeEnabled(node, coord, false) then
            -- If this icon has a glow enabled, render it
            local glow = node:GetGlow(map.id, false)
            if glow then
                glow[1] = coord -- update POI coord for this placement
                glow:Render(self:GetMap(), WorldMapPinTemplate)
            end

            -- Render any POIs this icon has registered
            if node.pois and (node._focus or node._hover) then
                for i, poi in ipairs(node.pois) do
                    if poi:IsEnabled() then
                        poi:Render(self:GetMap(), WorldMapPinTemplate)
                    end
                end
            end
        end
    end
end

function WorldMapPinMixin:OnLoad()
    -- The MAP_HIGHLIGHT frame level is well below the level standard
    -- HandyNotes pins use, preventing mouseover conflicts
    self:UseFrameLevelType('PIN_FRAME_LEVEL_MAP_HIGHLIGHT')
end

function WorldMapPinMixin:OnAcquired(poi, ...)
    local _, _, w, h = self:GetParent():GetRect()
    self.parentWidth = w
    self.parentHeight = h
    if (w and h) then
        local x, y = poi:Draw(self, ...)
        self:ApplyCurrentScale()
        self:SetPosition(x, y)
    end
end

function WorldMapPinMixin:OnReleased()
    if self.ticker then
        self.ticker:Cancel()
        self.ticker = nil
    end
end

function WorldMapPinMixin:ApplyFrameLevel()
    -- Allow frame level adjustments in POIs even if the current frame level
    -- type has a range of only 1 frame level
    MapCanvasPinMixin.ApplyFrameLevel(self)
    self:SetFrameLevel(self:GetFrameLevel() + self.frameOffset)
end

-------------------------------------------------------------------------------
------------------------------ HANDYNOTES HOOKS -------------------------------
-------------------------------------------------------------------------------

-- HandyNotes removes its data provider from the world map when the global
-- enable/disable checkbox is toggled at the top of its UI window. We need
-- to do the same thing here or our paths will still display.

local OnEnable = HandyNotes.OnEnable
local OnDisable = HandyNotes.OnDisable

function HandyNotes:OnEnable()
    OnEnable(self)
    if not HandyNotes.db.profile.enabled then return end
    WorldMapFrame:AddDataProvider(WorldMapDataProvider)
end

function HandyNotes:OnDisable()
    OnDisable(self)
    if WorldMapFrame.dataProviders[WorldMapDataProvider] then
        WorldMapFrame:RemoveDataProvider(WorldMapDataProvider)
    end
end

-------------------------------------------------------------------------------

Core.Map = Map
Core.MinimapDataProvider = MinimapDataProvider
Core.WorldMapDataProvider = WorldMapDataProvider