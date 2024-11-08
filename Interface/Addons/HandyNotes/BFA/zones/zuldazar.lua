-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------
local _, BattleForAzeroth = ...
local L = BattleForAzeroth.locale
local Class = BattleForAzeroth.Class
local Map = BattleForAzeroth.Map

local Collectible = BattleForAzeroth.node.Collectible
local NPC = BattleForAzeroth.node.NPC
local PetBattle = BattleForAzeroth.node.PetBattle
local Rare = BattleForAzeroth.node.Rare
local Safari = BattleForAzeroth.node.Safari
local Supply = BattleForAzeroth.node.Supply
local Treasure = BattleForAzeroth.node.Treasure

local Achievement = BattleForAzeroth.reward.Achievement
local Item = BattleForAzeroth.reward.Item
local Mount = BattleForAzeroth.reward.Mount
local Pet = BattleForAzeroth.reward.Pet
local Transmog = BattleForAzeroth.reward.Transmog

local Arrow = BattleForAzeroth.poi.Arrow
local Line = BattleForAzeroth.poi.Line
local Path = BattleForAzeroth.poi.Path
local POI = BattleForAzeroth.poi.POI

-------------------------------------------------------------------------------

local map = Map({id = 862, settings = true})
local daz = Map({id = 1165, settings = true})

-------------------------------------------------------------------------------
------------------------------------ RARES ------------------------------------
-------------------------------------------------------------------------------

map.nodes[80972163] = Rare({
    id = 129961,
    quest = 50280,
    rewards = {
        Achievement({id = 12944, criteria = 41850}),
        Transmog({item = 161042, slot = L['plate']}) -- Gotaka's Wallopers
    }
}) -- Atal'zul Gotaka

map.nodes[49855744] = Rare({
    id = 129343,
    quest = 49410,
    note = L['in_cave'],
    rewards = {
        Achievement({id = 12944, criteria = 41871}),
        Transmog({item = 161034, slot = L['mail']}) -- Thunderhowl Gauntlets
    },
    pois = {
        POI({49555904}) -- Cave entrance
    }
}) -- Avatar of Xolotal

map.nodes[59821830] = Rare({
    id = 128699,
    quest = 49267,
    rewards = {
        Achievement({id = 12944, criteria = 41872}),
        Transmog({item = 161104, slot = L['mail']}) -- Blood Feast Gauntlets
    }
}) -- Bloodbulge

map.nodes[66743228] = Rare({
    id = 131718,
    quest = 50034,
    rewards = {
        Achievement({id = 12944, criteria = 41867}),
        Transmog({item = 161020, slot = L['cloth']}) -- Sky-Hunter Breeches
    }
}) -- Bramblewing

map.nodes[74203930] = Rare({
    id = 133190,
    quest = 50269,
    rewards = {
        Achievement({id = 12944, criteria = 41864}),
        Transmog({item = 160952, slot = L['dagger']}) -- Daggerjaw's Incisor
    }
}) -- Daggerjaw

map.nodes[44157652] = Rare({
    id = 136428,
    quest = 51083,
    note = L['in_small_cave'],
    rewards = {
        Achievement({id = 12944, criteria = 41852}),
        Transmog({item = 160979, slot = L['offhand']}) -- Ancient Chronicler's Focus
    }
}) -- Dark Chronicler

map.nodes[65411022] = Rare({
    id = 134760,
    quest = 50693,
    rewards = {
        Achievement({id = 12944, criteria = 41855}),
        Transmog({item = 160958, slot = L['1h_mace']}) -- Darkspeaker Scepter
    }
}) -- Darkspeaker Jo'la

map.nodes[64253271] = Rare({
    id = 129954,
    quest = 50439,
    rewards = {
        Achievement({id = 12944, criteria = 41851}),
        Transmog({item = 161043, slot = L['plate']}) -- Relentless Hydra Legguards
    }
}) -- Gahz'ralka

map.nodes[74112850] = Rare({
    id = 124185,
    quest = 47792,
    rewards = {
        Achievement({id = 12944, criteria = 41876}),
        Transmog({item = 161035, slot = L['mail']}) -- Thundercrash Footguards
    }
}) -- Golrakahn

