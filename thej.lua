owner.Character.Archivable = true
local char = owner.Character:Clone()
char.Parent = nil
local MainPos = CFrame.new(0, 15, 0)
local Parts = {}
local mainpos = CFrame.new()
local CameraCFrame = CFrame.new(0, 1, 0)
RayProperties = RaycastParams.new()
RayProperties.IgnoreWater = true
RayProperties.FilterType = Enum.RaycastFilterType.Blacklist
local W,A,S,D = false, false, false, false
local UserInputService = {}
UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
function randomstring(Length)
    local Length = (Length and string.len(Length) >= 1 and Length or math.random(1, math.clamp(math.random(35, 100), 5, 35)))
    local o = {}
    local str = ""
    for i = 0, Length, 1 do
        table.insert(o,math.random(1, 350))
    end
    for g,b in pairs(o) do
        str = str.. utf8.char(b)
        table.remove(o,g)
    end
    return tostring(str)
end
walkspeed = 0.4
movementfalse = false
flying = false
falling = false
local fallingspeed = 0
b = {}
local start = -tick()
thing = 0
local TimePos = 0
LastThing = tick()
mainpos = mainpos*CFrame.new(0, 25, 0)
function cler(args,speed)
    local chara = b.Character
    pcall(function()
        chara.Torso.CFrame = chara.Torso.CFrame:Lerp(MainPos * args[1],speed)
        chara.Head.CFrame = chara.Head.CFrame:Lerp(MainPos * args[1] * args[2],speed)
        chara["Right Arm"].CFrame = chara["Right Arm"].CFrame:Lerp(MainPos * args[1] * args[4],speed)
        chara["Left Arm"].CFrame = chara["Left Arm"].CFrame:Lerp(MainPos * args[1] *  args[3],speed)
        chara["Right Leg"].CFrame = chara["Right Leg"].CFrame:Lerp(MainPos * args[1] *  args[5],speed)
        chara["Left Leg"].CFrame = chara["Left Leg"].CFrame:Lerp(MainPos * args[1] *  args[6],speed)
    end)
end
LastFrame = tick()
FlyMode = false
PotentialCFrame = mainpos
Moving = false
Remote = Instance.new("RemoteEvent",owner)
Remote.Name = "Remote"
local atacc
local mode = "default"
local Mouse = {Hit=CFrame.new(0,0,0),Target=nil}
Remote.OnServerEvent:connect(function(pl,m,a,b)
    if m == "stuff" then
        pcall(function()
            mainpos = a
            Moving,FlyMode = unpack(b)
        end)
    elseif m == "attack" then
        atacc = a
        Mouse.Hit,Mouse.Target = b.Hit,b.Target
    end
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
local Mode = "default"
local RayProperties = RaycastParams.new()
RayProperties.IgnoreWater,RayProperties.FilterType = true,Enum.RaycastFilterType.Blacklist
local function KeyDown(Key)
    return not game:GetService("UserInputService"):GetFocusedTextBox() and game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode[Key]) or false
end
local function KeyUp(Key)
    return not game:GetService("UserInputService"):GetFocusedTextBox() and not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode[Key]) or false
end
    local MouseProps,Hit,Target = RaycastParams.new(),CFrame.new(),nil
game:GetService'UserInputService'.InputBegan:Connect(function(Input,sa)
    if sa then return end 
    if Input.KeyCode == Enum.KeyCode.F then
        FlyMode = not FlyMode
    end
        if Input.KeyCode == Enum.KeyCode.M then
        if Mode == "default" then
        Mode = "rainbow"
        else
        Mode = "default"
        end
    end
end)
warn("same")

game:GetService("RunService").RenderStepped:Connect(function()
    MouseProps.FilterType = Enum.RaycastFilterType.Blacklist
    MouseProps.FilterDescendantsInstances = {LocalPlayer.Character,workspace.Terrain} -- add stuff if youy want loser
    local MousePosition = game:GetService("UserInputService"):GetMouseLocation()-game:GetService("GuiService"):GetGuiInset()
    local UnitRay = workspace.CurrentCamera:ScreenPointToRay(MousePosition.X,MousePosition.Y)
    local Ray_ = workspace:Raycast(UnitRay.Origin,UnitRay.Direction*1e3,MouseProps)
    Hit,Target = Ray_ and CFrame.new(Ray_.Position) or CFrame.new(),Ray_ and Ray_.Instance or nil
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
    pcall(function()
        workspace:FindFirstChild(LocalPlayer.Name).Humanoid.walkspeed = 0
    end)
    pcall(function()
        game:GetService'TweenService':Create(CFrameValue,TweenInfo.new(0.1),{
            Value = mainpos
        }):Play()
        owner.Remote:FireServer("stuff",CFrameValue.Value,{Moving,FlyMode})
        RayProperties.FilterDescendantsInstances = {workspace:FindFirstChild(LocalPlayer.Name)}
    end)
    pcall(function()
    Part = workspace:FindFirstChild(LocalPlayer.Name).Head
    workspace.CurrentCamera.CameraSubject = Part
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
warn("same")
]==],owner.PlayerGui)
function thread(u1)
    local u2 
    u2 = coroutine.wrap(function()
        u1()
        wait()
        coroutine.yield(u2)
    end)
    u2 = u2()
