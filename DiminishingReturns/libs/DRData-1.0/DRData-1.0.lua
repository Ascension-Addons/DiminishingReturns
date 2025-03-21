local major = "DRData-1.0"
local minor = 1003
assert(LibStub, string.format("%s requires LibStub.", major))

local Data = LibStub:NewLibrary(major, minor)
if( not Data ) then return end

local L = {
	["Banish"] = "Banish",
	["Charge"] = "Charge",
	["Controlled stuns"] = "Controlled stuns",
	["Disarms"] = "Disarms",
	["Disorients"] = "Disorients",
	["Horrors"] = "Horrors",
	["Random roots"] = "Random roots",
	["Random stuns"] = "Random stuns",
	["Controlled roots"] = "Controlled roots",
	["Silences"] = "Silences",
	["Taunts"] = "Taunts",
}

if GetLocale() == "frFR" then
	L["Banish"] = "Bannissement"
	L["Charge"] = "Charge"
	L["Controlled stuns"] = "Etourdissements contrôlés"
	L["Disarms"] = "Désarmements"
	L["Disorients"] = "Désorientations"
	L["Horrors"] = "Horreurs"
	L["Random roots"] = "Immobilisations aléatoires"
	L["Random stuns"] = "Etourdissemensts aléatoires"
	L["Controlled roots"] = "Immobilisations contrôlées"
	L["Silences"] = "Silences"
	L["Taunts"] = "Provocations"
end

-- How long before DR resets
-- While everyone will tell you it's 15 seconds, it's actually 16 - 20 seconds with 18 being a decent enough average
Data.RESET_TIME = 18