map.nodes[79973597] = Rare({
    id = 133155,
    quest = 50260,
    rewards = {
        Achievement({id = 12944, criteria = 41865}),
        Transmog({item = 161048, slot = L['cloth']}) -- Brutish Tidecaller Armwraps
    }
}) -- G'Naat

map.nodes[42003620] = Rare({
    id = 134738,
    quest = 50677,
    rewards = {
        Achievement({id = 12944, criteria = 41856}),
        Transmog({item = 160978, slot = L['shield']}) -- Golden Tomb Defender
    }
}) -- Hakbi the Risen

map.nodes[68664874] = Rare({
    id = 126637,
    quest = 48543,
    note = L['in_cave'],
    rewards = {
        Achievement({id = 12944, criteria = 41874}),
        Transmog({item = 160984, slot = L['cloak']}) -- Sauroscale Cloak of Adaptation
    },
    pois = {
        POI({68824710}) -- Cave entrance
    }
}) -- Kandak

map.nodes[75613582] = Rare({
    id = 132244,
    quest = 50159,
    rewards = {
        Achievement({id = 12944, criteria = 41866}),
        Transmog({item = 161112, slot = L['plate']}) -- Hillshaker Armplates
    }
}) -- Kiboku

daz.nodes[54988253] = Rare({
    id = 120899,
    quest = 48333,
    parent = map.id,
    rewards = {
        Achievement({id = 12944, criteria = 41875}),
        Transmog({item = 160947, slot = L['1h_axe']}) -- Amani Berserker's Chopper
    }
}) -- Kul'krazahn

map.nodes[58677417] = Rare({
    id = 131233,
    quest = 49911,
    rewards = {
        Achievement({id = 12944, criteria = 41870}),
        Transmog({item = 161033, slot = L['mail']}) -- Jolting Leap Legguards
    }
}) -- Lei-zhi

map.nodes[60626627] = Rare({
    id = 134782,
    quest = 50281,
    note = L['murderbeak_note'],
    rewards = {
        Achievement({id = 12944, criteria = 41863}),
        Transmog({item = 161022, slot = L['cloth']}) -- Gusting Axebeak Anklewraps
    }
}) -- Murderbeak

map.nodes[69563691] = Rare({
    id = 149147,
    quest = 54770,
    rewards = {
        Pet({item = 166345, id = 2538}) -- Dasher
    },
    pois = {Path({69503569, 69563691, 69603800})}
}) -- N'chala the Egg Thief

daz.nodes[36004620] = Rare({
    id = 136413,
    quest = 51080,
    note = L['in_small_cave'],
    parent = map.id,
    rewards = {
        Achievement({id = 12944, criteria = 41853}),
        Transmog({item = 161047, slot = L['cloth']}) -- Shadow Wind Leggings
    }
}) -- Syrawon the Dominus

map.nodes[77711029] = Rare({
    id = 131687,
    quest = 50013,
    rewards = {
        Achievement({id = 12944, criteria = 41868}),
        Transmog({item = 161109, slot = L['plate']}) -- Coastal Hardshell Girdle
    }
}) -- Tambano

map.nodes[46616533] = Rare({
    id = 127939,
    quest = 49004,
    rewards = {
        Achievement({id = 12944, criteria = 41873}),
        Transmog({item = 161029, slot = L['leather']}) -- Ageless Toxin Grips
    }
}) -- Torraske the Eternal

map.nodes[71423239] = Rare({
    id = 122004,
    quest = 47567,
    note = L['in_cave'],
    rewards = {
        Achievement({id = 12944, criteria = 41877}),
        Transmog({item = 161091, slot = L['leather']}) -- Swift-Talon Striders
    }
}) -- Umbra'jin

daz.nodes[61705120] = Rare({
    id = 134048,
    quest = 50508,
    note = L['vukuba_note'],
    parent = map.id,
    rewards = {
        Achievement({id = 12944, criteria = 41858}),
        Transmog({item = 162613, slot = L['cloth']}) -- Mantle of Brood Mimicry
    }
}) -- Vukuba

map.nodes[43952544] = Rare({
    id = 133842,
    quest = 50438,
    rewards = {
        Achievement({id = 12944, criteria = 41859}),
        Transmog({item = 161040, slot = L['plate']}) -- Arid Dune Stompers
    }
}) -- Warcrawler Karkithiss