end
for i,v in pairs(char:GetDescendants()) do
    if v:IsA'Humanoid' then v:Destroy() end
    if v:IsA'SpecialMesh' or v:IsA'BodyColors' or v:IsA("Accessory") or v:IsA("LocalScript") then v:Destroy() end
    if v:IsA("BasePart") then v.Material = "Neon" v.Color = Color3.fromRGB(0,0,0) v.Transparency = 0.32 end
    if v:IsA("BasePart") then
        if v.Name == "HumanoidRootPart" then
            v:Destroy()
        end
    end
end
-- s
sick = Instance.new("StringValue")
b.Character = char:Clone()
local wat = CFrame.new()
local wat2 = wat
b.Character.Parent = workspace
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
local LEFTWINGS = {}
local RIGHTWINGS = {}
function CreatePart(FORMFACTOR, PARENT, MATERIAL, REFLECTANCE, TRANSPARENCY, BRICKCOLOR, NAME, SIZE, ANCHOR)
    local NEWPART = IT("Part")
    NEWPART.formFactor = FORMFACTOR
    NEWPART.Reflectance = REFLECTANCE
    NEWPART.Transparency = TRANSPARENCY
    NEWPART.CanCollide = false
    NEWPART.Locked = true
    NEWPART.Anchored = true
    if ANCHOR == false then
        NEWPART.Anchored = false
    end
    NEWPART.BrickColor = BrickColor.new(tostring(BRICKCOLOR))
    NEWPART.Name = NAME
    NEWPART.Size = SIZE
    NEWPART.Position = Vector3.new()
    NEWPART.Material = MATERIAL
    NEWPART:BreakJoints()
    NEWPART.Parent = PARENT
    return NEWPART
end
function Make(ty,par,props)
    local obj;
    obj=Instance.new(ty,par)
    for k,v in pairs(props) do 
        if type(k)=='number'then 
            pcall(function()
                v.Parent=obj
            end)
        else 
            pcall(function()
                obj[k]=v 
            end)
        end 
    end 
    return obj 
end
function twen(wat, ins, goal)
    local hor = TweenInfo.new(unpack(ins))
    local twww = game:GetService("TweenService"):Create(wat, hor, goal)
    return twww
end
function RefitWings()
    for i,v in pairs(LEFTWINGS) do
        if LEFTWINGS[i] then
            game:GetService("Debris"):AddItem(LEFTWINGS[i],0)
        end
        table.remove(LEFTWINGS,i)
    end
    --aabb
    for i,v in pairs(RIGHTWINGS) do
        if RIGHTWINGS[i] then
            game:GetService("Debris"):AddItem(RIGHTWINGS[i],0)
        end
        table.remove(RIGHTWINGS,i)
    end
    local ANGLE = 35
    for i = 1, 5 do
        local Wing = Make("Part",workspace,{Formfactor = 3, Material = "Neon", Reflectance = 0, Transparency = 0, Color = Color3.fromRGB(), Name = "Wing", Size = Vector3.new(0.15,2+(i/2),0.15),Anchored=false})
        ANGLE = ANGLE - 15
        LEFTWINGS[i] = Wing
    end
    local ANGLE = 35
    for i = 1, 5 do
        local Wing = Make("Part",workspace,{Formfactor = 3, Material = "Neon", Reflectance = 0, Transparency = 0, Color = Color3.fromRGB(), Name = "Wing", Size = Vector3.new(0.15,2+(i/2),0.15),Anchored=false})
        ANGLE = ANGLE - 15
        RIGHTWINGS[i] = Wing
    end
