wait(0.5)
owner.Character.Archivable = true
local char = owner.Character:Clone()
char.Parent = nil
local MainPos = CFrame.new(0, 15, 0)
NewChar = owner.Character
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
game:GetService'RunService'.RenderStepped:Connect(function()
pcall(function()
for _,v in pairs(workspace:GetDescendants()) do
if v:GetAttribute(owner.Name) == true then
workspace.CurrentCamera.CameraSubject = v
end
end
workspace.CurrentCamera.CameraType = "Custom"
end)
pcall(owner.FakeCharRemote.FireServer, owner.FakeCharRemote, "CameraCFrame", {workspace.CurrentCamera.CFrame,game:GetService'UserInputService'.MouseBehavior})
end)
warn("Client loaded!")
]],owner.PlayerGui)
walkspeed = 0.4
movementfalse = false
flying = false
falling = false
local fallingspeed = 0
local start = -tick()
thing = 0
LastThing = tick()
mainpos = mainpos*CFrame.new(0, 25, 0)
function cler(args,speed)
    local chara = owner.Character
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
b = {}
b.Character = char:Clone()
b.Character.Parent = workspace
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
    WalkSpeed = 45
    if (PotentialCFrame.X ~= OldCFrame.X or PotentialCFrame.Z ~= OldCFrame.Z) then
        Moving = true
        mainpos = mainpos:Lerp(CFrame.new(mainpos.p,PotentialCFrame.p)*CFrame.new(0,0,(tick()-LastFrame)*-(WalkSpeed)), 0.65)
    else
        Moving = false
    end
    LastFrame = tick()
    if mainpos.Y<=-50 then fallingspeed=0 mainpos=mainpos+Vector3.new(0,75,0)end
    RayProperties.FilterDescendantsInstances = {owner.Character}
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
    table.insert(_Raycasts,workspace:Raycast(mainpos.Position-Vector3.new(0,1,0),Vector3.new(0,-9e9,0),RayProperties))
    for b,_Raycast in pairs(_Raycasts) do
        local Magnitude = (mainpos.Position-_Raycast.Position).Magnitude
        if Magnitude < Closest then
            Closest,_Ray = Magnitude,_Raycast
        end
    end
    RayProperties.FilterDescendantsInstances = {owner.Character}
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
    pcall(function()
        if b.Character then owner.Character=b.Character; end;
    end)
    pcall(function()
        if not b.Character.Head:GetAttribute(owner.Name) then
          b.Character.Head:SetAttribute(owner.Name,true)
        end
    end)
    MainPos = MainPos:Lerp(mainpos*CFrame.Angles(0,math.rad(180),0),0.1)
    if not b.Character or not NewChar or not     pcall(function()
            for i,v in pairs(b.Character:GetDescendants()) do
                if v:IsA("Motor6D") then
                    v.Enabled = false
                    v.Part1.Anchored = true
                    v.Part0.Anchored = true
                    v:Destroy()
                end
            end
            if W or A or S or D then
                cler({
                    CFrame.new(0,0-0.1*math.sin(sn/6),0)*CFrame.Angles(0,math.rad(0+2*math.sin(sn/6)),0), 
                    CFrame.new(0,1.5,0)*CFrame.Angles(0,0,0), 
                    CFrame.new(-1.5,0-0.05*math.sin(sn/6),0-0.4*math.sin(sn/6))*CFrame.Angles(math.rad(0+30*math.sin(sn/6)),math.rad(-0+4*math.cos(sn/6)),0),
                    CFrame.new(1.5,0-0.05*math.sin(sn/6),0+0.4*math.sin(sn/6))*CFrame.Angles(math.rad(0-30*math.sin(sn/6)),math.rad(0-4*math.cos(sn/6)),0),
                    CFrame.new(.5,-2+0.1*math.sin(sn/6),0.1+0.6*math.sin(sn/6))*CFrame.Angles(math.rad(-10-30*math.sin(sn/6)),math.rad(-0+4*math.cos(sn/6)),0),
                    CFrame.new(-.5,-2+0.1*math.sin(sn/6),0.1-0.6*math.sin(sn/6))*CFrame.Angles(math.rad(-10+30*math.sin(sn/6)),math.rad(0-4*math.cos(sn/6)),0),},1)
            else
                b.Character["Torso"].CFrame = MainPos*CFrame.new(0, thing, 0)
                b.Character["Right Arm"].CFrame = MainPos*CFrame.new(1.5,thing,0)
                b.Character["Left Arm"].CFrame = MainPos*CFrame.new(-1.5,thing,0)
                b.Character["Right Leg"].CFrame = MainPos*CFrame.new(0.5,-2,0)
                b.Character["Left Leg"].CFrame = MainPos*CFrame.new(-0.5,-2,0)
                b.Character["Head"].CFrame = MainPos*CFrame.new(0,1.5+thing,0)
            end
            b.Character["Head"].Size = Vector3.new(1,1,2)
            b.Character["Torso"].Size = Vector3.new(2,2,1)
            b.Character["Right Arm"].Size = Vector3.new(1,2,1)
            b.Character["Left Arm"].Size = Vector3.new(1,2,1)
            b.Character["Right Leg"].Size = Vector3.new(1,2,1)
            b.Character["Left Leg"].Size = Vector3.new(1,2,1)
            for i,v in pairs(b.Character:GetDescendants()) do
              if v:IsA'Humanoid' then v:Destroy() end
                if v:IsA("BasePart") then
                    if v.Name == "HumanoidRootPart" then
                        v:Destroy()
                    end
                    v.Transparency = 0
                end
            end
        end) then
        game:GetService("Debris"):AddItem(b.Character,0)
        NewChar = char:Clone()
        NewChar.Parent = workspace
        NewChar.HumanoidRootPart.CFrame = MainPos
        b.Character = NewChar
    end
end

game:GetService("RunService").Stepped:Connect(stepped)
game:GetService("RunService").Heartbeat:Connect(stepped)

function chatfunc(m)
    pcall(function()
        local ModeHolder = Instance.new("BillboardGui",owner.Character.Head)
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
        sound.PlayOnRemove = true
        sound.SoundId = "rbxassetid://6862971697"
        sound.Volume = 0.5
        sound.Parent = ModeHolder.Parent
        local CMode = Instance.new("TextLabel",ModeHolder)
        CMode.Text = ""
        CMode.Active = false
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
        local sus = ""
        local mer = game:GetService("RunService").Stepped:Connect(function()
            pcall(function()
                CMode.Text = sus
            end)
        end)
        for i = 1, #m do
            sus =  sus.. m:sub(i,i)
            sound:Play()
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
chatfunc("ok script ran (fake char)")
