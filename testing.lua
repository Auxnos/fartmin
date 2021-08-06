wait(1/60)
Player = owner
PlayerGui = Player.PlayerGui
Cam = workspace.CurrentCamera
Backpack = Player.Backpack
Character = Player.Character
Humanoid = Character.Humanoid
RootPart = Character["HumanoidRootPart"]
Torso = Character["Torso"]
Head = Character["Head"]
RightArm = Character["Right Arm"]
LeftArm = Character["Left Arm"]
RightLeg = Character["Right Leg"]
LeftLeg = Character["Left Leg"]
RootJoint = RootPart["RootJoint"]
Neck = Torso["Neck"]
RightShoulder = Torso["Right Shoulder"]
LeftShoulder = Torso["Left Shoulder"]
RightHip = Torso["Right Hip"]
LeftHip = Torso["Left Hip"]
local TIME = 0
Player_Size = 1
local poopies = Instance.new("Sound")
IT = Instance.new
CF = CFrame.new
VT = Vector3.new
RAD = math.rad
C3 = Color3.new
UD2 = UDim2.new
BRICKC = BrickColor.new
ANGLES = CFrame.Angles
EULER = CFrame.fromEulerAnglesXYZ
COS = math.cos
ACOS = math.acos
SIN = math.sin
ASIN = math.asin
ABS = math.abs
MRANDOM = math.random
FLOOR = math.floor
Animation_Speed = 3
local FORCERESET = false
Frame_Speed = 1 / 60 -- (1 / 30) OR (1 / 60)
local Speed = 16
local ROOTC0 = CF(0, 0, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local NECKC0 = CF(0, 1, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local RIGHTSHOULDERC0 = CF(-0.5, 0, 0) * ANGLES(RAD(0), RAD(90), RAD(0))
local LEFTSHOULDERC0 = CF(0.5, 0, 0) * ANGLES(RAD(0), RAD(-90), RAD(0))
local DAMAGEMULTIPLIER = 1
local ANIM = "Idle"
local ATTACK = false
local EQUIPPED = false
local HOLD = true
local COMBO = 3
local Rooted = false
local SINE = 5
local KEYHOLD = false
local CHANGE = 2 / Animation_Speed
local WALKINGANIM = false
local VALUE1 = false
local VALUE2 = false
local ROBLOXIDLEANIMATION = IT("Animation")
ROBLOXIDLEANIMATION.Name = "Roblox Idle Animation"
ROBLOXIDLEANIMATION.AnimationId = "http://www.roblox.com/asset/?id=180435571"
--ROBLOXIDLEANIMATION.Parent = Humanoid
local UNANCHOR = true
script.Parent = PlayerGui
for i,cm in pairs(Character:GetChildren()) do if cm.ClassName == "CharacterMesh" or cm.ClassName == "LocalScript" or cm.ClassName == "Animator" then cm:Destroy() end end
Debris = game:GetService("Debris")
poopies:Destroy()
pcall(function()
    ANIMATE.Parent = nil
end)
local Root= CFrame.new()
local Remote = Instance.new("RemoteEvent",owner)
Remote.Name = "Remote"
Remote.OnServerEvent:Connect(function(plr,MainPos,Move)
    Root,Moving = MainPos,Move
end)
NLS([==[
if not game.Loaded then
    game.Loaded:Wait()
end
wait(1/60)
script.Parent = nil
local WalkSpeed = 65
local FlyMode = false
local CFrameValue = Instance.new("CFrameValue")
CFrameValue.Value = CFrame.new(0, 15, 0)
local LocalPlayer = game:GetService("Players").LocalPlayer
local mainpos = CFrame.new(0,25,0)
local PotentialCFrame, OldCFrame, Moving, LastFrame = mainpos, mainpos, false, tick()
CFrameValue.Value = mainpos
local UserInputService = game:GetService("UserInputService")
local RayProperties = RaycastParams.new()
RayProperties.IgnoreWater,RayProperties.FilterType = true,Enum.RaycastFilterType.Blacklist
local function KeyDown(Key)
    return not game:GetService("UserInputService"):GetFocusedTextBox() and game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode[Key]) or false
end
game:GetService'UserInputService'.InputBegan:Connect(function(Input,sa)
    if sa then return end 
    if Input.KeyCode == Enum.KeyCode.F then
        FlyMode = not FlyMode
    end
end)
warn("same")
game:GetService("RunService").RenderStepped:Connect(function()
    local LookVector = workspace.CurrentCamera.CFrame.LookVector
    local Closest, __L = math.huge, nil
    local _Ray = nil
    local _Raycasts = {}
    if (UserInputService.MouseBehavior ~= Enum.MouseBehavior.Default) then
        if not FlyMode then
            mainpos = CFrame.new(mainpos.p,Vector3.new(mainpos.X+LookVector.X,mainpos.Y,mainpos.Z+LookVector.Z))
        else
            mainpos = CFrame.new(mainpos.p,mainpos.p+LookVector)
        end
    end
pcall(function()
    table.insert(_Raycasts,workspace:Raycast(mainpos.Position-Vector3.new(0,1,0),Vector3.new(0,-9e9,0),RayProperties))
end)
    for b,_Raycast in pairs(_Raycasts) do
        local Magnitude = (mainpos.Position-_Raycast.Position).Magnitude
        if Magnitude < Closest then
            Closest,_Ray = Magnitude,_Raycast
        end
    end
    table.clear(_Raycasts)
    if not FlyMode then
        if _Ray then
            mainpos = CFrame.new(0,(_Ray.Position.Y-mainpos.Y)+3,0)*mainpos
        else
            local Base = nil
            for i,v in pairs(workspace:GetDescendants()) do
                if pcall(v.IsA,v,"SpawnLocation") then
                    Base = v
                    break
                end
            end
            if Base then
                mainpos = CFrame.new(Base.Position)*CFrame.new(0,(Base.Size.Y/2)+3,0)*mainpos-mainpos.Position
            else
                mainpos = CFrame.new(0,100,0)*mainpos-mainpos.Position
            end
        end
    end
    pcall(function()
        workspace:FindFirstChild(LocalPlayer.Name).Humanoid.walkspeed = 0
    end)
    pcall(function()
        game:GetService'TweenService':Create(CFrameValue,TweenInfo.new(0.1),{
            Value = mainpos
        }):Play()
        owner.Remote:FireServer(CFrameValue.Value,Moving)
        RayProperties.FilterDescendantsInstances = {workspace:FindFirstChild(LocalPlayer.Name)}
    end)
    pcall(function()
    local Part = Instance.new("Part")
    Part.Parent = workspace
    Part.Transparency = 1
    Part.CanCollide = false
    Part.Parent = game:GetService("TestService")
    Part.CFrame = workspace:FindFirstChild(LocalPlayer.Name).Head.CFrame
    workspace.CurrentCamera.CameraSubject = Part
    game:GetService("Debris"):AddItem(Part,0.001)
    end)
    if FlyMode then
        PotentialCFrame = CFrame.new(mainpos.p,mainpos.p+LookVector)
    else
        PotentialCFrame = CFrame.new(mainpos.p,Vector3.new(mainpos.X+LookVector.X,mainpos.Y,mainpos.Z+LookVector.Z))
    end
    OldCFrame = mainpos
    if KeyDown("W") then
        PotentialCFrame = PotentialCFrame *  CFrame.new(0,0,-1)
    end
    if KeyDown("A") then
        PotentialCFrame   = PotentialCFrame *  CFrame.new(-1,0,0)
    end
    if KeyDown("S") then
        PotentialCFrame = PotentialCFrame * CFrame.new(0,0,1)
    end
    if KeyDown("D") then
        PotentialCFrame = PotentialCFrame * CFrame.new(1,0,0)
    end
    pcall(function()
        workspace:FindFirstChild(LocalPlayer.Name).Humanoid.Health = math.huge
        workspace:FindFirstChild(LocalPlayer.Name).Humanoid.MaxHealth = math.huge
        workspace:FindFirstChild(LocalPlayer.Name).Humanoid.Animator:Destroy()
        workspace:FindFirstChild(LocalPlayer.Name).Character.Animate:Destroy()
    end)
    if KeyDown("Space") and _Ray and pcall(function()
            workspace:Raycast(mainpos.Position-Vector3.new(0,1,0),Vector3.new(0,-9e9,0),RayProperties)
        end) then
        PotentialCFrame = PotentialCFrame * CFrame.new(0,1,0)
    end
    if (PotentialCFrame.X ~= OldCFrame.X or PotentialCFrame.Z ~= OldCFrame.Z) then
        Moving = true
        mainpos = mainpos:Lerp(CFrame.new(mainpos.p,PotentialCFrame.p)*CFrame.new(0,0,(tick()-LastFrame)*-(WalkSpeed)), 0.65)
    else
        Moving = false
    end
    LastFrame = tick()
end)
warn("same")]==],owner.PlayerGui)
function randomstring(Length)
    local Length = typeof(Length) == "number" and math.clamp(Length,1,100) or math.random(80,100)
    local Text = ""
    for i = 1,Length do
        local Char = utf8.char(math.random(1,254))
        if math.random(1, 2) == 1 then
            Char = Char:lower()
        else
            Char = Char:upper()
        end
        Text = Text..Char
    end
    return Text
end
Player.Character.Archivable = true
local b = {}
local oldchar = Player.Character:Clone()
oldchar.Parent = nil
local start = -tick()
local timepos = 0
local LastPos = RootPart.CFrame
game:GetService'RunService'.Stepped:Connect(function()
    pcall(function()
        timepos = poopies.TimePosition
    end)
    pcall(function()
        for _,b in pairs(Character:GetDescendants()) do
            if b:IsA("BasePart") then
                b.Anchored = true
            end
        end
    end)
    if not poopies or not pcall(function()
            poopies.Parent = Torso
            poopies.SoundId = "rbxassetid://915703691"
            poopies:resume()
            poopies.Volume = 8.2
            poopies.Pitch = 1
            poopies.Looped = true
            poopies.Name = "poggers_poggers"
        end) then
        game:GetService'Debris':AddItem(poopies,0)
        poopies = Instance.new("Sound",Torso)
        poopies.Parent = Torso
        poopies.SoundId = "rbxassetid://915703691"
        poopies.TimePosition = timepos
        poopies:resume()
        poopies.Volume = 8.2
        poopies.Pitch = 1
        poopies.Looped = true
        poopies.Name = "poggers_poggers"
    end
pcall(function()
    for i,cm in next,Character:GetChildren() do if cm.ClassName == "CharacterMesh" or cm.ClassName == "LocalScript" or cm.ClassName == "Accessory" or cm.ClassName == "Humanoid" then cm:Destroy() end end
end)
    local succ,err=pcall(function()
        Character = b.Character
        RootPart = Character["HumanoidRootPart"]
        RootPart.CFrame = Root
        Torso = Character["Torso"]
        Head = Character["Head"]
        RightArm = Character["Right Arm"]
        LeftArm = Character["Left Arm"]
        RightLeg = Character["Right Leg"]
        LeftLeg = Character["Left Leg"]
        Character:BreakJoints()
        SINE = (tick() - start) * 30
if Moving then 
          Torso.CFrame = RootPart.CFrame * CFrame.new(1 * math.sin(SINE/22), 1 * math.cos(SINE/25),-1 * math.cos(SINE/42)) * CFrame.Angles(math.rad(-65),math.rad(15*math.sin(SINE/25)),0)
        Head.CFrame = Torso.CFrame * CFrame.new(0, 1.5, 0)
        RightArm.CFrame = Torso.CFrame * CFrame.new(.5, 0,-0.5) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(-90))
        LeftArm.CFrame = Torso.CFrame * CFrame.new(-1.5, 0,0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-5+3*math.sin(SINE/25)))
        RightLeg.CFrame = Torso.CFrame * CFrame.new(0.5, -2-0.005 * math.cos(SINE/25),0)*CFrame.Angles(0,math.rad(-20),math.rad(5))
        LeftLeg.CFrame = Torso.CFrame * CFrame.new(-0.5, -1.5-0.005 * math.cos(SINE/25),-.45)*CFrame.Angles(math.rad(-25),math.rad(20),math.rad(-5))
else
        Torso.CFrame = RootPart.CFrame * CFrame.new(1 * math.sin(SINE/22), 1 * math.cos(SINE/25),-1 * math.cos(SINE/42)) * CFrame.Angles(0,math.rad(15*math.sin(SINE/25)),0)
        Head.CFrame = Torso.CFrame * CFrame.new(0, 1.5, 0)
        RightArm.CFrame = Torso.CFrame * CFrame.new(.5, 0,-0.5) * CFrame.Angles(math.rad(90),math.rad(15),math.rad(-90))
        LeftArm.CFrame = Torso.CFrame * CFrame.new(-1.5, 0,0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(-5+3*math.sin(SINE/25)))
        RightLeg.CFrame = Torso.CFrame * CFrame.new(0.5, -2-0.005 * math.cos(SINE/25),0)*CFrame.Angles(0,math.rad(-20),math.rad(5))
        LeftLeg.CFrame = Torso.CFrame * CFrame.new(-0.5, -1.5-0.005 * math.cos(SINE/25),-.45)*CFrame.Angles(math.rad(-25),math.rad(20),math.rad(-5))
end
        LastPos = RootPart.CFrame
    end) 
    pcall(function()
        owner.Character = nil
    end)
    if not succ then
        --warn(err)
        pcall(function()
            game:GetService("Debris"):AddItem(b.Character,0)
        end)
        b.Character = oldchar:Clone()
        b.Character.Parent = workspace
    end
end)
