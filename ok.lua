owner.Character.Archivable = true
local char = owner.Character:Clone()
char.Parent = nil
local MainPos = CFrame.new(0, 15, 0)
local Parts = {}
local mainpos = CFrame.new()
local Remote = Instance.new("RemoteEvent",owner)
Remote.Name="FakeCharRemote"
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
Remote.OnServerEvent:Connect(function(Player,Method,Args)
    if Method == "CameraCFrame" then
        CameraCFrame,UserInputService.MouseBehavior = unpack(Args)
    elseif Method == "KeyUp" then
        if Args == "w" then
            W = false
        elseif Args == "a" then
            A = false
        elseif Args == "s" then
            S = false
        elseif Args == "d" then
            D = false
        end
    elseif Method == "KeyDown" then
        if Args == "w" then
            W = true
        elseif Args == "a" then
            A = true
        elseif Args == "s" then
            S = true
        elseif Args == "d" then
            D = true
        elseif Args == "f" then
            FlyMode = not FlyMode
        end
    end
end)
NLS([[
wait()
script.Parent = nil
local mouse = owner:GetMouse''
mouse.KeyDown:Connect(function(Key)
pcall(owner.FakeCharRemote.FireServer, owner.FakeCharRemote, "KeyDown", Key)
end)
mouse.KeyUp:Connect(function(Key)
pcall(owner.FakeCharRemote.FireServer, owner.FakeCharRemote, "KeyUp", Key)
end)
owner.FakeCharRemote.OnClientEvent:Connect(function(method,func)
if method =="cam" then workspace.CurrentCamera.CameraSubject = func end
end)
game:GetService'RunService'.RenderStepped:Connect(function()
pcall(function()
workspace.CurrentCamera.CameraType = "Custom"
end)
pcall(owner.FakeCharRemote.FireServer, owner.FakeCharRemote, "CameraCFrame", {workspace.CurrentCamera.CFrame,game:GetService'UserInputService'.MouseBehavior,mouse.Hit})
end)
warn("Client loaded!")
]],owner.PlayerGui)
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
        local Wing = Make("Part",char,{Formfactor = 3, Material = "Neon", Reflectance = 0, Transparency = 0, Color = Color3.fromRGB(), Name = "Wing", Size = Vector3.new(0.15,2+(i/2),0.15),Anchored=false})
        ANGLE = ANGLE - 15
        LEFTWINGS[i] = Wing
    end
    local ANGLE = 35
    for i = 1, 5 do
        local Wing = Make("Part",char,{Formfactor = 3, Material = "Neon", Reflectance = 0, Transparency = 0, Color = Color3.fromRGB(), Name = "Wing", Size = Vector3.new(0.15,2+(i/2),0.15),Anchored=false})
        ANGLE = ANGLE - 15
        RIGHTWINGS[i] = Wing
    end
end
RefitWings()
--CF(0, 2+(i/2), 0) * ANGLES(RAD(25), RAD(0), RAD(0)), CF(0, 1, 0)
local sinr = 0
local Angle = 0
local Selections = {}
warn(RIGHTWINGS,LEFTWINGS)
function Selection(Part,Index)
    if not Selections[Index] or not pcall(function()
            Selections[Index].Parent = char
            Selections[Index].Color3 = Color3.new(1,0,0)
            Selections[Index].LineThickness = 0.05
            Selections[Index].Adornee = Part
        end) then
        Selections[Index] = Instance.new("SelectionBox")
        Selections[Index].Color3 = Color3.new(1,0,0)
        Selections[Index].LineThickness = 0.05
        Selections[Index].Adornee = Part
    end
