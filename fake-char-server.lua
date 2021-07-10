
local plr = owner
local head = nil
local torso = nil
local rightarm = nil
local leftarm = nil
local leftleg = nil

local rightleg = nil
local Parent = game:GetService("ReplicatedStorage")
pcall(function()
    Parent[owner.UserId.."Watcher"]:Destroy()
end)
local Name = owner.UserId.."Watcher"
local Remote = Instance.new("RemoteEvent", Parent)
Remote.Name = Name
local CCF = CFrame.new(0,0,0)
local cn,v3 = CFrame.new,Vector3.new
local w,a,s,d = false, false, false, false
local mainpos = CFrame.new(0, 0, 0)
head = Instance.new("Part", workspace)
head.Anchored = true
head.CFrame = mainpos
head.Name = "..."
head.CFrame = CFrame.new(0, 0, 0)
head.Size = Vector3.new(1,1,1)
local headmesh = Instance.new("SpecialMesh", head)
headmesh.MeshType = Enum.MeshType.Head
headmesh.Scale = Vector3.new(1.25, 1.25, 1.25)
local decal = Instance.new('Decal', head)
decal.Texture = 'rbxasset://textures/face.png'
torso = Instance.new("Part", workspace)
torso.Anchored = true
torso.CFrame = mainpos
torso.Name = "funny limb"
torso.CFrame = CFrame.new(0, 0, 0)
torso.Size = Vector3.new(2,2,1)
leftleg = Instance.new("Part", workspace)
leftleg.Anchored = true
leftleg.CFrame = mainpos
leftleg.Name = "funny limb"
leftleg.CFrame = CFrame.new(0, 0, 0)
leftleg.Size = Vector3.new(1,2,1)
rightleg = Instance.new("Part", workspace)
rightleg.Anchored = true
rightleg.CFrame = mainpos
rightleg.Name = "funny limb"
rightleg.CFrame = CFrame.new(0, 0, 0)
rightleg.Size = Vector3.new(1,2,1)
leftarm = Instance.new("Part", workspace)
leftarm.Anchored = true
leftarm.CFrame = mainpos
leftarm.Name = "funny limb"
leftarm.CFrame = CFrame.new(0, 0, 0)
leftarm.Size = Vector3.new(1,2,1)
rightarm = Instance.new("Part", workspace)
rightarm.Anchored = true
rightarm.CFrame = mainpos
rightarm.Name = "funny limb"
rightarm.CFrame = CFrame.new(0, 0, 0)
rightarm.Size = Vector3.new(1,2,1)
local Mouse = {}
local client = NLS([==[wait(1/60)
pcall(function()
    _G.Input:Disconnect()
end)
pcall(function()
    _G.Input2:Disconnect()
end)
local Remote = game:GetService'ReplicatedStorage':FindFirstChild(game:GetService'Players'.localPlayer.UserId.. "Watcher")
local uis = game:GetService("UserInputService")
local Mouse = game:GetService("Players").LocalPlayer:GetMouse''
Mouse.KeyDown:Connect(function(key)
    Remote:FireServer("KeyDown", key)
end)
Mouse.KeyUp:Connect(function(key)
    Remote:FireServer("KeyUp", key)
end)
coroutine.wrap(function()
    for i,v in pairs(workspace:GetDescendants()) do 
        if v.Name == "..." or string.lower(v.Name) == "head" and v.Parent:FindFirstChild("funny limb") then
            workspace.CurrentCamera.CameraSubject = v

        end
    end
    while wait(1) do
        for i,v in pairs(workspace:GetDescendants()) do 
            if v.Name == "..." or string.lower(v.Name) == "head" and v.Parent:FindFirstChild("funny limb") then
                workspace.CurrentCamera.CameraSubject = v
               
            end
        end
    end
end)()
while wait(0.01) do 
    Remote:FireServer("CCF", workspace.CurrentCamera.CFrame)
    Remote:FireServer("Hit", Mouse.Hit)
end
]==], plr.PlayerGui)
local function trollage(plr,Method,Argument)
  if Method == "Hit" then Mouse.Hit = Argument end
    if Method == "KeyDown" then
        if Argument == "w" then
            w = true
        end
        if Argument == "s" then
            s = true
        end
        if Argument == "a" then
            a = true
        end
        if Argument == "d" then
            d = true
        end
        if Argument == " " then
            mainpos = mainpos * cn(0, 25, 0)
        end
                if Argument == "z" then
            local Part = Instance.new("Part", mmmodel)
                    Part.Anchored = true
                    Part.Name = "{Effect},{true}"
                    Part.CFrame = Mouse.Hit 
                    game:GetService"Debris":AddItem(Part, 1)
        end
    elseif Method == "KeyUp" then
        if Argument == "w" then
            w = false
        end
        if Argument == "s" then
            s = false
        end
        if Argument == "a" then
            a = false
        end
        if Argument == "d" then
            d = false
        end
    elseif Method == "CCF" then
        CCF = Argument
    end
