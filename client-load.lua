-- Main Functions:
local function thread(func)
    local u1 = nil
    u1 = coroutine.wrap(function()
        func()
        wait()
        coroutine.yield(u1)
    end)
    u1 = u1()
end
local function thread2(func)
    local u1 = nil
    u1 = coroutine.wrap(function()
        func()
        wait()
        coroutine.yield(u1)
    end)
    u1 = u1()
end

-- Shortcuts:
local Players = game:GetService("Players")
function create(ty,props)
    local obj = Instance.new(ty)
    if typeof(props) == "table" and props ~= nil then
        for i,v in pairs(props) do
            pcall(function()
                obj[i] = v
            end)
        end
    end
    return obj
end
function RandomString(Length)
    local String = ""
    for i = 0,Length,1 do
        String = String .. string.char(math.random(1,180))
    end
    return String
end
-- Instances:
local Hub = create "ScreenGui"
local DropShadow = create "Frame"
local UICorner = create"UICorner"
local MainFrame = create "Frame"
local UICorner_2 = create "UICorner"
local ScrollingFrame = create "ScrollingFrame"
local Button = create "TextButton"
local UIListLayout = create "UIListLayout"
local TextBox = create "TextBox"
local Play = create "TextButton"
local Stop = create "TextButton"

--Properties:
Hub.Name = RandomString(math.random(1,50))
Hub.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
Hub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Hub.ResetOnSpawn = false
DropShadow.Name = RandomString(math.random(1,50))
DropShadow.Parent = Hub
DropShadow.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
DropShadow.Position = UDim2.new(1, 0, 1, 0)
DropShadow.Size = UDim2.new(0.283313334, 0, 0.314035088, 0)
UICorner.CornerRadius = UDim.new(0.0500000007, 0)
UICorner.Parent = DropShadow
MainFrame.Name = RandomString(math.random(1,50))
MainFrame.Parent = DropShadow
MainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
MainFrame.Size = UDim2.new(0.986999989, 0, 0.986999989, 0)
UICorner_2.CornerRadius = UDim.new(0.0500000007, 0)
UICorner_2.Parent = MainFrame
ScrollingFrame.Parent = MainFrame
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame.BackgroundTransparency = 1.000
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Position = UDim2.new(0.611766517, 0, 0.169805244, 0)
ScrollingFrame.Size = UDim2.new(0.288896233, 0, 0.603751957, 0)
Button.Name = RandomString(math.random(1,50))
Button.Parent = ScrollingFrame
Button.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
Button.BorderSizePixel = 0
Button.Position = UDim2.new(0, 0, 1.90734866e-07, 0)
Button.Size = UDim2.new(0.709273398, 0, 0.0705579668, 0)
Button.Font = Enum.Font.SourceSans
Button.Text = "Text"
Button.TextColor3 = Color3.fromRGB(149, 149, 149)
Button.TextSize = 14.000
UIListLayout.Name = RandomString(math.random(1,50))
UIListLayout.Parent = ScrollingFrame
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
TextBox.Parent = MainFrame
TextBox.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
TextBox.BackgroundTransparency = 0.200
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.137379155, 0, 0.758463383, 0)
TextBox.Size = UDim2.new(0.308867425, 0, 0.100000001, 0)
TextBox.Font = Enum.Font.SourceSans
TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
TextBox.PlaceholderText = "Background SoundId"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(178, 178, 178)
TextBox.TextSize = 14.000
BackgroundMusic = Instance.new(
    'Sound',
    game:GetService("SoundService")
)
BackgroundMusic.Looped = true
BackgroundMusic.Volume = 2
BackgroundMusic.Playing = false
BackgroundMusic.TimePosition = 0
Play.Name = "Play"
Play.Parent = MainFrame
Play.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
Play.BorderSizePixel = 0
Play.Position = UDim2.new(0.0883798599, 0, 0.88676095, 0)
Play.Size = UDim2.new(0.219950721, 0, 0.0705579668, 0)
Play.Font = Enum.Font.SourceSans
Play.Text = "Play"
Play.TextColor3 = Color3.fromRGB(149, 149, 149)
Play.TextSize = 14.000