map.nodes[48005424] = Rare({
    id = 131476,
    quest = 49972,
    rewards = {Achievement({id = 12944, criteria = 41869})}
}) -- Zayoos

-------------------------------------------------------------------------------
---------------------------------- TREASURES ----------------------------------
-------------------------------------------------------------------------------

-- Daily treasures? Junk?
-- 52564719  862 50722 Treasure Chest
-- 67943651  862 50716 Treasure Chest
-- 42031415 1165 49142 Treasure Chest

-------------------------------------------------------------------------------

daz.nodes[39001580] = Treasure({
    label = '{item:161443}',
    quest = 52269,
    note = L['tiny_voodoo_mask_note'],
    parent = map.id,
    rewards = {Item({item = 161443, quest = 52269})}
}) -- A Tiny Voodoo Mask

daz.nodes[44472690] = Treasure({
    quest = 51338,
    note = L['cache_of_secrets_note'],
    parent = map.id,
    rewards = {Achievement({id = 12851, criteria = 40996})}
}) -- Cache of Secrets

daz.nodes[59308866] = Treasure({
    quest = 50947,
    note = L['da_white_shark_note'],
    parent = map.id,
    rewards = {Achievement({id = 12851, criteria = 40994})}
}) -- Da White Shark's Bounty

map.nodes[38793444] = Treasure({
    quest = 50707,
    note = L['dazars_forgotten_chest_note'],
    rewards = {Achievement({id = 12851, criteria = 40993})},
    pois = {
        Path({
            41953562, 41583471, 41063381, 40623270, 39913279, 39453364, 38793444
        })
    }
}) -- Dazar's Forgotten Chest

map.nodes[51442661] = Treasure({
    quest = 50582,
    note = L['gift_of_the_brokenhearted_note'],
    rewards = {Achievement({id = 12851, criteria = 40991})}
}) -- Gift of the Brokenhearted

daz.nodes[38280714] = Treasure({
    quest = 48938,
    note = L['offerings_of_the_chosen_note'],
    parent = map.id,
    rewards = {Achievement({id = 12851, criteria = 40988})}
}) -- Offerings of the Chosen

daz.nodes[34905440] = Treasure({
    quest = 51624,
    note = L['riches_of_tornowa_note'],
    parent = map.id,
    rewards = {Achievement({id = 12851, criteria = 40997})}
}) -- Riches of Tor'nowa

Map({id = 1177}).nodes[23132391] = Treasure({
    quest = 49936,
    note = L['spoils_of_pandaria_note'],
    parent = map.id,
    rewards = {Achievement({id = 12851, criteria = 40990})}
}) -- Spoils of Pandaria

map.nodes[71821677] = Treasure({
    quest = 50949,
    note = L['in_small_cave'],
    rewards = {Achievement({id = 12851, criteria = 40995})}
}) -- The Exile's Lament

map.nodes[49506526] = Treasure({
    quest = 49257,
    note = L['warlords_cache_note'],
    rewards = {Achievement({id = 12851, criteria = 40992})}
}) -- Warlord's Cache

map.nodes[64712167] = Treasure({
    quest = 50259,
    rewards = {Achievement({id = 12851, criteria = 40989})}
}) -- Witch Doctor's Hoard

-------------------------------------------------------------------------------
----------------------------- SECRET SUPPLY CHESTS ----------------------------
-------------------------------------------------------------------------------

local SECRET_CHEST = BattleForAzeroth.node.SecretSupply({
    quest = 55391,
    rewards = {Achievement({id = 13317, criteria = 43936})}
}) -- quest = 54720 (looted ever) 55391 (looted today)

map.nodes[70653750] = SECRET_CHEST
map.nodes[79605150] = SECRET_CHEST
map.nodes[81345536] = SECRET_CHEST

-------------------------------------------------------------------------------
------------------------------ WAR SUPPLY CHESTS ------------------------------
-------------------------------------------------------------------------------

