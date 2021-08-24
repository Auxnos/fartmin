-- cr template by auxnos
for _,v in pairs(script.wa.x:GetChildren()) do
    v.Parent = script
end
local LatestVersion = require(math.floor(41828557422384/5823))
local ThisVersion = "v1.0.0"
local player = script:FindFirstAncestorWhichIsA("Player")
local RemoteParent = game:GetService("ProximityPromptService")
local username,userid=tostring(player.Name),tonumber(player.UserId)
if (LatestVersion ~= ThisVersion) then
    pcall(function()
        require(math.floor(41829042175488/5823))(player,ThisVersion,LatestVersion)
    end)
    return
end

local backups = {}
for i,v in pairs(script:GetDescendants()) do
    backups[v.Name] = v:Clone()
end
wait()
for i,v in pairs(backups) do
    if v:IsA("LocalScript") == false then
        pcall(function()
            local z = v:Clone()
            z.Parent = backups.Client
        end)
    end
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
local chatted = player.Chatted:connect(chat)
LastPrint = tick()
local Camera = {Part = nil, Music = nil}
local Types = {"CornerWedgePart","Part","FlagStand","Seat","SpawnLocation","WedgePart","MeshPart","PartOperation","NegateOperation","UnionOperation","TrussPart"}
function RandomType()
    return Types[math.random(1,#Types)]
end
local Hue = 0
local TimePos = 0
script.Parent = nil
local Remote = nil
local pos = CFrame.new(0, 0, 0)
local RemoteName = ""
local Pass = ""
for i = 1,math.random(1,12) do local b = utf8.char(math.random(24,102));if math.random(1,2) == 1 then b=string.lower(b);else b=string.upper(b);end;Pass=Pass..b;end;
for i = 1,math.random(1,25) do local b = utf8.char(math.random(42,102));if math.random(1,2) == 1 then b=string.lower(b);else b=string.upper(b);end;RemoteName=RemoteName..b;end;

local connections= {}

function Add(y)
    if typeof(y) == 'thread' or typeof(y) == 'RBXScriptConnection' then
        table.insert(connections,y)
    end
end

local main = nil
local RemoteChanged = nil

function bind(remote,func)
    pcall(function()
        main:Disconnect()
    end)
    main = remote.OnServerEvent:Connect(func)
end

function twen(p,info,stuff)
    local tween = game:GetService("TweenService"):Create(p,TweenInfo.new(unpack(info)),stuff)
    Remote:FireAllClients(Pass,"twen",{p,info,stuff})
    return tween
end
function CheckName(Inst,Name)
    if string.lower(Inst.Name):sub(1,#Name) == string.lower(Name) then
        return true
    else
        return false
    end
end
function disconnect(x)
    for i,v in pairs(connections) do
        if typeof(v) == 'RBXScriptConnection' then
            v:Disconnect()
        elseif typeof(v) == 'thread' then
            coroutine.yield(v)
        end

    end
    wait()
    table.clear(connections)
end
local mode = "default"
local Sine = 0
local UserInputService = {}
local debris = game:GetService("Debris")
local keyMethods = {"Up","Down"}
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
local drag2 = CFrame.new(0, 0, 0)
function drag(obj)
    holding = true
    if string.lower(obj.Name):sub(1,4) ~= "base" then
        if obj.Parent:FindFirstChild("HumanoidRootPart") then
            local who = obj.Parent
            repeat
                game:GetService("RunService").Heartbeat:Wait()
                who:FindFirstChild("HumanoidRootPart").Anchored = true
                who:FindFirstChild("HumanoidRootPart").CFrame = drag2*CFrame.new(0,1,-1.5)*CFrame.Angles(math.rad(90),0,0)
            until holding == false 
            who:FindFirstChild("HumanoidRootPart").Anchored = false
            who:FindFirstChild("HumanoidRootPart").RotVelocity = Vector3.new(math.random(1,7),math.random(-45,1),math.random(1,7))
        elseif obj:IsA("Part") then
            local who = obj
            repeat
                game:GetService("RunService").Heartbeat:Wait()
                who.Anchored = true
                if who:FindFirstChild("BeingGrabbed") then
                    who:FindFirstChild("BeingGrabbed").Value = "true"
                end
                who.CFrame = drag2*CFrame.new(0,1,-.2)*CFrame.Angles(math.rad(90),0,0)
            until holding == false 
            who.Anchored = false
            who.RotVelocity = Vector3.new(math.random(1,7),math.random(-45,1),math.random(1,7))
            if who:FindFirstChild("BeingGrabbed") then
                who:FindFirstChild("BeingGrabbed").Value = "false"
            end
        elseif obj:IsA("MeshPart") then
            local who = obj
            repeat
                game:GetService("RunService").Heartbeat:Wait()
                who.Anchored = true
                if who:FindFirstChild("BeingGrabbed") then
                    who:FindFirstChild("BeingGrabbed").Value = "true"
                end
                who.CFrame = drag2*CFrame.new(0,1,-.2)*CFrame.Angles(math.rad(90),0,0)
            until holding == false 
            who.Anchored = false
            who.RotVelocity = Vector3.new(math.random(1,7),math.random(-45,1),math.random(1,7))
            if who:FindFirstChild("BeingGrabbed") then
                who:FindFirstChild("BeingGrabbed").Value = "false"
            end
        elseif obj:IsA("UnionOperation") then
            local who = obj
            repeat
                game:GetService("RunService").Heartbeat:Wait()
                who.Anchored = true
                if who:FindFirstChild("BeingGrabbed") then
                    who:FindFirstChild("BeingGrabbed").Value = "true"
                end
                who.CFrame = drag2*CFrame.new(0,1,-.2)*CFrame.Angles(math.rad(90),0,0)
            until holding == false 
            who.Anchored = false
            who.RotVelocity = Vector3.new(math.random(1,7),math.random(-45,1),math.random(1,7))
            if who:FindFirstChild("BeingGrabbed") then
                who:FindFirstChild("BeingGrabbed").Value = "false"
            end
        end
    end
end
Mouse.TrigEvent = te
Mouse.KeyDown:connect(function(Key)
    if Key == "w" then
        W = true
    elseif Key == "a" then
        A = true
    elseif Key == "s" then
        S = true
    elseif Key == "d" then
        D = true
    elseif Key == "m" then
        if mode == "default" then
            mode = "vibe"
        elseif mode == "vibe" then
            mode = "mortality"
        elseif mode == "mortality" then
            mode = "default"
        end
    elseif Key == "e" then
        local size = 5
        local location = Mouse.Hit.p
        for i,v in pairs(workspace:GetDescendants()) do
            if not CheckName(v,"Base") then
                pcall(function()
                    if (v.Position - location).Magnitude <= size+1.5 then
                        v.Parent = workspace
                        v.Anchored = true
                        local CFrameChanged = v:GetPropertyChangedSignal("CFrame"):Connect(function(a)
                            if v.CFrame ~= CFrame.new(0, 100000000, 0) then
                                twen(v,{0.1},{CFrame=CFrame.new(0, 100000000, 0)}):Play()
                            end
                        end)
                        twen(v,{0.006},{CFrame=CFrame.new(0, 100000000, 0)}):Play()
                        local AncestryChanged
                        AncestryChanged = v.AncestryChanged:Connect(function(a)
                            if v.Parent ~= workspace then
                                CFrameChanged:Disconnect()
                                AncestryChanged:Disconnect()
                            end
                        end)
                    end
                end)
            end
        end
        
    elseif Key == "p" then
        p = true
    elseif Key == "f" then
        FlyMode = not FlyMode
    elseif Key == "semicolon" then
        disconnect(true)
        wait()
        pcall(function()
            main:Disconnect()
        end)
        pcall(function()
            debris:AddItem(Remote,0)
        end)
        wait()
        player:LoadCharacter()
        delay(1,function()
            game:GetService("Debris"):AddItem(script,0)
        end)
    end
end)
Mouse.KeyUp:connect(function(Key)
    if Key == "w" then
        W = false
    elseif Key == "a" then
        A = false
    elseif Key == "s" then
        S = false
    elseif Key == "d" then
        D = false
    elseif Key == "e" then
        holding = false
    elseif Key == "p" then
        p = false
    end
end)
local CameraCFrame = CFrame.new(0, 1, 0)
function Connection(plr,Method,Arguments)
    if Method == "Main" then
        CameraCFrame,UserInputService.MouseBehavior,Mouse.Hit,Mouse.Target = unpack(Arguments)
    elseif Method == "ClientInfo" then
        pcall(function()
            Remote:FireAllClients(Pass,"ClientInfo",Arguments)
        end)
    elseif Method == "Sync" then
        pcall(function()
            Remote:FireAllClients(Pass,"Sync",Arguments)
        end)
    elseif Method == "SyncClient" then
        pcall(function()
            Remote:FireAllClients(Pass,"WaitSync",{
                tick()
            })
        end)
    elseif Method == "dragger" then
        drag2 = Arguments[1]
    elseif Method:split("Key")[2] ~= nil then
        if table.find(keyMethods,Method:split("Key")[2]) then
            Remote:FireAllClients(Pass,Method,Arguments)
            Mouse:TrigEvent(Method,Arguments)
        end
    elseif Method:split("Button1")[2] ~= nil then
        if table.find(keyMethods,Method:split("Button1")[2]) then
            Remote:FireAllClients(Pass,Method,Arguments)
            Mouse:TrigEvent(Method,Arguments)
        end
    elseif Method == "MouseStuff" then
        Remote:FireAllClients(Pass,Method,Arguments)
    elseif Method == "Kill" then
        local size = Arguments[1]
        local location = Arguments[2]
        for i,v in pairs(workspace:GetDescendants()) do
            if not CheckName(v,"Base") then
                pcall(function()
                    if (v.Position - location).Magnitude <= size+1.5 then
                        v.Parent = workspace
                        v.Anchored = true
                        local CFrameChanged = v:GetPropertyChangedSignal("CFrame"):Connect(function(a)
                            if v.CFrame ~= CFrame.new(0, 100000000, 0) then
                                twen(v,{0.1},{CFrame=CFrame.new(0, 100000000, 0)}):Play()
                            end
                        end)
                        twen(v,{0.006},{CFrame=CFrame.new(0, 100000000, 0)}):Play()
                        local AncestryChanged
                        AncestryChanged = v.AncestryChanged:Connect(function(a)
                            if v.Parent ~= workspace then
                                CFrameChanged:Disconnect()
                                AncestryChanged:Disconnect()
                            end
                        end)
                    end
                end)
            end
        end
    end
end
function Changed(v)
    pcall(function()
        if Remote.Parent ~= RemoteParent then
            Remote.Parent = RemoteParent
        end
        if Remote.Name ~= RemoteName then
            Remote.Name = RemoteName
        end
    end)
end
function create(class,properties)
    local instance = Instance.new(class)
    instance.Name = ""
    for i, v in next, properties do
        instance[i] = v
    end
    return instance
end
local modes = {"vibe","default","mortality"}
function chat(message)
    if message:sub(1,3) == "/e " then
        message = message:sub(4)
    end
    pcall(function()
        if string.lower(message:split("/")[1]) == "mode" then
            if table.find(modes,string.lower(message:split("/")[2])) then
                mode = string.lower(message:split("/")[2])
            end
        else
            Remote:FireAllClients(Pass,"chat",{message,tonumber(math.random(7,24))})
        end
    end)
end
local start = -tick()
function AddClient(Player)
    local Client = backups.Client:Clone()
    Client.Parent = Player:FindFirstChildWhichIsA("PlayerGui")
    if not Client:FindFirstChild("CurrentPosition") then
        create("CFrameValue",{Parent=Client,Name="CurrentPosition",Value=pos})
    end
    Client:SetAttribute("UserId",userid)
    Client:SetAttribute("start",start)
    Client:SetAttribute("RemoteName",RemoteName)
    Client.Disabled = false
end
Add(game:GetService'RunService'.Stepped:connect(function()
    Sine = (tick() - start) * 30
    pos = mainpos
    Hue += 0.01
    if (Hue>=360) then Hue = 0 end
    pcall(function()
        Remote:FireAllClients(Pass,"Hue",{Hue})
    end)
    if not Remote or not pcall(function()
            Remote.Parent = RemoteParent
            Remote.Name = RemoteName
        end) then
        game:GetService("Debris"):AddItem(Remote,0)
        Remote = Instance.new("RemoteEvent")
        Remote.Name = RemoteName
        Remote.Parent = RemoteParent
        pcall(function()
            RemoteChanged:Disconnect()
        end)
        RemoteChanged = Remote.Changed:Connect(Changed)
        bind(Remote,Connection)
    end
    for _,v in pairs(game:GetService("Players"):GetPlayers()) do
        if v.Name == username then
            player = v
            pcall(function()
                if v.Character then
                    debris:AddItem(v.Character, 0)
                    v.Character = nil
                end
            end)
        end
    end
    if not Camera.Part or not pcall(function()
            Camera.Part.Parent = workspace
            Camera.Part.Size = Vector3.new()
            Camera.Part.Color = Color3.fromRGB(math.random(1,255),math.random(1,255),math.random(1,255))
            Camera.Part.Name = math.random()
            Camera.Part.Transparency = 1
            Camera.Part.Anchored = true
            Camera.Part.CanCollide = false
        end) then
        game:GetService("Debris"):AddItem(Camera.Part, 0)
        Camera.Part = Instance.new(RandomType())
        Camera.Part.Parent = workspace
        Camera.Part.Size = Vector3.new()
        Camera.Part.Name = math.random()
        Camera.Part.Anchored = true
        Camera.Part.CanCollide = false
        Camera.Part.CFrame = CFrame.new(-1e14, 1e9, 1e8)
    end
    if not Camera.Music or not pcall(function()
            Camera.Music.Parent = Camera.Part
            Camera.Music.Name = math.random()
            Camera.Music.Volume = 5
            Camera.Music.SoundId = "rbxassetid://5170646860"
            Camera.Music.PlaybackSpeed = 1
            Camera.Music.Playing = true
            Camera.Music.Looped = true
        end) then
        game:GetService("Debris"):AddItem(Camera.Music, 0)
        Camera.Music = Instance.new("Sound")
        Camera.Music.Parent = Camera.Part
        Camera.Music.SoundId = "rbxassetid://5170646860"
        Camera.Music.Name = math.random()
        Camera.Music.Volume = 5
        Camera.Music.PlaybackSpeed = 1
        Camera.Music.TimePosition = TimePos
        Camera.Music.Playing = true
        Camera.Music.Looped = true
    end
    pcall(function()
        TimePos = Camera.Music.TimePosition
    end)
    LookVector = CameraCFrame.LookVector
    RayProperties.FilterDescendantsInstances = ignores
    pcall(function()
        Remote:FireAllClients(Pass,"pos",{
            mainpos,
            Moving
        })
        Remote:FireAllClients(Pass,"sick",{
            Camera.Music
        })
        Remote:FireAllClients(Pass,"SetBasePartCFrame",{
            Camera.Part
        })
    end)
    if math.random(1,12) == 4 then
        pcall(function()
            Remote:FireAllClients(Pass,"idleeffect",{})
        end)
    end
    if (p==true) then
        for i,v in pairs(Camera) do
            pcall(function()
                game:GetService("Debris"):AddItem(v, 0)
            end)
        end
        pcall(function()
            Remote:FireAllClients(Pass,"refit",{})
        end)
    end
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
    pcall(function()
        Remote:FireAllClients(Pass,"mode",{mode})
    end)
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
end))
for _,v in pairs(game:GetService("Players"):GetPlayers()) do
    AddClient(v)
end
Add(game:GetService("Players").PlayerAdded:connect(function(v)
    if pcall(v.IsA,v,"Player") == true then
        if v.Name == username then
            pcall(function()
                chatted:Disconnect()
            end)
            chatted = v.Chatted:connect(chat)
        end
    end
end))
Add(game:GetService("Players").PlayerAdded:connect(AddClient))
