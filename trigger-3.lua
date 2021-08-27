function(allstates,
        event, 
        timestamp, 
        subevent, 
        hideCaster,
        sourceGUID,
        sourceName,
        sourceFlags, 
        sourceRaidFlags, 
        destGUID, 
        destName, 
        destFlags, 
        destRaidFlags,
        spellID, 
        spellName, 
        spellSchool, 
        extraSpellId
    )
    
    local spellCast = (subevent == "SPELL_CAST_SUCCESS") or (subevent == "SPELL_CAST_START") 
    local isTrackedSpell = aura_env.tabContainsKey(aura_env.spellList, spellID)
    
    local spellAuraApplied = (subevent == "SPELL_AURA_APPLIED")
    local isTrackedAura = aura_env.tabContainsKey(aura_env.auraList, spellID) 
    
    if (spellCast and isTrackedSpell) then
        
        -- False if not an enemy arena unit, this covers if it's a friendly cast. 
        local arenaIndex = aura_env.getArenaIndex(sourceGUID)
        
        if (arenaIndex) then
            aura_env.infoInsert(arenaIndex, aura_env.spellList[spellID])    
        end  
        
    elseif (spellAuraApplied and isTrackedAura) then
        
        -- False if not an enemy arena unit, this covers if it's a friendly cast. 
        local arenaIndex = aura_env.getArenaIndex(sourceGUID)  
        
        -- If debuffs are applied to friendly units we still care about them.    
        local destUnit = aura_env.getUnitID(destGUID)        
        
        if (arenaIndex) then
            
            -- Deeper Stratagem is a special case.
            if (spellID == 408) then
                local duration = select(5, WA_GetUnitAura(destUnit, 408))
                
                -- Use 6.2s to cover the case of Sephuz 10% reduction, even though it's 7s base. 
                -- We might be able to use something exact here for orc/rele cases, but not done for now. 
                if (duration >= 6.2) then 
                    aura_env.infoInsert(arenaIndex, "Deeper Stratagem")
                end
                
                -- Trinity is a special case.
            elseif (spellID == 194384) then 
                local duration = select(5, WA_GetUnitAura(destUnit, 194384))
                
                if (duration >= 29) then 
                    aura_env.infoInsert(arenaIndex, "Trinity")
                end 
            else
                aura_env.infoInsert(arenaIndex, aura_env.auraList[spellID])
            end            
        end
    end
    
    return true
end