-- List of spellID -> DR category
Data.spells = {
	--[[ TAUNT ]]--
	-- Taunt (Warrior)
	[355] = "taunt",
	-- Taunt (Pet)
	[53477] = "taunt",
	-- Mocking Blow
	[694] = "taunt",
	-- Growl (Druid)
	[6795] = "taunt",
	-- Dark Command
	[56222] = "taunt",
	-- Hand of Reckoning
	[62124] = "taunt",
	-- Righteous Defense
	[31790] = "taunt",
	-- Distracting Shot
	[20736] = "taunt",
	-- Challenging Shout
	[1161] = "taunt",
	-- Challenging Roar
	[5209] = "taunt",
	-- Death Grip
	[49560] = "taunt",
	-- Challenging Howl
	[59671] = "taunt",
	-- Angered Earth
	[36213] = "taunt",
	
	--[[ DISORIENTS ]]--
	-- Dragon's Breath
	[31661] = "disorient",
	[33041] = "disorient",
	[33042] = "disorient",
	[33043] = "disorient",
	[42949] = "disorient",
	[42950] = "disorient",
	
	-- Hungering Cold
	[49203] = "disorient",
	
	-- Sap
	[6770] = "disorient",
	[2070] = "disorient",
	[11297] = "disorient",
	[51724] = "disorient",
	
	-- Gouge
	[1776] = "disorient",
		
	-- Hex (Guessing)
	[51514] = "disorient",
	
	-- Shackle
	[9484] = "disorient",
	[9485] = "disorient",
	[10955] = "disorient",
	
	-- Polymorph
	[118] = "disorient",
	[12824] = "disorient",
	[12825] = "disorient",
	[28272] = "disorient",
	[28271] = "disorient",
	[12826] = "disorient",
	[61305] = "disorient",
	[61025] = "disorient",
	[61721] = "disorient",
	[61780] = "disorient",
	
	-- Freezing Trap
	[3355] = "disorient",
	[14308] = "disorient",
	[14309] = "disorient",
	
	-- Freezing Arrow
	[60210] = "disorient",

	-- Wyvern Sting
	[24131] = "horror",
	
	-- Repentance
	[20066] = "horror",
		
	--[[ SILENCES ]]--
	-- Nether Shock
	[53588] = "silence",
	[53589] = "silence",
	
	-- Garrote
	[1330] = "silence",
	
	-- Arcane Torrent (Energy version)
	[25046] = "silence",
	
	-- Arcane Torrent (Mana version)
	[28730] = "silence",
	
	-- Arcane Torrent (Runic power version)
	[50613] = "silence",
	
	-- Silence
	[15487] = "silence",

	-- Silencing Shot
	[34490] = "silence",

	-- Improved Kick
	[18425] = "silence",

	-- Improved Counterspell
	[18469] = "silence",
	
	-- Spell Lock
	[19244] = "silence",
	[19647] = "silence",
	
	-- Shield of the Templar
	[63529] = "silence",
	
	-- Strangulate
	[47476] = "silence",
	[49913] = "silence",
	[49914] = "silence",
	[49915] = "silence",
	[49916] = "silence",
	
	-- Gag Order (Warrior talent)
	[18498] = "silence",
	
	-- Unstable Affliction
	[31117] = "silence",
	
	--[[ DISARMS ]]--
	-- Snatch
	[53542] = "disarm",
	[53543] = "disarm",
	
	-- Dismantle
	[51722] = "disarm",
	
	-- Disarm
	[676] = "disarm",
	
	-- Chimera Shot - Scorpid
	[53359] = "disarm",
	
	-- Psychic Horror (Disarm effect)
	[64058] = "disarm",
	
	-- Fiery Payback (Disarm effect)
	[64353] = "disarm",

	--[[ FEARS ]]--
	-- Blind
	[2094] = "horror",

	-- Fear (Warlock)
	[5782] = "disorient",
	[6213] = "disorient",
	[6215] = "disorient",
	
	-- Seduction (Pet)
	[6358] = "disorient",
	
	-- Howl of Terror
	[5484] = "disorient",
	[17928] = "disorient",

	-- Psychic scream
	[8122] = "disorient",
	[8124] = "disorient",
	[10888] = "disorient",
	[10890] = "disorient",
	
	-- Scare Beast
	[1513] = "disorient",
	[14326] = "disorient",
	[14327] = "disorient",
	
	-- Turn Evil
	[10326] = "disorient",
	
	-- Intimidating Shout
	[5246] = "disorient",
	

	--[[ CONTROL STUNS ]]--
	-- Intercept (Felguard)
	[30153] = "ctrlroot",
	[30195] = "ctrlroot",
	[30197] = "ctrlroot",
	[47995] = "ctrlroot",
	
	-- Ravage
	[50518] = "ctrlstun",
	[53558] = "ctrlstun",
	[53559] = "ctrlstun",
	[53560] = "ctrlstun",
	[53561] = "ctrlstun",
	[53562] = "ctrlstun",
	
	-- Sonic Blast
	[50519] = "ctrlstun",
	[53564] = "ctrlstun",
	[53565] = "ctrlstun",
	[53566] = "ctrlstun",
	[53567] = "ctrlstun",
	[53568] = "ctrlstun",
	
	-- Concussion Blow
	[12809] = "ctrlstun",
	
	-- Shockwave
	[46968] = "ctrlstun",
	[846968] = "ctrlstun",
	[846969] = "ctrlstun",
	
	-- Hammer of Justice
	[853] = "ctrlstun",
	[5588] = "ctrlstun",
	[5589] = "ctrlstun",
	[10308] = "ctrlstun",

	-- Bash
	[5211] = "ctrlstun",
	[6798] = "ctrlstun",
	[8983] = "ctrlstun",
	
	-- Intimidation
	[19577] = "ctrlstun",

	-- Maim
	[22570] = "disorient",
	[49802] = "disorient",

	-- Kidney Shot
	[408] = "ctrlstun",
	[8643] = "ctrlstun",

	-- War Stomp
	[20549] = "ctrlstun",

	-- Intercept
	[20252] = "ctrlstun",
	
	-- Deep Freeze
	[44572] = "ctrlstun",
			
	-- Shadowfury
	[30283] = "ctrlstun", 
	[30413] = "ctrlstun",
	[30414] = "ctrlstun",
	
	-- Holy Wrath
	[2812] = "ctrlstun",
	
	-- Inferno Effect
	[22703] = "ctrlstun",
	
	-- Demon Charge
	[60995] = "ctrlstun",
	
	-- Gnaw (Ghoul)
	[47481] = "ctrlstun",
	
	--[[ RANDOM STUNS ]]--
	-- Impact
	[12355] = "rndstun",

	-- Improved Fire Nova Totem
	[64538] = "rndstun",
	[51880] = "rndstun",
	
	-- Stoneclaw Stun
	[39796] = "rndstun",
	
	-- Seal of Justice
	[20170] = "rndroot",
	
	--[[ CYCLONE ]]--
	-- Cyclone
	[33786] = "disorient",
	
	--[[ ROOTS ]]--
	-- Freeze (Water Elemental)
	[33395] = "ctrlroot",
	
	-- Pin (Crab)
	[50245] = "ctrlroot",
	[53544] = "ctrlroot",
	[53545] = "ctrlroot",
	[53546] = "ctrlroot",
	[53547] = "ctrlroot",
	[53548] = "ctrlroot",	
	
	-- Frost Nova
	[122] = "ctrlroot",
	[865] = "ctrlroot",
	[6131] = "ctrlroot",
	[10230] = "ctrlroot",
	[27088] = "ctrlroot",
	[42917] = "ctrlroot",
	
	-- Entangling Roots
	[339] = "ctrlroot",
	[1062] = "ctrlroot",
	[5195] = "ctrlroot",
	[5196] = "ctrlroot",
	[9852] = "ctrlroot",
	[9853] = "ctrlroot",
	[26989] = "ctrlroot",
	[53308] = "ctrlroot",
	
	-- Nature's Grasp (Uses different spellIDs than Entangling Roots for the same spell)
	[19970] = "ctrlroot",
	[19971] = "ctrlroot",
	[19972] = "ctrlroot",
	[19973] = "ctrlroot",
	[19974] = "ctrlroot",
	[19975] = "ctrlroot",
	[27010] = "ctrlroot",
	[53313] = "ctrlroot",
	
	-- Earthgrab (Storm, Earth and Fire talent)
	[8377] = "ctrlroot",
	[31983] = "ctrlroot",

	-- Web (Spider)
	[4167] = "ctrlroot",
	
	-- Venom Web Spray (Silithid)
	[54706] = "ctrlroot",
	[55505] = "ctrlroot",
	[55506] = "ctrlroot",
	[55507] = "ctrlroot",
	[55508] = "ctrlroot",
	[55509] = "ctrlroot",
	
	
	--[[ RANDOM ROOTS ]]--
	-- Improved Hamstring
	[23694] = "rndroot",
	
	-- Frostbite
	[12494] = "rndroot",

	-- Shattered Barrier
	[55080] = "rndroot",
	
	--[[ SLEEPS ]]--
	-- Hibernate
	[2637] = "disorient",
	[18657] = "disorient",
	[18658] = "disorient",
		
	--[[ HORROR ]]--
	-- Death Coil
	[6789] = "horror",
	[17925] = "horror",
	[17926] = "horror",
	[27223] = "horror",
	[47859] = "horror",
	[47860] = "horror",
	
	-- Psychic Horror
	[64044] = "horror",
	
	-- Blood Horror
	[954517] = "horror",
	[954563] = "horror",
	[954565] = "horror",
	[954567] = "horror",
	
	--[[ MISC ]]--
	-- Scatter Shot
	[19503] = "disorient",

	-- Cheap Shot
	[1833] = "ctrlstun",

	-- Pounce
	[9005] = "ctrlstun",
	[9823] = "ctrlstun",
	[9827] = "ctrlstun",
	[27006] = "ctrlstun",
	[49803] = "ctrlstun",

	-- Charge
	[7922] = "charge",
	
	-- Mind Control
	[605] = "disorient",

	-- Banish
	[710] = "banish",
	[18647] = "banish",
	
	-- Entrapment
	[64804] = "ctrlroot",
	[64804] = "ctrlroot",
	[19185] = "ctrlroot",
	
	-- Chaos Meteor
	[954240] = "disorient",
	
	-- Electrocute
	[954387] = "disorient",
	
	-- Blinding Light
	[954500] = "horror",

	-- Guerilla Stun
	[954099] = "ctrlstun",

	-- Timed Charge
	[954637] = "ctrlstun",

	-- Blinding Dispersion
	[954635] = "disorient",

	-- Starfire Stun
	[16922] = "rndstun",

	-- Transformation Sickness
	[411148] = "ctrlstun",

	-- Freeze (Frozen Power)
	[63685] = "ctrlroot",

	-- Earthquake Stun
	[954527] = "rndstun",
	
	-- Noxious Poison
	[954189] = "silence",
	
	-- Lightning Overload
	[412005] = "rndstun",
	
	-- Lightning Overload
	[412005] = "rndstun",
	
	-- Lightning Discharge
	[954037] = "ctrlstun",
	
	-- Foul Play
	[965663] = "silence",
	
	-- Lightning Discharge (Capacitor Totem)
	[954519] = "ctrlstun",
	[954595] = "ctrlstun",
	[954596] = "ctrlstun",
	[954597] = "ctrlstun",
	[954598] = "ctrlstun",
	[954599] = "ctrlstun",
	[954600] = "ctrlstun",
	[954601] = "ctrlstun",
	
	-- Heroic Impact
	[949397] = "ctrlstun",
	
	-- Hibernate (Hypnosis)
	[977966] = "disorient",
	
	-- Stoneclaw Petrification
	[954121] = "horror",
	
	-- Stormherald
	[34510] = "ctrlstun",
	
	-- Mace Specialization Stun
	[56] = "rndstun",
	
	-- Light of Justice
	[977953] = "ctrlstun",
	
	-- Ring of Frost
	[954855] = "horror",
	
}

