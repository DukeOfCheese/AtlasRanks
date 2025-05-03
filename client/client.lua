lib.registerContext({
    id='changeRank',
    title='Change Staff Rank',
    canClose=true,
    options = function()
        local options = {}
        for _, rank in ipairs(Config.Ranks) do
            table.insert(options, {
                title = rank.name,
                onSelect = function()
                    TriggerEvent('atlasranks:clientNoti', 'Rank changed to '..rank.name, 'success', 5000)
                    TriggerServerEvent('atlasranks:changeRank', rank.name)
                end
            })
        end
        return options
    end
})

RegisterNetEvent('atlasranks:sendMenu', function()
    lib.showContext('changeRank')
end)

RegisterNetEvent('atlasranks:clientNoti', function(msg, type, time)
    lib.notify({title='Atlas Ranks', description=msg, type=type, duration=time})
end)