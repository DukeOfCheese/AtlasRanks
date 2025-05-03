local hiddenRanks = {}

function GetRoleRank(player)
    local userRoles
    if Config.RoleFetchResource == 1 then
        userRoles = export.AtlasAPI:GetDiscordRoles(player)
    elseif Config.RoleFetchResource == 2 then
        userRoles = exports.BadgerDiscordAPI:GetUserRoles(player)
    else
        return nil
    end

    if not userRoles then
        return nil
    end

    local highestRank
    for _, playerTable in ipairs(hiddenRanks) do
        if playerTable.player == player then
            highestRank = playerTable.rank
        end
    end
    if highestRank == nil then
        for _, roleId in ipairs(userRoles) do
            local roleRank = Config.Ranks[roleId]
            if roleRank and (not highestRank or roleRank > highestRank) then
                highestRank = roleRank
            end
        end
    end

    return highestRank
end

exports('GetRank', GetRoleRank)

RegisterCommand('changerank', function()
    local src = source
    if IsPlayerAceAllowed(src, 'atlasranks.changerank') then
        TriggerClientEvent('atlasranks:sendMenu', src)
    else
        TriggerClientEvent('atlasranks:clientNoti', src, "No permission", "error", 3000)
    end
end)

RegisterNetEvent('atlasranks:changeRank', function(rankName)
    table.insert(hiddenRanks, {player=source, rank=rankName})
end)