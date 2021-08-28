function(allstates, name, covenantID)
    
    local arenaIndex = aura_env.getArenaIndexByName(name)
    local covenantInformation = {
        [1] = {text = "Kyrian",    icon = 3257748, trackFor = {"all"}, notificationType = 2},
        [2] = {text = "Necrolord", icon = 3257749, trackFor = {"all"}, notificationType = 2},
        [3] = {text = "Night Fae", icon = 3257750, trackFor = {"all"}, notificationType = 2},
        [4] = {text = "Venthyr",   icon = 3257751, trackFor = {"all"}, notificationType = 2},
    }

    if (arenaIndex) then
        aura_env.infoInsert(arenaIndex, covenantInformation[covenantID])
    end

    return true
end




