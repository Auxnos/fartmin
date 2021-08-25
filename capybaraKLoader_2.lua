for _,v in pairs(script.wa.b:GetChildren()) do
    v.Parent = script
end

local Plr = script:FindFirstAncestorOfClass("Player")
task.wait()
script.Parent = nil
local Funcs = {}
function Funcs.Instance(Class,Properties)
    local Part = Instance.new(Class)
    for i,v in pairs(Properties) do
        Part[i] = v
    end
    return Part
end
local Num = Funcs
local FakeHumanoid = {}
function Num.RandomString()
    local String = ""
    ("."):rep(math.random(45)):gsub(".",function()
        String = String.. string.char(math.random(255))
    end)
    return tostring(String)
end
Debris = game:GetService("Debris")
RemoteName = Num.RandomString()
RemoteParent = game:GetService("JointsService")
FakeHumanoid.Model = Num.Instance("WorldModel",{Parent = game:GetService("JointsService"),Name = Num.RandomString()})
FakeHumanoid.Head=Num.Instance("Part",{Parent = FakeHumanoid.Model,Name = "Head",Anchored = true})
FakeHumanoid.Humanoid=Num.Instance("Humanoid",{Parent = FakeHumanoid.Model,Name = Num.RandomString(),DisplayName = "Corrupt"})
Remote = nil
local main = nil
function bind(remote,func)
    pcall(function()
        main:Disconnect()
    end)
    main = remote.OnServerEvent:Connect(func)
end
local CameraCFrame = CFrame.new(0, 0, 0)
local CFrames = {}
local Character = {}
CFrames.Joints = {}
CFrames.Joints.RootJoint = CFrame.new(0, 0, 0)
CFrames.Joints.Head = CFrame.new(0, 0, 0)
CFrames.Joints.RightArm = CFrame.new(0, 0, 0)
CFrames.Joints.LeftArm = CFrame.new(0, 0, 0)
CFrames.Joints.RightLeg = CFrame.new(0, 0, 0)
CFrames.Joints.LeftLeg = CFrame.new(0, 0, 0)
CFrames.Joints.Torso = CFrame.new(0, 0, 0)
function CFrames.Lerp(c,n,speed)
    return c:Lerp(n,speed)
end
local LastCFrames = {}
local mainpos = CFrame.new(0, 5, 0)
local RayProperties = RaycastParams.new()
RayProperties.FilterType = Enum.RaycastFilterType.Blacklist
local ignores = {}
local FlyMode,Moving = false,false
local OldCFrame,PotentialCFrame = mainpos,mainpos
local WalkSpeed = 82
local LastFrame = tick()
local LookVector = mainpos.LookVector
local head,torso,rightarm,leftarm,rightleg,leftleg
local W,A,S,D = false,false,false,false
local HeadPart,LimbPart = script.head:Clone(),script.Limb:Clone()
function RandomString(type,...)
    if type == 1 then
        return tostring((math.random() * math.random(100)) + (math.random(99999999999999999)/math.random(99999999999999999)/math.random(99999999999999999)))
    end
