local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/maotiandi/Cat-script/refs/heads/main/CatUI.lua"))()
local VirtualUser = game:GetService("VirtualUser")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local StarterGui = game:GetService("StarterGui")
local function notify(title, text)
    pcall(function()
        StarterGui:SetCore("SendNotification", {Title = title, Text = text, Duration = 3})
    end)
end
Players.LocalPlayer.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)
local Window = WindUI:CreateWindow({
    Title = "猫脚本",
    Author = "猫天帝制作",
    Folder = "猫脚本",
    Size = UDim2.fromOffset(390, 460),
    Transparent = false,
    Theme = "Dark",
    SideBarWidth = 150,
    ScrollBarEnabled = true,
    Background = "https://raw.githubusercontent.com/maotiandi/Cat-script/1b4e700e090744abe044153ca0f461baf61f6c5c/image_download_1785427315889.jpg",
    BackgroundImageTransparency = 0.5,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 165, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 192, 203))
    }),
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function() end
    },
})
Window:EditOpenButton({
    Title = "猫脚本",
    CornerRadius = UDim.new(0, 10),
    StrokeThickness = 2.5,
    Color = ColorSequence.new(Color3.fromRGB(255, 100, 100)),
    Draggable = true,
    OnlyMobile = false,
})
Window.ToggleKey = Enum.KeyCode.RightShift
local GameTag = Window:Tag({
    Title = "忍者传奇",
    Color = Color3.fromRGB(255, 255, 0),
    Radius = 12
})
local TimeTag = Window:Tag({
    Title = os.date("%H:%M"),
    Color = Color3.fromRGB(0, 255, 0),
    Radius = 12
})
local TimerTag = Window:Tag({
    Title = "00:00:00",
    Color = Color3.fromRGB(178, 34, 34),
    Radius = 12
})
local SessionTag = Window:Tag({
    Title = "00:00:00",
    Color = Color3.fromRGB(0, 100, 255),
    Radius = 12
})
local saveFolder = "猫脚本"
local saveFile = saveFolder .. "/total_time.json"
local function loadTotalTime()
    pcall(function()
        if not isfolder(saveFolder) then makefolder(saveFolder) end
    end)
    local saved = 0
    pcall(function()
        if isfile(saveFile) then
            local data = readfile(saveFile)
            saved = tonumber(data) or 0
        end
    end)
    return saved
end
local function saveTotalTime(total)
    pcall(function()
        if not isfolder(saveFolder) then makefolder(saveFolder) end
        writefile(saveFile, tostring(total))
    end)
end
local historyTime = loadTotalTime()
local sessionStartTime = tick()
local currentSessionStartTime = tick()
local function formatTime(seconds)
    local h = math.floor(seconds / 3600)
    local m = math.floor((seconds % 3600) / 60)
    local s = math.floor(seconds % 60)
    return string.format("%02d:%02d:%02d", h, m, s)
end
if TimerTag and TimerTag.SetTitle then
    TimerTag:SetTitle(formatTime(historyTime))
end
task.spawn(function()
    while TimerTag do
        task.wait(1)
        if TimeTag and TimeTag.SetTitle then
            TimeTag:SetTitle(os.date("%H:%M"))
        end
        if TimerTag and TimerTag.SetTitle then
            local sessionElapsed = tick() - sessionStartTime
            local totalElapsed = historyTime + sessionElapsed
            TimerTag:SetTitle(formatTime(totalElapsed))
            saveTotalTime(totalElapsed)
        end
        if SessionTag and SessionTag.SetTitle then
            local currentSessionElapsed = tick() - currentSessionStartTime
            SessionTag:SetTitle(formatTime(currentSessionElapsed))
        end
    end
end)
local Tabs = {}
function Tabs:Create(name, icon)
    return Window:Tab({ Title = name, Icon = icon })
