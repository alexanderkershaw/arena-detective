function() 
    if WeakAuras.IsOptionsOpen() then
        aura_env.mockDisplay()
    end
    
    local display = aura_env.formatDisplay()
    
    return display
end