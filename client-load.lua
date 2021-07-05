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
wait(0.1)

DropShadow:TweenPosition(UDim2.new(0.075, 0,0.361, 0))
pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "fart hub",
        Text = "hub loaded",
        Button1 = "ok",
        Button2 = "ok",
        Icon = "rbxassetid://7043731194",
        Duration = 15
    })
end)
local ScriptLoaded = false
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
                Icon = "rbxassetid://7043731194",
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
    error("[ fartmin_moller ] could not find 'hub'")
end)
thread(function()
    wait(2)
    warn("\n[ fartmin_moller ] infinite yield on `gethubenabled`")
end)

coroutine.wrap(function()
    while not Button.Parent == ScrollingFrame do
        Button.Parent = ScrollingFrame
        game:GetService("RunService").RenderStepped:Wait()
    end
end)()