Stop.Name = "Stop"
Stop.Parent = MainFrame
Stop.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
Stop.BorderSizePixel = 0
Stop.Position = UDim2.new(0.334118992, 0, 0.88676095, 0)
Stop.Size = UDim2.new(0.219950721, 0, 0.0705579668, 0)
Stop.Font = Enum.Font.SourceSans
Stop.Text = "Stop"
Stop.TextColor3 = Color3.fromRGB(149, 149, 149)
Stop.TextSize = 14.000
wait(0.1)
local IsOpen = true
DropShadow:TweenPosition(UDim2.new(0.075, 0,0.361, 0))
local ScriptLoaded = false
pcall(function()
    local UpkeepSettings =_G.__UpkeepSettings
    wait()
    _G.__UpkeepSettings = nil
    game:GetService("UserInputService").InputBegan:Connect(function(Input,TextBoxEnabled)
        if TextBoxEnabled then return end
        if Input.KeyCode.Name == UpkeepSettings.OpenCloseKey then
            IsOpen = not IsOpen
            if IsOpen == true then
                thread(function()
                    DropShadow:TweenPosition(UDim2.new(1, 0,0.361, 0))
                    wait(.3)
                    DropShadow:TweenPosition(UDim2.new(1, 0,1, 0))
                end)
            else
                DropShadow:TweenPosition(UDim2.new(0.075, 0,0.361, 0))
            end
        elseif Input.KeyCode.Name == UpkeepSettings.StartAutoFarm then
            if game.PlaceId == tonumber("537413528") then
            if not ScriptLoaded then
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "fart hub",
                    Text = Button.Text.. " loaded",
                    Button1 = "ok",
                    Button2 = "ok",
                    Icon = "rbxassetid://7037264869",
                    Duration = 15
                })
                _G['can i haz chezburger too'] = true
                ScriptLoaded = true
            else
                _G['can i haz chezburger too'] = not _G['can i haz chezburger too']
            end
            end
        end
    end)
end)
function UpdateSong(id)
    BackgroundMusic.SoundId = "rbxassetid://".. tostring(id)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "background music",
        Text = "set soundid to ".. tostring(id),
        Button1 = "ok",
        Button2 = "ok",
        Icon = "rbxassetid://7037264869",
        Duration = 15
    })
end
function _Play()
    BackgroundMusic:Resume()
    BackgroundMusic.Playing = true
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "background music",
        Text = "resumed",
        Button1 = "ok",
        Button2 = "ok",
        Icon = "rbxassetid://7037264869",
        Duration = 15
    })
end
function _Stop()
    BackgroundMusic.Playing = false
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "background music",
        Text = "paused",
        Button1 = "ok",
        Button2 = "ok",
        Icon = "rbxassetid://7037264869",
        Duration = 15
    })
end
function onFocusLost(enterPressed)
    if not enterPressed then
        return
    end
    UpdateSong(TextBox.Text)
end
Play.MouseButton1Down:Connect(_Play)
Stop.MouseButton1Down:Connect(_Stop)
TextBox.FocusLost:Connect(onFocusLost)
pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "fart hub",
        Text = "hub loaded",
        Button1 = "ok",
        Button2 = "ok",
        Icon = "rbxassetid://7037264869",
        Duration = 15
    })
end)
if game.PlaceId == tonumber("537413528") then
    local Stages = workspace.BoatStages.NormalStages
    local client = game:GetService("Players").LocalPlayer
    _G.mola = true
    Button.Text = "Build A Boat For Rreasure Auto Farm"
    Button.MouseButton1Down:Connect(function()
        if not ScriptLoaded then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "fart hub",
                Text = Button.Text.. " loaded",
                Button1 = "ok",
                Button2 = "ok",
                Icon = "rbxassetid://7037264869",
                Duration = 15
            })
            _G['can i haz chezburger too'] = true
            ScriptLoaded = true
        else
            _G['can i haz chezburger too'] = not _G['can i haz chezburger too']
        end
    end)
    local function FireTouch(v)
        pcall(function()
            if client.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then
                firetouchinterest(v, client.Character.Torso, 0)
            else
                firetouchinterest(v, client.Character.UpperTorso, 0)
            end
        end)
    end
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G['can i haz chezburger too'] == true then
            pcall(function()
                if _G.mola == true then
                    _G.mola = false
                    for i = 1, 10 do
                        local ThisPart = Stages["CaveStage"..i].DarknessPart
                        x = game:GetService('TweenService'):Create(client.Character.HumanoidRootPart, TweenInfo.new(0.5), {
                            CFrame = ThisPart.CFrame
                        })
                        x:Play()
                        delay(0.5, function()
                            game:GetService("Debris"):AddItem(x,0)
                        end)
                        FireTouch(ThisPart)
                        ThisPart.Touched:Wait()
                        workspace.ClaimRiverResultsGold:FireServer()
                    end
                    _G.mola = true
                end
            end)
        end
    end)
end
function ilil (lili : string) 
    local ilili = ""
    local lilili = string.split(lili, " ")
    for i,_ in ipairs(lilili) do 
        ilili = ilili.. string.char(lilili[i])
    end
    return tostring(ilili)
end 
lIl = string IlI = lIl[ilil("99 104 97 114")] 
thread(function()
    wait(.3)
    warn("\n[ moller_error_recorder ] infinite yield on `gethubenabled`")
end)

thread2(function()
    error("[ moller_error_recorder ] could not find 'hub'")
end)
coroutine.wrap(function()
    while not Button.Parent == ScrollingFrame do
        Button.Parent = ScrollingFrame
        game:GetService("RunService").RenderStepped:Wait()
    end
end)()