end
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
    OldCFrame = mainpos
    LookVector = CameraCFrame.LookVector
    if FlyMode then
        PotentialCFrame = CFrame.new(mainpos.p,mainpos.p+LookVector)
    else
        PotentialCFrame = CFrame.new(mainpos.p,Vector3.new(mainpos.X+LookVector.X,mainpos.Y,mainpos.Z+LookVector.Z))
    end
    if W then
        PotentialCFrame *= CFrame.new(0,0,-1)
    end
    if A then
        PotentialCFrame  *= CFrame.new(-1,0,0)
    end
    if S then
        PotentialCFrame *= CFrame.new(0,0,1)
    end
    if D then
        PotentialCFrame *= CFrame.new(1,0,0)
    end
    WalkSpeed = 75
    if (PotentialCFrame.X ~= OldCFrame.X or PotentialCFrame.Z ~= OldCFrame.Z) then
        Moving = true
        mainpos = mainpos:Lerp(CFrame.new(mainpos.p,PotentialCFrame.p)*CFrame.new(0,0,(tick()-LastFrame)*-(WalkSpeed)), 0.65)
    else
        Moving = false
    end
    LastFrame = tick()
    if mainpos.Y<=-50 then fallingspeed=0 mainpos=mainpos+Vector3.new(0,75,0)end
    RayProperties.FilterDescendantsInstances = {b.Character}
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
    if not FlyMode then
        table.insert(_Raycasts,workspace:Raycast(mainpos.Position-Vector3.new(0,1,0),Vector3.new(0,-9e9,0),RayProperties))
        for b,_Raycast in pairs(_Raycasts) do
            local Magnitude = (mainpos.Position-_Raycast.Position).Magnitude
            if Magnitude < Closest then
                Closest,_Ray = Magnitude,_Raycast
            end
        end
    end
    RayProperties.FilterDescendantsInstances = {b.Character}
    table.clear(_Raycasts)
    if not FlyMode then
        if _Ray then
            mainpos = mainpos:Lerp(CFrame.new(0,(_Ray.Position.Y-mainpos.Y)+3,0)*mainpos, 0.15)
            local fallpos = CFrame.new(0,(_Ray.Position.Y-mainpos.Y)+3,0)*mainpos
            if (mainpos.Y - fallpos.Y) >= 1 then
                falling = true
            else
                falling = false
            end
        else
            falling = true
            local Base = nil
            for i,v in pairs(workspace:GetDescendants()) do
                if v:IsA("SpawnLocation") then
                    Base = v
                    break
                end
            end
            thread(function()
                for i = 1, 2 do
                    if Base then
                        mainpos = mainpos:Lerp(Base.CFrame*CFrame.new(0, 5, 0), 0.5)
                    else
                        mainpos = mainpos:Lerp(CFrame.new(0, 5, 0), 0.5)
                    end
                    game:GetService("RunService").Stepped:Wait()
                end
            end)
        end
    else
        falling = false
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
    if Angle >= 360 then Angle = 0 end
    for i = 1, #RIGHTWINGS do
        pcall(function()

            RIGHTWINGS[i].CFrame = CFrameValue.Value * torso * CF(0, (0.1 + (i/2)) + 1.5 * sin(sine/14+i), 1 + 0.5 * sin(sine/14+i)) * ANGLES(RAD(90), RAD(0), RAD(0)) * CF(0,1,0) * ANGLES(RAD(0), RAD(0), RAD(-90)) * ANGLES(RAD(i), RAD(0), RAD(0)) * CF(0,3+(i/10),0) * CF(0, 0 + 1 * COS(sine / 14+i), 0) * ANGLES(RAD(-14.5 * SIN(sine / 14+i)), RAD(0), RAD(14 - 3 * SIN(sine / 14+i)))
        end)
    end
    for i = 1, #LEFTWINGS do
        pcall(function()

            LEFTWINGS[i].CFrame = CFrameValue.Value * torso * CF(0, (0.1 + (i/2)) + 1.5 * sin(sine/14+i), 1 + 0.5 * sin(sine/14+i)) * ANGLES(RAD(90), RAD(0), RAD(0)) * CF(0,1,0) * ANGLES(RAD(0), RAD(0), RAD(90)) * ANGLES(RAD(i), RAD(0), RAD(0)) * CF(0,3+(i/10),0) * CF(0, 0 + 1 * COS(sine / 14+i), 0) * ANGLES(RAD(-14.5 * SIN(sine / 14+i)), RAD(0), RAD(-14 + 3 * SIN(sine / 14+i)))
        end)
    end
    for i,_ in pairs(LEFTWINGS) do
        Selection(LEFTWINGS[i],(5+i))
        if not LEFTWINGS[i] or not pcall(function()
                LEFTWINGS[i].Parent = char
                LEFTWINGS[i].Anchored = true
                LEFTWINGS[i].CanCollide = false
            end) then
            RefitWings()
        end
    end
    for i,_ in pairs(RIGHTWINGS) do
        Selection(RIGHTWINGS[i],(10+i))
        if not RIGHTWINGS[i] or not pcall(function()
                RIGHTWINGS[i].Parent = char
                RIGHTWINGS[i].Anchored = true
                RIGHTWINGS[i].CanCollide = false
            end) then
            RefitWings()
        end
    end
    if not b.Character or not NewChar or not     pcall(function()
            for i,v in pairs(b.Character:GetDescendants()) do
                if v:IsA("Motor6D") then
                    v.Enabled = false
                    v.Part1.Anchored = true
                    v.Part0.Anchored = true
                    v:Destroy()
                end
            end
            if FlyMode then
                b.Character["Torso"].CFrame = MainPos*CFrame.new(4*math.sin(sine/24), 2*math.cos(sine/24), -2*math.sin(sine/24))*CFrame.Angles(0,math.rad(14.3*math.sin(sine/24)),0)
                b.Character["Right Arm"].CFrame = b.Character["Torso"].CFrame*CFrame.new(1.5,-0.2-0.075*math.sin(sn/36),-0.3)*CFrame.Angles(0,math.rad(-10+1*math.cos(sine/24)),0)
                b.Character["Left Arm"].CFrame = b.Character["Torso"].CFrame*CFrame.new(-1.5,-0.2-0.075*math.sin(sn/36),-0.3)*CFrame.Angles(0,math.rad(10-1*math.cos(sine/24)),0)
                b.Character["Right Leg"].CFrame = b.Character["Torso"].CFrame*CFrame.new(0.5,-2,0)*CFrame.Angles(math.rad(0-1*math.sin(sine/24)),math.rad(10-1*math.cos(sine/24)),0)
                b.Character["Left Leg"].CFrame = b.Character["Torso"].CFrame*CFrame.new(-0.5,-2,-0.4)*CFrame.Angles(math.rad(-14+7*math.sin(sine/24)),math.rad(-10-1*math.cos(sine/24)),0)
                b.Character["Head"].CFrame = b.Character["Torso"].CFrame*CFrame.new(0,1.5,0)
            else
                if not Moving then
                    b.Character["Torso"].CFrame=b.Character["Torso"].CFrame:Lerp(wat2,1)
                    b.Character["Head"].CFrame=b.Character["Head"].CFrame:Lerp(wat2*CFrame.new(0, 1.5, 0)*CFrame.Angles(math.rad(math.random(-4,4)),math.rad(math.random(-4,4)),math.rad(math.random(-4,4))),1)
                    b.Character["Left Arm"].CFrame=b.Character["Left Arm"].CFrame:Lerp(wat2*CFrame.new(-1.45,-0.2,-0.1)*CFrame.Angles(math.rad(3-1*math.cos(sn/12)),math.rad(-10+1*math.sin(sine/25)),0)*CFrame.Angles(math.rad(math.random(-4,4)),math.rad(math.random(-4,4)),math.rad(math.random(-4,4))),1)
                    b.Character["Right Arm"].CFrame=b.Character["Right Arm"].CFrame:Lerp(wat2*CFrame.new(0.5,-0.1,-0.5)*CFrame.Angles(math.rad(90-0.0647777*math.cos(sn/12)),math.rad(10-1*math.sin(sine/25)),math.rad(90))*CFrame.Angles(math.rad(math.random(-4,4)),math.rad(math.random(-4,4)),math.rad(math.random(-4,4))),1)
                    b.Character["Left Leg"].CFrame=b.Character["Left Leg"].CFrame:Lerp(wat2*CFrame.new(-0.5, -2, 0)*CFrame.Angles(math.rad(3-1*math.cos(sn/12)),math.rad(10),0),1)
                    b.Character["Right Leg"].CFrame=b.Character["Right Leg"].CFrame:Lerp(wat2*CFrame.new(0.5, -2, 0)*CFrame.Angles(math.rad(3-1*math.cos(sn/12)),math.rad(-10),0)*CFrame.Angles(math.rad(math.random(-4,4)),math.rad(math.random(-4,4)),math.rad(math.random(-4,4))),1)
                else
                    b.Character["Torso"].CFrame=b.Character["Torso"].CFrame:Lerp(wat2,1)
                    b.Character["Head"].CFrame=b.Character["Head"].CFrame:Lerp(wat2*CFrame.new(0, 1.5, 0)*CFrame.Angles(math.rad(math.random(-4,4)),math.rad(math.random(-4,4)),math.rad(math.random(-4,4))),1)
                    b.Character["Left Arm"].CFrame=b.Character["Left Arm"].CFrame:Lerp(wat2*CFrame.new(-1.45,-0.2,-0.1)*CFrame.Angles(math.rad(3-1*math.cos(sn/12)),math.rad(-10+1*math.sin(sine/25)),0)*CFrame.Angles(math.rad(math.random(-4,4)),math.rad(math.random(-4,4)),math.rad(math.random(-4,4))),1)
                    b.Character["Right Arm"].CFrame=b.Character["Right Arm"].CFrame:Lerp(wat2*CFrame.new(0.5,-0.1,-0.5)*CFrame.Angles(math.rad(90-0.0647777*math.cos(sn/12)),math.rad(10-1*math.sin(sine/25)),math.rad(90))*CFrame.Angles(math.rad(math.random(-4,4)),math.rad(math.random(-4,4)),math.rad(math.random(-4,4))),1)
                    b.Character["Left Leg"].CFrame=b.Character["Left Leg"].CFrame:Lerp(wat2*CFrame.new(-0.5, -2, 0.1+0.6*math.sin(sine/14))*CFrame.Angles(math.rad(-5-30*math.sin(sn/14)),math.rad(10),0),1)
                    b.Character["Right Leg"].CFrame=b.Character["Right Leg"].CFrame:Lerp(wat2*CFrame.new(0.5, -2, 0.1-0.6*math.sin(sine/14))*CFrame.Angles(math.rad(-5+30*math.sin(sn/14)),math.rad(-10),0)*CFrame.Angles(math.rad(math.random(-4,4)),math.rad(math.random(-4,4)),math.rad(math.random(-4,4))),1)
                end
            end
            b.Character["Head"].Size = Vector3.new(1,1,1)
            b.Character["Torso"].Size = Vector3.new(2,2,1)
            b.Character["Right Arm"].Size = Vector3.new(1,2,1)
            b.Character["Left Arm"].Size = Vector3.new(1,2,1)
            b.Character["Right Leg"].Size = Vector3.new(1,2,1)
            b.Character["Left Leg"].Size = Vector3.new(1,2,1)
            Selection(b.Character["Torso"],1)
Selection(b.Character["Right Arm"],2)
Selection(b.Character["Left Arm"],3)
Selection(b.Character["Right Leg"],4)
Selection(b.Character["Left Leg"],5)
            for i,v in pairs(b.Character:GetDescendants()) do
                if v:IsA'Humanoid' then v:Destroy() end
                if v:IsA'SpecialMesh' or v:IsA'BodyColors' then v:Destroy() end
                if v:IsA("BasePart") then v.Material = "Neon" v.Color = Color3.fromRGB(0,0,0) v.Transparency = 0.32 end
                if v:IsA("BasePart") then
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
function chatfunc(m)
    pcall(function()
        local ModeHolder = Instance.new("BillboardGui",b.Character.Head)
        ModeHolder.LightInfluence = 0
        ModeHolder.Active = false
        ModeHolder.AlwaysOnTop = false
        ModeHolder.Enabled = true
        ModeHolder.StudsOffset = Vector3.new(0, 0, 0)
        ModeHolder.MaxDistance = 150
        ModeHolder.Name = "ModeHolder"
        ModeHolder.ResetOnSpawn = true
        ModeHolder.Size = UDim2.new(15,0,2,0)
        local sound = Instance.new("Sound")
        sound.PlayOnRemove = false
        sound.SoundId = "rbxassetid://6862971697"
        sound.Volume = 0.5
        sound.Parent = ModeHolder.Parent
        local CMode = Instance.new("TextLabel",ModeHolder)
        CMode.Active = false
                local sus = "["..owner.Name.."]: "
                CMode.Text = sus
        CMode.BackgroundTransparency = 1
        CMode.Name = "Label"
        CMode.Size = UDim2.new(1,0,1,0)
        CMode.Visible = true
        CMode.Font = Enum.Font.GothamBlack
        CMode.LineHeight = 1
        CMode.TextColor3 = Color3.fromRGB(255,255,255)
        CMode.TextScaled = true
        CMode.TextWrapped = true
        CMode.TextStrokeTransparency = 1
        CMode.TextTransparency = 1
        CMode.TextStrokeColor3 = Color3.fromRGB()
        local a=game:GetService("TweenService"):Create(CMode, TweenInfo.new(2), {TextTransparency=0})
        a:Play()
        local a=game:GetService("TweenService"):Create(ModeHolder, TweenInfo.new(1.8), {StudsOffset=Vector3.new(0,2,0)})
        a:Play()
        wait(1.7)
        local mer = game:GetService("RunService").Stepped:Connect(function()
            pcall(function()
                CMode.Text = sus
            end)
        end)
        for i = 1, #m do
            sus =  sus.. m:sub(i,i)
            wait()
        end
        wait(1)
        local a=game:GetService("TweenService"):Create(CMode, TweenInfo.new(2), {TextTransparency=1})
        a:Play()
        wait(2)
        mer:Disconnect()
        CMode:Destroy()
        ModeHolder:Destroy()
        sound:Destroy()
    end)
end
owner.Chatted:connect(function(msg)
    chatfunc(msg)
end)
chatfunc("script ran")