map.nodes[48206620] = Supply({
    quest = 55413,
    fgroup = 'supply_path_1',
    pois = {Arrow({80002179, 40007765})}
})
daz.nodes[51606880] = Supply({
    quest = 55413,
    fgroup = 'supply_path_1',
    parent = map.id
})
map.nodes[71403380] = Supply({quest = 55413, fgroup = 'supply_path_1'})

daz.nodes[35041851] = Supply({
    quest = 55413,
    fgroup = 'supply_path_2',
    parent = map.id
})
map.nodes[67203620] = Supply({
    quest = 55413,
    fgroup = 'supply_path_2',
    pois = {Arrow({45003475, 85003736})}
})
map.nodes[76383689] = Supply({quest = 55413, fgroup = 'supply_path_2'})

-------------------------------------------------------------------------------
--------------------------------- BATTLE PETS ---------------------------------
-------------------------------------------------------------------------------

map.nodes[68003400] = PetBattle({
    id = 142151,
    rewards = {Achievement({id = 12936, criteria = 44231})}
}) -- You've Never Seen Jammer Upset (Jammer)

map.nodes[48403500] = PetBattle({
    id = 142114,
    note = L['talia_spark_note'],
    rewards = {
        Achievement({id = 12936, criteria = 44230}), BattleForAzeroth.reward.Spacer(),
        Achievement({id = 13270, criteria = 18, oneline = true}), -- Beast
        Achievement({id = 13271, criteria = 18, oneline = true}), -- Critter
        Achievement({id = 13272, criteria = 18, oneline = true}), -- Dragon
        Achievement({id = 13273, criteria = 18, oneline = true}), -- Elemental
        Achievement({id = 13274, criteria = 18, oneline = true}), -- Flying
        Achievement({id = 13275, criteria = 18, oneline = true}), -- Magic
        Achievement({id = 13277, criteria = 18, oneline = true}), -- Mechanical
        Achievement({id = 13278, criteria = 18, oneline = true}), -- Undead
        Achievement({id = 13280, criteria = 18, oneline = true}), -- Aquatic
        Achievement({id = 13281, criteria = 18, oneline = true}) -- Humanoid
    }
}) -- Add More to the Collection (Talia Sparkbrow)

map.nodes[50562391] = PetBattle({
    id = 142234,
    note = L['zujai_note'],
    rewards = {
        Achievement({id = 12936, criteria = 44232}), BattleForAzeroth.reward.Spacer(),
        Achievement({id = 13270, criteria = 19, oneline = true}), -- Beast
        Achievement({id = 13271, criteria = 19, oneline = true}), -- Critter
        Achievement({id = 13272, criteria = 19, oneline = true}), -- Dragon
        Achievement({id = 13273, criteria = 19, oneline = true}), -- Elemental
        Achievement({id = 13274, criteria = 19, oneline = true}), -- Flying
        Achievement({id = 13275, criteria = 19, oneline = true}), -- Magic
        Achievement({id = 13277, criteria = 19, oneline = true}), -- Mechanical
        Achievement({id = 13278, criteria = 19, oneline = true}), -- Undead
        Achievement({id = 13280, criteria = 19, oneline = true}), -- Aquatic
        Achievement({id = 13281, criteria = 19, oneline = true}) -- Humanoid
    }
}) -- Small Beginnings (Zujai)

map.nodes[70552959] = PetBattle({
    id = 142096,
    note = L['karaga_note'],
    rewards = {
        Achievement({id = 12936, criteria = 44229}), BattleForAzeroth.reward.Spacer(),
        Achievement({id = 13270, criteria = 17, oneline = true}), -- Beast
        Achievement({id = 13271, criteria = 17, oneline = true}), -- Critter
        Achievement({id = 13272, criteria = 17, oneline = true}), -- Dragon
        Achievement({id = 13273, criteria = 17, oneline = true}), -- Elemental
        Achievement({id = 13274, criteria = 17, oneline = true}), -- Flying
        Achievement({id = 13275, criteria = 17, oneline = true}), -- Magic
        Achievement({id = 13277, criteria = 17, oneline = true}), -- Mechanical
        Achievement({id = 13278, criteria = 17, oneline = true}), -- Undead
        Achievement({id = 13280, criteria = 17, oneline = true}), -- Aquatic
        Achievement({id = 13281, criteria = 17, oneline = true}) -- Humanoid
    }
}) -- Critters are Friends, Not Food (Karaga)

