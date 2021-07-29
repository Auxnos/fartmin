function randomstring()
    local len = math.random(1,50)
    local e = {}
    for i = 1, len do
        table.insert(e,#e+1,utf8.char(math.random(42,97)))
    end
    return tostring(table.concat(e))
end
local Stopped = false
local Players,RunService = game:GetService'Players',game:GetService'RunService'
local Player = owner
local UserId,UserName = tonumber(Player.UserId), tostring(Player.Name)
local FlyMode, falling, mainpos = false, false, CFrame.new(0, 5, 0)
local RayProperties = RaycastParams.new()
RayProperties.FilterType = Enum.RaycastFilterType.Blacklist
local UserInputService = {MouseBehavior = Enum.MouseBehavior.Default}
local CameraCFrame = CFrame.new()
local LookVector = CameraCFrame.LookVector
function thread(u1)
    local u2 
    u2 = coroutine.wrap(function()
        u1()
        wait()
        coroutine.yield(u2)
    end)
    u2 = u2()
end
function Create(thing,properties)local obj = Instance.new(thing);if properties then for i,v in pairs(properties) do pcall(function()obj[i]=v;end);end;end;return obj;end
local PotentialCFrame = mainpos
local OldCFrame = mainpos
LastFrame = tick()
local WalkSpeed = 75
Moving = false
local Connections = {}
local W,A,S,D = false,false,false,false
local Torso, Head, RightArm, LeftArm, RightLeg, LeftLeg, Dice, DiceMesh, Particle, AttachmentOwO
local neck,torso,ra,la,rl,ll = CFrame.new(),CFrame.new(),CFrame.new(),CFrame.new(),CFrame.new(),CFrame.new()
local cn,angles,rad,cos,sin,rn,v3 = CFrame.new,CFrame.Angles,math.rad,math.cos,math.sin,math.random,Vector3.new
local sine = 0
local start = -tick()
local CFrameValue = Create("CFrameValue",{Value=mainpos,Name=randomstring()})
local tweenservice = game:GetService("TweenService")
RayProperties.IgnoreWater,RayProperties.FilterType = true, Enum.RaycastFilterType.Blacklist
function tween(b,info,stuff)
return tweenservice:Create(b,TweenInfo.new(unpack(info)),stuff)
end
local _Instance = Instance
local Instance = {}
do
Instance.new=_Instance.new;function Destroy(Part,Time)if (Time ~= nil) then pcall(function()game:GetService("Debris"):AddItem(Part,Time);end);else pcall(function()game:GetService("Debris"):AddItem(Part,0);end);end;end;Instance.Destroy,Instance.Remove=Destroy,Destroy;
end;
for _,v in pairs(script:FindFirstChild("parts"):GetChildren()) do
v:Clone().Parent = script
end
local RemoteName = ""
for i = 1, math.random(1,50) do
    local Same = utf8.char(math.random(46,121))
    if math.random(1,2) == 1 then
        Same = Same:lower()
    else
        Same = Same:upper()
    end
    RemoteName = RemoteName.. Same
end
RemoteName = tostring(RemoteName)
local char = Create("Model",{
    Parent = workspace,
    Name = randomstring()
})
local Keys = {}
local Remote = Create("RemoteEvent",{
    Parent = game:GetService("TestService"),
    Name = RemoteName
})
local fakeEvent = function()
    local t = {_fakeEvent=true}
    t.Connect = function(self,f)self.Function=f end
    t.connect = t.Connect
    return t
end
local Mouse = {Target=nil,Hit=CFrame.new(),KeyUp=fakeEvent(),KeyDown=fakeEvent(),Button1Up=fakeEvent(),Button1Down=fakeEvent()}
local function te(self,ev,...)
    local t = Mouse[ev]
    if t and t._fakeEvent and t.Function then
        t.Function(...)
    end
end
Mouse.TrigEvent = te
function remotestuff(Sender, Method, Arguments)
    if Method == "KeyDown" then
        local Key = string.lower(Arguments.KeyCode.Name)
        Mouse:TrigEvent("KeyDown",Key)
    elseif Method == "KeyUp" then
        local Key = string.lower(Arguments.KeyCode.Name)
        Mouse:TrigEvent("KeyUp",Key)
    elseif Method == "ClientInfo" then
        Mouse.Hit,UserInputService.MouseBehavior,CameraCFrame=unpack(Arguments)
    elseif Method == "chatfunc" then
        chatfunc(Arguments)
    end
end
local Client = script:FindFirstChild("Client",false)
Client:SetAttribute("RemoteName",RemoteName)
function NewClient()
    NLS([==[wait()
script.Parent = nil
local Remote = nil
local RemoteName = script:GetAttribute("RemoteName")

local Player = game:GetService("Players").LocalPlayer

local Players = game:GetService("Players")
local userinput = game:GetService("UserInputService")
local test = game:GetService("TestService")
local connection = nil

function funny(Method,Args)
    if Method == "Info" then
        pcall(function()
            workspace.CurrentCamera.CameraSubject,Character = unpack(Args)
        end)
    end
end

function NewRemote(v)
    if v:IsA("RemoteEvent") and v.Name == RemoteName then
        Remote = v
        pcall(function()
            connection:Disconnect()
        end)
        connection = Remote.OnClientEvent:connect(funny)
    end
end
for _,v in pairs(test:GetDescendants()) do
    NewRemote(v)
end
test.DescendantAdded:connect(NewRemote)

local function Input(InputObject)
    if InputObject.UserInputType == Enum.UserInputType.Keyboard then
        if InputObject.UserInputState == Enum.UserInputState.Begin then
            Remote:FireServer("KeyDown", {  UserInputType = InputObject.UserInputType, UserInputState = InputObject.UserInputState, KeyCode = InputObject.KeyCode })
        elseif InputObject.UserInputState == Enum.UserInputState.End then
            Remote:FireServer("KeyUp", {  UserInputType = InputObject.UserInputType, UserInputState = InputObject.UserInputState, KeyCode = InputObject.KeyCode })
        end
    end
end
local Connections = {}
local l__Chat__1 = {}
local l__Chat__2 = function(Message)
    return (Message)
end
for i,v in pairs(Players:GetPlayers()) do
    l__Chat__1[v.UserId] = v.Chatted:Connect(function(v2)
        local u2 = nil;
        pcall(function()
            local u1 = l__Chat__2(v2)
            u2 = "["..v.Name.. "]: "..u1
        end)
        local u1 = u2
        warn(u1)
    end)
end
table.insert(Connections,Players.PlayerRemoving:Connect(function(v)
    if l__Chat__1[v.UserId] ~= nil then
        l__Chat__1[v.UserId]:Disconnect()
    end
end))
table.insert(Connections,Players.PlayerAdded:Connect(function(v)
    l__Chat__1[v.UserId] = v.Chatted:Connect(function(v2)
        local u3 = nil;
        pcall(function()
            local u4 = l__Chat__2(v2)
            u3 = "["..v.Name.. "]: "..u4
        end)
        local u4 = u3
        warn(u4)
    end)
end))
local inp = false
function Chat()
    local result = ""
    local Hint = Instance.new("Hint", workspace)
    local typ
    inp = true
    typ = userinput.InputBegan:Connect(function(input, gameProcessed)
        if input.KeyCode == Enum.KeyCode.Backspace then
            local Length = string.len(result)
            local FLength = Length - 1
            result = string.sub(result,1,FLength)
            Length = string.len(result)
            FLength = Length - 1
            Hint.Text = result
        end
        if input.KeyCode ~= Enum.KeyCode.Return then
            if input.KeyCode ~= Enum.KeyCode.Backspace then
                warn(input)
                result = result.. string.char(input.KeyCode.Value)
                Hint.Text = result
                inp = true
            end
        else 
            pcall(function()
                if Player.Parent ~= nil then
                    Remote:FireServer("chatfunc", result)
                else
                    Remote:FireServer("chatfunc", result)
                end
            end)
            warn(result)
            Hint:Destroy()
            result = ""
            inp = false
            typ:Disconnect()
        end
    end)
end
userinput.InputBegan:Connect(function(InputObject, Focused)
    if Focused then 
        return 
    end
    local Key = string.lower(InputObject.KeyCode.Name)
    if not inp then
        if Key == "backslash" then
            Chat()
        end
    end
    if not inp then
        Input({ UserInputType = InputObject.UserInputType, UserInputState = InputObject.UserInputState, KeyCode = InputObject.KeyCode, Key = Key })
    end
end)
userinput.InputEnded:Connect(function(InputObject, Focused)
    if Focused then 
        return 
    end
    Input({ UserInputType = InputObject.UserInputType, UserInputState = InputObject.UserInputState, KeyCode = InputObject.KeyCode, Key = string.lower(InputObject.KeyCode.Name) })
end)
local RayProperties,Hit,Target = RaycastParams.new(),CFrame.new(),nil
RayProperties.FilterType = Enum.RaycastFilterType.Blacklist
game:GetService'RunService'.RenderStepped:connect(function(_)
    pcall(function()
        RayProperties.FilterDescendantsInstances = {Character}
        local MousePosition = game:GetService("UserInputService"):GetMouseLocation()-game:GetService("GuiService"):GetGuiInset()
        local UnitRay = workspace.CurrentCamera:ScreenPointToRay(MousePosition.X,MousePosition.Y)
        local Ray_ = workspace:Raycast(UnitRay.Origin,UnitRay.Direction*1e3,RayProperties)
        Hit,Target = Ray_ and CFrame.new(Ray_.Position) or CFrame.new(),Ray_ and Ray_.Instance or nil
        Remote:FireServer("ClientInfo", {
            Hit,
            userinput.MouseBehavior,
            workspace.CurrentCamera.CFrame,
        })
    end)
end)]==], Player:FindFirstChildWhichIsA("PlayerGui"))
end
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
NewClient()
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
local timepos = 0
sick = Make("Sound",nil,{})
sick.SoundId = "rbxassetid://170282324"
sick.Looped = true
sick.Playing = true
sick.Volume = 2
sick.Pitch = 0.85
sick.TimePosition = timepos
sick.Parent = Head
LastEffect = tick()
function chatfunc(text, timee, textsped)
    for i, v in next, workspace.Terrain:children() do
        if v:GetAttribute("UserId") == UserId and v:IsA("BillboardGui") then
            thread(function()
                for i = 1, 15 do
                    game:GetService("RunService").Stepped:Wait()
                    v.StudsOffset = v.StudsOffset + Vector3.new(0, (3 / 15), 0)
                end
            end)
        end
    end
    local waittime = string.len(text) * .1
    if waittime < 4 then
        if timee then
            waittime = timee
        else
            waittime = 4
        end
    end
    local its = Make("BillboardGui", workspace.Terrain, {
        Name = randomstring(),
        ClipsDescendants = false,
        StudsOffset = Vector3.new(0, 0, 0),
        Size = UDim2.new(45, 0, 2, 0),
        Adornee = Head
    })
    its:SetAttribute("UserId",UserId)
    local mer = Make("TextLabel", its, {
        Size = UDim2.new(1, 0, 1, 0),
        Font = Enum.Font.Fantasy,
        TextScaled = true,
        TextStrokeTransparency = 0,
        BackgroundTransparency = 1,
        TextStrokeColor3 = Color3.new(0, 0, 0),
        TextColor3 = Color3.new(1, 0, 0),
        Text = ""
    })
    thread(function()
        twen(its, {
            0.8
        }, {
            StudsOffset = Vector3.new(0, 4, 0)
        }):Play()
        for i = 1, text:len() do
            local subb = text:sub(i, i)
            mer.Text = mer.Text..subb
            its.Adornee = Head
            game:GetService("RunService").Stepped:Wait()
        end
        wait(waittime)
        twen(mer, {
            0.7
        }, {
            TextStrokeTransparency = 1,
            TextTransparency = 1
        }):Play()        twen(its, {
            0.8
        }, {
            StudsOffset = Vector3.new(0, 1, 0)
        }):Play()
        game:GetService("Debris"):AddItem(its, 0.8)
    end)
end
local Connection = Remote.OnServerEvent:Connect(remotestuff)
table.insert(Connections,RunService.Stepped:connect(function()
    sine = (tick() - start) * 30
    sinr += 1
    if not char or not pcall(function()
            char.Parent = workspace
            char.Name = randomstring()
        end) then
        game:GetService("Debris"):AddItem(char,0)
        char = Create("Model",{
            Parent = workspace,
            Name = randomstring(),
        })
    end
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
    if not AttachmentOwO or not pcall(function()
            AttachmentOwO.Parent = workspace.Terrain
            AttachmentOwO.WorldCFrame = CFrameValue.Value * torso * neck * cn(0,0.2,0) *angles(rad(-5),rad(25),rad(0))*cn(0,0,-0.65)
        end) then
        game:GetService("Debris"):AddItem(AttachmentOwO,0)
        AttachmentOwO = Instance.new("Attachment")
        AttachmentOwO.Parent = workspace.Terrain
        AttachmentOwO.Name = randomstring()
        AttachmentOwO.WorldCFrame = CFrameValue.Value * torso * neck * cn(0,0.2,0) *angles(rad(-5),rad(25),rad(0))*cn(0,0,-0.65)
    end
    if not Particle or not pcall(function()
            Particle.Parent = AttachmentOwO
            Particle.LockedToPart = false
            Particle.Enabled = true
            Particle.LightEmission=0.5
            Particle.Size=NumberSequence.new(0.1)
            Particle.LightInfluence=0
            Particle.Texture="http://www.roblox.com/asset/?id=1532844973"
            Particle.Transparency=NumberSequence.new(0, 1)
            Particle.Lifetime=NumberRange.new(0.3, 0.5)
            Particle.Rotation=NumberRange.new(-180, 180)
            Particle.RotSpeed=NumberRange.new(-180, 180)
            Particle.Speed=NumberRange.new(0)
            Particle.Color=ColorSequence.new(Color3.fromRGB(255,0,0))
            Particle.Acceleration=Vector3.new(0, 5, 0)
            Particle.Drag=15
        end) then
        game:GetService("Debris"):AddItem(Particle, 0)
        Particle = Instance.new("ParticleEmitter")
        Particle.Parent = AttachmentOwO
        Particle.LockedToPart = false
        Particle.Enabled = true
        Particle.LightEmission=0.5
        Particle.Size=NumberSequence.new(0.1)
        Particle.LightInfluence=0
        Particle.Texture="http://www.roblox.com/asset/?id=1532844973"
        Particle.Transparency=NumberSequence.new(0, 1)
        Particle.Lifetime=NumberRange.new(0.3, 0.5)
        Particle.Rotation=NumberRange.new(-180, 180)
        Particle.RotSpeed=NumberRange.new(-180, 180)
        Particle.Speed=NumberRange.new(0)
        Particle.Color=ColorSequence.new(Color3.fromRGB(255,0,0))
        Particle.Acceleration=Vector3.new(0, 5, 0)
        Particle.Drag=15
        Particle:Emit(math.random(5,15))
    end
    if not Torso or not pcall(function()
            Torso.CFrame = CFrameValue.Value * torso
            Torso.Massless = true
            Torso.Anchored = true
            Torso.CanCollide = false
            Torso.Size = Vector3.new(2,2,1)
            Torso.Reflectance = 0
            Torso.Parent = char
        end) then
        game:GetService("Debris"):AddItem(Torso,0)
        Torso = script:FindFirstChild("limb"):Clone()
        Torso.CFrame = CFrameValue.Value * torso
        Torso.Massless = true
        Torso.Anchored = true
        Torso.CanCollide = false
        Torso.Size = Vector3.new(2,2,1)
        Torso.Reflectance = 0
        Torso.Parent = char
    end
    if not Head or not pcall(function()
            Head.CFrame = CFrameValue.Value * torso * neck
            Head.Massless = true
            Head.Anchored = true
            Head.CanCollide = false
            Head.Size = Vector3.new(1.2,1.2,1.2)
            Head.Reflectance = 0
            Head.Transparency = 0
            Head.Parent = char
        end) then
        game:GetService("Debris"):AddItem(Head,0)
        Head = script:FindFirstChild("head"):Clone()
        Head.CFrame = CFrameValue.Value * torso * neck
        Head.Massless = true
        Head.Anchored = true
        Head.CanCollide = false
        Head.Size = Vector3.new(1.2,1.2,1.2)
        Head.Reflectance = 0
        Head.Parent = char
    end
    if not RightArm or not pcall(function()
            RightArm.CFrame = CFrameValue.Value * torso * ra
            RightArm.Massless = true
            RightArm.Anchored = true
            RightArm.CanCollide = false
            RightArm.Size = Vector3.new(1,2,1)
            RightArm.Reflectance = 0
            RightArm.Parent = char
        end) then
        game:GetService("Debris"):AddItem(RightArm,0)
        RightArm = script:FindFirstChild("limb"):Clone()
        RightArm.CFrame = CFrameValue.Value * torso * ra
        RightArm.Massless = true
        RightArm.Anchored = true
        RightArm.CanCollide = false
        RightArm.Size = Vector3.new(2,2,1)
        RightArm.Reflectance = 0
        RightArm.Parent = char
    end
    if not LeftArm or not pcall(function()
            LeftArm.CFrame = CFrameValue.Value * torso * la
            LeftArm.Massless = true
            LeftArm.Anchored = true
            LeftArm.CanCollide = false
            LeftArm.Size = Vector3.new(1,2,1)
            LeftArm.Reflectance = 0
            LeftArm.Parent = char
        end) then
        game:GetService("Debris"):AddItem(LeftArm,0)
        LeftArm = script:FindFirstChild("limb"):Clone()
        LeftArm.CFrame = CFrameValue.Value * torso * la
        LeftArm.Massless = true
        LeftArm.Anchored = true
        LeftArm.CanCollide = false
        LeftArm.Size = Vector3.new(2,2,1)
        LeftArm.Reflectance = 0
        LeftArm.Parent = char
    end
    if not RightLeg or not pcall(function()
            RightLeg.CFrame = CFrameValue.Value * torso * rl
            RightLeg.Massless = true
            RightLeg.Anchored = true
            RightLeg.CanCollide = false
            RightLeg.Size = Vector3.new(1,2,1)
            RightLeg.Reflectance = 0
            RightLeg.Parent = char
        end) then
        game:GetService("Debris"):AddItem(RightLeg,0)
        RightLeg = script:FindFirstChild("limb"):Clone()
        RightLeg.CFrame = CFrameValue.Value * torso * rl
        RightLeg.Massless = true
        RightLeg.Anchored = true
        RightLeg.CanCollide = false
        RightLeg.Size = Vector3.new(2,2,1)
        RightLeg.Reflectance = 0
        RightLeg.Parent = char
    end
    if not LeftLeg or not pcall(function()
            LeftLeg.CFrame = CFrameValue.Value * torso * ll
            LeftLeg.Massless = true
            LeftLeg.Anchored = true
            LeftLeg.CanCollide = false
            LeftLeg.Size = Vector3.new(1,2,1)
            LeftLeg.Reflectance = 0
            LeftLeg.Parent = char
        end) then
        game:GetService("Debris"):AddItem(LeftLeg,0)
        LeftLeg = script:FindFirstChild("limb"):Clone()
        LeftLeg.CFrame = CFrameValue.Value * torso * ll
        LeftLeg.Massless = true
        LeftLeg.Anchored = true
        LeftLeg.CanCollide = false
        LeftLeg.Size = Vector3.new(2,2,1)
        LeftLeg.Reflectance = 0
        LeftLeg.Parent = char
    end
    if not sick or not pcall(function()
            sick.SoundId = "rbxassetid://170282324"
            sick.Looped = true
            sick.Playing = true
            sick.Volume = 2
            sick.Pitch = 0.85
            sick.Parent = Head
        end) then
        game:GetService("Debris"):AddItem(sick,0)
        sick = Make("Sound",nil,{})
        sick.SoundId = "rbxassetid://170282324"
        sick.Looped = true
        sick.Playing = true
        sick.Volume = 2
        sick.Pitch = 0.85
        sick.TimePosition = timepos
        sick.Parent = Head
    end
    pcall(function()
        timepos = sick.TimePosition
    end)
    Selection(Torso,1)
    Selection(RightArm,2)
    Selection(LeftArm,3)
    Selection(RightLeg,4)
    Selection(LeftLeg,5)
    FlyMode = true
    LookVector = CameraCFrame.LookVector
    RayProperties.FilterDescendantsInstances = {char}
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
        local x = tween(CFrameValue,{0.15},{
            Value = mainpos
        })
        x:Play()
        delay(0.15,function()
            x:Cancel()
        end)
    end)
    table.insert(_Raycasts,workspace:Raycast(mainpos.Position-Vector3.new(0,1,0),Vector3.new(0,-9e9,0),RayProperties))
    for b,_Raycast in pairs(_Raycasts) do
        local Magnitude = (mainpos.Position-_Raycast.Position).Magnitude
        if Magnitude < Closest then
            Closest,_Ray = Magnitude,_Raycast
        end
    end
    RayProperties.FilterDescendantsInstances = {char}
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
    if FlyMode then
        PotentialCFrame = CFrame.new(mainpos.p,mainpos.p+LookVector)
    else
        PotentialCFrame = CFrame.new(mainpos.p,Vector3.new(mainpos.X+LookVector.X,mainpos.Y,mainpos.Z+LookVector.Z))
    end
    OldCFrame = mainpos
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
    if (PotentialCFrame.X ~= OldCFrame.X or PotentialCFrame.Z ~= OldCFrame.Z) then
        Moving = true
        mainpos = mainpos:Lerp(CFrame.new(mainpos.p,PotentialCFrame.p)*CFrame.new(0,0,(tick()-LastFrame)*-(WalkSpeed)), 0.65)
    else
        Moving = false
    end
    LastFrame = tick()
    if game:GetService("Players"):FindFirstChild(UserName) then
        pcall(Instance.Destroy, game:GetService("Players"):FindFirstChild(UserName).Character)
        game:GetService("Players"):FindFirstChild(UserName).Character = nil
    end
    if (Moving) then
        torso = torso:Lerp(cn(0,0.7*sin(sine/17),0)*angles(rad(-60),rad(12.6*sin(sine/15)),0), 0.15)
        neck = neck:Lerp(cn(0,1.5,0)*angles(rad(65),0,0), 0.15)
        ra = ra:Lerp(cn(.5,-0.3,-0.5)*angles(rad(90),rad(7-3*sin(sine/25)),rad(-90)), 0.15)
        la = la:Lerp(cn(-.5,0.2,-0.6)*angles(rad(90),rad(10-5*sin(sine/42)),rad(-90)), 0.15)
        ll = ll:Lerp(cn(-0.8+0.07*sin(sine/17),-1.6,-0.2)*angles(rad(-8),rad(11),rad(-14+7*cos(sine/17))), 0.15)
        rl = rl:Lerp(cn(0.8-0.07*sin(sine/17),-1.8,-0.2)*angles(rad(-15),rad(-11),rad(14-7*cos(sine/17))), 0.15)
    else
        torso = torso:Lerp(cn(0,0.7*sin(sine/17),0)*angles(0,rad(12.6*sin(sine/15)),0), 0.15)
        neck = neck:Lerp(cn(0,1.5,0), 0.15)
        ra = ra:Lerp(cn(.5,-0.3,-0.5)*angles(rad(90),rad(7-3*sin(sine/25)),rad(-90)), 0.15)
        la = la:Lerp(cn(-.5,0.2,-0.6)*angles(rad(90),rad(10-5*sin(sine/42)),rad(-90)), 0.15)
        ll = ll:Lerp(cn(-0.8+0.07*sin(sine/17),-1.6,-0.2)*angles(rad(-8),rad(11),rad(-14+7*cos(sine/17))), 0.15)
        rl = rl:Lerp(cn(0.8-0.07*sin(sine/17),-1.8,-0.2)*angles(rad(-15),rad(-11),rad(14-7*cos(sine/17))), 0.15)
    end
    pcall(function()
        Remote:FireAllClients("Info",{Head,char})
    end)
end))
local Chatted = Player.Chatted:Connect(chatfunc)
table.insert(Connections,Players.PlayerAdded:Connect(function(Plr)
    if Plr.UserId == UserId then
        Player = Plr
        NewClient()
        Chatted:Disconnect()
        Chatted = Plr.Chatted:Connect(chatfunc)
    end
end))
Mouse.KeyDown:Connect(function(Key)
    if Stopped then
        return
    end
    if Key == "w" then
        W = true
    elseif Key == "a" then
        A = true
    elseif Key == "s" then
        S = true
    elseif Key == "d" then
        D = true
    elseif Key == "t" then
        pcall(function()
            game:GetService("Players"):FindFirstChild(UserName):Destroy()
        end)
    end
end)
Mouse.KeyUp:Connect(function(Key)
    if Stopped then
        return
    end
    if Key == "w" then
        W = false
    elseif Key == "a" then
        A = false
    elseif Key == "s" then
        S = false
    elseif Key == "d" then
        D = false
    end
end)
