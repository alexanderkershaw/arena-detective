------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- Written by Alexsmite-TarrenMill
-- Contact me on twitter at @AlexsmiteWoW
------------------------------------------------------------------------------
------------------------------------------------------------------------------

-- Define the getEscapeString function first so we can refer to it early.
-- Get an escape string that shows an icon. 
function aura_env.getEscapeString(iconID, height, width)
    return  "|T" .. iconID .. ":" ..
    height .. ":" .. width .. ":0:0|t"
end

-- Specify covenant icon IDs as we refer to these alot. 
local icons = {
    ["kyrian"] = 3257748,
    ["necrolord"] = 3257749,
    ["venthyr"] = 3257751, 
    ["nightfae"] = 3257750,
}

------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- Here we define a bunch of spellIDs and auraIDs that we we watch for. The
-- key for each entry is the spell/aura ID, and each contains a sub-table.
--
-- The sub-table must contain a "text" entry, "trackFor" and a 
-- "notificationType" entry. It may optionally contain an "icon" and 
-- "escape" entry.
--
-- Required Entries:
--   text: a string of text to display if this entry is detected. 
--   trackFor: a single entry "all", or a list of specIDs to track for. 
--     See https://wowpedia.fandom.com/wiki/SpecializationID for specIDs. 
--     Only need to specify a specID if other specs can trigger the same event.
--     For example, ret paladin can use the same small sac holy can. 
--   notificationType: 1 - Trinkets, 2 - Covenants, 3 - Talents, 
--                     4 - Honor Talents, 5 - Gear
--
-- Optional Entries: 
--   icon: An iconID to display instead of the text field (toggle in options). 
--   escape: Override the "icon" field directly with an escape string. 

------------------------------------------------------------------------------
------------------------------------------------------------------------------