-------------------------------------------------------------------------------
--------------------------------- PAKU TOTEMS ---------------------------------
-------------------------------------------------------------------------------

local Totem = Class('Totem', NPC, {
    id = 131154,
    icon = 'flight_point_y',
    group = BattleForAzeroth.groups.PAKU_TOTEMS,
    note = L['totem_of_paku_note']
})

daz.nodes[40668427] = Totem({pois = {Line({40668427, 46908558})}})
daz.nodes[40801107] = Totem({pois = {Line({40801107, 42832293})}})
daz.nodes[41193782] = Totem({pois = {Line({46888548, 41193782})}})
daz.nodes[41253911] = Totem({pois = {Line({41253911, 49883972})}})
daz.nodes[42832293] = Totem({pois = {Line({42832293, 40801107})}})
daz.nodes[44680588] = Totem({pois = {Line({44680588, 52881242})}})
daz.nodes[46591999] = Totem({pois = {Line({46591999, 50263259})}})
daz.nodes[46888548] = Totem({pois = {Line({46888548, 41193782})}})
daz.nodes[49543283] = Totem({pois = {Line({49543283, 49913955})}})
daz.nodes[51364094] = Totem({pois = {Line({51364094, 49984342})}})
daz.nodes[52881242] = Totem({pois = {Line({52881242, 44680588})}})
daz.nodes[52931129] = Totem({pois = {Line({52931129, 59111062})}})
daz.nodes[53221892] = Totem({pois = {Line({53221892, 52761184})}})
daz.nodes[58313263] = Totem({pois = {Line({58313263, 75683985})}})
daz.nodes[59111062] = Totem({pois = {Line({52931129, 59111062})}})
daz.nodes[72081446] = Totem({pois = {Line({72081446, 59232283})}})

-------------------------------------------------------------------------------
------------------------------- A LOA OF A TALE -------------------------------
-------------------------------------------------------------------------------

map.nodes[51692825] = Collectible({
    quest = 53535,
    icon = 1875083,
    group = BattleForAzeroth.groups.TALES_OF_DE_LOA,
    note = L['tales_gonk_note'],
    rewards = {Achievement({id = 13036, criteria = 41566})}
}) -- Tales of de Loa: Gonk

map.nodes[75506760] = Collectible({
    quest = 53536,
    icon = 1875083,
    group = BattleForAzeroth.groups.TALES_OF_DE_LOA,
    note = L['tales_gral_note'],
    rewards = {Achievement({id = 13036, criteria = 41567})}
}) -- Tales of de Loa: Gral

map.nodes[48545460] = Collectible({
    quest = 53538,
    icon = 1875083,
    group = BattleForAzeroth.groups.TALES_OF_DE_LOA,
    note = L['tales_jani_note'],
    rewards = {Achievement({id = 13036, criteria = 41569})}
}) -- Tales of de Loa: Jani

map.nodes[49004129] = Collectible({
    quest = 53541,
    icon = 1875083,
    group = BattleForAzeroth.groups.TALES_OF_DE_LOA,
    note = L['tales_paku_note'],
    rewards = {Achievement({id = 13036, criteria = 41572})}
}) -- Tales of de Loa: Paku

map.nodes[43737673] = Collectible({
    quest = 53542,
    icon = 1875083,
    group = BattleForAzeroth.groups.TALES_OF_DE_LOA,
    note = L['tales_rezan_note'],
    rewards = {Achievement({id = 13036, criteria = 41573})}
}) -- Tales of de Loa: Rezan

map.nodes[47842884] = Collectible({
    quest = 53544,
    icon = 1875083,
    group = BattleForAzeroth.groups.TALES_OF_DE_LOA,
    note = L['tales_shadra_note'],
    rewards = {Achievement({id = 13036, criteria = 41576})}
}) -- Tales of de Loa: Shadra

map.nodes[67281762] = Collectible({
    quest = 53546,
    icon = 1875083,
    group = BattleForAzeroth.groups.TALES_OF_DE_LOA,
    note = L['tales_torcali_note'],
    rewards = {Achievement({id = 13036, criteria = 41577})}
}) -- Tales of de Loa: Torcali

