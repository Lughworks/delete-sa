local DEBUG = true

local function UnloadIpls()
    for _, iplName in pairs(YMAPS) do
        if IsIplActive(iplName) then
            RemoveIpl(iplName)

            if DEBUG then
                print(('[IPL UNLOADER] Removed IPL: %s'):format(iplName))
            end
        else
            if DEBUG then
                print(('[IPL UNLOADER] IPL not active: %s'):format(iplName))
            end
        end
    end
end

-- Run once when resource starts
AddEventHandler('onClientResourceStart', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    Wait(1000) -- small delay to ensure map loads first
    UnloadIpls()
end)