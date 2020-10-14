﻿--[[
    ItemSystems.RollLootManager
    ================
    Description: Creates rolled loot objects that clients will listen for. 
]]

local ROLLENTRY_TEMPLATE = script:GetCustomProperty("RollEntryTemplate")
local ROLLER_TEMPLATE = script:GetCustomProperty("RollerTemplate")
local ROLL_EXPIRETIME = script:GetCustomProperty("RollExpireTime")

local Database = require(script:GetCustomProperty("ItemSystems_Database"))
Database:WaitUntilLoaded()

local entries = {}

-- Create a ID table of all players as a 
local function PlayersToIDTable(players)
    local ids = ''
    for _, player in pairs(players) do
        ids = ids .. player.id .. ","
    end
    return ids
end

local function GetEntry(id)
    for _, entry in pairs(entries) do
        if entry.serverUserData.id == id then
            return entry
        end
    end
    return nil
end

local function DeleteEntry(oldEntry)
    for i, entry in pairs(entries) do
        if entry == oldEntry then
            if Object.IsValid(entry) then
                table.remove(entries, i)
                entry:Destroy()
            end
        end
    end
end

local function RollingComplete(entry)
    local highestRoller = 0
    local winner = nil
    if not Object.IsValid(entry) then return end 
    for _, playerEntry in pairs(entry.serverUserData.replies) do
        if playerEntry.roll > highestRoller and playerEntry.participated then 
            highestRoller = playerEntry.roll
            winner = playerEntry.player
        end
    end
    if winner ~= nil then -- If no one claims the loot then we will destroy the entry
        Events.Broadcast("DropLootSpecificForPlayers",entry.serverUserData.itemName,winner,winner:GetWorldPosition() + Vector3.UP * -100)
    end
    DeleteEntry(entry)
end

-- Check if someone already rolled our number. If so then reroll.
local function GetValidRoll(entry)
    local roll = math.random(0,100)
    for _, playerEntry in pairs(entry.serverUserData.replies) do
        if playerEntry.roll == roll then GetValidRoll(entry) end
    end
    return roll
end

-- Receives a client reques
local function ProcessRollRequest(player,id,request) -- player, int, bool
    local entry = GetEntry(id)
    if not Object.IsValid(entry) then return end
    local replies = entry.serverUserData.replies
    local requiredReplies = entry.serverUserData.requiredReplies
    local roll = GetValidRoll(entry)
    if request then -- If the player wants to participate in the roll. 
        -- Clients will be listening for the players roll child. When they receive it they'll display what the person rolled above their head.
        local newRollerEntry = World.SpawnAsset(ROLLER_TEMPLATE)
        newRollerEntry:SetNetworkedCustomProperty("PlayerName",player.name)
        newRollerEntry:SetNetworkedCustomProperty("Rolled",roll)
        newRollerEntry.parent = entry
    end
    table.insert(replies,{ player = player, 
                participated = request, 
                roll = roll, })
    if #replies >= requiredReplies then
        Task.Wait(1) -- Wait for the last player to see their roll.
        RollingComplete(entry)
    end
end

-- Create a rolled loot entry that specified clients will receive to roll upon.
local function CreateRollForLootEntry(itemName, players) -- string, table of players
    assert(#players > 1, "You need more than 1 player to create rollable loot.")
    local rolledItem = Database:CreateItemDropFromName(itemName)
    local rollEntry = World.SpawnAsset(ROLLENTRY_TEMPLATE,{ parent = script })
    local ID = #entries+1
    local playerIds = PlayersToIDTable(players)
    table.insert(entries,ID,rollEntry)
    rollEntry:SetNetworkedCustomProperty('ItemHash',rolledItem:PersistentHash())
    rollEntry:SetNetworkedCustomProperty("RequestedPlayers",playerIds)
    rollEntry:SetNetworkedCustomProperty("ID",ID)
    rollEntry.serverUserData.itemName = rolledItem:GetName()
    rollEntry.serverUserData.id = ID
    rollEntry.serverUserData.requiredReplies = #players -- Amount of replies required to process the roll.
    rollEntry.serverUserData.replies = {} -- { player, rollType }
    Task.Wait(ROLL_EXPIRETIME + 3) -- Expire time + extra time. We can't be sure that the client and server will be synced.
    RollingComplete(rollEntry)
end

Events.Connect('RollForLootDrop', CreateRollForLootEntry)
Events.ConnectForPlayer("ProcessRollRequest", ProcessRollRequest)