end
--CF(0, 2+(i/2), 0) * ANGLES(RAD(25), RAD(0), RAD(0)), CF(0, 1, 0)
local sinr = 0
local Angle = 0
local Selections = {}
function stepped()
    local sine = (tick() - start) * 30
    if (tick() - LastThing) >= 1.5 then
        if thing == 0.2 then
            thing = 0
        else
            thing = 0.2
        end
        LastThing = tick()
    end
    local sn = sine
    if not Moving then
        wat = wat:Lerp(CFrame.new(0, 0, 0)*CFrame.Angles(math.rad(-3+1*math.cos(sn/12)),0,0)*CFrame.Angles(math.rad(math.random(-4,4)),math.rad(math.random(-4,4)),math.rad(math.random(-4,4))), 0.25)
    else
        wat = wat:Lerp(CFrame.new(0, 0, 0)*CFrame.Angles(math.rad(0*math.cos(sn/12)),math.rad(2*math.sin(sine/14)),0)*CFrame.Angles(math.rad(math.random(-4,4)),math.rad(math.random(-4,4)),math.rad(math.random(-4,4))), 0.25)
    end
    wat2 = MainPos * wat
    pcall(function()
        if not b.Character.Head:GetAttribute(owner.Name) then
            b.Character.Head:SetAttribute(owner.Name,true)
        end
        Remote:FireAllClients("cam",b.Character.Head)
        if owner.Character then
            owner.Character:Destroy()
        end
    end)
    MainPos = MainPos:Lerp(mainpos*CFrame.Angles(0,math.rad(0),0),0.045)
    Angle+=1
    sin = math.sin
    if not b.Character or not NewChar or not     pcall(function()
            for i,v in pairs(b.Character:GetDescendants()) do
                if v:IsA("Motor6D") then
                    v.Enabled = false
                    v.Part1.Anchored = true
                    v.Part0.Anchored = true
                    v:Destroy()
                end
            end
            local cn,angles,rad,cos,sin,rn,v3 = CFrame.new,CFrame.Angles,math.rad,math.cos,math.sin,math.random,Vector3.new
            local ok = cn(3.7*cos(sine/42),0.7*sin(sine/17),-2*cos(sine/24))
            if FlyMode then
                if (Moving) then
                    b.Character["Torso"].CFrame = b.Character["Torso"].CFrame:Lerp(MainPos*ok*angles(rad(-45),rad(12.6*sin(sine/15)),0)*angles(0,rad(0),0), 1.15)
                    b.Character["Head"].CFrame = b.Character["Head"].CFrame:Lerp(b.Character["Torso"].CFrame*cn(0,1.5,0)*angles(rad(45),0,0), 1.15)
                else
                    b.Character["Torso"].CFrame = b.Character["Torso"].CFrame:Lerp(MainPos*ok*angles(0,rad(12.6*sin(sine/15)),0), 1.15)
                    b.Character["Head"].CFrame = b.Character["Head"].CFrame:Lerp(b.Character["Torso"].CFrame*cn(0,1.5,0), 1.15)
                end
                b.Character["Right Arm"].CFrame = b.Character["Right Arm"].CFrame:Lerp(b.Character["Torso"].CFrame*cn(.5,-0.3,0.5)*angles(rad(1),rad(0.3-0.1*sin(sine/25)),rad(-43)), 1.15)
                b.Character["Left Arm"].CFrame = b.Character["Left Arm"].CFrame:Lerp(b.Character["Torso"].CFrame*cn(-.5,0.2,-0.6)*angles(rad(90),rad(10-5*sin(sine/42)),rad(-90)), 1.15)
                b.Character["Left Leg"].CFrame = b.Character["Left Leg"].CFrame:Lerp(b.Character["Torso"].CFrame*cn(-0.8+0.002*sin(sine/17),-1.6,-0.2)*angles(rad(-8),rad(11),rad(-14+2*cos(sine/17))), 1.15)
                b.Character["Right Leg"].CFrame = b.Character["Right Leg"].CFrame:Lerp(b.Character["Torso"].CFrame*cn(0.8-0.002*sin(sine/17),-1.8,-0.2)*angles(rad(-15),rad(-11),rad(14-2*cos(sine/17))), 1.15)
            else
                b.Character["Torso"].CFrame = MainPos*CFrame.new(0,0,0)
                b.Character["Head"].CFrame = MainPos*CFrame.new(0,1.5,0)
                b.Character["Right Arm"].CFrame = MainPos*CFrame.new(1.5,0,0)
                b.Character["Left Arm"].CFrame = MainPos*CFrame.new(-1.5,0,0)
                b.Character["Right Leg"].CFrame = MainPos*CFrame.new(.5,-2,0)
                b.Character["Left Leg"].CFrame = MainPos*CFrame.new(-.5,-2,0)
            end
            b.Character["Head"].Size = Vector3.new(2,1,1)
            b.Character["Torso"].Size = Vector3.new(2,2,1)
            b.Character["Right Arm"].Size = Vector3.new(1,2,1)
            b.Character["Left Arm"].Size = Vector3.new(1,2,1)
            b.Character["Right Leg"].Size = Vector3.new(1,2,1)
            b.Character["Left Leg"].Size = Vector3.new(1,2,1)
            for i,v in pairs(b.Character:GetDescendants()) do
                if v:IsA'Humanoid' then v:Destroy() end
                if v:IsA'BodyColors' then v:Destroy() end
                if v:IsA("BasePart") then v.Material = "Neon" v.Color = Color3.fromRGB(0,0,0) v.Transparency = 0 end
                if v:IsA("BasePart") then
                    if v.Name == "Head" then
                        if not v:FindFirstChildOfClass("SpecialMesh") then
                            --  game:GetService("Debris"):AddItem(mesh,0)
                        end
                    end
                end
            end
        end) then
        for i,v in pairs(Parts) do
            game:GetService("Debris"):AddItem(v,0)
            table.remove(Parts,i)
        end
        game:GetService("Debris"):AddItem(b.Character,0)
        NewChar = char:Clone()
        NewChar.Parent = workspace
        for i,v in pairs(NewChar:GetDescendants()) do 
            table.insert(Parts,v)
        end
        b.Character = NewChar
    end
end
game:GetService("RunService").Stepped:Connect(stepped)
game:GetService("RunService").Heartbeat:Connect(stepped) 