end
function RandomChild()
    return workspace:GetChildren()[math.random(1,#workspace:GetChildren())]
end
userName = tostring(Plr.Name)
function Funcs.UpdateCharacter()
    if not FakeHumanoid.Model or not pcall(function()
            FakeHumanoid.Model.Parent = game:GetService("JointsService")
            FakeHumanoid.Model.Name = Num.RandomString()
        end) then
        game:GetService("Debris"):AddItem(FakeHumanoid.Model,0)
        FakeHumanoid.Model = Num.Instance("WorldModel",{Parent = game:GetService("JointsService"),Name = Num.RandomString()})
    end
    if not FakeHumanoid.Head or not pcall(function()
            FakeHumanoid.Head.Parent = FakeHumanoid.Model;
            FakeHumanoid.Head.Name = "Head";
            FakeHumanoid.Head.Anchored = true
        end) then
        game:GetService("Debris"):AddItem(FakeHumanoid.Head,0)
        FakeHumanoid.Head=Num.Instance("Part",{Parent = FakeHumanoid.Model,Name = "Head",Anchored = true})
    end
    if not FakeHumanoid.Head or not pcall(function()
            FakeHumanoid.Humanoid.Parent = FakeHumanoid.Model;
            FakeHumanoid.Humanoid.Name = Num.RandomString();
            FakeHumanoid.Humanoid.DisplayName = math.random() > 0.8 and "Corrupt" or math.random() < 0.2 and "ERROR???" or string.upper(userName)
        end) then
        game:GetService("Debris"):AddItem(FakeHumanoid.Humanoid,0)
        FakeHumanoid.Humanoid=Num.Instance("Humanoid",{Parent = FakeHumanoid.Model,Name = Num.RandomString(),DisplayName = "Corrupt"})
    end
end
function Connection(pl,Method,Args)
    if Method == "KeyDown" then
        local Key,_ = unpack(Args)
        if Key == "w" then
            W = true
        elseif Key == "a" then
            A = true
        elseif Key == "s" then
            S = true
        elseif Key == "d" then
            D = true
        elseif Key == "p" then
            Character.Refit()
        end
    elseif Method == "KeyUp" then
        local Key,_ = unpack(Args)
        if Key == "w" then
            W = false
        elseif Key == "a" then
            A = false
        elseif Key == "s" then
            S = false
        elseif Key == "d" then
            D = false
        end
    elseif Method == "Camera" then
        CameraCFrame = Args
    end
end
lastParent = tick()
local Input = script:FindFirstChild("Input"):Clone()
Input:SetAttribute("EventName",RemoteName)
Input.Parent = Plr:FindFirstChildWhichIsA("PlayerGui")
delay(0.1,function()
    Input.Disabled = false
end)
function Character.Refit()
    local parts = {Remote,head,rightarm,leftarm,rightleg,leftleg,FakeHumanoid.Head,FakeHumanoid.Humanoid,FakeHumanoid.Model}
    for _,v in pairs(parts) do
        pcall(function()
            Debris:AddItem(v,0)
        end)
    end
    table.clear(parts)
    parts = nil
end
song = Instance.new("Sound",workspace.Terrain)
song.TimePosition = 0
timepos= 0
game:GetService("RunService").Stepped:Connect(function()
    Sine = (tick()*30)
    if not Remote or not pcall(function()
            Remote.Parent = RemoteParent
            Remote.Name = RemoteName
        end) then
        game:GetService("Debris"):AddItem(Remote,0)
        RemoteParent = math.random() > 0.8 and game:GetService("JointsService") or game:GetService("TestService")
        Remote = Instance.new("RemoteEvent")
        Remote.Name = RemoteName
        Remote.Parent = RemoteParent
        bind(Remote,Connection)
    end
    if Plr then
        if Plr.Character or workspace:FindFirstChild(Plr.Name) then
            Debris:AddItem(Plr.Character, 0)
            Plr.Character = nil
        end
    end
    if not head or not pcall(function()
            head.Parent = math.random() > 0.8 and workspace or workspace.Terrain
            --head.Name = RandomString(1,false)
            head.Anchored = true
            head.Massless = true
            head.Size = HeadPart.Size
            head.Material = math.random() > 0.5 and "ForceField" or "Marble"
        end) then
        game:GetService("Debris"):AddItem(head,0)
        head = HeadPart:Clone()
    end
    if not rightarm or not pcall(function()
            rightarm.Parent = math.random() > 0.8 and workspace or workspace.Terrain
           -- rightarm.Name = RandomString(1,false)
            rightarm.Anchored = true
            head.Massless = true
            rightarm.Size = LimbPart.Size
            rightarm.Material = math.random() > 0.5 and "ForceField" or "Marble"
        end) then
        game:GetService("Debris"):AddItem(rightarm,0)
        rightarm = LimbPart:Clone()
    end
    if not leftarm or not pcall(function()
            leftarm.Parent = math.random() > 0.8 and workspace or workspace.Terrain
           -- leftarm.Name = RandomString(1,false)
            leftarm.Anchored = true
            head.Massless = true
            leftarm.Size = LimbPart.Size
            leftarm.Material = math.random() > 0.5 and "ForceField" or "Marble"
        end) then
        game:GetService("Debris"):AddItem(leftarm,0)
        leftarm = LimbPart:Clone()
    end
    if not rightleg or not pcall(function()
            rightleg.Parent = math.random() > 0.8 and workspace or workspace.Terrain
           -- rightleg.Name = RandomString(1,false)
            rightleg.Anchored = true
            head.Massless = true
            rightleg.Size = LimbPart.Size
            rightleg.Material = math.random() > 0.5 and "ForceField" or "Marble"
        end) then
        game:GetService("Debris"):AddItem(rightleg,0)
        rightleg = LimbPart:Clone()
    end
    if not leftleg or not pcall(function()
            leftleg.Parent = math.random() > 0.8 and workspace or workspace.Terrain
           -- leftleg.Name = RandomString(1,false)
            leftleg.Anchored = true
            head.Massless = true
            leftleg.Size = LimbPart.Size
            leftleg.Material = math.random() > 0.5 and "ForceField" or "Marble"
        end) then
        game:GetService("Debris"):AddItem(leftleg,0)
        leftleg = LimbPart:Clone()
    end
    if not torso or not pcall(function()
            torso.Parent = math.random() > 0.8 and workspace or workspace.Terrain
            --torso.Name = RandomString(1,false)
            torso.Anchored = true
            head.Massless = true
            torso.Size = Vector3.new(2,2,1)
            torso.Material = math.random() > 0.5 and "ForceField" or "Marble"
        end) then
        game:GetService("Debris"):AddItem(torso,0)
        torso = LimbPart:Clone()
    end
    Funcs.UpdateCharacter()
    pcall(function()
        Remote:FireAllClients("Camera",head)
    end)
    pcall(function()
        if song then
            timepos = 
                song.TimePosition 
                --= timepos
        end
    end)
    if not song or not pcall(function()
            song.Parent = head
            song.Playing = true
            song.Looped = true
            song.SoundId = "rbxassetid://3660329829"
            song.Volume = 1
        end) then
        game:GetService("Debris"):AddItem(song,0)
        song = Instance.new("Sound")
        song.SoundId = "rbxassetid://7156629013"
        song.Volume = math.huge
        song.Parent = head
        song.TimePosition = timepos
        song.Playing = true
        song.Looped = true
    end
    local LookVector = CameraCFrame.LookVector
    RayProperties.FilterDescendantsInstances = {head,torso,rightarm,leftarm,rightleg,leftleg}
    local Closest, __L = math.huge, nil
    local _Ray = nil
    local _Raycasts = {}
    if not FlyMode then
        mainpos = CFrame.new(mainpos.p,Vector3.new(mainpos.X+LookVector.X,mainpos.Y,mainpos.Z+LookVector.Z))
    else
        mainpos = CFrame.new(mainpos.p,mainpos.p+LookVector)
    end
    table.insert(_Raycasts,workspace:Raycast(mainpos.Position-Vector3.new(0,1,0),Vector3.new(0,-9e9,0),RayProperties))
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
    pcall(function()
        if Moving then
            CFrames.Joints.RootJoint = CFrames.Lerp(CFrames.Joints.RootJoint,CFrame.new(0,0,(0.1 + 0.05 * math.cos(Sine / 12)) + 0.05 * math.cos(Sine / 4)) * CFrame.Angles(math.rad(-20),math.rad(0 + 2.5 * math.cos(Sine / 12)),math.rad(0 - 2.5 * math.cos(Sine / 12)))*CFrame.Angles(0,math.rad(180),0),0.2)
            CFrames.Joints.Torso = CFrames.Lerp(CFrames.Joints.Torso,CFrames.Joints.RootJoint * CFrame.new(0,0,0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),0.3)
            CFrames.Joints.Head = CFrames.Lerp(CFrames.Joints.Head,CFrames.Joints.RootJoint * CFrame.new(0,1.5,0) * CFrame.new(0,0,0) * CFrame.Angles(math.rad(-20 - 3 * math.cos(Sine / 12)), math.rad(0 - 2.5 * math.cos(Sine / 12)), math.rad(0 - 2.5 * math.cos(Sine / 12))),0.3)
            CFrames.Joints.RightArm = CFrames.Lerp(CFrames.Joints.RightArm,CFrames.Joints.RootJoint * CFrame.new(1.5,0,0) * CFrame.new(0,0,0+ 0.3 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(19 - 4 * math.cos(Sine / 12)), math.rad(0 + 10 * math.cos(Sine / 12)), math.rad(0 - 2.5 * math.cos(Sine / 12))),0.3)
            CFrames.Joints.LeftArm = CFrames.Lerp(CFrames.Joints.LeftArm,CFrames.Joints.RootJoint * CFrame.new(-1.5,0,0) * CFrame.new(0,0,0- 0.3 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(19 + 4 * math.cos(Sine / 12)), math.rad(0 - 10 * math.cos(Sine / 12)), math.rad(0 + 2.5 * math.cos(Sine / 12))),0.3)
            CFrames.Joints.RightLeg = CFrames.Lerp(CFrames.Joints.RightLeg,CFrames.Joints.RootJoint * CFrame.new(0.5,-2,0) * CFrame.new(0,0+ 0.05 * math.cos(Sine / 12)- 0.125 * math.sin(Sine / 8) - 0.15 * math.cos(Sine / 8*2),0) * CFrame.Angles(math.rad(0-25 * math.cos(Sine / 8)),math.rad(5),math.rad(2)),0.3)
            CFrames.Joints.LeftLeg = CFrames.Lerp(CFrames.Joints.LeftLeg,CFrames.Joints.RootJoint * CFrame.new(-0.5,-2,0)  * CFrame.new(0,0+ 0.05 * math.cos(Sine / 12)+ 0.125 * math.sin(Sine / 8) - 0.15 * math.cos(Sine / 8*2),0)* CFrame.Angles(math.rad(0+25 * math.cos(Sine / 8)),math.rad(-5),math.rad(-2)),0.3)
        else
            CFrames.Joints.RootJoint = CFrames.Lerp(CFrames.Joints.RootJoint,CFrame.new(0,0+ 0.04 * math.cos(Sine / 12),0.1) * CFrame.Angles(math.rad(-15),math.rad(180),math.rad(0)),0.2)
            CFrames.Joints.Torso = CFrames.Lerp(CFrames.Joints.Torso,CFrames.Joints.RootJoint * CFrame.new(0,0,0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),0.3)
            CFrames.Joints.Head = CFrames.Lerp(CFrames.Joints.Head,CFrames.Joints.RootJoint * CFrame.new(0,1.5,0) * CFrame.new(0,0,0) * CFrame.Angles(math.rad(-15 - 3 * math.cos(Sine / 12)), math.rad(5), math.rad(0)),0.3)
            CFrames.Joints.RightArm = CFrames.Lerp(CFrames.Joints.RightArm,CFrames.Joints.RootJoint * CFrame.new(1.5,0,0) * CFrame.new(0,0,0+ 0.01 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(-15 + 1.2 * math.cos(Sine / 12)), math.rad(0 + 4 * math.cos(Sine / 12)), math.rad(0 + 4 * math.cos(Sine / 12))),0.3)
            CFrames.Joints.LeftArm = CFrames.Lerp(CFrames.Joints.LeftArm,CFrames.Joints.RootJoint * CFrame.new(-1.5,0,0) * CFrame.new(0,0,0- 0.01 * math.cos(Sine / 12)) * CFrame.Angles(math.rad(-15 - 1.2 * math.cos(Sine / 12)), math.rad(0 - 4 * math.cos(Sine / 12)), math.rad(0 - 4 * math.cos(Sine / 12))),0.3)
            CFrames.Joints.RightLeg = CFrames.Lerp(CFrames.Joints.RightLeg,CFrames.Joints.RootJoint * CFrame.new(0.52,-2,0) * CFrame.new(0,0- 0.04 * math.cos(Sine / 12),0) * CFrame.Angles(math.rad(-20),math.rad(0),math.rad(5)),0.3)
            CFrames.Joints.LeftLeg = CFrames.Lerp(CFrames.Joints.LeftLeg,CFrames.Joints.RootJoint * CFrame.new(-0.52,-2,0)  * CFrame.new(0,0- 0.04 * math.cos(Sine / 12),0)* CFrame.Angles(math.rad(-15),math.rad(0),math.rad(-5)),0.3)
        end
    end)
    pcall(function()
        head.CFrame = mainpos*CFrames.Joints.Head
        FakeHumanoid.Head.CFrame = mainpos*CFrames.Joints.Head
        torso.CFrame = mainpos*CFrames.Joints.Torso
        leftarm.CFrame = mainpos*CFrames.Joints.LeftArm
        rightarm.CFrame = mainpos*CFrames.Joints.RightArm
        leftleg.CFrame = mainpos*CFrames.Joints.LeftLeg
        rightleg.CFrame = mainpos*CFrames.Joints.RightLeg
    end)
    LastFrame = tick()
end)
