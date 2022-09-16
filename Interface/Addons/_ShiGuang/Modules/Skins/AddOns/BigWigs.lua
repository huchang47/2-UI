local _, ns = ...
local M, R, U, I = unpack(ns)
local S = M:GetModule("Skins")

local function removeStyle(bar)
	bar.candyBarBackdrop:Hide()
	local height = bar:Get("bigwigs:restoreheight")
	if height then
		bar:SetHeight(height)
	end

	local tex = bar:Get("bigwigs:restoreicon")
	if tex then
		bar:SetIcon(tex)
		bar:Set("bigwigs:restoreicon", nil)
		bar.candyBarIconFrameBackdrop:Hide()
	end

	bar.candyBarDuration:ClearAllPoints()
	bar.candyBarDuration:SetPoint("TOPLEFT", bar.candyBarBar, "TOPLEFT", 2, 0)
	bar.candyBarDuration:SetPoint("BOTTOMRIGHT", bar.candyBarBar, "BOTTOMRIGHT", -2, 0)
	bar.candyBarLabel:ClearAllPoints()
	bar.candyBarLabel:SetPoint("TOPLEFT", bar.candyBarBar, "TOPLEFT", 2, 0)
	bar.candyBarLabel:SetPoint("BOTTOMRIGHT", bar.candyBarBar, "BOTTOMRIGHT", -2, 0)
end

local function styleBar(bar)
	local height = bar:GetHeight()
	bar:Set("bigwigs:restoreheight", height)
	bar:SetHeight(height/2)
	bar.candyBarBackdrop:Hide()
	if not bar.styled then
		M.StripTextures(bar.candyBarBar, true)
		M.SetBD(bar.candyBarBar)
		bar.styled = true
	end
	bar:SetTexture(I.normTex)

	local tex = bar:GetIcon()
	if tex then
		local icon = bar.candyBarIconFrame
		bar:SetIcon(nil)
		icon:SetTexture(tex)
		icon:Show()
		if bar.iconPosition == "RIGHT" then
			icon:SetPoint("BOTTOMLEFT", bar, "BOTTOMRIGHT", 5, 0)
		else
			icon:SetPoint("BOTTOMRIGHT", bar, "BOTTOMLEFT", -5, 0)
		end
		icon:SetSize(height, height)
		bar:Set("bigwigs:restoreicon", tex)
		bar.candyBarIconFrameBackdrop:Hide()

		if not icon.styled then
			M.SetBD(icon)
			icon.styled = true
		end
	end

	bar.candyBarLabel:ClearAllPoints()
	bar.candyBarLabel:SetPoint("LEFT", bar.candyBarBar, "LEFT", 2, 8)
	bar.candyBarLabel:SetPoint("RIGHT", bar.candyBarBar, "RIGHT", -2, 8)
	bar.candyBarDuration:ClearAllPoints()
	bar.candyBarDuration:SetPoint("RIGHT", bar.candyBarBar, "RIGHT", -2, 8)
	bar.candyBarDuration:SetPoint("LEFT", bar.candyBarBar, "LEFT", 2, 8)
end

local styleData = {
	apiVersion = 1,
	version = 3,
	GetSpacing = function(bar) return bar:GetHeight()+5 end,
	ApplyStyle = styleBar,
	BarStopped = removeStyle,
	fontSizeNormal = 13,
	fontSizeEmphasized = 14,
	fontOutline = "OUTLINE",
	GetStyleName = function() return "UI" end,
}

function S:RegisterBWStyle()
	if not R.db["Skins"]["Bigwigs"] then return end
	if not BigWigsAPI then return end

	BigWigsAPI:RegisterBarStyle("UI", styleData)
	-- Force to use UI style
	local pending = true
	hooksecurefunc(BigWigsAPI, "GetBarStyle", function()
		if pending then
			BigWigsAPI.GetBarStyle = function() return styleData end
			pending = nil
		end
	end)
end

function S:BigWigsSkin()
	if not R.db["Skins"]["Bigwigs"] then return end

	if BigWigsLoader and BigWigsLoader.RegisterMessage then
		BigWigsLoader.RegisterMessage(_, "BigWigs_FrameCreated", function(_, frame, name)
			if name == "QueueTimer" and not frame.styled then
				M.StripTextures(frame)
				frame:SetStatusBarTexture(I.normTex)
				M.SetBD(frame)

				frame.styled = true
			end
		end)
	end
end

S:RegisterSkin("BigWigs", S.BigWigsSkin)
S:RegisterSkin("BigWigs_Plugins", S.RegisterBWStyle)