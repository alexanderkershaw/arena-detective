-- Table containing keys of the form "playername-realmname" and
-- value corresponding to their covenant as per to the below:
--   1: Kyrian
--   2: Necrolord
--   3: Night Fae
--   4: Venthyr
aura_env.covenantMemory = {}

function aura_env.respond()
    for name, covenantID in pairs(aura_env.covenantMemory) do
        WeakAuras.ScanEvents("DETECTIVE_MEMORY_RESPONSE", name, covenantID)
    end
end