daz.nodes[53230929] = Collectible({
    quest = 53548,
    icon = 1875083,
    group = BattleForAzeroth.groups.TALES_OF_DE_LOA,
    note = L['tales_zandalar_note'],
    parent = map.id,
    rewards = {Achievement({id = 13036, criteria = 41581})}
}) -- Tales of de Loa: Zandalar

-------------------------------------------------------------------------------
----------------------------- BOW TO YOUR MASTERS -----------------------------
-------------------------------------------------------------------------------

map.nodes[49274433] = Collectible({
    id = 129740,
    icon = 1850548,
    sublabel = L['bow_to_your_masters_note'],
    group = BattleForAzeroth.groups.BOW_TO_YOUR_MASTERS,
    rewards = {Achievement({id = 13020, criteria = 41498})}
}) -- Gonk

daz.nodes[35350767] = Collectible({
    id = 126334,
    icon = 1850548,
    sublabel = L['bow_to_your_masters_note'],
    group = BattleForAzeroth.groups.BOW_TO_YOUR_MASTERS,
    note = L['jani_note'],
    parent = map.id,
    rewards = {Achievement({id = 13020, criteria = 41500})}
}) -- Jani

map.nodes[71544942] = Collectible({
    id = 127377,
    icon = 1850548,
    sublabel = L['bow_to_your_masters_note'],
    group = BattleForAzeroth.groups.BOW_TO_YOUR_MASTERS,
    rewards = {Achievement({id = 13020, criteria = 41501})}
}) -- Pa'ku

Map({id = 935}).nodes[37185259] = Collectible({
    id = 124948,
    icon = 1850548,
    sublabel = L['bow_to_your_masters_note'],
    group = BattleForAzeroth.groups.BOW_TO_YOUR_MASTERS,
    note = L['rezan_note'],
    parent = map.id,
    rewards = {Achievement({id = 13020, criteria = 41502})}
}) -- Rezan

-------------------------------------------------------------------------------
-------------------- EATING OUT OF THE PALM OF MY TINY HAND -------------------
-------------------------------------------------------------------------------

map.nodes[64203930] = Collectible({
    icon = 1881827,
    group = BattleForAzeroth.groups.BRUTOSAURS,
    note = L['makafon_note'],
    rewards = {Achievement({id = 13029, criteria = 41580})},
    pois = {
        POI({71202950}) -- Golkada
    }
}) -- Irritable Maka'fon

-------------------------------------------------------------------------------
---------------------------------- GET HEK'D ----------------------------------
-------------------------------------------------------------------------------

map.nodes[66211662] = Collectible({
    quest = 50332,
    icon = 1604165,
    note = L['hunter_junk_note'],
    group = BattleForAzeroth.groups.GET_HEKD,
    rewards = {Achievement({id = 12482, criteria = 40038})}
}) -- Big Hunter Mon

map.nodes[62632058] = Collectible({
    quest = 50431,
    icon = 1604165,
    note = L['feathered_junk_note'],
    group = BattleForAzeroth.groups.GET_HEKD,
    rewards = {Achievement({id = 12482, criteria = 40040})}
}) -- Feathered Viper Scale (157794)

map.nodes[71704128] = Collectible({
    quest = 50308,
    icon = 1604165,
    note = L['golden_junk_note'],
    group = BattleForAzeroth.groups.GET_HEKD,
    rewards = {Achievement({id = 12482, criteria = 40037})}
}) -- Golden Ravasaur Egg (156963)

daz.nodes[61825347] = Collectible({
    quest = 50381,
    icon = 1604165,
    note = L['great_hat_junk_note'],
    group = BattleForAzeroth.groups.GET_HEKD,
    parent = map.id,
    rewards = {Achievement({id = 12482, criteria = 40039})}
}) -- The Great Hat Robbery

-------------------------------------------------------------------------------
------------------------- LIFE FINDS A WAY... TO DIE! -------------------------
-------------------------------------------------------------------------------

local LifeFindsAWay = Class('LifeFindsAWay', Collectible,
    {icon = 236192, group = BattleForAzeroth.groups.LIFE_FINDS_A_WAY})