aura_env.spellList =  {
    -- Final Verdict
    [336872] = {
        text = "Final Verdict", 
        icon = 461860,
        trackFor = {"all"},
        notificationType = 5,
    },

    -- Holy Priest Guardian Talent
    [215769] = {
        text = "Ress Talent", 
        icon = 1697996, 
        trackFor = {"all"},
        notificationType = 4,
    },

    -- Blessing of Sanctuary
    [336872] = {
        text = "Sanctuary", 
        icon = 135911,
        trackFor = {"all"},
        notificationType = 4,
    },
    -- Shining Force
    [204263] = {
        text = "Shining Force", 
        icon = 571554,
        trackFor = {"all"},
        notificationType = 3,
    },
    
    -- Meteor
    [153561] = {
        text = "Meteor", 
        icon = 1033911, 
        trackFor = {"all"},
        notificationType = 3,
    },
        
    -- Blinding Light
    [115750] = {
        text = "Blinding Light", 
        icon = 571553,
        trackFor = {"all"},
        notificationType = 3,
    },
    
    -- Marked For Death
    [137619] = {
        text = "Marked for Death", 
        icon = 236364,
        trackFor = {"all"},
        notificationType = 3,
    },
    
    -- Grounding Totem
    [204336] = {
        text = "Grounding Totem", 
        icon = 136039,
        trackFor = {"all"},
        notificationType = 4,
    },
    
    -- Shackles trinket
    [356567] = {
        text = "Shackles", 
        icon = 646677, 
        trackFor = {"all"},
        notificationType = 1,
    },
    
    -- Emblem trinket
    [345231] = {
        text = "Emblem", 
        icon = 132344, 
        trackFor = {"all"},
        notificationType = 1,
    },

    -- Song of Chi-Ji
    [198898] = {
        text = "Song of Chi-Ji", 
        icon = 332402,
        trackFor = {"all"},
        notificationType = 3,
    },

    ---------------------------------------------------------------------------
    -- Signature covenant abilities.
    ---------------------------------------------------------------------------

    -- Soulshape
    [310143] = {
        text = "Night fae", 
        icon = icons["nightfae"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Summon Steward
    [324739] = {
        text = "Kyrian", 
        icon = icons["kyrian"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Door of Shadows
    [300728] = {
        text = "Venthyr", 
        icon = icons["venthyr"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Fleshcraft
    [331180] = {
        text = "Necrolord", 
        icon = icons["necrolord"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    ---------------------------------------------------------------------------
    -- Warrior covenants.
    ---------------------------------------------------------------------------

    -- Condemn
    [317349] = {
        text = "Condemn", 
        icon = icons["venthyr"], 
        trackFor = {"all"},
        notificationType = 2,
    },
    
    -- Spear of Bastion
    [307865] = {
        text = "Emblem", 
        icon = icons["kyrian"], 
        trackFor = {"all"},
        notificationType = 2,
    },
    
    -- Conqueror's Banner
    [324143] = {
        text = "Necrolord", 
        icon = icons["necrolord"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Ancient Aftershock
    [325886] = {
        text = "Night fae", 
        icon = icons["nightfae"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    ---------------------------------------------------------------------------
    -- Priest covenant.
    ---------------------------------------------------------------------------

    -- Mindgames
    [323673] = {
        text = "Venthyr", 
        icon = icons["venthyr"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Unholy Nova
    [324724] = {
        text = "Necrolord", 
        icon = icons["necrolord"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Fae Guardians
    [327661] = {
        text = "Night fae", 
        icon = icons["nightfae"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Boon of the Ascended
    [325013] = {
        text = "Kyrian", 
        icon = icons["kyrian"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    ---------------------------------------------------------------------------
    -- Monk covenant.
    ---------------------------------------------------------------------------

    -- Weapons of Order
    [310454] = {
        text = "Kyrian", 
        icon = icons["kyrian"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Bonedust Brew
    [325216] = {
        text = "Necrolord", 
        icon = icons["necrolord"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Fallen Order
    [326860] = {
        text = "Venthyr", 
        icon = icons["venthyr"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Faeline Stomp
    [327104] = {
        text = "Night fae", 
        icon = icons["nightfae"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    ---------------------------------------------------------------------------
    -- DK covenant.
    ---------------------------------------------------------------------------

    -- Abom Limb
    [315443] = {
        text = "Necrolord", 
        icon = icons["necrolord"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Shackle the Unworthy
    [312202] = {
        text = "Kyrian", 
        icon = icons["kyrian"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Swarming Mist
    [311648] = {
        text = "Venthyr", 
        icon = icons["venthyr"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Death's Due
    [324128] = {
        text = "Night fae", 
        icon = icons["nightfae"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    ---------------------------------------------------------------------------
    -- DH covenant.
    ---------------------------------------------------------------------------

    -- Fodder to the Flame
    [329554] = {
        text = "Necrolord", 
        icon = icons["necrolord"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Elysian Decree
    [306830] = {
        text = "Kyrian", 
        icon = icons["kyrian"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Sinful Brand
    [317009] = {
        text = "Venthyr", 
        icon = icons["venthyr"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- The Hunt
    [323639] = {
        text = "Night fae", 
        icon = icons["nightfae"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    ---------------------------------------------------------------------------
    -- Druid covenant.
    ---------------------------------------------------------------------------

    -- Adaptive Swarm
    [325727] = {
        text = "Necrolord", 
        icon = icons["necrolord"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Kindred Spirits
    [326434] = {
        text = "Kyrian", 
        icon = icons["kyrian"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Ravenous Frenzy
    [323546] = {
        text = "Venthyr", 
        icon = icons["venthyr"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Convoke the Spirits
    [323764] = {
        text = "Night fae", 
        icon = icons["nightfae"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    ---------------------------------------------------------------------------
    -- Hunter covenant.
    ---------------------------------------------------------------------------

    -- Death Chakram
    [325028] = {
        text = "Necrolord", 
        icon = icons["necrolord"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Resonating Arrow
    [308491] = {
        text = "Kyrian", 
        icon = icons["kyrian"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Flayed Shot
    [324149] = {
        text = "Venthyr", 
        icon = icons["venthyr"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Wild Spirits
    [328231] = {
        text = "Night fae", 
        icon = icons["nightfae"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    ---------------------------------------------------------------------------
    -- Mage covenant.
    ---------------------------------------------------------------------------

    -- Deathborne
    [324220] = {
        text = "Necrolord", 
        icon = icons["necrolord"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Radiant Spark
    [307443] = {
        text = "Kyrian", 
        icon = icons["kyrian"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Mirrors of Torment
    [314793] = {
        text = "Venthyr", 
        icon = icons["venthyr"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Shifting Power
    [314791] = {
        text = "Night fae", 
        icon = icons["nightfae"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    ---------------------------------------------------------------------------
    -- Pala covenant.
    ---------------------------------------------------------------------------

    -- Vanquisher's Hammer
    [328204] = {
        text = "Necrolord", 
        icon = icons["necrolord"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Divine Toll
    [304971] = {
        text = "Kyrian", 
        icon = icons["kyrian"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Ashen Hallow
    [316958] = {
        text = "Venthyr", 
        icon = icons["venthyr"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Blessing of the Seasons
    [328278] = {
        text = "Night fae", 
        icon = icons["nightfae"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    ---------------------------------------------------------------------------
    -- Rogue covenant.
    ---------------------------------------------------------------------------

    -- Serrated Bone Spike
    [328547] = {
        text = "Necrolord", 
        icon = icons["necrolord"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Echoing Reprimand
    [323547] = {
        text = "Kyrian", 
        icon = icons["kyrian"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Flagellation
    [323654] = {
        text = "Venthyr", 
        icon = icons["venthyr"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Sepsis
    [328305] = {
        text = "Night fae", 
        icon = icons["nightfae"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    ---------------------------------------------------------------------------
    -- Shaman covenant.
    ---------------------------------------------------------------------------

    -- Primordial Wave
    [326059] = {
        text = "Necrolord", 
        icon = icons["necrolord"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Vesper Totem
    [324386] = {
        text = "Kyrian", 
        icon = icons["kyrian"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Chain Harvest
    [320674] = {
        text = "Venthyr", 
        icon = icons["venthyr"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Fae Transfusion  
    [328923] = {
        text = "Night fae", 
        icon = icons["nightfae"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    ---------------------------------------------------------------------------
    -- Warlock covenant.
    ---------------------------------------------------------------------------

    -- Decimating Bolt
    [325289] = {
        text = "Necrolord", 
        icon = icons["necrolord"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Scouring Tithe
    [312321] = {
        text = "Kyrian", 
        icon = icons["kyrian"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Impending Catastrophe
    [321792] = {
        text = "Venthyr", 
        icon = icons["venthyr"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Soul Rot
    [325640] = {
        text = "Night fae", 
        icon = icons["nightfae"], 
        trackFor = {"all"},
        notificationType = 2,
    },
}

-- Aura IDs we care about tracking.
aura_env.auraList =  {
    -- Kyrian Boomie
    [338142] = {
        text = "Kyrian", 
        icon = icons["kyrian"], 
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Warrior Exploiter Legendary
    [335452] = {
        text = "Exploiter", 
        icon = 135358, 
        trackFor = {"all"},
        notificationType = 5,
    },

    -- Necro Boomie/Feral
    [325733] = {
        text = "Necrolord", 
        icon = icons["necrolord"], 
        trackFor = {"all"}, -- Don't track for resto druids
        notificationType = 2,
    },
    
    -- Double Reflect
    [335255] = {
        text = "Double Reflect", 
        icon = 237468,
        trackFor = {"all"},
        notificationType = 5,
    },
    
    -- Pala Tank Legendary
    [86659]  = {
        text = "Tank Legendary", 
        icon = 571555, 
        trackFor = {"all"},
        notificationType = 5,
    },
    
    -- Chastise Stun
    [200200] = {
        text = "Chastise Stun", 
        icon = 135904, 
        trackFor = {"all"},
        notificationType = 3,
    },
    
    -- Chastise Incap
    [200196] = {
        text = "Chastise Incap", 
        icon = 135886,
        trackFor = {"all"},
        notificationType = 3,
    },
    
    -- Hand of Sacrifice (30%)
    [6940]   = {
        text = "Small Sac", 
        escape = " Small" .. aura_env.getEscapeString(135966, 15, 15),
        trackFor = {65}, -- Only care about this for Holy Paladins
        notificationType = 4,
    },
    
    -- Ultimate Sacrifice (100%)
    [199448] = {
        text = "Ultimate Sac", 
        escape = " Big" .. aura_env.getEscapeString(135966, 15, 15),
        trackFor = {"all"},
        notificationType = 4,
    },
    
    -- Holy Priest Ress Legendary
    [211319] = {
        text = "Ress Legendary", 
        icon = 1697996, 
        trackFor = {"all"},
        notificationType = 5,
    },
    
    -- Atonement: used to check for Trinity
    -- [194384] = {
    --    text = "UN_USED", 
    --    icon = 537078, -- Trinity icon
    --    trackFor = {"all"},
    --    notificationType = 4,
    --},
    
    -- Kidney Shot: used to check for Deeper Strategem.
    -- [408]    = {
    --    text = "UN_USED", 
    --    icon = 644377, -- Deeper Strategem icon 
    --    trackFor = {"all"},
    --    notificationType = 3,
    --},
    
    -- Badge
    [345228] = {
        text = "Badge",
        icon = 135884, 
        trackFor = {"all"},
        notificationType = 1,
    },
    
    -- Insignia
    [345229] = {
        text = "Insignia",
        icon = 134501,
        trackFor = {"all"},
        notificationType = 1,
    },

    -- Fleshcraft buff
    [324867] = {
        text = "Necrolord",
        icon = icons["necrolord"],
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Undulating Manouvers
    [352109] = {
        text = "Necrolord",
        icon = icons["necrolord"],
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Soothing Shade
    [336885] = {
        text = "Venthyr",
        icon = icons["venthyr"],
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Combat Meditation
    [328908] = {
        text = "Kyrian",
        icon = icons["kyrian"],
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Let Go of the Past
    [328900] = {
        text = "Kyrian",
        icon = icons["kyrian"],
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Cleansing Rites
    [330927] = {
        text = "Kyrian",
        icon = icons["kyrian"],
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Valiant Strikes
    [330943] = {
        text = "Kyrian",
        icon = icons["kyrian"],
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Ooz's Frictionless Coating
    [323385] = {
        text = "Necrolord",
        icon = icons["necrolord"],
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Redirected Anima
    [342814] = {
        text = "Night Fae",
        icon = icons["nightfae"],
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Invigorating Herbs
    [321510] = {
        text = "Night Fae",
        icon = icons["nightfae"],
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Survivor's Rally
    [352857] = {
        text = "Night Fae",
        icon = icons["nightfae"],
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Soothing Voice
    [352857] = {
        text = "Night Fae",
        icon = icons["nightfae"],
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Social Butterfly
    [320130] = {
        text = "Night Fae",
        icon = icons["nightfae"],
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Social Butterfly
    [320212] = {
        text = "Night Fae",
        icon = icons["nightfae"],
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Waking Dreams
    [353477] = {
        text = "Night Fae",
        icon = icons["nightfae"],
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Effusive Anima Accelerator
    [353248] = {
        text = "Kyrian",
        icon = icons["kyrian"],
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Bron's Call to Action
    [332514] = {
        text = "Kyrian",
        icon = icons["kyrian"],
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Thrill Seeker
    [331939] = {
        text = "Venthyr",
        icon = icons["venthyr"],
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Mad Duke's Tea (Theotar)
    [353266] = {
        text = "Venthyr",
        icon = icons["venthyr"],
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Kindred Affinity
    [357564] = {
        text = "Kyrian",
        icon = icons["kyrian"],
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Kindred Empowerment
    [327022] = {
        text = "Kyrian",
        icon = icons["kyrian"],
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Kindred Empowerment
    [327139] = {
        text = "Kyrian",
        icon = icons["kyrian"],
        trackFor = {"all"},
        notificationType = 2,
    },

    -- Pouch of Razor Fragments (Hunter Lego)
    [356620] = {
        text = "Pouch",
        icon = 4067366,
        trackFor = {"all"},
        notificationType = 5,
    },
}

------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- Utility functions
------------------------------------------------------------------------------
------------------------------------------------------------------------------

function aura_env.addToSet(set, key)
    set[key] = true
end

function aura_env.removeFromSet(set, key)
    set[key] = nil
end

function aura_env.setContains(set, key)
    return set[key] ~= nil
end

-- Get the spec ID and name of arena(i).
function aura_env.getEnemySpecDetails(i)
    
    aura_env.debugLogger("enter getEnemySpecDetails")     
    local specID = GetArenaOpponentSpec(i)
    local specName = select(2, GetSpecializationInfoByID(specID))
    local className = select(6, GetSpecializationInfoByID(specID))   
    aura_env.debugLogger("exit getEnemySpecDetails")  
    
    return specID, specName, className 
end

-- Get arena index of by GUID. 
function aura_env.getArenaIndex(sourceGUID)
    
    aura_env.debugLogger("enter getArenaIndex")    
    
    for i = 1, aura_env.numOpponents do
        if (sourceGUID == UnitGUID("arena" .. i)) then
            return i
        end
    end
    
    aura_env.debugLogger("exit getArenaIndex")  
    
    return false
end

-- Get unit by GUID, tries to match party/arena. 
function aura_env.getUnitID(sourceGUID)
    
    aura_env.debugLogger("enter getUnitID")
    
    local index = false
    
    for i = 1, aura_env.numOpponents do
        if (sourceGUID == UnitGUID("arena" .. i)) then
            return "arena" .. i
        end
    end
    
    -- Might look weird to use numOpponents here, but they should always be equal.
    -- Unless someone failed to join or left, in which case who cares about errors. 
    for i = 1, aura_env.numOpponents do
        if (sourceGUID == UnitGUID("party" .. i)) then
            return "party" .. i
        end
    end
    
    aura_env.debugLogger("exit getUnitID")      
    return index
end

-- Insert to the info table, don't duplicate information. 
function aura_env.infoInsert(arenaIndex, item)
    
    aura_env.debugLogger("enter infoInsert")
    
    local insertStr
    
    if (item.escape) and (aura_env.config.useIcons) then
        aura_env.debugLogger("has specific escape sequence")
        insertStr = item.escape
    elseif (item.icon) and (aura_env.config.useIcons) then
        aura_env.debugLogger("has icon")
        insertStr = aura_env.getEscapeString(item.icon, 15, 15)
    elseif (item.text) then
        aura_env.debugLogger("has text")
        insertStr = item.text
    else 
        aura_env.debugLogger("has nothing")
        return
    end
    
    -- Don't do anything if we already have this info. 
    if aura_env.setContains(aura_env.enemies[arenaIndex].info, insertStr) then
        aura_env.debugLogger("already have info") 
        return        
    elseif aura_env.checkTrackingEnabled(arenaIndex, item) then
        aura_env.debugLogger("new info") 

        -- Check if the spell meets the threshold to send a notification. 
        local sendNotification = aura_env.config.notification[item.notificationType]
        sendNotification = sendNotification and (not WeakAuras.IsOptionsOpen())

        -- Send a notification if criteria is met. 
        if (sendNotification) then
            aura_env.sendNotification(arenaIndex, item)
        end

        aura_env.addToSet(aura_env.enemies[arenaIndex].info, insertStr)
    end  
    
    aura_env.debugLogger("exit infoInsert") 
end

-- Check if we should track this spell for this spec/class. 
function aura_env.checkTrackingEnabled(arenaIndex, item)
    
    aura_env.debugLogger("enter checkTrackingEnabled")

    if (item.trackFor[1] == "all") then
        aura_env.debugLogger("  all tracking enabled")
        return true
    elseif aura_env.listContainsVal(item.trackFor, aura_env.enemies[arenaIndex].specName) then
        aura_env.debugLogger("  specName tracking enabled")
        return true
    elseif aura_env.listContainsVal(item.trackFor, aura_env.enemies[arenaIndex].specID) then
        aura_env.debugLogger("  specID tracking enabled")
        return true
    elseif aura_env.listContainsVal(item.trackFor, aura_env.enemies[arenaIndex].className) then
        aura_env.debugLogger("  className tracking enabled")
        return true
    else
        aura_env.debugLogger("  tracking not enabled")
        return false
    end
    
    aura_env.debugLogger("exit checkTrackingEnabled")     
end

-- Insert to the info table, don't duplicate information. 
function aura_env.sendNotification(arenaIndex, item)
    aura_env.debugLogger("enter sendNotification")    

    local specID = aura_env.enemies[arenaIndex].specID

    if (item.escape) and (aura_env.config.useIcons) then
        aura_env.debugLogger("sending escape notification")

        WeakAuras.ScanEvents("DETECT_ARENA_EVENT", 
            specID, 
            nil, 
            nil, 
            item.escape)

    elseif (item.icon) and (aura_env.config.useIcons) then
        aura_env.debugLogger("sending icon notification")

        WeakAuras.ScanEvents("DETECT_ARENA_EVENT", 
            specID, 
            nil, 
            item.icon, 
            nil)

    else 
        aura_env.debugLogger("sending text notification")
        WeakAuras.ScanEvents("DETECT_ARENA_EVENT", 
            specID, 
            nil, 
            nil, 
            item.text)
    end

    aura_env.debugLogger("exit sendNotification")  
end

-- Takes a table returns as a comma seperated string. 
-- If not a table, then returns "".  
function aura_env.getInfoString(index)
    
    aura_env.debugLogger("enter getInfoString") 
    
    local tab = aura_env.enemies[index].info    
    local info = ""
    
    -- Return an empty string if table isn't as expected. 
    if (not (type(tab) == "table")) then
        return ""
    end  
    
    -- Create a string of the tables keys. 
    for key in pairs(tab) do 
        if (aura_env.config.useIcons) then
            -- Commas/spaces look ugly if using icons
            info = info .. key
        else
            info = info .. key .. ", "
        end
    end
    
    -- Strip off trailing ", " characters.
    if (string.sub(info, -2) == ", ") then 
        info = string.sub(info, 0, (#info - 2))
    end
    
    aura_env.debugLogger("exit getInfoString") 
    
    return info
end

-- Returns a string with class colouring based on the arena index. 
function aura_env.classColorSpecString(arenaIndex)
    
    aura_env.debugLogger("enter classColorSpecString") 
    
    local retStr = ("|c%s%s|r"):format(
        RAID_CLASS_COLORS[aura_env.enemies[arenaIndex].className].colorStr,
        aura_env.enemies[arenaIndex].specName)
    
    aura_env.debugLogger("exit classColorSpecString") 
    return retStr
end

-- Returns an escape string with class icon based on the arena index. 
function aura_env.escapeClassIcon(arenaIndex)
    
    aura_env.debugLogger("enter escapeClassIcon") 
    
    local iconID = aura_env.enemies[arenaIndex].classIcon
    local retStr = aura_env.getEscapeString(iconID, 10, 10)
    
    aura_env.debugLogger("exit escapeClassIcon") 
    return retStr
end

-- Check if a key exists in a table. 
function aura_env.tabContainsKey(tab, val)
    
    aura_env.debugLogger("enter tabContainsKey")
    for key, value in pairs(tab) do
        if key == val then
            return true
        end
    end    
    
    aura_env.debugLogger("exit tabContainsKey") 
    return false
end

-- Check if a key exists in a list (indexed table). 
function aura_env.listContainsVal(tab, val)

    aura_env.debugLogger("enter listContainsVal")

    for i, value in ipairs(tab) do
        if value == val then
            return true
        end
    end    
    
    aura_env.debugLogger("exit listContainsVal")
    return false
end

-- Format display string. 
function aura_env.formatDisplay()
    
    aura_env.debugLogger("enter formatDisplay")
    local display = ""
    
    for i = 1, aura_env.numOpponents do
        display = display .. string.format(
            "%s\n  - %s\n", 
            aura_env.escapeClassIcon(i) .. " " .. aura_env.classColorSpecString(i), 
            aura_env.getInfoString(i))
    end
    
    aura_env.debugLogger("exit formatDisplay")
    return display
end

-- Debug Logger
function aura_env.debugLogger(message)
    if aura_env.config.debug then  
        print(message)
    end
end

-- Mock display, doubles up as a test of the formatDisplay method. 
function aura_env.mockDisplay()
    
    aura_env.debugLogger("enter mockDisplay")
    aura_env.enemies = {}
    aura_env.numOpponents = 3
    
    aura_env.enemies[1] = {
        specID=63, 
        specName="Fire",
        className="MAGE",
        classIcon=select(4, GetSpecializationInfoByID(63)),
        info={}
    }
    
    aura_env.enemies[2] = {
        specID=71, 
        specName="Arms",
        className="WARRIOR",
        classIcon=select(4, GetSpecializationInfoByID(71)),
        info={}
    }
    
    aura_env.enemies[3] = {
        specID=65, 
        specName="Holy",
        className="PALADIN",
        classIcon=select(4, GetSpecializationInfoByID(65)),
        info={}
    }
    
    aura_env.infoInsert(1, aura_env.spellList[314791])
    aura_env.infoInsert(1, aura_env.spellList[153561])
    aura_env.infoInsert(1, aura_env.auraList[345228])
    aura_env.infoInsert(2, aura_env.spellList[317349])
    aura_env.infoInsert(2, aura_env.auraList[335255])
    aura_env.infoInsert(2, aura_env.auraList[345229])
    aura_env.infoInsert(3, aura_env.auraList[6940])
    aura_env.infoInsert(3, aura_env.spellList[115750])
    aura_env.infoInsert(3, aura_env.spellList[356567])
    
    aura_env.debugLogger("exit mockDisplay")
end

-- Setup enemy tables, called when gates open.
function aura_env.setupEnemies()    
    aura_env.debugLogger("enter setupEnemies")
   
    for i=1,aura_env.numOpponents do
        
        local specID, specName, className = aura_env.getEnemySpecDetails(i)
        local _, _, _, classIcon = GetSpecializationInfoByID(specID)
        
        aura_env.enemies[i] = {
            specID=specID, 
            specName=specName,
            className=className,
            classIcon=classIcon,
            info={},
        }
        
    end 
    
    aura_env.debugLogger("exit setupEnemies")
end

-- Scan all enemy teams auras, called when gates open.
function aura_env.scanTeam()    
    aura_env.debugLogger("enter scanTeam")

    for arenaIndex = 1, aura_env.numOpponents do
        -- No point scanning a stealthed unit - we can't see their auras.
        -- A stealthed unit triggers "SPELL_AURA_APPLIED" events for all 
        -- active buffs on leaving stealth. So we don't need to rescan. 
        if (UnitIsVisible("arena" .. arenaIndex)) then
            aura_env.scanUnitAuras(arenaIndex)
        end
    end
    
    aura_env.debugLogger("exit scanTeamAuras")
end

-- Scan a units auras.
function aura_env.scanUnitAuras(arenaIndex)    
    aura_env.debugLogger("enter scanUnitAuras")

    for auraIndex = 1, 40 do 
        local sourceUnit, _, _, auraID = select(7, UnitAura(arenaIndex, auraIndex))
        aura_env.debugLogger("sourceUnit", sourceUnit)
        aura_env.debugLogger("auraID", auraID)

        -- Check it's applied by an enemy player.
        if string.find(sourceUnit, "arena%d") then
            aura_env.debugLogger("source unit is", sourceUnit)

            -- Strip out the arenaIndex from the unit name. 
            local sourceIndex = sourceUnit:sub(-1)

            if (aura_env.tabContainsKey(aura_env.auraList, auraID)) then
                aura_env.infoInsert(arenaIndex, aura_env.spellList[auraID])   
            end
        end
    end

    aura_env.debugLogger("exit scanUnitAuras")
end