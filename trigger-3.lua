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
    local spellAuraApplied = (subevent == "SPELL_AURA_APPLIED")
    
    if (spellCast and aura_env.tabContainsKey(aura_env.spellList, spellID)) then
        -- False if not an enemy arena unit, this covers if it's a friendly cast. 
        local arenaIndex = aura_env.getArenaIndex(sourceGUID)
        
        if (arenaIndex) then
            aura_env.infoInsert(arenaIndex, aura_env.spellList[spellID])    
        end

        return true
    elseif (spellAuraApplied and aura_env.tabContainsKey(aura_env.auraList, spellID)) then
        -- False if not an enemy arena unit, this covers if it's a friendly cast. 
        local arenaIndex = aura_env.getArenaIndex(sourceGUID)  
        
        if (arenaIndex) then
            aura_env.infoInsert(arenaIndex, aura_env.auraList[spellID])      
        end

        return true  
    else
        return 
    end
end