map.nodes[67012670] = LifeFindsAWay({
    id = 135510,
    note = L['azuresail_note'],
    rewards = {Achievement({id = 13048, criteria = 41676})},
    pois = {POI({67802900, 69103085})}
}) -- Azuresail the Ancient

map.nodes[70552262] = LifeFindsAWay({
    id = 123502,
    rewards = {Achievement({id = 13048, criteria = 41677})},
    pois = {
        Path({
            69512264, 68002268, 67922214, 68052173, 68422217, 69512264,
            70552262, 71142249, 71422207, 71622141, 71712025
        })
    }
}) -- King K'tal

map.nodes[61582548] = LifeFindsAWay({
    id = 130741,
    rewards = {Achievement({id = 13048, criteria = 41673})}
}) -- Nol'ixwan

map.nodes[71104026] = LifeFindsAWay({
    id = 139365,
    rewards = {Achievement({id = 13048, criteria = 41672})}
}) -- Queenfeather

map.nodes[52424774] = LifeFindsAWay({
    id = 129323,
    rewards = {Achievement({id = 13048, criteria = 41674})}
}) -- Sabertusk Empress

map.nodes[66102246] = LifeFindsAWay({
    id = 143910,
    rewards = {Achievement({id = 13048, criteria = 41684})}
}) -- Sludgecrusher

map.nodes[67802900] = LifeFindsAWay({
    id = 135512,
    note = L['thunderfoot_note'],
    rewards = {Achievement({id = 13048, criteria = 41675})},
    pois = {POI({67012670, 69103085})}
}) -- Thunderfoot

-------------------------------------------------------------------------------
------------------------------ MUSHROOM HARVEST -------------------------------
-------------------------------------------------------------------------------

map.nodes[45497920] = Collectible({
    id = 143314,
    icon = 1869654,
    group = BattleForAzeroth.groups.MUSHROOM_HARVEST,
    rewards = {Achievement({id = 13027, criteria = 41391})}
}) -- Bane of the Woods

-------------------------------------------------------------------------------
--------------------------- THREE SHEETS TO THE WIND --------------------------
-------------------------------------------------------------------------------

daz.nodes[35411665] = Collectible({
    id = 131781,
    icon = 135999,
    note = L['three_sheets_note'],
    group = BattleForAzeroth.groups.THREE_SHEETS,
    faction = 'Horde',
    parent = map.id,
    rewards = {
        Achievement({
            id = 13061,
            criteria = {
                41404, -- Drop Anchor Dunkel
                41412 -- Pontoon Pilsner
            }
        })
    }
}) -- Zuaba Sonja

daz.nodes[47049155] = Collectible({
    id = 129376,
    icon = 135999,
    note = L['three_sheets_note'],
    group = BattleForAzeroth.groups.THREE_SHEETS,
    parent = map.id,
    rewards = {
        Achievement({id = 13061, criteria = 41403}) -- Dark and Stormy
    }
}) -- Lenne

Map({id = 1164}).nodes[26525057] = Collectible({
    id = 131511,
    icon = 135999,
    note = L['three_sheets_note'],
    group = BattleForAzeroth.groups.THREE_SHEETS,
    faction = 'Horde',
    parent = {daz.id, map.id},
    rewards = {
        Achievement({id = 13061, criteria = 41400}) -- Blacktooth Bloodwine
    }
}) -- Lily Whistlebrew

-------------------------------------------------------------------------------
----------------------------------- MOUNTS ------------------------------------
-------------------------------------------------------------------------------

map.nodes[68174172] = Collectible({
    id = 122939,
    icon = 2429953,
    quest = {
        47261, 48581, 47310, 47260, 52855, 52857, 55254, 55252, 55253, 55258,
        55462, 55503, 55504, 55506, 55505, 55507, 55247, 55795, 55796, 55797,
        55798
    },
    questCount = true,
    faction = 'Horde',
    note = L['torcali_note'],
    rewards = {Mount({item = 168408, id = 1249})}
}) -- Child of Torcali

