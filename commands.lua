---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Zoë.
--- DateTime: 11/04/2022 18:43
---

local commands = {}

function commands.RTSell(...)
    local args = {...}
    local s = args[1]
    for bag = 0,4 do
        for slot = 1, GetContainerNumSlots(bag) do
            local link = GetContainerItemLink(bag, slot)
            if link then
                local name, _, _, _, _, _, _, _, _, price = GetItemInfo(link)
                if name == s and price ~= 0 then
                    UseContainerItem(bag, slot)
                end
            end
        end
    end
end

for command, func in pairs(commands) do
    _G["SLASH_"..command:upper().."1"] = "/"..command;
    SlashCmdList[command:upper()] = func;
end

RandomThings.commands = commands;