-- DR Category names
Data.categoryNames = {
	["banish"] = L["Banish"],
	["charge"] = L["Charge"],
	["cheapshot"] = L["Cheap Shot"],
	["ctrlstun"] = L["Controlled stuns"],
	["cyclone"] = L["Cyclone"],
	["disarm"] = L["Disarms"],
	["disorient"] = L["Disorients"],
	["entrapment"] = L["Entrapment"],
	["horror"] = L["Fears"],
	["horror"] = L["Horrors"],
	["mc"] = L["Mind Control"],
	["rndroot"] = L["Random roots"],
	["rndstun"] = L["Random stuns"],
	["ctrlroot"] = L["Controlled roots"],
	["scatters"] = L["Scatter Shot"],
	["silence"] = L["Silences"],
	["sleep"] = L["Hibernate"],
	["taunt"] = L["Taunts"],
}

-- Categories that have DR in PvE as well as PvP
Data.pveDR = {
	["ctrlstun"] = true,
	["rndstun"] = true,
	["taunt"] = true,
	["cyclone"] = true,
}

-- Public APIs
-- Category name in something usable
function Data:GetCategoryName(cat)
	return cat and Data.categoryNames[cat] or nil
end

-- Spell list
function Data:GetSpells()
	return Data.spells
end

-- Seconds before DR resets
function Data:GetResetTime()
	return Data.RESET_TIME
