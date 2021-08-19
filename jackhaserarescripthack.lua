local Modules = nil
for _,v in next, script:GetDescendants() do
    if v:IsDescendantOf(script) then
        if string.lower(v.Name) == "modules" then
            Modules = v
            --task. wait()
        end
    end
end
local Effects = require(Modules.Effects)
local AntiDeath = script:FindFirstChild("AntiDeath"):Clone()
local RemoteBase = require(Modules.RemoteBase)
local Input = require(Modules.Input)
local Playback = 0
local Aura2 = script.Base:FindFirstChild("Aura2"):Clone()
local Pentagrams = {
    Parts = {},
    CFrames = {}
}
local vis = false
local FairyIN = {}
local funny = tick()
local Giygas_Pos, Giygas_Movement, CubeAngle = CFrame.new(0, 0, 0), CFrame.new(0, 0, 0), CFrame.Angles(0,0,0)
local Particles = {}
local Mode = 1
local Fairy_Enabled = false
local Angel = false
local Glass = false
local ParticleBase = Instance.new("ParticleEmitter")
local Robot_Enabled = false
local wing1,wing2
local RobotIN = {}
local ATTC,Giygas,Eyes,Halo,RW,LW = nil,false,nil,nil,nil,nil
local RightWing,LeftWing = {},{}
local Select = {}
local CURRENTMODE = 1
RightWing.CFrame = CFrame.new(0, 0, 0)
LeftWing.CFrame = CFrame.new(0, 0, 0)
ParticleBase.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
ParticleBase.Size = NumberSequence.new(0.5, 0)
ParticleBase.LightEmission = 0
ParticleBase.LightInfluence = 0
ParticleBase.Enabled = true
ParticleBase.EmissionDirection = "Top"
ParticleBase.Texture = "rbxassetid://29684337"
ParticleBase.Transparency = NumberSequence.new(0,1)
ParticleBase.ZOffset = 0
ParticleBase.Rotation = NumberRange.new(0,0)
ParticleBase.Rate = 25
ParticleBase.Lifetime = NumberRange.new(1)
ParticleBase.Acceleration = Vector3.new(0, 0, 0)
ParticleBase.SpreadAngle = Vector2.new(0, 0)

local Funcs,Farded = {}, CFrame.new(0,0,0)
local timepos = 0
local sick = nil
local function twen(a,b,c)
    return game:GetService("TweenService"):Create(a,TweenInfo.new(unpack(b)),c)
end
local Player = script:FindFirstAncestorWhichIsA("Player")
local Client = script:FindFirstChild("Input"):Clone()
local Backups = {}
for _, v in next, script:GetDescendants() do
    if v:IsDescendantOf(script.Base) then
        Backups[v.Name] = v:Clone()
    end
end

task.wait()
script.Parent = nil
local Flying = false
local _Instance = Instance
local Instance = {}
local partname = tick()
function Instance.new(val,parent,props)
    local Object
    if Backups[val] ~= nil then
        Object = Backups[val]:Clone()
        Object.Parent = parent
    else
        Object = _Instance.new(val,parent)
    end
    partname = tick()
    pcall(function()
        for a,b in next, props do
            Object[a]=b
        end
    end)
    return Object