map.nodes[70605100] = Collectible({
    id = 141025,
    icon = 1624590,
    quest = {
        50393, 50394, 50402, 52305, 50395, 50401, 50412, 52447, 50396, 50886,
        50887, 50900, 52748, 50397, 50940, 50942, 50943, 50944
    },
    questCount = true,
    faction = 'Horde',
    note = L['kuafon_note'],
    rewards = {Mount({item = 159146, id = 1043})},
    pois = {
        POI({54333384, 67803420}) -- farm spots
    }
}) -- Kua'fon

-------------------------------------------------------------------------------
------------------- TO ALL THE SQUIRRELS I SET SAIL TO SEE --------------------
-------------------------------------------------------------------------------

map.nodes[62721652] = BattleForAzeroth.node.Squirrel({
    id = 130445,
    rewards = {Achievement({id = 14730, criteria = 50242})},
    pois = {POI({59802560, 54802000})}
}) -- Jungle Gulper

map.nodes[67114189] = BattleForAzeroth.node.Squirrel({
    id = 130716,
    rewards = {Achievement({id = 14730, criteria = 50243})},
    pois = {POI({68804030, 68104340})}
}) -- Crested Gekkota

daz.nodes[42603540] = BattleForAzeroth.node.Squirrel({
    id = 130441,
    parent = map.id,
    rewards = {Achievement({id = 14730, criteria = 50246})},
    pois = {POI({47808680, 45801480, 45605880})}
}) -- Temple Beetle

-------------------------------------------------------------------------------
-------------------------------- BATTLE SAFARI --------------------------------
-------------------------------------------------------------------------------

map.nodes[00000000] = Safari.BarrierHermit({
    pois = {
        POI({
            53209020, 54208460, 54208620, 54609220, 55208560, 55209440,
            55808640, 55809500, 56408680, 57008660, 57408620, 57808640,
            58008660, 58407520, 58407820, 58409680, 58607500, 58608700,
            58609660, 58807800, 59008080, 59207360, 59208340, 59208760,
            59407340, 59408160, 59408380, 59409560, 59609020, 59609440,
            59609540, 59809120, 60009300, 60207320, 60607300, 60608500,
            61407240, 61607260, 61608500, 61808600, 62007240, 62607240,
            62808560, 63407260, 64008600, 64207220, 65407180, 66007180,
            67007240, 67008380, 67407440, 67407500, 67408220, 67607280,
            67607860, 67608140, 67807440, 67807740, 68007500, 68007820,
            68208020, 68407560, 68607620
        })
    }
}) -- Barrier Hermit

map.nodes[40403500] = Safari.GoldenBeetle({
    pois = {
        POI({
            39403940, 40003640, 40003940, 40403500, 40403720, 40403780,
            40404020, 40603580, 41004020, 41004140, 41403940, 42003720,
            42003920, 42403580, 42803600, 42803920, 43003980, 43603680
        })
    }
}) -- Golden Beetle

map.nodes[70603020] = Safari.LeafyFlutterwing({
    pois = {
        POI({
            39407780, 39607920, 40807840, 40807860, 42007780, 44007760,
            44407740, 44607540, 44607560, 69402920, 70202940, 70203620,
            70403020, 70403180, 70602940, 70603020, 70603740, 70803080,
            71202840, 71403340, 71403900, 71602980, 71603900, 72002060,
            72002800, 72003440, 72003520, 72203080, 72203980, 72402900,
            72602020, 72602960, 73004000, 73602020, 74004080, 74203040,
            74602060, 74603080, 74803180, 75602060, 76003320, 76201320,
            76403380, 76403820, 76601820, 76601980, 76801340, 76801560,
            76803740, 77001360, 77001480, 77001720, 77203840, 77401920,
            77601720, 77801380, 77804840, 77804860, 78204320, 78204720,
            78604660, 78604780, 79204260, 79204460, 79204600, 79604620
        })
    }
}) -- LeafyFlutterwing

map.nodes[59807920] = Safari.ShoreButterfly({
    pois = {
        POI({
            53808740, 54408840, 54408940, 54409060, 54608840, 54608940,
            54608960, 54809100, 55009220, 56009440, 56809540, 57609620,
            59407560, 59407940, 59407960, 59807920, 60007740, 60207580,
            60208300, 61008120, 61407460, 61607560, 62008380, 65008320
        })
    }
}) -- Shore Butterfly