end

-- Get the category of the spellID
function Data:GetSpellCategory(spellID)
	return spellID and Data.spells[spellID] or nil
end

-- Does this category DR in PvE?
function Data:IsPVE(cat)
	return cat and Data.pveDR[cat] or nil
end

-- List of categories
function Data:GetCategories()
	return Data.categoryNames
end

-- Next DR, if it's 1.0, next is 0.50, if it's 0.[50] = "ctrlroot",next is 0.[25] = "ctrlroot",and such
function Data:NextDR(diminished)
	if( diminished == 1 ) then
		return 0.50
	elseif( diminished == 0.50 ) then
		return 0.25
	end
	
	return 0
end

--[[ EXAMPLES ]]--
-- This is how you would track DR easily, you're welcome to do whatever you want with the below functions

--[[
local trackedPlayers = {}
local function debuffGained(spellID, destName, destGUID, isEnemy, isPlayer)
	-- Not a player, and this category isn't diminished in PVE, as well as make sure we want to track NPCs
	local drCat = DRData:GetSpellCategory(spellID)
	if( not isPlayer and not DRData:IsPVE(drCat) ) then
		return
	end
	
	if( not trackedPlayers[destGUID] ) then
		trackedPlayers[destGUID] = {}
	end

	-- See if we should reset it back to undiminished
	local tracked = trackedPlayers[destGUID][drCat]
	if( tracked and tracked.reset <= GetTime() ) then
		tracked.diminished = 1.0
	end
end

local function debuffFaded(spellID, destName, destGUID, isEnemy, isPlayer)
	local drCat = DRData:GetSpellCategory(spellID)
	if( not isPlayer and not DRData:IsPVE(drCat) ) then
		return
	end

	if( not trackedPlayers[destGUID] ) then
		trackedPlayers[destGUID] = {}
	end

	if( not trackedPlayers[destGUID][drCat] ) then
		trackedPlayers[destGUID][drCat] = { reset = 0, diminished = 1.0 }
	end
	
	local time = GetTime()
	local tracked = trackedPlayers[destGUID][drCat]
	
	tracked.reset = time + DRData:GetResetTime()
	tracked.diminished = DRData:NextDR(tracked.diminished)
	
	-- Diminishing returns changed, now you can do an update
end

local function resetDR(destGUID)
	-- Reset the tracked DRs for this person
	if( trackedPlayers[destGUID] ) then
		for cat in pairs(trackedPlayers[destGUID]) do
			trackedPlayers[destGUID][cat].reset = 0
			trackedPlayers[destGUID][cat].diminished = 1.0
		end
	end
end

local COMBATLOG_OBJECT_TYPE_PLAYER = COMBATLOG_OBJECT_TYPE_PLAYER
local COMBATLOG_OBJECT_REACTION_HOSTILE = COMBATLOG_OBJECT_REACTION_HOSTILE
local COMBATLOG_OBJECT_CONTROL_PLAYER = COMBATLOG_OBJECT_CONTROL_PLAYER

local eventRegistered = {["SPELL_AURA_APPLIED"] = true, ["SPELL_AURA_REFRESH"] = true, ["SPELL_AURA_REMOVED"] = true, ["PARTY_KILL"] = true, ["UNIT_DIED"] = true}
local function COMBAT_LOG_EVENT_UNFILTERED(self, event, timestamp, eventType, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, spellID, spellName, spellSchool, auraType)
	if( not eventRegistered[eventType] ) then
		return
	end
	
	-- Enemy gained a debuff
	if( eventType == "SPELL_AURA_APPLIED" ) then
		if( auraType == "DEBUFF" and DRData:GetSpellCategory(spellID) ) then
			local isPlayer = ( bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) == COMBATLOG_OBJECT_TYPE_PLAYER or bit.band(destFlags, COMBATLOG_OBJECT_CONTROL_PLAYER) == COMBATLOG_OBJECT_CONTROL_PLAYER )
			debuffGained(spellID, destName, destGUID, (bit.band(destFlags, COMBATLOG_OBJECT_REACTION_HOSTILE) == COMBATLOG_OBJECT_REACTION_HOSTILE), isPlayer)
		end
	
	-- Enemy had a debuff refreshed before it faded, so fade + gain it quickly
	elseif( eventType == "SPELL_AURA_REFRESH" ) then
		if( auraType == "DEBUFF" and DRData:GetSpellCategory(spellID) ) then
			local isPlayer = ( bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) == COMBATLOG_OBJECT_TYPE_PLAYER or bit.band(destFlags, COMBATLOG_OBJECT_CONTROL_PLAYER) == COMBATLOG_OBJECT_CONTROL_PLAYER )
			local isHostile = (bit.band(destFlags, COMBATLOG_OBJECT_REACTION_HOSTILE) == COMBATLOG_OBJECT_REACTION_HOSTILE)
			debuffFaded(spellID, destName, destGUID, isHostile, isPlayer)
			debuffGained(spellID, destName, destGUID, isHostile, isPlayer)
		end
	
	-- Buff or debuff faded from an enemy
	elseif( eventType == "SPELL_AURA_REMOVED" ) then
		if( auraType == "DEBUFF" and DRData:GetSpellCategory(spellID) ) then
			local isPlayer = ( bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) == COMBATLOG_OBJECT_TYPE_PLAYER or bit.band(destFlags, COMBATLOG_OBJECT_CONTROL_PLAYER) == COMBATLOG_OBJECT_CONTROL_PLAYER )
			debuffFaded(spellID, destName, destGUID, (bit.band(destFlags, COMBATLOG_OBJECT_REACTION_HOSTILE) == COMBATLOG_OBJECT_REACTION_HOSTILE), isPlayer)
		end
		
	-- Don't use UNIT_DIED inside arenas due to accuracy issues, outside of arenas we don't care too much
	elseif( ( eventType == "UNIT_DIED" and select(2, IsInInstance()) ~= "arena" ) or eventType == "PARTY_KILL" ) then
		resetDR(destGUID)
	end
end]]