end
CONNECTION = Remote.OnServerEvent:Connect(trollage)
local sine = 0
local mmmodel = Instance.new("Model", workspace)
local humman = Instance.new("Humanoid")
humman.HealthDisplayDistance = 0
local fakename = tostring(owner.Name)
camer = Instance.new("Part", mmmodel)
camer.Anchored = true
camer.CFrame = mainpos
camer.Name = "..."
local timepos = 0
local song = Instance.new("Actor", workspace.Terrain)
camer.CFrame = CFrame.new(0, 0, 0)
local mainposz = mainpos
camer.Size = Vector3.new(0,0,0)
camer.Transparency = 1
local falling, fallingspeed = false, 0
pcall(function()

end)
game:GetService("RunService").Heartbeat:Connect(function()
    sine+=1
    pcall(function()
        owner.Character = nil
    end)
    if not client or not client.Parent or not pcall(function()
client.Parent = plr.PlayerGui 
client.Name = "?{Input}?"
    end) then 
game:GetService'Debris':AddItem(client, 0)
client = NLS([==[wait(1/60)
pcall(function()
    _G.Input:Disconnect()
end)
pcall(function()
    _G.Input2:Disconnect()
end)
local Remote = game:GetService'ReplicatedStorage':FindFirstChild(game:GetService'Players'.localPlayer.UserId.. "Watcher")
local uis = game:GetService("UserInputService")
local Mouse = game:GetService("Players").LocalPlayer:GetMouse''
Mouse.KeyDown:Connect(function(key)
    Remote:FireServer("KeyDown", key)
end)
Mouse.KeyUp:Connect(function(key)
    Remote:FireServer("KeyUp", key)
end)
coroutine.wrap(function()
    for i,v in pairs(workspace:GetDescendants()) do 
        if v.Name == "..." or string.lower(v.Name) == "head" and v.Parent:FindFirstChild("funny limb") then
            workspace.CurrentCamera.CameraSubject = v

        end
    end
    while wait(1) or not workspace.CurrentCamera.CameraSubject do
        for i,v in pairs(workspace:GetDescendants()) do 
            if v.Name == "..." or string.lower(v.Name) == "head" and v.Parent:FindFirstChild("funny limb") then
                workspace.CurrentCamera.CameraSubject = v
               
            end
        end
    end
end)()
while wait(0.01) do 
    Remote:FireServer("CCF", workspace.CurrentCamera.CFrame)
    Remote:FireServer("Hit", Mouse.Hit)
end
]==], plr.PlayerGui)
    end
    if not Remote or not Remote.Parent or not pcall(function()
            Remote.Parent = Parent
            Remote.Name = Name
        end) then
        game:GetService("Debris"):AddItem(Remote, 0)
        
        CONNECTION = Remote.OnServerEvent:Connect(trollage)
    end
    if math.random(1, 5) == 1 then
        fakename = math.random() > 0.5 and string.reverse(owner.Name) or string.upper(owner.Name) or string.lower(owner.Name)
    else
        fakename = tostring(owner.Name)
    end
    for i,v in pairs({
        head, 
        torso, 
        rightarm,
        leftarm,
        rightleg,
        leftleg,}) do
        pcall(function()
            if v.CFrame.X >= 10000 or v.CFrame.Y >= 10000 or v.CFrame.Z >= 10000 then
                game:GetService("Debris"):AddItem(v, 0)
            end
        end)
    end
    if not mmmodel or not mmmodel.Parent or not pcall(function()
            mmmodel.Parent = workspace
            mmmodel.Name = math.random()
            mmmodel.Name = utf8.char(math.random(1, 180))..utf8.char(math.random(1, 180)).. " ".. tostring(fakename).. utf8.char(math.random(1, 180)).. utf8.char(math.random(1, 180))
        end) then
        game:GetService("Debris"):AddItem(mmmodel,0)
        mmmodel= Instance.new("Model", workspace)
    end
       if not head or not head.Parent or not pcall(function()
            head.Parent = mmmodel
            head.Name = "Head"
        end) then
        game:GetService("Debris"):AddItem(head, 0)
        game:GetService("Debris"):AddItem(decal, 0)
        game:GetService("Debris"):AddItem(headmesh, 0)
        head = Instance.new("Part", mmmodel)
        head.Anchored = true
        head.CFrame = mainpos
        head.Name = "..."
        headmesh = Instance.new("SpecialMesh", head)
headmesh.MeshType = Enum.MeshType.Head
headmesh.Scale = Vector3.new(1.25, 1.25, 1.25)
        pcall(function()
            if w or a or s or d then
                torso.CFrame = mainposz * cn(0, 0, 0) * CFrame.Angles(0, math.rad(180-10*math.sin(sine/25)),0)
                head.CFrame = torso.CFrame * cn(0, 1.5, 0)
                rightarm.CFrame =torso.CFrame * cn(1.5, 0, -.9 * math.sin(sine/25)) * CFrame.Angles(math.rad(90*math.sin(sine/25)),0,0)
                leftarm.CFrame = torso.CFrame * cn(-1.5, 0, .9 * math.sin(sine/25)) * CFrame.Angles(math.rad(-90*math.sin(sine/25)),0,0)
                rightleg.CFrame = torso.CFrame * cn(0.5, -2, .76 * math.sin(sine/25)) * CFrame.Angles(math.rad(-76*math.sin(sine/25)),0,0)
                leftleg.CFrame = torso.CFrame * cn(-0.5, -2, -.76 * math.sin(sine/25)) * CFrame.Angles(math.rad(76*math.sin(sine/25)),0,0)
            else
                torso.CFrame = mainposz * cn(0, 0 + 0.5 * math.sin(sine/25), 0) * CFrame.Angles(0, math.rad(180),0)
                head.CFrame = torso.CFrame * cn(0, 1.5, 0) * CFrame.Angles(math.rad(-5 + 10 * math.sin(sine/25)),0,0)
                rightarm.CFrame = torso.CFrame * cn(1.5, 0, 0)
                leftarm.CFrame = torso.CFrame * cn(-1.5, 0, 0)
                rightleg.CFrame =torso.CFrame * cn(0.5, -2- 0.5 * math.sin(sine/25), 0)
                leftleg.CFrame = torso.CFrame * cn(-0.5, -2- 0.5 * math.sin(sine/25), 0)
            end
        end)
        head.Size = Vector3.new(1,1,1)
        decal = Instance.new('Decal', head)
        decal.Texture = 'rbxasset://textures/face.png'
    end
    if not camer or not camer.Parent or not pcall(function()
            camer.Parent = mmmodel
            camer.Name = "camer"
        end) then
        game:GetService("Debris"):AddItem(camer, 0)
        camer = Instance.new("Part", mmmodel)
        camer.Anchored = true
        camer.CFrame = mainpos
        camer.Name = "..."
        pcall(function()
            if w or a or s or d then
                torso.CFrame = mainposz * cn(0, 0, 0) * CFrame.Angles(0, math.rad(180-10*math.sin(sine/25)),0)
                head.CFrame = torso.CFrame * cn(0, 1.5, 0)
                rightarm.CFrame =torso.CFrame * cn(1.5, 0, -.9 * math.sin(sine/25)) * CFrame.Angles(math.rad(90*math.sin(sine/25)),0,0)
                leftarm.CFrame = torso.CFrame * cn(-1.5, 0, .9 * math.sin(sine/25)) * CFrame.Angles(math.rad(-90*math.sin(sine/25)),0,0)
                rightleg.CFrame = torso.CFrame * cn(0.5, -2, .76 * math.sin(sine/25)) * CFrame.Angles(math.rad(-76*math.sin(sine/25)),0,0)
                leftleg.CFrame = torso.CFrame * cn(-0.5, -2, -.76 * math.sin(sine/25)) * CFrame.Angles(math.rad(76*math.sin(sine/25)),0,0)
            else
                torso.CFrame = mainposz * cn(0, 0 + 0.5 * math.sin(sine/25), 0) * CFrame.Angles(0, math.rad(180),0)
                head.CFrame = torso.CFrame * cn(0, 1.5, 0) * CFrame.Angles(math.rad(-5 + 10 * math.sin(sine/25)),0,0)
                rightarm.CFrame = torso.CFrame * cn(1.5, 0, 0)
                leftarm.CFrame = torso.CFrame * cn(-1.5, 0, 0)
                rightleg.CFrame =torso.CFrame * cn(0.5, -2- 0.5 * math.sin(sine/25), 0)
                leftleg.CFrame = torso.CFrame * cn(-0.5, -2- 0.5 * math.sin(sine/25), 0)
            end
        end)
        camer.Size = Vector3.new(0,0,0)
        camer.Transparency = 1
    end
    if not torso or not torso.Parent or not pcall(function()
            torso.Parent = mmmodel
            torso.Name = "funny limb"
        end) then
        game:GetService("Debris"):AddItem(torso, 0)
        torso = Instance.new("Part", mmmodel)
        torso.Anchored = true
        torso.CFrame = mainpos
        torso.Name = "funny limb"
        pcall(function()
            if w or a or s or d then
                torso.CFrame = mainposz * cn(0, 0, 0) * CFrame.Angles(0, math.rad(180-10*math.sin(sine/25)),0)
                head.CFrame = torso.CFrame * cn(0, 1.5, 0)
                rightarm.CFrame =torso.CFrame * cn(1.5, 0, -.9 * math.sin(sine/25)) * CFrame.Angles(math.rad(90*math.sin(sine/25)),0,0)
                leftarm.CFrame = torso.CFrame * cn(-1.5, 0, .9 * math.sin(sine/25)) * CFrame.Angles(math.rad(-90*math.sin(sine/25)),0,0)
                rightleg.CFrame = torso.CFrame * cn(0.5, -2, .76 * math.sin(sine/25)) * CFrame.Angles(math.rad(-76*math.sin(sine/25)),0,0)
                leftleg.CFrame = torso.CFrame * cn(-0.5, -2, -.76 * math.sin(sine/25)) * CFrame.Angles(math.rad(76*math.sin(sine/25)),0,0)
            else
                torso.CFrame = mainposz * cn(0, 0 + 0.5 * math.sin(sine/25), 0) * CFrame.Angles(0, math.rad(180),0)
                head.CFrame = torso.CFrame * cn(0, 1.5, 0) * CFrame.Angles(math.rad(-5 + 10 * math.sin(sine/25)),0,0)
                rightarm.CFrame = torso.CFrame * cn(1.5, 0, 0)
                leftarm.CFrame = torso.CFrame * cn(-1.5, 0, 0)
                rightleg.CFrame =torso.CFrame * cn(0.5, -2- 0.5 * math.sin(sine/25), 0)
                leftleg.CFrame = torso.CFrame * cn(-0.5, -2- 0.5 * math.sin(sine/25), 0)
            end
        end)
        torso.Size = Vector3.new(2,2,1)
    end
    if not leftleg or not leftleg.Parent or not pcall(function()
            leftleg.Parent = mmmodel
            leftleg.Name = "funny limb"
        end) then
        game:GetService("Debris"):AddItem(leftleg, 0)
        leftleg = Instance.new("Part", mmmodel)
        leftleg.Anchored = true
        leftleg.CFrame = mainpos
        leftleg.Name = "funny limb"
        pcall(function()
            if w or a or s or d then
                torso.CFrame = mainposz * cn(0, 0, 0) * CFrame.Angles(0, math.rad(180-10*math.sin(sine/25)),0)
                head.CFrame = torso.CFrame * cn(0, 1.5, 0)
                rightarm.CFrame =torso.CFrame * cn(1.5, 0, -.9 * math.sin(sine/25)) * CFrame.Angles(math.rad(90*math.sin(sine/25)),0,0)
                leftarm.CFrame = torso.CFrame * cn(-1.5, 0, .9 * math.sin(sine/25)) * CFrame.Angles(math.rad(-90*math.sin(sine/25)),0,0)
                rightleg.CFrame = torso.CFrame * cn(0.5, -2, .76 * math.sin(sine/25)) * CFrame.Angles(math.rad(-76*math.sin(sine/25)),0,0)
                leftleg.CFrame = torso.CFrame * cn(-0.5, -2, -.76 * math.sin(sine/25)) * CFrame.Angles(math.rad(76*math.sin(sine/25)),0,0)
            else
                torso.CFrame = mainposz * cn(0, 0 + 0.5 * math.sin(sine/25), 0) * CFrame.Angles(0, math.rad(180),0)
                head.CFrame = torso.CFrame * cn(0, 1.5, 0) * CFrame.Angles(math.rad(-5 + 10 * math.sin(sine/25)),0,0)
                rightarm.CFrame = torso.CFrame * cn(1.5, 0, 0)
                leftarm.CFrame = torso.CFrame * cn(-1.5, 0, 0)
                rightleg.CFrame =torso.CFrame * cn(0.5, -2- 0.5 * math.sin(sine/25), 0)
                leftleg.CFrame = torso.CFrame * cn(-0.5, -2- 0.5 * math.sin(sine/25), 0)
            end
        end)
        leftleg.Size = Vector3.new(1,2,1)
    end
    if not rightleg or not rightleg.Parent or not pcall(function()
            rightleg.Parent = mmmodel
            rightleg.Name = "funny limb"
        end) then
        game:GetService("Debris"):AddItem(rightleg, 0)
        rightleg = Instance.new("Part", mmmodel)
        rightleg.Anchored = true
        rightleg.CFrame = mainpos
        rightleg.Name = "funny limb"
        pcall(function()
            if w or a or s or d then
                torso.CFrame = mainposz * cn(0, 0, 0) * CFrame.Angles(0, math.rad(180-10*math.sin(sine/25)),0)
                head.CFrame = torso.CFrame * cn(0, 1.5, 0)
                rightarm.CFrame =torso.CFrame * cn(1.5, 0, -.9 * math.sin(sine/25)) * CFrame.Angles(math.rad(90*math.sin(sine/25)),0,0)
                leftarm.CFrame = torso.CFrame * cn(-1.5, 0, .9 * math.sin(sine/25)) * CFrame.Angles(math.rad(-90*math.sin(sine/25)),0,0)
                rightleg.CFrame = torso.CFrame * cn(0.5, -2, .76 * math.sin(sine/25)) * CFrame.Angles(math.rad(-76*math.sin(sine/25)),0,0)
                leftleg.CFrame = torso.CFrame * cn(-0.5, -2, -.76 * math.sin(sine/25)) * CFrame.Angles(math.rad(76*math.sin(sine/25)),0,0)
            else
                torso.CFrame = mainposz * cn(0, 0 + 0.5 * math.sin(sine/25), 0) * CFrame.Angles(0, math.rad(180),0)
                head.CFrame = torso.CFrame * cn(0, 1.5, 0) * CFrame.Angles(math.rad(-5 + 10 * math.sin(sine/25)),0,0)
                rightarm.CFrame = torso.CFrame * cn(1.5, 0, 0)
                leftarm.CFrame = torso.CFrame * cn(-1.5, 0, 0)
                rightleg.CFrame =torso.CFrame * cn(0.5, -2- 0.5 * math.sin(sine/25), 0)
                leftleg.CFrame = torso.CFrame * cn(-0.5, -2- 0.5 * math.sin(sine/25), 0)
            end
        end)
        rightleg.Size = Vector3.new(1,2,1)
    end
    if not leftarm or not leftarm.Parent or not pcall(function()
            leftarm.Parent = mmmodel
            leftarm.Name = "funny limb"
        end) then
        game:GetService("Debris"):AddItem(leftarm, 0)
        leftarm = Instance.new("Part", mmmodel)
        leftarm.Anchored = true
        leftarm.CFrame = mainpos
        leftarm.Name = "funny limb"
        pcall(function()
            if w or a or s or d then
                torso.CFrame = mainposz * cn(0, 0, 0) * CFrame.Angles(0, math.rad(180-10*math.sin(sine/25)),0)
                head.CFrame = torso.CFrame * cn(0, 1.5, 0)
                rightarm.CFrame =torso.CFrame * cn(1.5, 0, -.9 * math.sin(sine/25)) * CFrame.Angles(math.rad(90*math.sin(sine/25)),0,0)
                leftarm.CFrame = torso.CFrame * cn(-1.5, 0, .9 * math.sin(sine/25)) * CFrame.Angles(math.rad(-90*math.sin(sine/25)),0,0)
                rightleg.CFrame = torso.CFrame * cn(0.5, -2, .76 * math.sin(sine/25)) * CFrame.Angles(math.rad(-76*math.sin(sine/25)),0,0)
                leftleg.CFrame = torso.CFrame * cn(-0.5, -2, -.76 * math.sin(sine/25)) * CFrame.Angles(math.rad(76*math.sin(sine/25)),0,0)
            else
                torso.CFrame = mainposz * cn(0, 0 + 0.5 * math.sin(sine/25), 0) * CFrame.Angles(0, math.rad(180),0)
                head.CFrame = torso.CFrame * cn(0, 1.5, 0) * CFrame.Angles(math.rad(-5 + 10 * math.sin(sine/25)),0,0)
                rightarm.CFrame = torso.CFrame * cn(1.5, 0, 0)
                leftarm.CFrame = torso.CFrame * cn(-1.5, 0, 0)
                rightleg.CFrame =torso.CFrame * cn(0.5, -2- 0.5 * math.sin(sine/25), 0)
                leftleg.CFrame = torso.CFrame * cn(-0.5, -2- 0.5 * math.sin(sine/25), 0)
            end
        end)
        leftarm.Size = Vector3.new(1,2,1)
    end
    if not rightarm or not rightarm.Parent or not pcall(function()
            rightarm.Parent = mmmodel
            rightarm.Name = "funny limb"
        end) then
        game:GetService("Debris"):AddItem(rightarm, 0)
        rightarm = Instance.new("Part", mmmodel)
        rightarm.Anchored = true
        rightarm.CFrame = mainpos
        rightarm.Name = "funny limb"
        pcall(function()
            if w or a or s or d then
                torso.CFrame = mainposz * cn(0, 0, 0) * CFrame.Angles(0, math.rad(180-10*math.sin(sine/25)),0)
                head.CFrame = torso.CFrame * cn(0, 1.5, 0)
                rightarm.CFrame =torso.CFrame * cn(1.5, 0, -.9 * math.sin(sine/25)) * CFrame.Angles(math.rad(90*math.sin(sine/25)),0,0)
                leftarm.CFrame = torso.CFrame * cn(-1.5, 0, .9 * math.sin(sine/25)) * CFrame.Angles(math.rad(-90*math.sin(sine/25)),0,0)
                rightleg.CFrame = torso.CFrame * cn(0.5, -2, .76 * math.sin(sine/25)) * CFrame.Angles(math.rad(-76*math.sin(sine/25)),0,0)
                leftleg.CFrame = torso.CFrame * cn(-0.5, -2, -.76 * math.sin(sine/25)) * CFrame.Angles(math.rad(76*math.sin(sine/25)),0,0)
            else
                torso.CFrame = mainposz * cn(0, 0 + 0.5 * math.sin(sine/25), 0) * CFrame.Angles(0, math.rad(180),0)
                head.CFrame = torso.CFrame * cn(0, 1.5, 0) * CFrame.Angles(math.rad(-5 + 10 * math.sin(sine/25)),0,0)
                rightarm.CFrame = torso.CFrame * cn(1.5, 0, 0)
                leftarm.CFrame = torso.CFrame * cn(-1.5, 0, 0)
                rightleg.CFrame =torso.CFrame * cn(0.5, -2- 0.5 * math.sin(sine/25), 0)
                leftleg.CFrame = torso.CFrame * cn(-0.5, -2- 0.5 * math.sin(sine/25), 0)
            end
        end)
        rightarm.Size = Vector3.new(1,2,1)
    end
    for i,v in pairs(mmmodel:GetDescendants()) do 
        if v:IsA("Part") or v:IsA("MeshPart") then
                v.Material = "Neon"
                v.Reflectance = -1
                v.Color = Color3.fromRGB()
                v.Transparency = 0.2
        end
    end
    local rc = Ray.new(mainpos.p, (CFrame.new(0, -1, 0).p).unit * 4)
    local pos, hit = workspace:FindPartOnRay(rc, mmmodel, false, true)
    if pos ~= nil then
        falling = false
        fallingspeed = 0
        mainpos = mainpos * CFrame.new(0, hit.Y - mainpos.Y + 3, 0)
    else
        falling = true
        fallingspeed = fallingspeed + .06
        mainpos = mainpos - Vector3.new(0, fallingspeed, 0)
    end
    if w or a or s or d then
        mainpos = cn(mainpos.p,v3(CCF.x,mainpos.Y,CCF.z))
    end
    if mainpos.Y <= -200 then
        mainpos *= cn(0, 250, 0)
    end
    if d then
        mainpos = mainpos * CFrame.new(-0.4, 0, 0)
    end
    if s then
        mainpos = mainpos * CFrame.new(0, 0, -0.4)
    end
    if a then
        mainpos = mainpos * CFrame.new(0.4, 0, 0)
    end
    if w then
        mainpos = mainpos * CFrame.new(0, 0, 0.4)
    end
    if math.random(1, 90) == 1 then
        mainposz = mainpos * cn(v3(math.random(-5, 5), math.random(-5, 5), math.random(-5, 5))) * CFrame.Angles(math.rad(math.random(-360, 1)), math.rad(math.random(-360, 1)), math.rad(math.random(-360, 1)))
    else
        mainposz= mainposz:Lerp(mainpos, .25)
    end
    
    if w or a or s or d then
        torso.CFrame = mainposz * cn(0, 0, 0) * CFrame.Angles(0, math.rad(180-10*math.sin(sine/25)),0)
        head.CFrame = torso.CFrame * cn(0, 1.5, 0)
        rightarm.CFrame =torso.CFrame * cn(1.5, 0, -.9 * math.sin(sine/25)) * CFrame.Angles(math.rad(90*math.sin(sine/25)),0,0)
        leftarm.CFrame = torso.CFrame * cn(-1.5, 0, .9 * math.sin(sine/25)) * CFrame.Angles(math.rad(-90*math.sin(sine/25)),0,0)
        rightleg.CFrame = torso.CFrame * cn(0.5, -2, .76 * math.sin(sine/25)) * CFrame.Angles(math.rad(-76*math.sin(sine/25)),0,0)
        leftleg.CFrame = torso.CFrame * cn(-0.5, -2, -.76 * math.sin(sine/25)) * CFrame.Angles(math.rad(76*math.sin(sine/25)),0,0)
    else
        torso.CFrame = mainposz * cn(0, 0 + 0.5 * math.sin(sine/25), 0) * CFrame.Angles(0, math.rad(180),0)
        head.CFrame = torso.CFrame * cn(0, 1.5, 0) * CFrame.Angles(math.rad(-5 + 10 * math.sin(sine/25)),0,0)
        rightarm.CFrame = torso.CFrame * cn(1.5, 0, 0)
        leftarm.CFrame = torso.CFrame * cn(-1.5, 0, 0)
        rightleg.CFrame =torso.CFrame * cn(0.5, -2- 0.5 * math.sin(sine/25), 0)
        leftleg.CFrame = torso.CFrame * cn(-0.5, -2- 0.5 * math.sin(sine/25), 0)
    end
    pcall(function()
        timepos = song.TimePosition
    end)
    pcall(function()
        camer.Transparency = 1
    end)
    camer.CFrame = head.CFrame
    if not song or not song.Parent or not pcall(function()
            song.Name = ""
            song.Volume = 10
            song.Parent = camer
            song.Pitch = 0.9
            song.Playing = true
            song.Looped = true
        end) then
        game:GetService("Debris"):AddItem(song, 0)
        song = Instance.new("Sound")
        song.Parent = camer
        song.SoundId = "rbxassetid://4456917336"
        song.TimePosition = timepos
        song.Playing = true
        song.Looped = true
    end
end)