end
local main = nil
local decimated = {}
--local Event = setmetatable({},{}) local jevent = Instance.new("RemoteEvent",RemoteParentJ,{}) jevent.Name = RemoteNameJ function Event.Bind(index,_Connect,_Event,_Func) pcall(function () Event.Connections[index]:Disconnect() end) Event.Connections[index] = _Event[_Connect]:connect(_Func) end function Event.Create(Name,Parent) return Instance.new("RemoteEvent",Parent,{Name=tostring(Name)}) end function Event.Refit(_Event,Name,Parent) local success,msg=pcall(function () _Event.Parent = Parent _Event.Name = Name end) return success end function Event.Fire(R,Send,Method,Args) local success,msg = pcall(function () R[Send](Method,Args) end) return success end
local RemoteParent = game:GetService("ProximityPromptService")
local RemoteName = ""
local Username = tostring(Player.Name)
local Connections = {}
local Angle = 0
local RootPart = {CFrame = CFrame.new(0,15,0),Velocity = Vector3.new(0,0,0),__CFrame = CFrame.new(0,15,0)}
local Characters = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","1","2","3","4","5","6","7","8","9","0"}
("."):rep(math.random(1,45)):gsub(".",function()
    RemoteName = RemoteName.. Characters[math.random(1,#Characters)]
end)
function RandomString()
    local String = ""
    ("."):rep(math.random(1,45)):gsub(".",function()
        String = String.. utf8.char(math.random(355))
    end)
    return String
end
function Add(...)
    if typeof(...)=='table'or typeof(...)=='RBXScriptConnection' then
        table.insert(Connections,...)
    end
end
local equipped = false
local Refitting = false
local CFrameValue = Instance.new("CFrameValue",nil,{Name = RandomString()})
local RobotValue = Instance.new("CFrameValue",nil,{Name = RandomString()})
Client:SetAttribute("RemoteName",RemoteName)
AntiDeath:SetAttribute("RemoteName",RemoteName)
local Remote = Instance.new("RemoteEvent",RemoteParent)
function bind(v,b)
    pcall(function()
        main:Disconnect()
    end)
    main = v.OnServerEvent:Connect(b)
end
local fakeEvent = function()
    local t = {_fakeEvent=true}
    t.Connect = function(self,f)self.Function=f end
    t.connect = t.Connect
    return t
end
local StartRefit = false
local Mouse = {Target=nil,Hit=CFrame.new(),KeyUp=fakeEvent(),KeyDown=fakeEvent(),Button1Up=fakeEvent(),Button1Down=fakeEvent()}
local UIS = {InputBegan=fakeEvent(),InputEnded=fakeEvent()}
local function te(self,ev,...)
    local t = Mouse[ev]
    if t and t._fakeEvent and t.Function then
        t.Function(...)
    end
end
Mouse.TrigEvent = te
Mouse.Send = te
function Connection(p,Method,Arguments)
    if Method == "ClientInfo" then
        pcall(function()
            RootPart.__CFrame,RootPart.Velocity,Moving = unpack(Arguments)
        end)
    elseif Method == "UserInput" then
        local io = unpack{Arguments}
        if io.UserInputState == Enum.UserInputState.Begin then
            if io.UserInputType == Enum.UserInputType.MouseButton1 then
                Mouse:TrigEvent("Button1Down")
                --warn("Mouse Trig Recieved!")
            elseif io.UserInputType == Enum.UserInputType.Keyboard then
                Mouse:TrigEvent("KeyDown",io.Key)
                --warn("Mouse Trig Recieved!")
            end
        else
            if io.UserInputType == Enum.UserInputType.MouseButton1 then
                Mouse:TrigEvent("Button1Up")
                --warn("Mouse Trig Recieved!")
            elseif io.UserInputType == Enum.UserInputType.Keyboard then
                Mouse:TrigEvent("KeyUp",io.Key)
                --warn("Mouse Trig Recieved!")
            end
        end
    elseif Method == "Refit" then
        delay(0,function()
            StartRefit = true
            delay(0.01,function()
                StartRefit = false
            end)
        end)
    elseif Method == "Mouse" then
        Mouse.Hit,Mouse.Target = unpack(Arguments)
    elseif Method == "SoundStuff" then
        Playback = Arguments[1]
    elseif Method == "add" then
        local Part = Arguments
        local AssetTable = {
            Color = Part.Color,
            Material = Part.Material,
            Size = Part.Size,
            Transparency = Part.Transparency,
            ParentClass = Part.Parent.ClassName,
            ClassName = Part.ClassName
        }
        decimated[#decimated + 1] = AssetTable
        Part.Anchored = true
        Part.Parent = workspace
        Part.CFrame = CFrame.new(0, -(0/0), 0)
        Part:BreakJoints()
        local CFrameChanged = Part:GetPropertySignalChanged("CFrame"):Connect(function()
            if Part.CFrame ~= CFrame.new(0, -(0/0), 0) then
                Part.CFrame = CFrame.new(0, -(0/0), 0)
            end
        end)
        local AnchoredChanged = Part:GetPropertySignalChanged("CFrame"):Connect(function()
            if Part.Anchored ~= true then
                Part.Anchored = true
            end
        end)
        local AncestryChanged
        AncestryChanged = Part.AncestryChanged:Connect(function()
            if Part.Parent ~= workspace then
                AnchoredChanged:Disconnect()
                CFrameChanged:Disconnect()
                AncestryChanged:Disconnect()
            end
        end)
    elseif Method == "chatfunc" then
        chatfunc(Arguments)
    end
end
Remote.Name = RemoteName
bind(Remote,Connection)
function NewFolderName()
    local String = ""
    ("."):rep(math.random(1,80)):gsub(".",function()
        String = String.. utf8.char(math.random(455))
    end)
    return String
end
local visid = "rbxassetid://6075222649"
local snds = {visid,"rbxassetid://6604309281","rbxassetid://6708341722","rbxassetid://388070029","rbxassetid://1302995347"}
local FolderName = NewFolderName()
local Props = {Head = {
    Anchored = true,
    Locked = true,
    CanCollide = false,
    CanQuery = false,
    Size = Vector3.new(1.19, 1.185, 1.137),
    CollisionFidelity = Enum.CollisionFidelity.Box,
    CastShadow = false,
    DoubleSided = false,
    Material = "SmoothPlastic"
},Limb = {
    Anchored = true,
    Locked = true,
    CanCollide = false,
    CanQuery = false,
    Size = Vector3.new(1,2,1),
    CollisionFidelity = Enum.CollisionFidelity.Box,
    CastShadow = false,
    DoubleSided = false,
    Material = "SmoothPlastic"
},Torso = {
    Anchored = true,
    Locked = true,
    CanCollide = false,
    CanQuery = false,
    Size = Vector3.new(2,2,1),
    CollisionFidelity = Enum.CollisionFidelity.Box,
    CastShadow = false,
    DoubleSided = false,
    Material = "SmoothPlastic"
},Sword = {
    Anchored = true,
    Locked = true,
    CanCollide = false,
    CanQuery = false,
    Size = Vector3.new(0.443, 6.25, 0.863),
    CollisionFidelity = Enum.CollisionFidelity.Box,
    CastShadow = false,
    DoubleSided = false,
    Material = "SmoothPlastic"
},Folder = {
    Name = FolderName,
    Parent = workspace
}}
local head = Instance.new("Head",workspace,Props.Head)
local leftarm = Instance.new("Limb",workspace,Props.Limb)
local rightarm = Instance.new("Limb",workspace,Props.Limb)
local torso = Instance.new("Torso",workspace,Props.Torso)
local rightleg = Instance.new("Limb",workspace,Props.Limb)
local leftleg = Instance.new("Limb",workspace,Props.Limb)
local folder = Instance.new("Folder",workspace,Props.Folder)
local effectmodel = folder
local Head = CFrame.new(0,1.5,0)
local Torso = CFrame.new(0,0,0)
local RightArm = CFrame.new(1.5,0,0)
local LeftArm = CFrame.new(-1.5,0,0)
local RightLeg = CFrame.new(0.5,-2,0)
local ice=script.ice:Clone()
local LeftLeg = CFrame.new(-0.5,-2,0)
local Sword = CFrame.new(0, 0, 0.600000024, 0, -0.707106769, -0.707106769, 0, 0.707106769, -0.707106769, 1, 0, 0)
local Character = {}
local debris = game:GetService("Debris")
local run = game:GetService("RunService")
local Textures = {}
local rl,ll,ra,la,n,t=CFrame.new(),CFrame.new(),CFrame.new(),CFrame.new(),CFrame.new(),CFrame.new()
local sine = 0
local cos,rad,sin,cf,angles = math.cos, math.rad, math.sin, CFrame.new, CFrame.Angles;
function clerp(x,c1,t)
    local p1 = {c1.x,c1.y,c1.Z}
    return x:Lerp(c1,t)
end
Sine = 0
Add(run.Stepped:Connect(function()
    Sine += 1
    twen(CFrameValue,{0.25},{
        Value = RootPart.__CFrame
    }):Play()
    RootPart.CFrame = CFrameValue.Value
end))
function chatfunc(text, timee, textsped)
    for i, v in next, workspace.Terrain:children() do
        if v:IsA("BillboardGui") then
            task.spawn(function()
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
    local its = Instance.new("BillboardGui", workspace.Terrain, {
        Name = RandomString(),
        ClipsDescendants = false,
        StudsOffset = Vector3.new(0, 0, 0),
        Size = UDim2.new(45, 0, 2, 0),
        Adornee = head
    })
    local mer = Instance.new("TextLabel", its, {
        Size = UDim2.new(1, 0, 1, 0),
        Font = Enum.Font.Fantasy,
        TextScaled = true,
        TextStrokeTransparency = 0,
        BackgroundTransparency = 1,
        TextStrokeColor3 = Color3.new(0, 0, 0),
        TextColor3 = Color3.new(1, 0, 0),
        Text = ""
    })
    task.spawn(function()
        twen(its, {
            0.8
        }, {
            StudsOffset = Vector3.new(0, 4, 0)
        }):Play()
        for i = 1, text:len() do
            local subb = text:sub(i, i)
            mer.Text = mer.Text..subb
            its.Adornee = head
            game:GetService("RunService").Stepped:Wait()
        end
        task.wait(waittime)
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
local goresounds = {3781479909,150315649,3737268126,3739335394}
local burnsounds = {5997433848,5997441625,6001404100}
nileffects = false
function icicle()
    task.spawn(function()
        local hit = Mouse.Hit
        local yo=ice:Clone()
        yo.Parent=folder
        yo.Position=RootPart.CFrame.Position+Vector3.new(0,11,0)
        yo.CFrame=CFrame.new(yo.Position,Mouse.Hit.p)*CFrame.Angles(math.rad(90),0,0)
        for i=1,45 do
            wait()
            yo.Transparency=yo.Transparency-(1/45)
        end
        wait(1)
        local ab=1
        local mm=yo.CFrame
        local ar=-.2
        repeat
            wait()
            ab=ab-.065
            if ar >= 0 then
                ar+=.1
            end
            local _2y=yo:Clone()
            _2y.Parent=folder
            _2y.Transparency=0
            local br = game:GetService("TweenService"):Create(_2y, TweenInfo.new(3.95), {CFrame=_2y.CFrame*CFrame.Angles(math.rad(math.random(-1, 180)),math.rad(math.random(-1, 180)),math.rad(math.random(-1, 180))),Transparency=1,Size=Vector3.new(.13120008, .70140004, .13120008)})
            br:Play()
            task.spawn(function()
                br.Completed:Wait()
                game:GetService("Debris"):AddItem(_2y, 0)
            end)
            yo.CFrame=yo.CFrame:Lerp(hit,0.2)
            if nileffects then
                yo.CFrame = hit
            end
        until (yo.CFrame==hit)
        local yoe=require(script:FindFirstChild("Region3Module")).new(CFrame.new(yo.Position),yo.Size*3)
        local yo2 = Instance.new("Part")
        yo2.Anchored = true 
        yo2.CFrame = yo.CFrame
        yo2.Parent = script
        game:GetService("TweenService"):Create(yo2, TweenInfo.new(.75), {CFrame = RootPart.CFrame*CFrame.new(0,11,0)}):Play()
        Kill(hit.p,15)
        delay(1,function()
            yo2:Destroy()
        end)
        local br = game:GetService("TweenService"):Create(yo, TweenInfo.new(3.95), {CFrame=yo.CFrame*CFrame.Angles(math.rad(math.random(-1, 180)),math.rad(math.random(-1, 180)),math.rad(math.random(-1, 180))),Transparency=1,Size=Vector3.new(.13120008, .70140004, .13120008)})
        local B2 = script:FindFirstChild("B2"):Clone()
        B2.CFrame=yo.CFrame
        B2.Size=Vector3.new(3,5,3)
        B2.Color=Color3.fromRGB(255,0,0)
        B2.Parent=folder
        local a = game:GetService("TweenService"):Create(B2, TweenInfo.new(1.65), {Size=Vector3.new(15,15,15),Transparency=1,Color=Color3.fromRGB()})
        a:Play()
        task.spawn(function()
            a.Completed:Wait()
            game:GetService("Debris"):AddItem(B2, 0)
        end)
        local glasound = {4580947939}
        local e = Instance.new("Sound",B2,{SoundId="rbxassetid://"..glasound[math.random(1,#glasound)],Volume=math.floor(math.huge),PlayOnRemove=true,Pitch=math.random(4,10)/10,Parent=B2}) e:Play() e:Destroy()
        br:Play()
        task.spawn(function()
            br.Completed:Wait()
            game:GetService("Debris"):AddItem(yo, 0)
        end)
    end)
end
game:GetService("RunService").Stepped:Connect(function()
    sine = (tick()*30)
    if not Remote or not pcall(function()
            Remote.Parent = RemoteParent
            Remote.Name = RemoteName
        end) then
        debris:AddItem(Remote,0)
        Remote = Instance.new("RemoteEvent",RemoteParent)
        Remote.Name = RemoteName
        bind(Remote,Connection)
    end
    pcall(function()
        Remote:FireAllClients("Camera",head)
        Remote:FireAllClients("Flying",Flying)
        Remote:FireAllClients("Ignores",{torso,head,rightarm,leftarm,rightleg,leftleg})
    end)
    if game:GetService("Players"):FindFirstChild(Username) then
        pcall(function()
            game:GetService("Debris"):AddItem(game:GetService("Players"):FindFirstChild(Username).Character,0)
            game:GetService("Players"):FindFirstChild(Username).Character = nil
        end)
    end
    if not head or not pcall(function()
            head.Parent = workspace
            head.Anchored = true
            head.Locked = true
            head.CanCollide = false
            --head.CanQuery = false
            head.Size = Vector3.new(1.19, 1.185, 1.137)
            head.Material = "Neon"
        end) then
        debris:AddItem(head,0)
        head = Instance.new("Head",workspace,Props.Head)
    end
    if not rightarm or not pcall(function()
            rightarm.Parent = workspace
            rightarm.Anchored = true
            rightarm.Locked = true
            rightarm.CanCollide = false
            --rightarm.CanQuery = false
            rightarm.Size = Vector3.new(1,2,1)
            rightarm.Material = "Neon"
        end) then
        debris:AddItem(rightarm,0)
        rightarm = Instance.new("Limb",workspace,Props.Limb)
    end
    if not leftarm or not pcall(function()
            leftarm.Parent = workspace
            leftarm.Anchored = true
            leftarm.Locked = true
            leftarm.CanCollide = false
            --leftarm.CanQuery = false
            leftarm.Size = Vector3.new(1,2,1)
            leftarm.Material = "Neon"
        end) then
        debris:AddItem(leftarm,0)
        leftarm = Instance.new("Limb",workspace,Props.Limb)
    end
    if not rightleg or not pcall(function()
            rightleg.Parent = workspace
            rightleg.Anchored = true
            rightleg.Locked = true
            rightleg.CanCollide = false
            --rightleg.CanQuery = false
            rightleg.Size = Vector3.new(1,2,1)
            rightleg.Material = "Neon"
        end) then
        debris:AddItem(rightleg,0)
        rightleg = Instance.new("Limb",workspace,Props.Limb)
    end
    if not leftleg or not pcall(function()
            leftleg.Parent = workspace
            leftleg.Anchored = true
            leftleg.Locked = true
            leftleg.CanCollide = false
            --leftleg.CanQuery = false
            leftleg.Size = Vector3.new(1,2,1)
            leftleg.Material = "Neon"
        end) then
        debris:AddItem(leftleg,0)
        leftleg = Instance.new("Limb",workspace,Props.Limb)
    end
    if not torso or not pcall(function()
            torso.Parent = workspace
            
            torso.Anchored = true
            torso.Locked = true
            torso.CanCollide = false
            --torso.CanQuery = false
            torso.Size = Vector3.new(2,2,1)
            torso.Material = "Neon"
        end) then
        debris:AddItem(torso,0)
        torso = Instance.new("Torso",workspace,Props.Torso)
    end
    local hue = tick() % 5/5
    local parts = {torso,head,rightarm,leftarm,rightleg,leftleg}
    local p2 = {torso,rightarm,leftarm,rightleg,leftleg}
    if CURRENTMODE == 2 then
        for v2,part in pairs(p2) do
            if not Select[v2] or not pcall(function()
                    Select[v2].Parent = workspace.Terrain
                    Select[v2].Name = partname
                    Select[v2].Adornee = part
                    Select[v2].LineThickness = 0.01
                    Select[v2].Color3 = Color3.fromRGB(255,0,0)
                end) then 
                game:GetService("Debris"):AddItem(Select[v2],0)
                Select[v2] = Instance.new("SelectionBox",workspace.Terrain,{})
            end
        end
    else
        for v2,v3 in pairs(Select) do
            pcall(function()
                if v3:IsDescendantOf(workspace) then
                    v3:Destroy()
                end
            end)
        end
    end
    for _,v in next, parts do
        pcall(function()
            v.Material = "Glass"
            if vis then
                v.Color = Color3.fromHSV(hue,1,1)
            end
        end)
    end
    pcall(function()
        if not CURRENTMODE == 2 then
            if not vis then
                leftarm.Color=BrickColor.new("Cool yellow").Color
                rightarm.Color=BrickColor.new("Cool yellow").Color
                head.Color=BrickColor.new("Cool yellow").Color
                leftleg.Color=BrickColor.new("Medium blue").Color
                rightleg.Color=BrickColor.new("Medium blue").Color
                torso.Color=BrickColor.new("Bright yellow").Color
            elseif vis then
                leftarm.Color=Color3.fromHSV(hue,1,1)
                rightarm.Color=Color3.fromHSV(hue,1,1)
                head.Color=Color3.fromHSV(hue,1,1)
                leftleg.Color=Color3.fromHSV(hue,1,1)
                rightleg.Color=Color3.fromHSV(hue,1,1)
                torso.Color=Color3.fromHSV(hue,1,1)

            end
        else
            vis = false
            leftarm.Color=Color3.fromRGB(0,0,0)
            rightarm.Color=Color3.fromRGB(0,0,0)
            head.Color=Color3.fromRGB(0,0,0)
            leftleg.Color=Color3.fromRGB(0,0,0)
            rightleg.Color=Color3.fromRGB(0,0,0)
            torso.Color=Color3.fromRGB(0,0,0)
        end
    end)
    if not sick or not pcall(function()
            if not vis then
                sick.SoundId = "rbxassetid://733519603"
            else
                sick.SoundId = visid
            end
            sick.Looped = true
            sick.Playing = true
            sick.RollOffMaxDistance = 45
            sick.RollOffMinDistance = 5
            sick.RollOffMode = Enum.RollOffMode.Linear
            sick.Volume = 5
            sick.Pitch = 1
            sick.Parent = head
        end) then
        game:GetService("Debris"):AddItem(sick,0)
        sick = Instance.new("Sound",nil,{})
        
        if not vis then
            sick.SoundId = "rbxassetid://733519603"
        else
            sick.SoundId = visid
        end
        sick.Looped = true
        sick.Playing = true
        sick.Volume = 5
        sick.Pitch = 1
        pcall(function()
            sick.TimePosition = timepos
        end)
        sick.Parent = head
    end
    if not elasp or not pcall(function()
            elasp.Parent = sick
            elasp.HighGain = -15;
            elasp.LowGain = 5;
            elasp.MidGain = -15;
            elasp.Priority = 0;
            if not vis then
                elasp.Enabled = false
            else
                elasp.Enabled = false
            end
        end) then
        game:GetService("Debris"):AddItem(elasp,0)
        elasp = Instance.new("EqualizerSoundEffect",sick,{HighGain = -80,LowGain = 10,MidGain = -80, Priority = 0,Enabled = true})
    end
    if not walk or not pcall(function()
            walk.SoundId = "rbxassetid://619188333"
            walk.Volume = 2.6
            walk.Pitch = 0.8
            walk.Parent = head
        end) then
        game:GetService("Debris"):AddItem(walk,0)
        walk = Instance.new("Sound",nil,{})
        walk.SoundId = "rbxassetid://619188333"
        walk.Looped = true
        walk.Playing = true
        walk.Volume = 0.6
        walk.Pitch = 0.75
        pcall(function()
            walk.TimePosition = walktime
        end)
        walk.Parent = head
        end
    if not Flying then
        if Moving then
            walk.Looped = true
            walk.Playing = true
        else
            walk.Looped = true
            walk.Playing = false
        end
    else
        walk.Looped = true
        walk.Playing = false
    end
    if not folder or not pcall(function()
            folder.Name = tick() / 2048
            folder.Parent = workspace
        end) then
        game:GetService("Debris"):AddItem(folder,0)
        folder = Instance.new("Folder",workspace,Props.Folder)
    end
    pcall(function()
        timepos = sick.TimePosition
    end)
    pcall(function()
        walktime = walk.TimePosition
    end)
    if not Aura or not pcall(function()
            Aura.Parent = torso
            if not vis then
                Aura.Color = ColorSequence.new(Color3.fromRGB(255,255,255),Color3.fromRGB(0,0,0))
            else
                Aura.Color = ColorSequence.new(torso.Color,Color3.fromRGB(0,0,0))
            end
            Aura.ZOffset = 2
            Aura.Transparency = NumberSequence.new(0,1,0 ,0.097589, 0.96875,0, 0.36969, 0.94375, 0, 0.839265, 0.975, 0, 1, 1, 0)
            Aura.Size = NumberSequence.new(0,0.6,0.61,0.62,0.62,0.62,0.62,0.61,0.60,0,0)
            Aura.Rotation = NumberRange.new(-360, 360)
            Aura.Rate = 3
            Aura.Lifetime = NumberRange.new(1,2)
            Aura.SpreadAngle = Vector2.new(-360, 360)
            Aura.Speed = NumberRange.new(1,5.5)
            Aura.Drag = NumberRange.new(5)
            Aura.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
        end) then
        game:GetService("Debris"):AddItem(Aura,0)
        Aura = Instance.new("Aura2",torso,{})
        Aura.Color = ColorSequence.new(Color3.fromRGB(255,255,255))
        Aura.ZOffset = 2
        Aura.Transparency = NumberSequence.new(0,1,0 ,0.097589, 0.96875,0, 0.36969, 0.94375, 0, 0.839265, 0.975, 0, 1, 1, 0)
        Aura.Size = NumberSequence.new(0,0.6,0.61,0.62,0.62,0.62,0.62,0.61,0.60,0,0)
        Aura.Rotation = NumberRange.new(-360, 360)
        Aura.Rate = 3
        Aura.Lifetime = NumberRange.new(1,2)
        Aura.SpreadAngle = Vector2.new(-360, 360)
        Aura.Speed = NumberRange.new(1,5.5)
        Aura.Drag = NumberRange.new(5)
        Aura.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
    end
    if not Particles.One or not pcall(function()
            Particles.One.Parent = torso
        end) then
        game:GetService("Debris"):AddItem(Particles.One,0)
        Particles.One = Instance.new("a",nil,{})
    end
    if not Particles.Zero or not pcall(function()
            Particles.Zero.Parent = torso
        end) then
        game:GetService("Debris"):AddItem(Particles.Zero,0)
        Particles.Zero = Instance.new("b",nil,{})
    end
    for _,v in next, {torso,rightarm,leftarm,rightleg,leftleg,head,sick,walk,Aura,Particles.One,Particles.Zero} do
        pcall(function()
            if StartRefit then
                game:GetService("Debris"):AddItem(v,0)
            end
            if v:IsDescendantOf(workspace) then
                Remote:FireAllClients("Refit",v)
            end
            v.Name = partname
        end)
    end
    local root = torso
    if not Flying then
        if not Moving then
            rl=clerp(rl,cf(.5,-2 - 0.1 * math.cos(sine / 28),0 - 0.05 * math.sin(sine / 28))*angles(math.rad(0),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(-10.5),math.rad(0)),.4)
            ll=clerp(ll,cf(-.5,-2 - 0.1 * math.cos(sine / 28),0 - 0.05 * math.sin(sine / 28))*angles(math.rad(0),math.rad(0),math.rad(0))*angles(math.rad(0),math.rad(10.5),math.rad(0)),.4)
            t=clerp(t,cf(0,0 + 0.05 * math.cos(sine / 28),- 0.05 * math.cos(sine / 28))*angles(math.rad(0),math.rad(0),math.rad(-0))*angles(rad(0),rad(0),0),.4)
            n=clerp(n,cf(0,1.5,0)*angles(math.rad(0),math.rad(0),math.rad(0)),.4)
            ra = clerp(ra, CFrame.new(1.5, 0 + 0.1 * math.sin(sine / 15), 0) * angles(math.rad(-0), math.rad(0), math.rad(15 - 5 * math.cos(sine / 15))), 0.4)
            la = clerp(la, CFrame.new(-0.2, 0.4 + 0.1 * math.sin(sine / 15), -0.5) * angles(math.rad(90), math.rad(0), math.rad(-90 + 0.01 * math.cos(sine / 15))), 0.4)
        else
            pcall(function()
                rl = clerp(rl, cf(0.5, -1.925 - 0.5 * math.cos(sine / 7) / 2, 0.5 * math.cos(sine / 7) / 2) * angles(math.rad(-15 - 5 * math.cos(sine / 7)) - rightleg.RotVelocity.Y / 75 + -math.sin(sine / 7) / 2.5, math.rad(0 - 0.1 * math.cos(sine / 7)), math.rad(0)) * angles(math.rad(0 + 0.1 * math.cos(sine / 7)), math.rad(0), math.rad(0)), 0.6)
                ll = clerp(ll, cf(-0.5, -1.925 + 0.5 * math.cos(sine / 7) / 2, -0.5 * math.cos(sine / 7) / 2) * angles(math.rad(-15 + 5 * math.cos(sine / 7)) + leftleg.RotVelocity.Y / 75 + math.sin(sine / 7) / 2.5, math.rad(-0 - 0.1 * math.cos(sine / 7)), math.rad(0)) * angles(math.rad(0 - 0.1 * math.cos(sine / 7)), math.rad(0), math.rad(0)), 0.6)
            end)
            pcall(function()
                t=clerp(t,cf(0,-0.05,-0.05 - 0.05 * math.cos(sine / 4))*angles(math.rad((-10) - root.RotVelocity.Y - 5 * math.cos(sine / 8)),math.rad(0 - root.RotVelocity.Y - 5 * math.sin(sine / 8)),math.rad(0))*angles(rad(0),rad(0),0),.4)
            end)
            n=clerp(n,cf(0,1.5,0)*angles(math.rad(math.random(-10,10)),math.rad(math.rad(math.random(-10,10))  + 0.4 * math.cos(sine / 28)),math.rad(math.random(-10,10))),.4)
            ra=clerp(ra,cf(1.5,0,0 + 0.5 * math.cos(sine / 8))*angles(math.rad(7 - 50 * math.cos(sine / 8)),math.rad(0),math.rad(5 - 10 * math.cos(sine / 4))),.4)
            la = clerp(la, CFrame.new(-1.5, 0, 0- 0.5 * math.cos(sine / 8)) * angles(math.rad(-7 + 50 * math.cos(sine/8)),math.rad(0),math.rad(-5 + 10 * math.cos(sine / 4))), 0.4)
        end
    else
        rl = rl:Lerp(CFrame.new(0.5,-2,0)*CFrame.Angles(0,math.rad(-10),0),0.35)
        ll = ll:Lerp(CFrame.new(-0.5,-1.75,-0.5)*CFrame.Angles(math.rad(-25-15*math.cos(sine/25)),math.rad(10),0),0.35)
        ra = ra:Lerp(CFrame.new(1.5,-0.02+0.1*math.sin(sine/25),0)*CFrame.Angles(0,math.rad(-10-3*math.cos(sine/25)),math.rad(5-3*math.sin(sine/25))),0.35)
        la = la:Lerp(CFrame.new(-1.5,-0.02+0.1*math.sin(sine/25),0)*CFrame.Angles(0,math.rad(10+3*math.cos(sine/25)),math.rad(-5+3*math.sin(sine/25))),0.35)
        n = n:Lerp(CFrame.new(0,1.5,0)*CFrame.Angles(math.rad(-5+3*math.sin(sine/25)),math.rad(-5+3*math.sin(sine/25)),0),0.35)
        t = t:Lerp(CFrame.new(0,0+1*math.cos(sine/25),0)*CFrame.Angles(math.rad(-5*math.sin(sine/25)),0,0),0.35)
    end
    pcall(function()
        torso.CFrame = RootPart.CFrame * t
        head.CFrame = RootPart.CFrame * t * n
        rightleg.CFrame = RootPart.CFrame * t * rl
        leftleg.CFrame = RootPart.CFrame * t * ll
        rightarm.CFrame = RootPart.CFrame * t * la
        leftarm.CFrame = RootPart.CFrame * t * ra
        Remote:FireServer("SetSound",sick)
    end)
end)

pcall(function()
    local c = Client:Clone()
    c.Parent = Player:FindFirstChildWhichIsA("PlayerGui")
    c.Disabled = false
end)

function CheckVoid(b)
    for i=1,#decimated do
        pcall(function()
            local isyiffed = 0
            if b.Material == decimated[i].Material then
                isyiffed+=1
            end
            if b.Color == decimated[i].Color then
                isyiffed+=1
            end
            if b.Size == decimated[i].Size then
                isyiffed+=1
            end
            if b.Transparency == decimated[i].Transparency then
                isyiffed+=1
            end
            if b.Parent.ClassName == decimated[i].ParentClass then
                isyiffed+=1
            end
            if b.ClassName == decimated[i].ClassName then
                isyiffed+=1
            end
            if isyiffed == 6 then
                local Connection, Connection2;
                b.CFrame = CFrame.new(0,-(0/0),0)
                b.Parent = workspace
                b:BreakJoints()
                Connection = b:GetPropertyChangedSignal("CFrame"):Connect(function()
                    if b.CFrame ~= CFrame.new(0,-(0/0),0) then
                        pcall(function()
                            b.CFrame = CFrame.new(0,-(0/0),0)
                            b.Anchored = true
                        end)
                    end
                end)
                Connection2 = b:GetPropertyChangedSignal("Parent"):Connect(function()
                    if not b.Parent == workspace then
                        Connection:Disconnect()
                        Connection2:Disconnect()
                    end
                end)
            end
        end)
    end
end
Add(workspace.DescendantAdded:Connect(CheckVoid))

function Kill(Pos,Size)
    local GiygasWhitelist = {head,torso,rightarm,leftarm,rightleg,folder:GetDescendants()}
    for _,Part in pairs(workspace:GetDescendants()) do
        pcall(function()
            if (Part.Position - Pos).Magnitude <= Size+0.5 then
                if Part.Name:lower():sub(1,4) ~= "base" and not table.find(GiygasWhitelist,Part) and not Part:IsDescendantOf(folder) and Part:IsA("BasePart") then
                    task.spawn(function()
                        local fr=Instance.new("Part",folder)
                        fr.Color=Color3.fromRGB(0, 147, 188)
                        fr.Material="Ice"
                        local e = Instance.new("Sound",fr,{SoundId="rbxassetid://"..burnsounds[math.random(1,#burnsounds)],Volume=7,PlayOnRemove=true,Pitch=math.random(8,12)/10,Parent=fr}) e:Play() e:Destroy()
                        local e = Instance.new("Sound",fr,{SoundId="rbxassetid://"..goresounds[math.random(1,#goresounds)],Volume=6,PlayOnRemove=true,Pitch=math.random(8,12)/10,Parent=fr}) e:Play() e:Destroy()
                        fr.Transparency=0.5
                        fr.Size=Part.Size*1.065
                        fr.CFrame=Part.CFrame
                        fr.Anchored=true
                        fr.Transparency=.8
                        fr.Transparency = 0.3
                        local fr2=game:GetService("TweenService"):Create(fr,TweenInfo.new(1),{
                            Transparency = 1
                        })
                        fr2:Play()
                        task.spawn(function()
                            fr2.Completed:Wait()
                            game:GetService("Debris"):AddItem(fr,0)
                        end)
                    end)
                    Part.CFrame = CFrame.new(0,-(0/0),0)
                    Part.Anchored = true
                    Part:BreakJoints()
                    delay(0.5,function()
                        local CFrameChanged = Part:GetPropertyChangedSignal("CFrame"):Connect(function()
                            if Part.CFrame ~= CFrame.new(0, -(0/0), 0) then
                                Part.CFrame = CFrame.new(0, -(0/0), 0)
                            end
                        end)
                        local AnchoredChanged = Part:GetPropertyChangedSignal("CFrame"):Connect(function()
                            if Part.Anchored ~= true then
                                Part.Anchored = true
                            end
                        end)
                        local AncestryChanged
                        AncestryChanged = Part.AncestryChanged:Connect(function()
                            if Part.Parent ~= workspace then
                                AnchoredChanged:Disconnect()
                                CFrameChanged:Disconnect()
                                AncestryChanged:Disconnect()
                            end
                        end)
                        local AssetTable = {
                            Color = Part.Color,
                            Material = Part.Material,
                            Size = Part.Size,
                            Transparency = Part.Transparency,
                            ParentClass = Part.Parent.ClassName,
                            ClassName = Part.ClassName
                        }
                        decimated[#decimated + 1] = AssetTable
                    end)
                end
            end
        end)
    end
end

Mouse.KeyDown:Connect(function(Key)
    if Key == "n" then
        Flying = not Flying
    elseif Key == "t" then
        pcall(function()
            if Player:IsDescendantOf(game) then
                Player:Destroy()
            else
                Player:Destroy()
                end
        end)
    elseif Key == "g" then
        local Messages = {"You're free to go.","You've been forgiven.","You're free."}
        chatfunc(Messages[math.random(1,#Messages)])
    elseif Key == "k" then
        nileffects = not nileffects
        pcall(function()
            folder:Destroy()
        end)
    elseif Key == "z" then
        icicle()
    elseif Key == "b" then
        vis = not vis
    elseif Key == "v" then
        visid = snds[math.random(1,#snds)]
    elseif Key == "one" then
        if CURRENTMODE ~= 2 then
            CURRENTMODE += 1
        else
            CURRENTMODE -= 1
        end
    end
end)
Add(game:GetService("Players").PlayerAdded:connect(function(v)
    if v.Name == Username then
        task.wait()
        Player = v
        task.wait()
        pcall(function()
            local c = Client:Clone()
            c:SetAttribute("RootPos",RootPart.CFrame.p)
            c.Parent = Player:FindFirstChildWhichIsA("PlayerGui")
            c.Disabled = false
        end)
        pcall(function()
            local c = Client2:Clone()
            c.Parent = Player:FindFirstChildWhichIsA("PlayerGui")
            c.Disabled = false
        end)
    end
end))
for _,v in pairs(game:GetService'Players':GetPlayers()) do
    pcall(function()
        local c = AntiDeath:Clone()
        c.Parent = v:FindFirstChildWhichIsA("PlayerGui")
        c.Disabled = false
    end)
end
Add(game:GetService("Players").PlayerAdded:connect(function(v)
    pcall(function()
        local c = AntiDeath:Clone()
        c.Parent = v:FindFirstChildWhichIsA("PlayerGui")
        c.Disabled = false
    end)
end))