end
Tabs.Announce = Tabs:Create("公告", "megaphone")
Tabs.Announce:Paragraph({
    Title = "猫脚本制作不易勿喷",
    Desc = "",
    Image = "heart",
    ImageSize = 26,
})
Tabs.Announce:Paragraph({
    Title = "感谢支持",
    Desc = "",
    Image = "heart",
    ImageSize = 26,
})
local announcePara = Tabs.Announce:Paragraph({
    Title = "猫脚本：1065455988",
    Desc = "",
    Image = "heart",
    ImageSize = 26,
})
task.spawn(function()
    task.wait(0.3)
    pcall(function()
        local frame = announcePara.Frame or announcePara.Instance or announcePara.Main or announcePara.Container
        if not frame then
            for _, v in pairs(announcePara) do
                if typeof(v) == "Instance" and v:IsA("GuiObject") then
                    frame = v
                    break
                end
            end
        end
        if frame and frame:IsA("GuiObject") then
            frame.Active = true
            frame.InputBegan:Connect(function(input, gameProcessed)
                if gameProcessed then return end
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    pcall(function()
                        if setclipboard then
                            setclipboard("猫脚本：1065455988")
                        end
                        game:GetService("StarterGui"):SetCore("SendNotification", {
                            Title = "猫脚本",
                            Text = "猫脚本QQ群号已复制到剪贴板！",
                            Duration = 3
                        })
                    end)
                end
            end)
        end
    end)
end)
Tabs.Announce:Paragraph({
    Title = "猫脚本建立时间2026年2月28日",
    Desc = "",
    Image = "heart",
    ImageSize = 26,
})
local imageUrl = "https://raw.githubusercontent.com/maotiandi/Cat-script/96f1ace604ec54b29f67af16229b9e7d5c86cbce/Image_1790320338642_423.jpg"
local localAssetId = nil
task.spawn(function()
    pcall(function()
        local folder = "猫脚本"
        if not isfolder(folder) then makefolder(folder) end
        local filename = folder .. "/sponsor_img.png"
        local data = game:HttpGet(imageUrl)
        writefile(filename, data)
        local ok, asset = pcall(getcustomasset, filename)
        if ok then
            localAssetId = asset
        end
    end)
end)
local imagePara = Tabs.Announce:Paragraph({
    Title = "点击放大",
    Thumbnail = imageUrl,
    ThumbnailSize = 250,
})
local isEnlarged = false
task.spawn(function()
    task.wait(0.5)
    pcall(function()
        local function waitForAsset()
            local waited = 0
            while not localAssetId and waited < 10 do
                task.wait(0.5)
                waited = waited + 0.5
            end
            return localAssetId
        end
        local frame = imagePara.Frame or imagePara.Instance or imagePara.Main or imagePara.Container
        if not frame then
            for _, v in pairs(imagePara) do
                if typeof(v) == "Instance" and v:IsA("GuiObject") then
                    frame = v
                    break
                end
            end
        end
        if frame and frame:IsA("GuiObject") then
            frame.Active = true
            frame.InputBegan:Connect(function(input, gameProcessed)
                if gameProcessed then return end
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    pcall(function()
                        local asset = waitForAsset()
                        if not asset then return end
                        local PlayerGui = Players.LocalPlayer:FindFirstChild("PlayerGui")
                        if not PlayerGui then return end
                        if isEnlarged then
                            local overlay = PlayerGui:FindFirstChild("CatImageOverlay")
                            if overlay then
                                local img = overlay:FindFirstChild("EnlargedImage")
                                if img then
                                    local ts = game:GetService("TweenService")
                                    local ti = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                                    local goal = {Size = UDim2.new(0, 260, 0, 260)}
                                    local tween = ts:Create(img, ti, goal)
                                    tween:Play()
                                    tween.Completed:Connect(function()
                                        overlay:Destroy()
                                    end)
                                end
                            end
                            isEnlarged = false
                            return
                        end
                        local overlay = Instance.new("ScreenGui")
                        overlay.Name = "CatImageOverlay"
                        overlay.Parent = PlayerGui
                        local bg = Instance.new("Frame")
                        bg.Size = UDim2.new(1, 0, 1, 0)
                        bg.BackgroundTransparency = 1
                        bg.Active = true
                        bg.Parent = overlay
                        local img = Instance.new("ImageLabel")
                        img.Name = "EnlargedImage"
                        img.AnchorPoint = Vector2.new(0.5, 0.5)
                        img.Position = UDim2.new(0.5, 0, 0.5, 0)
                        img.Size = UDim2.new(0, 260, 0, 260)
                        img.BackgroundTransparency = 1
                        img.Image = asset
                        img.ScaleType = Enum.ScaleType.Fit
                        img.Parent = overlay
                        local targetSize = UDim2.new(0, 320, 0, 320)
                        local ts = game:GetService("TweenService")
                        local ti = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                        local goal = {Size = targetSize}
                        local tween = ts:Create(img, ti, goal)
                        tween:Play()
                        isEnlarged = true
                        bg.InputBegan:Connect(function(inp, gp)
                            if gp then return end
                            if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
                                local ts2 = game:GetService("TweenService")
                                local ti2 = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                                local goal2 = {Size = UDim2.new(0, 260, 0, 260)}
                                local tween2 = ts2:Create(img, ti2, goal2)
                                tween2:Play()
                                tween2.Completed:Connect(function()
                                    overlay:Destroy()
                                end)
                                isEnlarged = false
                            end
                        end)
                    end)
                end
            end)
        end
    end)
end)
Tabs.General = Tabs:Create("通用", "zap")
do
    local Tab = Tabs.General
    Tab:Button({
        Title = "加载通用脚本",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/maotiandi/Cat-script/refs/heads/main/be%20in%20common%20use.lua"))("猫脚本")
        end
    })
