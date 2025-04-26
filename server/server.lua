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
    for _, roleId in ipairs(userRoles) do
        local roleRank = Config.Ranks[roleId]
        if roleRank and (not highestRank or roleRank > highestRank) then
            highestRank = roleRank
        end
    end

    return highestRank
end

exports('GetRank', GetRoleRank)