end
getgenv().UnlockAllPasses = getgenv().UnlockAllPasses or false
getgenv().SuckHoops = getgenv().SuckHoops or false
getgenv().AutoRace = getgenv().AutoRace or false
getgenv().AutoRaceWin = getgenv().AutoRaceWin or false
getgenv().AutoRebirth1 = getgenv().AutoRebirth1 or false
getgenv().AutoRebirth2 = getgenv().AutoRebirth2 or false
getgenv().TargetRebirths = getgenv().TargetRebirths or 0
getgenv().AutoEvolve = getgenv().AutoEvolve or false
getgenv().AutoBuyPet = getgenv().AutoBuyPet or false
getgenv().SelectedPet = getgenv().SelectedPet or ""
getgenv().PetFarmPurple = getgenv().PetFarmPurple or false
getgenv().PetFarmRed = getgenv().PetFarmRed or false
getgenv().PetFarmBlue = getgenv().PetFarmBlue or false
getgenv().PetFarmOrange = getgenv().PetFarmOrange or false
getgenv().PetFarmYellow = getgenv().PetFarmYellow or false
getgenv().PetFarmMode2 = getgenv().PetFarmMode2 or false
getgenv().Gem_City = getgenv().Gem_City or false
getgenv().Gem_SnowCity = getgenv().Gem_SnowCity or false
getgenv().Gem_MagmaCity = getgenv().Gem_MagmaCity or false
getgenv().Gem_LegendsHighway = getgenv().Gem_LegendsHighway or false
getgenv().Gem_SpeedJungle = getgenv().Gem_SpeedJungle or false
getgenv().AutoXP = getgenv().AutoXP or false
getgenv().AutoSpeedCity = getgenv().AutoSpeedCity or false
getgenv().AutoSpeedSnow = getgenv().AutoSpeedSnow or false
getgenv().AutoSpeedMagma = getgenv().AutoSpeedMagma or false
getgenv().AutoSpeedHighway = getgenv().AutoSpeedHighway or false
getgenv().AutoGemCity = getgenv().AutoGemCity or false
getgenv().AutoGemSnow = getgenv().AutoGemSnow or false
getgenv().AutoGemMagma = getgenv().AutoGemMagma or false
getgenv().AutoGemHighway = getgenv().AutoGemHighway or false
getgenv().AutoLoopTeleport = getgenv().AutoLoopTeleport or false
getgenv().AutoSpeedV2 = getgenv().AutoSpeedV2 or false
getgenv().AutoBuyPetCrystal = getgenv().AutoBuyPetCrystal or false
getgenv().AutoBuyTrail = getgenv().AutoBuyTrail or false
getgenv().passThread = nil
getgenv().hoopThread = nil
getgenv().raceThread = nil
getgenv().raceWinThread = nil
getgenv().rebirth1Thread = nil
getgenv().rebirth2Thread = nil
getgenv().evolveThread = nil
getgenv().buyPetThread = nil
getgenv().xpThread = nil
getgenv().speedCityThread = nil
getgenv().speedSnowThread = nil
getgenv().speedMagmaThread = nil
getgenv().speedHighwayThread = nil
getgenv().gemCityThread = nil
getgenv().gemSnowThread = nil
getgenv().gemMagmaThread = nil
getgenv().gemHighwayThread = nil
getgenv().loopTeleportThread = nil
getgenv().speedV2Thread = nil
getgenv().buyPetCrystalThread = nil
getgenv().buyTrailThread = nil
local PetFarmState = {
    area = "City",
    orbType = "Yellow Orb",
    multiplier = 1,
    isMaxLevel = false
}
local areaOptions = {"City", "Snow City", "Magma City", "Desert", "Space", "Legends Highway", "Speed Jungle"}
local areaDisplayNames = {"城市", "雪城", "熔岩城", "沙漠", "太空", "传奇公路", "丛林"}
local orbOptions = {"Ethereal Orb", "Red Orb", "Blue Orb", "Orange Orb", "Yellow Orb"}
local orbDisplayNames = {"紫球", "红球", "蓝球", "橙球", "经验球"}
local petOptions = {"Swift Samurai", "Hyperblast", "Flaming Hedgehog", "Rainbow Steps", "Electro Golem"}
local petDisplayNames = {"斯威夫特武士", "金色尾巴", "火焰刺猬", "彩虹尾巴", "电光雷宠"}
local getCharacter, getRootPart, checkMaxLevel
local startUnlockPasses, startSuckHoops, startPetFarmMode1, startPetFarmMode2, startGemMode, startAutoRace, startAutoRaceWin, startAutoRebirth1, startAutoRebirth2, startAutoEvolve, startAutoBuyPet, startAutoXP, startAutoSpeedCity, startAutoSpeedSnow, startAutoSpeedMagma, startAutoSpeedHighway, startAutoGemCity, startAutoGemSnow, startAutoGemMagma, startAutoGemHighway, startAutoLoopTeleport, startAutoSpeedV2, startAutoBuyPetCrystal, startAutoBuyTrail
Tabs.Main = Tabs:Create("主要", "zap")
Tabs.Main:Toggle({Title = "解锁全部通行证", Default = false, Callback = function(Value)
    getgenv().UnlockAllPasses = Value
    if Value then startUnlockPasses() else if getgenv().passThread then task.cancel(getgenv().passThread); getgenv().passThread = nil end end
end})
Tabs.Main:Toggle({Title = "吸全部环", Default = false, Callback = function(Value)
    getgenv().SuckHoops = Value
    if Value then startSuckHoops() else if getgenv().hoopThread then task.cancel(getgenv().hoopThread); getgenv().hoopThread = nil end end
end})
Tabs.Main:Dropdown({Title = "选择地区", Values = areaDisplayNames, Default = "城市", Callback = function(Value)
    local idx = table.find(areaDisplayNames, Value)
    if idx then PetFarmState.area = areaOptions[idx] end
end})
Tabs.Main:Toggle({Title = "紫球", Default = false, Callback = function(Value)
    if Value then
        if getgenv().PetFarmRed or getgenv().PetFarmBlue or getgenv().PetFarmOrange or getgenv().PetFarmYellow then
            getgenv().PetFarmPurple = false
            notify("提示", "只能同时开启一个球类型")
        else
            getgenv().PetFarmPurple = true
            startPetFarmMode1("Ethereal Orb", "PetFarmPurple")
        end
    else
        getgenv().PetFarmPurple = false
    end
end})
Tabs.Main:Toggle({Title = "红球", Default = false, Callback = function(Value)
    if Value then
        if getgenv().PetFarmPurple or getgenv().PetFarmBlue or getgenv().PetFarmOrange or getgenv().PetFarmYellow then
            getgenv().PetFarmRed = false
            notify("提示", "只能同时开启一个球类型")
        else
            getgenv().PetFarmRed = true
            startPetFarmMode1("Red Orb", "PetFarmRed")
        end
    else
        getgenv().PetFarmRed = false
    end
end})
Tabs.Main:Toggle({Title = "蓝球", Default = false, Callback = function(Value)
    if Value then
        if getgenv().PetFarmPurple or getgenv().PetFarmRed or getgenv().PetFarmOrange or getgenv().PetFarmYellow then
            getgenv().PetFarmBlue = false
            notify("提示", "只能同时开启一个球类型")
        else
            getgenv().PetFarmBlue = true
            startPetFarmMode1("Blue Orb", "PetFarmBlue")
        end
    else
        getgenv().PetFarmBlue = false
    end
end})
Tabs.Main:Toggle({Title = "橙球", Default = false, Callback = function(Value)
    if Value then
        if getgenv().PetFarmPurple or getgenv().PetFarmRed or getgenv().PetFarmBlue or getgenv().PetFarmYellow then
            getgenv().PetFarmOrange = false
            notify("提示", "只能同时开启一个球类型")
        else
            getgenv().PetFarmOrange = true
            startPetFarmMode1("Orange Orb", "PetFarmOrange")
        end
    else
        getgenv().PetFarmOrange = false
    end
end})
Tabs.Main:Toggle({Title = "经验球", Default = false, Callback = function(Value)
    if Value then
        if getgenv().PetFarmPurple or getgenv().PetFarmRed or getgenv().PetFarmBlue or getgenv().PetFarmOrange then
            getgenv().PetFarmYellow = false
            notify("提示", "只能同时开启一个球类型")
        else
            getgenv().PetFarmYellow = true
            startPetFarmMode1("Yellow Orb", "PetFarmYellow")
        end
    else
        getgenv().PetFarmYellow = false
    end
end})
Tabs.Main:Dropdown({Title = "球类型", Values = orbDisplayNames, Default = "经验球", Callback = function(Value)
    local idx = table.find(orbDisplayNames, Value)
    if idx then PetFarmState.orbType = orbOptions[idx] end
end})
Tabs.Main:Slider({Title = "倍率", Default = 1, Min = 1, Max = 100, Rounding = 0, Callback = function(Value)
    PetFarmState.multiplier = Value
end})
Tabs.Main:Toggle({Title = "卡宠模式2", Default = false, Callback = function(Value)
    getgenv().PetFarmMode2 = Value
    if Value then startPetFarmMode2() end
end})
Tabs.Main:Toggle({Title = "城市宝石", Default = false, Callback = function(Value)
    getgenv().Gem_City = Value
    if Value then startGemMode("City", "Gem_City") end
end})
Tabs.Main:Toggle({Title = "雪城宝石", Default = false, Callback = function(Value)
    getgenv().Gem_SnowCity = Value
    if Value then startGemMode("Snow City", "Gem_SnowCity") end
end})
Tabs.Main:Toggle({Title = "熔岩城宝石", Default = false, Callback = function(Value)
    getgenv().Gem_MagmaCity = Value
    if Value then startGemMode("Magma City", "Gem_MagmaCity") end
end})
Tabs.Main:Toggle({Title = "传奇公路宝石", Default = false, Callback = function(Value)
    getgenv().Gem_LegendsHighway = Value
    if Value then startGemMode("Legends Highway", "Gem_LegendsHighway") end
end})
Tabs.Main:Toggle({Title = "丛林宝石", Default = false, Callback = function(Value)
    getgenv().Gem_SpeedJungle = Value
    if Value then startGemMode("Speed Jungle", "Gem_SpeedJungle") end
end})
Tabs.Main:Toggle({Title = "自动比赛", Default = false, Callback = function(Value)
    getgenv().AutoRace = Value
    if Value then startAutoRace() else if getgenv().raceThread then task.cancel(getgenv().raceThread); getgenv().raceThread = nil end end
end})
Tabs.Main:Toggle({Title = "自动比赛胜利", Default = false, Callback = function(Value)
    getgenv().AutoRaceWin = Value
    if Value then startAutoRaceWin() else if getgenv().raceWinThread then task.cancel(getgenv().raceWinThread); getgenv().raceWinThread = nil end end
end})
Tabs.Main:Toggle({Title = "自动重生", Default = false, Callback = function(Value)
    getgenv().AutoRebirth1 = Value
    if Value then startAutoRebirth1() else if getgenv().rebirth1Thread then task.cancel(getgenv().rebirth1Thread); getgenv().rebirth1Thread = nil end end
end})
Tabs.Main:Slider({Title = "目标重生次数", Default = 100, Min = 0, Max = 1000, Rounding = 0, Callback = function(Value)
    getgenv().TargetRebirths = Value
end})
Tabs.Main:Toggle({Title = "重生到指定次数", Default = false, Callback = function(Value)
    getgenv().AutoRebirth2 = Value
    if Value then startAutoRebirth2() else if getgenv().rebirth2Thread then task.cancel(getgenv().rebirth2Thread); getgenv().rebirth2Thread = nil end end
end})
Tabs.Farm = Tabs:Create("刷取", "pickaxe")
Tabs.Farm:Toggle({Title = "自动刷经验 150", Default = false, Callback = function(Value)
    getgenv().AutoXP = Value
    if Value then startAutoXP() else if getgenv().xpThread then task.cancel(getgenv().xpThread); getgenv().xpThread = nil end end
end})
Tabs.Farm:Toggle({Title = "自动刷速度(城市)", Default = false, Callback = function(Value)
    getgenv().AutoSpeedCity = Value
    if Value then startAutoSpeedCity() else if getgenv().speedCityThread then task.cancel(getgenv().speedCityThread); getgenv().speedCityThread = nil end end
end})
Tabs.Farm:Toggle({Title = "自动刷速度(雪城)", Default = false, Callback = function(Value)
    getgenv().AutoSpeedSnow = Value
    if Value then startAutoSpeedSnow() else if getgenv().speedSnowThread then task.cancel(getgenv().speedSnowThread); getgenv().speedSnowThread = nil end end
end})
Tabs.Farm:Toggle({Title = "自动刷速度(熔岩城)", Default = false, Callback = function(Value)
    getgenv().AutoSpeedMagma = Value
    if Value then startAutoSpeedMagma() else if getgenv().speedMagmaThread then task.cancel(getgenv().speedMagmaThread); getgenv().speedMagmaThread = nil end end
end})
Tabs.Farm:Toggle({Title = "自动刷速度(传奇公路)", Default = false, Callback = function(Value)
    getgenv().AutoSpeedHighway = Value
    if Value then startAutoSpeedHighway() else if getgenv().speedHighwayThread then task.cancel(getgenv().speedHighwayThread); getgenv().speedHighwayThread = nil end end
end})
Tabs.Farm:Toggle({Title = "自动刷钻石(城市)", Default = false, Callback = function(Value)
    getgenv().AutoGemCity = Value
    if Value then startAutoGemCity() else if getgenv().gemCityThread then task.cancel(getgenv().gemCityThread); getgenv().gemCityThread = nil end end
end})
Tabs.Farm:Toggle({Title = "自动刷钻石(雪城)", Default = false, Callback = function(Value)
    getgenv().AutoGemSnow = Value
    if Value then startAutoGemSnow() else if getgenv().gemSnowThread then task.cancel(getgenv().gemSnowThread); getgenv().gemSnowThread = nil end end
end})
Tabs.Farm:Toggle({Title = "自动刷钻石(熔岩城)", Default = false, Callback = function(Value)
    getgenv().AutoGemMagma = Value
    if Value then startAutoGemMagma() else if getgenv().gemMagmaThread then task.cancel(getgenv().gemMagmaThread); getgenv().gemMagmaThread = nil end end
end})
Tabs.Farm:Toggle({Title = "自动刷钻石(传奇公路)", Default = false, Callback = function(Value)
    getgenv().AutoGemHighway = Value
    if Value then startAutoGemHighway() else if getgenv().gemHighwayThread then task.cancel(getgenv().gemHighwayThread); getgenv().gemHighwayThread = nil end end
end})
Tabs.Farm:Toggle({Title = "自动刷圈", Default = false, Callback = function(Value)
    getgenv().AutoLoopTeleport = Value
    if Value then startAutoLoopTeleport() else if getgenv().loopTeleportThread then task.cancel(getgenv().loopTeleportThread); getgenv().loopTeleportThread = nil end end
end})
Tabs.Farm:Toggle({Title = "自动刷速度V2", Default = false, Callback = function(Value)
    getgenv().AutoSpeedV2 = Value
    if Value then startAutoSpeedV2() else if getgenv().speedV2Thread then task.cancel(getgenv().speedV2Thread); getgenv().speedV2Thread = nil end end
end})
Tabs.Pet = Tabs:Create("宠物", "paw")
Tabs.Pet:Dropdown({Title = "选择宠物", Values = petDisplayNames, Default = "斯威夫特武士", Callback = function(Value)
    local idx = table.find(petDisplayNames, Value)
    if idx then getgenv().SelectedPet = petOptions[idx] end
end})
Tabs.Pet:Button({Title = "购买一次", Callback = function()
    if getgenv().SelectedPet ~= "" then
        pcall(function()
            local petShopFolder = ReplicatedStorage:FindFirstChild("cPetShopFolder")
            local petShopRemote = ReplicatedStorage:FindFirstChild("cPetShopRemote")
            if petShopFolder and petShopRemote then
                local pet = petShopFolder:FindFirstChild(getgenv().SelectedPet)
                if pet then
                    petShopRemote:InvokeServer(pet)
                    notify("购买宠物", "购买成功")
                end
            end
        end)
    end
end})
Tabs.Pet:Toggle({Title = "自动购买", Default = false, Callback = function(Value)
    getgenv().AutoBuyPet = Value
    if Value then
        if getgenv().SelectedPet ~= "" then
            startAutoBuyPet()
        else
            getgenv().AutoBuyPet = false
            notify("提示", "请先选择宠物")
        end
    else
        if getgenv().buyPetThread then task.cancel(getgenv().buyPetThread); getgenv().buyPetThread = nil end
    end
end})
Tabs.Pet:Button({Title = "进化一次", Callback = function()
    pcall(function()
        local ownedPets = Player:FindFirstChild("ownedPets")
        local petEvolveEvent = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("petEvolveEvent")
        if ownedPets and petEvolveEvent then
            local pets = ownedPets:GetChildren()
            if #pets > 0 then
                local randomPet = pets[math.random(#pets)]
                petEvolveEvent:FireServer("evolvePet", randomPet.Name)
                notify("进化", "进化成功")
            end
        end
    end)
end})
Tabs.Pet:Toggle({Title = "自动进化", Default = false, Callback = function(Value)
    getgenv().AutoEvolve = Value
    if Value then startAutoEvolve() else if getgenv().evolveThread then task.cancel(getgenv().evolveThread); getgenv().evolveThread = nil end end
end})
Tabs.Pet:Toggle({Title = "自动买宠物(丛林水晶)", Default = false, Callback = function(Value)
    getgenv().AutoBuyPetCrystal = Value
    if Value then startAutoBuyPetCrystal() else if getgenv().buyPetCrystalThread then task.cancel(getgenv().buyPetCrystalThread); getgenv().buyPetCrystalThread = nil end end
end})
Tabs.Pet:Toggle({Title = "自动买尾迹(地狱水晶)", Default = false, Callback = function(Value)
    getgenv().AutoBuyTrail = Value
    if Value then startAutoBuyTrail() else if getgenv().buyTrailThread then task.cancel(getgenv().buyTrailThread); getgenv().buyTrailThread = nil end end
end})
Tabs.Teleport = Tabs:Create("传送", "map-pin")
Tabs.Teleport:Button({Title = "传送至城市(出生点)", Callback = function()
    local hrp = getRootPart()
    if hrp then
        hrp.CFrame = CFrame.new(-568.6292114257812, 3.1723721027374268, 412.86492919921875)
        notify("传送", "传送成功")
    end
end})
Tabs.Teleport:Button({Title = "传送至神秘洞穴", Callback = function()
    local hrp = getRootPart()
    if hrp then
        hrp.CFrame = CFrame.new(-9683.048828125, 58.352359771728516, 3136.626953125)
        notify("传送", "传送成功")
    end
end})
Tabs.Teleport:Button({Title = "传送至白雪城市", Callback = function()
    local hrp = getRootPart()
    if hrp then
        hrp.CFrame = CFrame.new(-866.3868408203125, 3.222372055053711, 2165.70654296875)
        notify("传送", "传送成功")
    end
end})
Tabs.Teleport:Button({Title = "传送至地狱洞穴", Callback = function()
    local hrp = getRootPart()
    if hrp then
        hrp.CFrame = CFrame.new(-11041.357421875, 58.352359771728516, 4111.8251953125)
        notify("传送", "传送成功")
    end
end})
Tabs.Teleport:Button({Title = "传送至熔岩城市", Callback = function()
    local hrp = getRootPart()
    if hrp then
        hrp.CFrame = CFrame.new(1616.8270263671875, 3.2723801136016846, 4330.65234375)
        notify("传送", "传送成功")
    end
end})
Tabs.Teleport:Button({Title = "传送至水手路线", Callback = function()
    local hrp = getRootPart()
    if hrp then
        hrp.CFrame = CFrame.new(-1618.4071044921875, 8.759234428405762, 4892.44091796875)
        notify("传送", "传送成功")
    end
end})
Tabs.Teleport:Button({Title = "传送至电光洞穴", Callback = function()
    local hrp = getRootPart()
    if hrp then
        hrp.CFrame = CFrame.new(-13107.9892578125, 58.352359771728516, 4099.099609375)
        notify("传送", "传送成功")
    end
end})
Tabs.Teleport:Button({Title = "传送至传奇公路", Callback = function()
    local hrp = getRootPart()
    if hrp then
        hrp.CFrame = CFrame.new(3673.601318359375, 70.75231170654297, 5588.7958984375)
        notify("传送", "传送成功")
    end
end})
Tabs.Teleport:Button({Title = "传送至丛林洞穴", Callback = function()
    local hrp = getRootPart()
    if hrp then
        hrp.CFrame = CFrame.new(-15266.7880859375, 239.7072296142578, 3769.77490234375)
        notify("传送", "传送成功")
    end
end})
getCharacter = function()
    return Player.Character or Player.CharacterAdded:Wait()
end
getRootPart = function()
    local char = getCharacter()
    return char and char:FindFirstChild("HumanoidRootPart")
end
checkMaxLevel = function()
    PetFarmState.isMaxLevel = Player:GetAttribute("IsMaxLevel") == true
end
startUnlockPasses = function()
    if getgenv().passThread then
        task.cancel(getgenv().passThread)
        getgenv().passThread = nil
    end
    getgenv().passThread = task.spawn(function()
        while getgenv().UnlockAllPasses do
            pcall(function()
                local gamepassIds = ReplicatedStorage:FindFirstChild("gamepassIds")
                local ownedGamepasses = Player:FindFirstChild("ownedGamepasses")
                if gamepassIds and ownedGamepasses then
                    for _, v in ipairs(gamepassIds:GetChildren()) do
                        v.Parent = ownedGamepasses
                    end
                end
            end)
            task.wait(0.5)
        end
    end)
end
startSuckHoops = function()
    if getgenv().hoopThread then
        task.cancel(getgenv().hoopThread)
        getgenv().hoopThread = nil
    end
    getgenv().hoopThread = task.spawn(function()
        while getgenv().SuckHoops do
            pcall(function()
                local hrp = getRootPart()
                local hoops = Workspace:FindFirstChild("Hoops")
                if hrp and hoops then
                    for _, hoop in ipairs(hoops:GetChildren()) do
                        if hoop.Name == "Hoop" then
                            hoop.CFrame = hrp.CFrame
                        end
                    end
                end
            end)
            task.wait()
        end
    end)
end
startPetFarmMode1 = function(orbType, flag)
    getgenv()[flag] = true
    task.spawn(function()
        while getgenv()[flag] do
            if PetFarmState.isMaxLevel then
                getgenv()[flag] = false
                break
            end
            pcall(function()
                for i = 1, 10 do
                    local orbEvent = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("orbEvent")
                    if orbEvent then
                        orbEvent:FireServer("collectOrb", orbType, PetFarmState.area)
                    end
                end
            end)
            task.wait(0.05)
        end
    end)
end
startPetFarmMode2 = function()
    getgenv().PetFarmMode2 = true
    task.spawn(function()
        while getgenv().PetFarmMode2 do
            if PetFarmState.isMaxLevel then
                getgenv().PetFarmMode2 = false
                break
            end
            pcall(function()
                local total = math.max(1, PetFarmState.multiplier or 1)
                for i = 1, total do
                    local orbEvent = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("orbEvent")
                    if orbEvent then
                        orbEvent:FireServer("collectOrb", PetFarmState.orbType, PetFarmState.area)
                    end
                end
            end)
            task.wait()
        end
    end)
end
startGemMode = function(areaName, flag)
    getgenv()[flag] = true
    task.spawn(function()
        while getgenv()[flag] do
            pcall(function()
                for i = 1, 5 do
                    local orbEvent = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("orbEvent")
                    if orbEvent then
                        orbEvent:FireServer("collectOrb", "Gem", areaName)
                    end
                end
            end)
            task.wait()
        end
    end)
end
startAutoRace = function()
    if getgenv().raceThread then
        task.cancel(getgenv().raceThread)
        getgenv().raceThread = nil
    end
    getgenv().raceThread = task.spawn(function()
        while getgenv().AutoRace do
            pcall(function()
                local raceEvent = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("raceEvent")
                if raceEvent then
                    raceEvent:FireServer("joinRace")
                end
            end)
            task.wait()
        end
    end)
end
startAutoRaceWin = function()
    if getgenv().raceWinThread then
        task.cancel(getgenv().raceWinThread)
        getgenv().raceWinThread = nil
    end
    getgenv().raceWinThread = task.spawn(function()
        while getgenv().AutoRaceWin do
            pcall(function()
                local raceEvent = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("raceEvent")
                if raceEvent then
                    raceEvent:FireServer("joinRace")
                end
                local hrp = getRootPart()
                local raceMaps = Workspace:FindFirstChild("raceMaps")
                if hrp and raceMaps then
                    if game.PlaceId == 3101667897 then
                        if raceMaps:FindFirstChild("Grassland") and raceMaps.Grassland:FindFirstChild("finishPart") then
                            hrp.CFrame = raceMaps.Grassland.finishPart.CFrame
                        end
                        task.wait(0.1)
                        if raceMaps:FindFirstChild("Magma") and raceMaps.Magma:FindFirstChild("finishPart") then
                            hrp.CFrame = raceMaps.Magma.finishPart.CFrame
                        end
                        task.wait(0.1)
                        if raceMaps:FindFirstChild("Desert") and raceMaps.Desert:FindFirstChild("finishPart") then
                            hrp.CFrame = raceMaps.Desert.finishPart.CFrame
                        end
                    elseif game.PlaceId == 3276265788 then
                        if raceMaps:FindFirstChild("Speedway") and raceMaps.Speedway:FindFirstChild("finishPart") then
                            hrp.CFrame = raceMaps.Speedway.finishPart.CFrame
                        end
                    elseif game.PlaceId == 3232996272 then
                        if raceMaps:FindFirstChild("Starway") and raceMaps.Starway:FindFirstChild("finishPart") then
                            hrp.CFrame = raceMaps.Starway.finishPart.CFrame
                        end
                    end
                end
            end)
            task.wait(0.3)
        end
    end)
end
startAutoRebirth1 = function()
    if getgenv().rebirth1Thread then
        task.cancel(getgenv().rebirth1Thread)
        getgenv().rebirth1Thread = nil
    end
    getgenv().rebirth1Thread = task.spawn(function()
        while getgenv().AutoRebirth1 do
            pcall(function()
                local rebirthEvent = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("rebirthEvent")
                if rebirthEvent then
                    rebirthEvent:FireServer("rebirthRequest")
                end
            end)
            task.wait()
        end
    end)
end
startAutoRebirth2 = function()
    if getgenv().rebirth2Thread then
        task.cancel(getgenv().rebirth2Thread)
        getgenv().rebirth2Thread = nil
    end
    getgenv().rebirth2Thread = task.spawn(function()
        while getgenv().AutoRebirth2 do
            local rebirths = Player.leaderstats and Player.leaderstats:FindFirstChild("Rebirths")
            if rebirths and rebirths.Value >= getgenv().TargetRebirths then
                getgenv().AutoRebirth2 = false
                break
            else
                pcall(function()
                    local rebirthEvent = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("rebirthEvent")
                    if rebirthEvent then
                        rebirthEvent:FireServer("rebirthRequest")
                    end
                end)
            end
            task.wait(0.1)
        end
    end)
end
startAutoEvolve = function()
    if getgenv().evolveThread then
        task.cancel(getgenv().evolveThread)
        getgenv().evolveThread = nil
    end
    getgenv().evolveThread = task.spawn(function()
        while getgenv().AutoEvolve do
            pcall(function()
                local ownedPets = Player:FindFirstChild("ownedPets")
                local petEvolveEvent = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("petEvolveEvent")
                if ownedPets and petEvolveEvent then
                    local pets = ownedPets:GetChildren()
                    if #pets > 0 then
                        local randomPet = pets[math.random(#pets)]
                        petEvolveEvent:FireServer("evolvePet", randomPet.Name)
                    end
                end
            end)
            task.wait(0.1)
        end
    end)
end
startAutoBuyPet = function()
    if getgenv().buyPetThread then
        task.cancel(getgenv().buyPetThread)
        getgenv().buyPetThread = nil
    end
    getgenv().buyPetThread = task.spawn(function()
        while getgenv().AutoBuyPet and getgenv().SelectedPet ~= "" do
            pcall(function()
                local petShopFolder = ReplicatedStorage:FindFirstChild("cPetShopFolder")
                local petShopRemote = ReplicatedStorage:FindFirstChild("cPetShopRemote")
                if petShopFolder and petShopRemote then
                    local pet = petShopFolder:FindFirstChild(getgenv().SelectedPet)
                    if pet then
                        petShopRemote:InvokeServer(pet)
                    end
                end
            end)
            task.wait(0.5)
        end
    end)
end
startAutoXP = function()
    if getgenv().xpThread then
        task.cancel(getgenv().xpThread)
        getgenv().xpThread = nil
    end
    getgenv().xpThread = task.spawn(function()
        while getgenv().AutoXP do
            pcall(function()
                for i = 1, 17 do
                    ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer("collectOrb", "Orange Orb", "City")
                end
            end)
            task.wait()
        end
    end)
end
startAutoSpeedCity = function()
    if getgenv().speedCityThread then
        task.cancel(getgenv().speedCityThread)
        getgenv().speedCityThread = nil
    end
    getgenv().speedCityThread = task.spawn(function()
        while getgenv().AutoSpeedCity do
            pcall(function()
                for i = 1, 18 do
                    ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer("collectOrb", "Red Orb", "City")
                end
            end)
            task.wait()
        end
    end)
end
startAutoSpeedSnow = function()
    if getgenv().speedSnowThread then
        task.cancel(getgenv().speedSnowThread)
        getgenv().speedSnowThread = nil
    end
    getgenv().speedSnowThread = task.spawn(function()
        while getgenv().AutoSpeedSnow do
            pcall(function()
                for i = 1, 18 do
                    ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer("collectOrb", "Red Orb", "Snow City")
                end
            end)
            task.wait()
        end
    end)
end
startAutoSpeedMagma = function()
    if getgenv().speedMagmaThread then
        task.cancel(getgenv().speedMagmaThread)
        getgenv().speedMagmaThread = nil
    end
    getgenv().speedMagmaThread = task.spawn(function()
        while getgenv().AutoSpeedMagma do
            pcall(function()
                for i = 1, 16 do
                    ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer("collectOrb", "Red Orb", "Magma City")
                end
            end)
            task.wait()
        end
    end)
end
startAutoSpeedHighway = function()
    if getgenv().speedHighwayThread then
        task.cancel(getgenv().speedHighwayThread)
        getgenv().speedHighwayThread = nil
    end
    getgenv().speedHighwayThread = task.spawn(function()
        while getgenv().AutoSpeedHighway do
            pcall(function()
                for i = 1, 16 do
                    ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer("collectOrb", "Red Orb", "Legends Highway")
                end
            end)
            task.wait()
        end
    end)
end
startAutoGemCity = function()
    if getgenv().gemCityThread then
        task.cancel(getgenv().gemCityThread)
        getgenv().gemCityThread = nil
    end
    getgenv().gemCityThread = task.spawn(function()
        while getgenv().AutoGemCity do
            pcall(function()
                for i = 1, 20 do
                    ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer("collectOrb", "Gem", "City")
                end
            end)
            task.wait()
        end
    end)
end
startAutoGemSnow = function()
    if getgenv().gemSnowThread then
        task.cancel(getgenv().gemSnowThread)
        getgenv().gemSnowThread = nil
    end
    getgenv().gemSnowThread = task.spawn(function()
        while getgenv().AutoGemSnow do
            pcall(function()
                for i = 1, 20 do
                    ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer("collectOrb", "Gem", "Snow City")
                end
            end)
            task.wait()
        end
    end)
end
startAutoGemMagma = function()
    if getgenv().gemMagmaThread then
        task.cancel(getgenv().gemMagmaThread)
        getgenv().gemMagmaThread = nil
    end
    getgenv().gemMagmaThread = task.spawn(function()
        while getgenv().AutoGemMagma do
            pcall(function()
                for i = 1, 20 do
                    ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer("collectOrb", "Gem", "Magma City")
                end
            end)
            task.wait()
        end
    end)
end
startAutoGemHighway = function()
    if getgenv().gemHighwayThread then
        task.cancel(getgenv().gemHighwayThread)
        getgenv().gemHighwayThread = nil
    end
    getgenv().gemHighwayThread = task.spawn(function()
        while getgenv().AutoGemHighway do
            pcall(function()
                for i = 1, 20 do
                    ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer("collectOrb", "Gem", "Legends Highway")
                end
            end)
            task.wait()
        end
    end)
end
local q = {
    CFrame.new(-278.8976135253906, 66.09315490722656, -10946.564453125),
    CFrame.new(3980.05029296875, 159.91925048828125, 5589.21533203125),
    CFrame.new(137.6853485107422, 75.40111541748047, -5972.4873046875),
    CFrame.new(-15376.439453125, 412.2984619140625, 4475.322265625),
    CFrame.new(-489.440673828125, 98.277099609375, 2502.03564453125),
    CFrame.new(-15167.5068359375, 382.1965026855469, 4888.2900390625),
    CFrame.new(2094.217041015625, 251.98931884765625, 12877.951171875),
    CFrame.new(-1645.1728515625, 69.02545928955078, 5337.923828125),
    CFrame.new(-13254.447265625, 222.44158935546875, 4891.56005859375),
    CFrame.new(-533.439208984375, 58.4377326965332, 209.794921875),
    CFrame.new(473.2319641113281, 66.08084106445312, -10867.8388671875),
    CFrame.new(2333.369873046875, 161.6602325439453, 13369.1240234375),
    CFrame.new(5392.5322265625, 297.8348388671875, 5885.2138671875),
    CFrame.new(3806.247802734375, 299.41748046875, 7225.6806640625),
    CFrame.new(1664.3343505859375, 80.900390625, 12589.7109375),
    CFrame.new(1769.7236328125, 80.90105438232422, 12879.7958984375),
    CFrame.new(-11097.05859375, 200.84193420410156, 4465.34375),
    CFrame.new(-13140.974609375, 200.84193420410156, 4465.39599609375),
    CFrame.new(-536.3781127929688, 58.43798065185547, -133.1399688720703),
    CFrame.new(2485.461181640625, 135.55299377441406, 12384.6455078125),
    CFrame.new(1173.287109375, 92.03070831298828, -6024.24365234375),
    CFrame.new(-85.52466583251953, 115.9759750366211, -107.73560333251953),
    CFrame.new(1805.7076416015625, 90.94168853759766, 4617.30712890625),
    CFrame.new(-350.6163330078125, 66.06715393066406, -8732.2490234375),
    CFrame.new(5666.32861328125, 326.5240478515625, 6494.826171875),
    CFrame.new(4516.66845703125, 221.20545959472656, 7181.7421875),
    CFrame.new(-1746.5504150390625, 150.5835418701172, 5372.54248046875),
    CFrame.new(5361.96826171875, 297.8207092285156, 7025.44482421875),
    CFrame.new(4650.1669921875, 221.213134765625, 5608.54345703125),
    CFrame.new(-12993.1826171875, 200.82785034179688, 5222.71337890625),
    CFrame.new(355.5094299316406, 111.75679779052734, -10924.6923828125),
    CFrame.new(1942.0057373046875, 93.18344116210938, -2047.2164306640625),
    CFrame.new(-15156.52734375, 355.08978271484375, 4141.91357421875),
    CFrame.new(2062.114990234375, 159.88404846191406, 4374.28076171875),
    CFrame.new(230.04505920410156, 94.17676544189453, 80.71623229980469),
}
startAutoLoopTeleport = function()
    if getgenv().loopTeleportThread then
        task.cancel(getgenv().loopTeleportThread)
        getgenv().loopTeleportThread = nil
    end
    getgenv().loopTeleportThread = task.spawn(function()
        while getgenv().AutoLoopTeleport do
            pcall(function()
                for _, zdsq in ipairs(q) do
                    if not getgenv().AutoLoopTeleport then break end
                    local hrp = getRootPart()
                    if hrp then
                        hrp.CFrame = zdsq
                    end
                    task.wait()
                end
            end)
            task.wait()
        end
        local hrp = getRootPart()
        if hrp then
            hrp.CFrame = CFrame.new(-568.6292114257812, 3.1723721027374268, 412.86492919921875)
        end
    end)
end
startAutoSpeedV2 = function()
    if getgenv().speedV2Thread then
        task.cancel(getgenv().speedV2Thread)
        getgenv().speedV2Thread = nil
    end
    getgenv().speedV2Thread = task.spawn(function()
        while getgenv().AutoSpeedV2 do
            pcall(function()
                for i = 1, 20 do
                    ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("questsEvent"):FireServer("collectQuest", Instance.new("Folder", nil))
                end
            end)
            task.wait()
        end
    end)
end
startAutoBuyPetCrystal = function()
    if getgenv().buyPetCrystalThread then
        task.cancel(getgenv().buyPetCrystalThread)
        getgenv().buyPetCrystalThread = nil
    end
    getgenv().buyPetCrystalThread = task.spawn(function()
        while getgenv().AutoBuyPetCrystal do
            pcall(function()
                ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("openCrystalRemote"):InvokeServer("openCrystal", "Jungle Crystal")
            end)
            task.wait()
        end
    end)
end
startAutoBuyTrail = function()
    if getgenv().buyTrailThread then
        task.cancel(getgenv().buyTrailThread)
        getgenv().buyTrailThread = nil
    end
    getgenv().buyTrailThread = task.spawn(function()
        while getgenv().AutoBuyTrail do
            pcall(function()
                ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("openCrystalRemote"):InvokeServer("openCrystal", "Inferno Crystal")
            end)
            task.wait()
        end
    end)
end
RunService.Heartbeat:Connect(checkMaxLevel)
Window:SelectTab(1)
print("猫脚本由猫天帝制作")