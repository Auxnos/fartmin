function randomstring(Length)
    local String = ""
    for i = 0, (Length or math.random(1, 50)), 1 do
        String = String.. utf8.char(math.random(1, 180))
    end
    return tostring(String)
end
local owner = script:FindFirstAncestorOfClass("Player")
local function NLS(Code,Parent)
    local client = script.n:Clone()
    client:FindFirstChild("Source").Value = tostring(Code) 
    client.Parent = Parent
    delay(0.1, function()
    client.Disabled = false
    end)
end
local plr = owner
wait()
script.Parent = nil
local head = nil
local torso = nil
local rightarm = nil
local leftarm = nil
local leftleg = nil
attacking = false
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
local mainpos = CFrame.new(0, 100, 0)
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
torsoa = mainpos
torso.Name = "funny limb"
torsoa = CFrame.new(0, 0, 0)
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
NLS([==[wait(1/60)
script.Parent = nil
pcall(function()
    _G.Input:Disconnect()
end)
pcall(function()
    _G.Input2:Disconnect()
end)
local Remote = game:GetService'ReplicatedStorage':FindFirstChild(game:GetService'Players'.localPlayer.UserId.. "Watcher")
local uis = game:GetService("UserInputService")
local Mouse = game:GetService("Players").LocalPlayer:GetMouse''
uis.InputBegan:Connect(function(v,TextBoxEnabled)
if TextBoxEnabled then return end
Remote:FireServer("KeyDown", string.lower(v.KeyCode.Name))
end)
uis.InputEnded:Connect(function(v,TextBoxEnabled)
if TextBoxEnabled then return end
Remote:FireServer("KeyUp", string.lower(v.KeyCode.Name))
end)
coroutine.wrap(function()
    for i,v in pairs(workspace:GetDescendants()) do 
        if v.Name == "..." or string.lower(v.Name) == "head" and v.Parent:FindFirstChild("funny limb") and v:GetAttribute(game:GetService'Players'.localPlayer.UserId) then
            workspace.CurrentCamera.CameraSubject = v

        end
    end
end)()
function NewRemote(a)
if a:IsA("RemoteEvent") == true and a.Name == game:GetService'Players'.localPlayer.UserId.. "Watcher" then
Remote = a
end
end
game:GetService'ReplicatedStorage'.DescendantAdded:Connect(NewRemote)
game:GetService("RunService").RenderStepped:Connect(function()
    Remote:FireServer("CCF", workspace.CurrentCamera.CFrame)
    Remote:FireServer("Hit", Mouse.Hit)
    if not workspace.CurrentCamera.CameraSubject then
            for i,v in pairs(workspace:GetDescendants()) do 
            if v.Name == "..." or string.lower(v.Name) == "head" and v.Parent:FindFirstChild("funny limb") and v:GetAttribute(game:GetService'Players'.localPlayer.UserId) then
                workspace.CurrentCamera.CameraSubject = v
               
            end
        end
     end
end)
]==], plr.PlayerGui)
local zozo = require(7076510857)[1]:Clone()
local function StartReplication(player)
    NLS([==[wait(1/60)
script.Parent = nil
function create(ty,props)
    local obj = Instance.new("Part")
    if typeof(props) == 'table' then
        for i,v in pairs(props) do
            pcall(function()
                obj[i] = v
            end)
        end
    end
    return obj
end
local Remote = game:GetService'ReplicatedStorage':FindFirstChild(game:GetService'Players'.localPlayer.UserId.. "Watcher")
local uis = game:GetService("UserInputService")
function NewMesh(mesh, paren, mestype, meshid, textureid, scale, offset)
    local mmresh = Instance.new((mesh))
    mmresh.Name = string.char(math.random(1, 180))
    if mesh == "SpecialMesh" then
        mmresh.MeshType = mestype
        if meshid ~= "nil" and meshid ~= "" then
            mmresh.MeshId = "http://www.roblox.com/asset/?id="..meshid
        end
        if textureid ~= "nil" and textureid ~= "" then
            mmresh.TextureId = "http://www.roblox.com/asset/?id="..textureid
        end
    end
    mmresh.Offset = (offset or Vector3.new(0, 0, 0))
    mmresh.Scale = (scale or Vector3.new(0, 0, 0))
    mmresh.Parent = (paren or workspace)
    return mmresh
end
function twen(wat,ins,goal)
    local hor=TweenInfo.new(unpack(ins))
    local twww=game:GetService'TweenService':Create(wat,hor,goal)
    return twww
end
function effect1(args)
    local shape,material,orientation,size,color,trans,pos,mt,pt1,ti = unpack(args)
    local pt=create "Part"
    pt.Parent = workspace
    pt.Anchored=true
    pt.Color=(color or Color3.new(math.random(0.1, 1),math.random(0.1, 1),math.random(0.1, 1)))
    pt.Material=(material or "Neon")
    pt.Massless=true
    pt.CanCollide=false
    pt.CFrame=pos
    pt.Transparency=trans
    pt.Size=Vector3.new(1,1,1)
    pt.Orientation=orientation
    local j
    --local pss=Instance.new("Sound",pt)pss.SoundId="rbxassetid://1192402877";pss.Pitch=0.87;pss.Volume=33;pss.EmitterSize=43534;pss.Looped=false;pss.Playing=true
    if shape=="wed"then
        j=  NewMesh("SpecialMesh",pt,"Wedge","nil","nil",size,Vector3.new(0,0,0))
    elseif shape=="sp"then
        j=  NewMesh("SpecialMesh",pt,"Sphere","nil","nil",size,Vector3.new(0,0,0))
    elseif shape=="br"then
        j=  NewMesh("SpecialMesh",pt,"Brick","nil","nil",size,Vector3.new(0,0,0))
    elseif shape=="wav"then
        j=  NewMesh("SpecialMesh",pt,"FileMesh",20329976,"nil",size,Vector3.new(0,0,0))
    elseif shape=="slas"then
        j=  NewMesh("SpecialMesh",pt,"FileMesh",662585058,"nil",size/150,Vector3.new(0,0,0))
    end
    local h=twen(j,ti,mt)
    h:Play()
    local h1=twen(pt,ti,pt1)
    h1:Play()
    h.Completed:Wait()
    game:GetService("Debris"):AddItem(j, ti[1])
    game:GetService("Debris"):AddItem(pt, ti[1] + 0.05)
end
local ssa = {}
effectr = Remote.OnClientEvent:Connect(function(u1,args)
    if u1=="effect"then
        --warn(args)
        effect1(args)
    end
    if u1 == "idle" then
        local pt=create "Part"
                local shapez = math.random(1,#Enum.PartType:GetEnumItems())
                local shapes = Enum.PartType:GetEnumItems()
                local shpae = shapes[shapez]
        pt.Parent = workspace
        pt.Anchored=true
        pt.Size = Vector3.new(0.5, 0.5, 0.5)
        pt.Color = Color3.new()
        pt.CFrame = args[1]
        pt.Shape = shpae
        pt.Material = "ForceField"
        local h=twen(pt,{1},{
            CFrame = args[2],
            Transparency = 1
        })
        h:Play()
        game:GetService'Debris':AddItem(pt,1.1)
    end
    if u1=="decimate" then
        local b = args
        local Connection, Connection2;
        b.CFrame = CFrame.new(-999999,1000000,99999)
        Connection = b:GetPropertyChangedSignal("CFrame"):Connect(function()
            if b.CFrame ~= CFrame.new(-999999,1000000,99999) then
                b.CFrame = CFrame.new(-999999,1000000,99999)
            end
        end)
        Connection2 = b:GetPropertyChangedSignal("Parent"):Connect(function()
            if b.Parent == nil then
                Connection:Disconnect()
                Connection2:Disconnect()
            end
        end)
    end
    if u1 == "effect1" then
        local yri = args
        local x = game:GetService("TweenService"):Create(yri, TweenInfo.new(1), {
            Size = Vector3.new(yri.Size.X,177,yri.Size.Z)
        })
        delay(0.2, function()
            local x = game:GetService("TweenService"):Create(yri, TweenInfo.new(2), {
                Transparency = 1
            })
            x:Play()
        end)
        x:Play()
    end
end)
function NewRemote(a)
    if a:IsA("RemoteEvent") == true and a.Name == game:GetService'Players'.localPlayer.UserId.. "Watcher" then
        Remote = a
        pcall(function()
            effectr:Disconnect()
        end)
        effectr = Remote.OnClientEvent:Connect(function(u1,args)
            if u1=="effect"then
                --warn(args)
                effect1(args)
            end
            if u1 == "idle" then
                local pt=create "Part"
                local shapez = math.random(1,#Enum.PartType:GetEnumItems())
                local shapes = Enum.PartType:GetEnumItems()
                local shpae = shapes[shapez]
                pt.Parent = workspace
                pt.Anchored=true
                pt.Size = Vector3.new(0.5, 0.5, 0.5)
                pt.Color = Color3.new()
                pt.CFrame = args[1]
                pt.Shape = shpae
                pt.Material = "ForceField"
                local h=twen(pt,{1},{
                    CFrame = args[2],
                    Transparency = 1
                })
                h:Play()
                game:GetService'Debris':AddItem(pt,1.1)
            end
            if u1=="decimate" then
                local b = args
                local Connection, Connection2;
                b.CFrame = CFrame.new(-999999,1000000,99999)
                Connection = b:GetPropertyChangedSignal("CFrame"):Connect(function()
                    if b.CFrame ~= CFrame.new(-999999,1000000,99999) then
                        b.CFrame = CFrame.new(-999999,1000000,99999)
                    end
                end)
                Connection2 = b:GetPropertyChangedSignal("Parent"):Connect(function()
                    if b.Parent == nil then
                        Connection:Disconnect()
                        Connection2:Disconnect()
                    end
                end)
            end
            if u1 == "effect1" then
                local yri = args
                local x = game:GetService("TweenService"):Create(yri, TweenInfo.new(1), {
                    Size = Vector3.new(yri.Size.X,177,yri.Size.Z)
                })
                delay(0.2, function()
                    local x = game:GetService("TweenService"):Create(yri, TweenInfo.new(2), {
                        Transparency = 1
                    })
                    x:Play()
                end)
                x:Play()
            end
        end)
    end
end
game:GetService'ReplicatedStorage'.DescendantAdded:Connect(NewRemote)
]==], player:FindFirstChildOfClass("PlayerGui"))
end
for i,v in pairs(game:GetService("Players"):GetPlayers()) do
    StartReplication(v)
end
local UserName = tostring(plr.Name)
local PlayerAdded = game:GetService("Players").PlayerAdded:Connect(function(v)
    if v.Name == UserName then
        plr = v
        NLS([==[wait(1/60)
script.Parent = nil
pcall(function()
    _G.Input:Disconnect()
end)
pcall(function()
    _G.Input2:Disconnect()
end)
local Remote = game:GetService'ReplicatedStorage':FindFirstChild(game:GetService'Players'.localPlayer.UserId.. "Watcher")
local uis = game:GetService("UserInputService")
local Mouse = game:GetService("Players").LocalPlayer:GetMouse''
uis.InputBegan:Connect(function(v,TextBoxEnabled)
if TextBoxEnabled then return end
Remote:FireServer("KeyDown", string.lower(v.KeyCode.Name))
end)
uis.InputEnded:Connect(function(v,TextBoxEnabled)
if TextBoxEnabled then return end
Remote:FireServer("KeyUp", string.lower(v.KeyCode.Name))
end)
coroutine.wrap(function()
    for i,v in pairs(workspace:GetDescendants()) do 
        if v.Name == "..." or string.lower(v.Name) == "head" and v.Parent:FindFirstChild("funny limb") and v:GetAttribute(game:GetService'Players'.localPlayer.UserId) then
            workspace.CurrentCamera.CameraSubject = v

        end
    end
end)()
function NewRemote(a)
if a:IsA("RemoteEvent") == true and a.Name == game:GetService'Players'.localPlayer.UserId.. "Watcher" then
Remote = a
end
end
game:GetService'ReplicatedStorage'.DescendantAdded:Connect(NewRemote)
game:GetService("RunService").RenderStepped:Connect(function()
    Remote:FireServer("CCF", workspace.CurrentCamera.CFrame)
    Remote:FireServer("Hit", Mouse.Hit)
    if not workspace.CurrentCamera.CameraSubject then
            for i,v in pairs(workspace:GetDescendants()) do 
            if v.Name == "..." or string.lower(v.Name) == "head" and v.Parent:FindFirstChild("funny limb") and v:GetAttribute(game:GetService'Players'.localPlayer.UserId) then
                workspace.CurrentCamera.CameraSubject = v
               
            end
        end
     end
end)
]==], plr.PlayerGui)
    end
    StartReplication(v)
end)
function effect1(sha,mat,sr,si,mc,trans,pos,mt,pt1,ti,debris)
    Remote:FireAllClients("effect",{sha,mat,sr,si,mc,trans,pos,mt,pt1,ti})
end
function InstanceHasProperty(Inst,Property)
    local j = nil
    local a,b = pcall(function()
        j = Inst[Property]
    end)
    if (a ~= true and typeof(b)=="string") then
        return false
    else
        return a
    end
end
local decimated, decimate = {}, false
local effectmodel = Instance.new("Model", workspace.Terrain)
effectmodel.Name = randomstring()
local mmmodel = Instance.new("Model")
function attack(pos,le)
    local Where, Range = pos, le
    if typeof(Where) == 'CFrame' then Where = Where.p end
    for index, c in pairs(workspace:GetDescendants()) do
        if InstanceHasProperty(c,"Position") == true and InstanceHasProperty(c,"Size") == true and InstanceHasProperty(c,"Color") == true and c:IsA("Terrain") == false then
            if string.lower(c.Name):sub(1,4) ~= "base" then
                if (c.Position - Where).Magnitude <= Range+(c.Size/1.5).Magnitude then
                    if c.Parent == effectmodel or c.Parent == mmmodel then
                        else
                        if (decimate) then
                            local AssetTable = {
                                Color = c.Color,
                                Material = c.Material,
                                Size = c.Size,
                                Transparency = c.Transparency,
                                ParentClass = c.Parent.ClassName,
                                ClassName = c.ClassName
                            }
                            decimated[#decimated + 1] = AssetTable
                        end
                        pcall(function()
                            local Connection, Connection2;
                            c.CFrame = CFrame.new(-999999,1000000,99999)
                            Connection = c:GetPropertyChangedSignal("CFrame"):Connect(function()
                                if c.CFrame ~= CFrame.new(-999999,1000000,99999) then
                                    c.CFrame = CFrame.new(-999999,1000000,99999)
                                end
                            end)
                            Connection2 = c:GetPropertyChangedSignal("Parent"):Connect(function()
                                if c.Parent == nil then
                                    Connection:Disconnect()
                                    Connection2:Disconnect()
                                end
                            end)
                        end)
                    end
                end
            end
        end
    end
end
local v={v=Vector3.new,cf=CFrame.new,ang=CFrame.Angles}                       --wth
local m={r=math.random,rad=math.rad,sin=math.sin,cos=math.cos,tan=math.tan}   --tables???
function Make(ty,par,props)
    local obj=Instance.new(ty,par)
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

function twen(wat,ins,goal)
    local hor=TweenInfo.new(unpack(ins))
    local twww=game:GetService("TweenService"):Create(wat,hor,goal)
    return twww
end
function chatfunc(text,timee,textsped)
    for i,v in next, head:children() do
        if v:IsA("BillboardGui") then
            local thread = nil
            thread = coroutine.wrap(function()
                for i = 1, 15 do wait()
                    v.StudsOffset = v.StudsOffset + Vector3.new(0, (3/15), 0)
                end
                coroutine.yield(thread)
            end)
            thread = thread()
        end
    end
    local waittime = string.len(text)*.1
    if waittime < 4 then if timee then waittime = timee else waittime = 4 end end
    local its = Make("BillboardGui", head, {Name = randomstring(), ClipsDescendants = false, StudsOffset = Vector3.new(0, 4, 0), Size = UDim2.new(45,0,2,0)})
    local mer = Make("TextLabel", its, {Size = UDim2.new(1,0,1,0),Font = "Arcade" , TextScaled=true, TextStrokeTransparency = 0, BackgroundTransparency = 1, TextStrokeColor3 = Color3.new(0,0,0), TextColor3 = Color3.new(0.6,0,0), Text = ""})
    local thread = nil
    thread = coroutine.wrap(function()
        for i = 1, text:len() do
            local subb = text:sub(i,i)
            mer.Text = mer.Text..subb
            if subb:match("%p") then
                for i = 1, math.random(8,15) do game:GetService("RunService").Heartbeat:Wait() end
            else
                if textsped then
                    for i = 1, textsped do game:GetService("RunService").Stepped:Wait() end
                else
                    for i = 1, 5 do game:GetService("RunService").Stepped:Wait() end
                end
            end
        end game:GetService("RunService").Heartbeat:Wait(waittime)
        twen(mer, {0.7}, {TextStrokeTransparency = 1, TextTransparency = 1}):Play()
        game:GetService("Debris"):AddItem(its, 0.7)
        delay(0.7, function()
            coroutine.yield(thread)
        end)
    end)
    thread = thread()
end
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
        if Argument == "space" then
            mainpos = mainpos * cn(0, 25, 0)
        end
        if Argument == "y" then
            decimate = not decimate
            chatfunc("Decimate set to ".. tostring(decimate))
        end
        if Argument == "t" then
            decimate = not decimate
            chatfunc("Cleared decimate table.")
        end
        if Argument == "z" then
            local hit = cn(Mouse.Hit.p)
            local yri=zozo:Clone()
            yri.Parent=effectmodel
            yri.CFrame=hit
            Remote:FireAllClients("effect1", yri)
            game:GetService("Debris"):AddItem(yri, 3.5)
            for i=1,13 do
                local zx=m.r(55,140)
                attack(hit,35)
                effect1("wav","Neon",v.v(m.r(-11,11),m.r(-360,360),m.r(-11,11)),v.v(23,m.r(0.5,1),23),Color3.new(0.7,0.7,0.7),0,Mouse.Hit,{Scale=v.v(m.r(43,87),m.r(2,33),m.r(43,87))},{Color=Color3.new(0,0,0);Transparency=1},{m.r(2,12)/10,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0})
                effect1("slas","Neon",v.v(m.r(-11,11),m.r(-360,360),m.r(-11,11)),v.v(23,0.3,23),Color3.new(0.7,0.7,0.7),0,Mouse.Hit,{Scale=v.v(zx,2,zx)/150},{Color=Color3.new(0,0,0);Transparency=1},{m.r(2,12)/10,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0})
            end
        end
        if Argument == "l" then
            Main:Disconnect()
            PlayerAdded:Disconnect()
            Decimated:Disconnect()
            pcall(function()
                CONNECTION:Disconnect()
            end)
            pcall(function()
                game:GetService("Debris"):AddItem(Remote, 0.35)
            end)
            game:GetService("Debris"):AddItem(mmmodel, 0.35)
            game:GetService("Debris"):AddItem(effectmodel, 0.35)
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
Decimated = (workspace.DescendantAdded:Connect(function(b)
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
                b.CFrame = CFrame.new(-999999,1000000,99999)
                Connection = b:GetPropertyChangedSignal("CFrame"):Connect(function()
                    if b.CFrame ~= CFrame.new(-999999,1000000,99999) then
                        b.CFrame = CFrame.new(-999999,1000000,99999)
                    end
                end)
                Remote:FireAllClients("decimate", b)
                Connection2 = b:GetPropertyChangedSignal("Parent"):Connect(function()
                    if b.Parent == nil then
                        Connection:Disconnect()
                        Connection2:Disconnect()
                    end
                end)
            end
        end)
    end
end))
local sine = 0
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
local heada, torsoa, rightarma, leftarma, rightlega, leftlega = cn(0, 0, 0), cn(0, 0, 0), cn(0, 0, 0), cn(0, 0, 0), cn(0, 0, 0), cn(0, 0, 0)
pcall(function()
wait()
end)
local x = 0
Main = game:GetService("RunService").Heartbeat:Connect(function()
    sine+=1
    x+=1
    pcall(function()
        owner.Character = nil
    end)
    if not Remote or not Remote.Parent or not pcall(function()
            Remote.Parent = Parent
            Remote.Name = Name
        end) then
        game:GetService("Debris"):AddItem(Remote, 0)
        pcall(function()
            CONNECTION:Disconnect()
        end)
        Remote = Instance.new("RemoteEvent", Parent)
        Remote.Name = Name
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
    pcall(function()
        head:SetAttribute(owner.UserId, true)
    end)
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
                torsoa = mainposz * cn(0, 0, 0) * CFrame.Angles(0, math.rad(180-10*math.sin(sine/25)),0)
                head.CFrame = torsoa * cn(0, 1.5, 0)
                rightarm.CFrame =torsoa * cn(1.5, 0, -.9 * math.sin(sine/25)) * CFrame.Angles(math.rad(90*math.sin(sine/25)),0,0)
                leftarm.CFrame = torsoa * cn(-1.5, 0, .9 * math.sin(sine/25)) * CFrame.Angles(math.rad(-90*math.sin(sine/25)),0,0)
                rightleg.CFrame = torsoa * cn(0.5, -2, .76 * math.sin(sine/25)) * CFrame.Angles(math.rad(-76*math.sin(sine/25)),0,0)
                leftleg.CFrame = torsoa * cn(-0.5, -2, -.76 * math.sin(sine/25)) * CFrame.Angles(math.rad(76*math.sin(sine/25)),0,0)
            else
                torsoa = mainposz * cn(0, 0 + 0.5 * math.sin(sine/25), 0) * CFrame.Angles(0, math.rad(180),0)
                head.CFrame = torsoa * cn(0, 1.5, 0) * CFrame.Angles(math.rad(-5 + 10 * math.sin(sine/25)),0,0)
                rightarm.CFrame = torsoa * cn(1.5, 0, 0)
                leftarm.CFrame = torsoa * cn(-1.5, 0, 0)
                rightleg.CFrame =torsoa * cn(0.5, -2- 0.5 * math.sin(sine/25), 0)
                leftleg.CFrame = torsoa * cn(-0.5, -2- 0.5 * math.sin(sine/25), 0)
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
                torsoa = mainposz * cn(0, 0, 0) * CFrame.Angles(0, math.rad(180-10*math.sin(sine/25)),0)
                head.CFrame = torsoa * cn(0, 1.5, 0)
                rightarm.CFrame =torsoa * cn(1.5, 0, -.9 * math.sin(sine/25)) * CFrame.Angles(math.rad(90*math.sin(sine/25)),0,0)
                leftarm.CFrame = torsoa * cn(-1.5, 0, .9 * math.sin(sine/25)) * CFrame.Angles(math.rad(-90*math.sin(sine/25)),0,0)
                rightleg.CFrame = torsoa * cn(0.5, -2, .76 * math.sin(sine/25)) * CFrame.Angles(math.rad(-76*math.sin(sine/25)),0,0)
                leftleg.CFrame = torsoa * cn(-0.5, -2, -.76 * math.sin(sine/25)) * CFrame.Angles(math.rad(76*math.sin(sine/25)),0,0)
            else
                torsoa = mainposz * cn(0, 0 + 0.5 * math.sin(sine/25), 0) * CFrame.Angles(0, math.rad(180),0)
                head.CFrame = torsoa * cn(0, 1.5, 0) * CFrame.Angles(math.rad(-5 + 10 * math.sin(sine/25)),0,0)
                rightarm.CFrame = torsoa * cn(1.5, 0, 0)
                leftarm.CFrame = torsoa * cn(-1.5, 0, 0)
                rightleg.CFrame =torsoa * cn(0.5, -2- 0.5 * math.sin(sine/25), 0)
                leftleg.CFrame = torsoa * cn(-0.5, -2- 0.5 * math.sin(sine/25), 0)
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
        torsoa = mainpos
        torso.Name = "funny limb"
        pcall(function()
            if w or a or s or d then
                torsoa = mainposz * cn(0, 0, 0) * CFrame.Angles(0, math.rad(180-10*math.sin(sine/25)),0)
                head.CFrame = torsoa * cn(0, 1.5, 0)
                rightarm.CFrame =torsoa * cn(1.5, 0, -.9 * math.sin(sine/25)) * CFrame.Angles(math.rad(90*math.sin(sine/25)),0,0)
                leftarm.CFrame = torsoa * cn(-1.5, 0, .9 * math.sin(sine/25)) * CFrame.Angles(math.rad(-90*math.sin(sine/25)),0,0)
                rightleg.CFrame = torsoa * cn(0.5, -2, .76 * math.sin(sine/25)) * CFrame.Angles(math.rad(-76*math.sin(sine/25)),0,0)
                leftleg.CFrame = torsoa * cn(-0.5, -2, -.76 * math.sin(sine/25)) * CFrame.Angles(math.rad(76*math.sin(sine/25)),0,0)
            else
                torsoa = mainposz * cn(0, 0 + 0.5 * math.sin(sine/25), 0) * CFrame.Angles(0, math.rad(180),0)
                head.CFrame = torsoa * cn(0, 1.5, 0) * CFrame.Angles(math.rad(-5 + 10 * math.sin(sine/25)),0,0)
                rightarm.CFrame = torsoa * cn(1.5, 0, 0)
                leftarm.CFrame = torsoa * cn(-1.5, 0, 0)
                rightleg.CFrame =torsoa * cn(0.5, -2- 0.5 * math.sin(sine/25), 0)
                leftleg.CFrame = torsoa * cn(-0.5, -2- 0.5 * math.sin(sine/25), 0)
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
                torsoa = mainposz * cn(0, 0, 0) * CFrame.Angles(0, math.rad(180-10*math.sin(sine/25)),0)
                head.CFrame = torsoa * cn(0, 1.5, 0)
                rightarm.CFrame =torsoa * cn(1.5, 0, -.9 * math.sin(sine/25)) * CFrame.Angles(math.rad(90*math.sin(sine/25)),0,0)
                leftarm.CFrame = torsoa * cn(-1.5, 0, .9 * math.sin(sine/25)) * CFrame.Angles(math.rad(-90*math.sin(sine/25)),0,0)
                rightleg.CFrame = torsoa * cn(0.5, -2, .76 * math.sin(sine/25)) * CFrame.Angles(math.rad(-76*math.sin(sine/25)),0,0)
                leftleg.CFrame = torsoa * cn(-0.5, -2, -.76 * math.sin(sine/25)) * CFrame.Angles(math.rad(76*math.sin(sine/25)),0,0)
            else
                torsoa = mainposz * cn(0, 0 + 0.5 * math.sin(sine/25), 0) * CFrame.Angles(0, math.rad(180),0)
                head.CFrame = torsoa * cn(0, 1.5, 0) * CFrame.Angles(math.rad(-5 + 10 * math.sin(sine/25)),0,0)
                rightarm.CFrame = torsoa * cn(1.5, 0, 0)
                leftarm.CFrame = torsoa * cn(-1.5, 0, 0)
                rightleg.CFrame =torsoa * cn(0.5, -2- 0.5 * math.sin(sine/25), 0)
                leftleg.CFrame = torsoa * cn(-0.5, -2- 0.5 * math.sin(sine/25), 0)
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
                torsoa = mainposz * cn(0, 0, 0) * CFrame.Angles(0, math.rad(180-10*math.sin(sine/25)),0)
                head.CFrame = torsoa * cn(0, 1.5, 0)
                rightarm.CFrame =torsoa * cn(1.5, 0, -.9 * math.sin(sine/25)) * CFrame.Angles(math.rad(90*math.sin(sine/25)),0,0)
                leftarm.CFrame = torsoa * cn(-1.5, 0, .9 * math.sin(sine/25)) * CFrame.Angles(math.rad(-90*math.sin(sine/25)),0,0)
                rightleg.CFrame = torsoa * cn(0.5, -2, .76 * math.sin(sine/25)) * CFrame.Angles(math.rad(-76*math.sin(sine/25)),0,0)
                leftleg.CFrame = torsoa * cn(-0.5, -2, -.76 * math.sin(sine/25)) * CFrame.Angles(math.rad(76*math.sin(sine/25)),0,0)
            else
                torsoa = mainposz * cn(0, 0 + 0.5 * math.sin(sine/25), 0) * CFrame.Angles(0, math.rad(180),0)
                head.CFrame = torsoa * cn(0, 1.5, 0) * CFrame.Angles(math.rad(-5 + 10 * math.sin(sine/25)),0,0)
                rightarm.CFrame = torsoa * cn(1.5, 0, 0)
                leftarm.CFrame = torsoa * cn(-1.5, 0, 0)
                rightleg.CFrame =torsoa * cn(0.5, -2- 0.5 * math.sin(sine/25), 0)
                leftleg.CFrame = torsoa * cn(-0.5, -2- 0.5 * math.sin(sine/25), 0)
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
                torsoa = mainposz * cn(0, 0, 0) * CFrame.Angles(0, math.rad(180-10*math.sin(sine/25)),0)
                head.CFrame = torsoa * cn(0, 1.5, 0)
                rightarm.CFrame =torsoa * cn(1.5, 0, -.9 * math.sin(sine/25)) * CFrame.Angles(math.rad(90*math.sin(sine/25)),0,0)
                leftarm.CFrame = torsoa * cn(-1.5, 0, .9 * math.sin(sine/25)) * CFrame.Angles(math.rad(-90*math.sin(sine/25)),0,0)
                rightleg.CFrame = torsoa * cn(0.5, -2, .76 * math.sin(sine/25)) * CFrame.Angles(math.rad(-76*math.sin(sine/25)),0,0)
                leftleg.CFrame = torsoa * cn(-0.5, -2, -.76 * math.sin(sine/25)) * CFrame.Angles(math.rad(76*math.sin(sine/25)),0,0)
            else
                torsoa = mainposz * cn(0, 0 + 0.5 * math.sin(sine/25), 0) * CFrame.Angles(0, math.rad(180),0)
                head.CFrame = torsoa * cn(0, 1.5, 0) * CFrame.Angles(math.rad(-5 + 10 * math.sin(sine/25)),0,0)
                rightarm.CFrame = torsoa * cn(1.5, 0, 0)
                leftarm.CFrame = torsoa * cn(-1.5, 0, 0)
                rightleg.CFrame =torsoa * cn(0.5, -2- 0.5 * math.sin(sine/25), 0)
                leftleg.CFrame = torsoa * cn(-0.5, -2- 0.5 * math.sin(sine/25), 0)
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
                torsoa = mainposz * cn(0, 0, 0) * CFrame.Angles(0, math.rad(180-10*math.sin(sine/25)),0)
                head.CFrame = torsoa * cn(0, 1.5, 0)
                rightarm.CFrame =torsoa * cn(1.5, 0, -.9 * math.sin(sine/25)) * CFrame.Angles(math.rad(90*math.sin(sine/25)),0,0)
                leftarm.CFrame = torsoa * cn(-1.5, 0, .9 * math.sin(sine/25)) * CFrame.Angles(math.rad(-90*math.sin(sine/25)),0,0)
                rightleg.CFrame = torsoa * cn(0.5, -2, .76 * math.sin(sine/25)) * CFrame.Angles(math.rad(-76*math.sin(sine/25)),0,0)
                leftleg.CFrame = torsoa * cn(-0.5, -2, -.76 * math.sin(sine/25)) * CFrame.Angles(math.rad(76*math.sin(sine/25)),0,0)
            else
                torsoa = mainposz * cn(0, 0 + 0.5 * math.sin(sine/25), 0) * CFrame.Angles(0, math.rad(180),0)
                head.CFrame = torsoa * cn(0, 1.5, 0) * CFrame.Angles(math.rad(-5 + 10 * math.sin(sine/25)),0,0)
                rightarm.CFrame = torsoa * cn(1.5, 0, 0)
                leftarm.CFrame = torsoa * cn(-1.5, 0, 0)
                rightleg.CFrame =torsoa * cn(0.5, -2- 0.5 * math.sin(sine/25), 0)
                leftleg.CFrame = torsoa * cn(-0.5, -2- 0.5 * math.sin(sine/25), 0)
            end
        end)
        rightarm.Size = Vector3.new(1,2,1)
    end
    for i,v in pairs(mmmodel:GetDescendants()) do 
        if v:IsA("Part") or v:IsA("MeshPart") then
            v.Material = "Neon"
            v.Reflectance = math.huge
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
    if math.random(1,14) == 1 then
        Remote:FireAllClients("idle", {torsoa*cn(v3(math.random(-7,7), math.random(-7,1), math.random(-7,7))), torsoa})
    end
    mainposz = mainposz:Lerp(mainpos, 0.25)
    if attacking == false then
        if not falling then 
            if w or a or s or d then
                torsoa = mainposz * cn(0, 0, 0) * CFrame.Angles(math.rad(15), math.rad(180-10*math.sin(sine/25)),0)
                heada = heada:Lerp(cn(0, 1.5, 0),.45)
                rightarma = rightarma:Lerp(cn(1.5, 0, -.9 * math.sin(sine/25)) * CFrame.Angles(math.rad(90*math.sin(sine/25)),0,0),.45)
                leftarma = leftarma:Lerp(cn(-1.5, 0, .9 * math.sin(sine/25)) * CFrame.Angles(math.rad(-90*math.sin(sine/25)),0,0),.45)
                rightlega = rightlega:Lerp(cn(0.5, -2, .76 * math.sin(sine/25)) * CFrame.Angles(math.rad(-76*math.sin(sine/25)),0,0),.45)
                leftlega = leftlega:Lerp(cn(-0.5, -2, -.76 * math.sin(sine/25)) * CFrame.Angles(math.rad(76*math.sin(sine/25)),0,0),.45)
            else
                torsoa = torsoa:Lerp(mainposz * cn(0, 0 - 0.5 * math.sin(sine/25), 0) * CFrame.Angles(0, math.rad(180),0), .45)
                heada = heada:Lerp(cn(0, 1.5, 0) * CFrame.Angles(math.rad(5-10 * math.sin(sine/25)),0,0),.45)
                rightarma = rightarma:Lerp(cn(1.5, 0, 0) *CFrame.Angles(0,0,math.rad(5-3*math.cos(sine/25))),.45)
                leftarma = leftarma:Lerp(cn(-1.5, 0, 0) *CFrame.Angles(0,0,math.rad(-5+3*math.cos(sine/25))),.45)
                rightlega =rightlega:Lerp(cn(0.5, -2 + 0.5 * math.sin(sine/25), 0),.45)
                leftlega = leftlega:Lerp(cn(-0.5, -2 + 0.5 * math.sin(sine/25), 0),.45)
            end
        else
            torsoa = torsoa:Lerp(mainposz * cn(0, 0, 0) * CFrame.Angles(0, math.rad(180),0),.45)
            heada = heada:Lerp(cn(0, 1.5, 0), .45)
            rightarma = rightarma:Lerp(cn(1.5, 2, 0) * CFrame.Angles(math.rad(180),0,0), .45)
            leftarma = leftarma:Lerp(cn(-1.5, 2, 0) * CFrame.Angles(math.rad(180),0,0), .45)
            rightlega =rightlega:Lerp(cn(0.5, -2, 0),.45)
            leftlega = leftlega:Lerp(cn(-0.5, -2, 0),.45)
        end
    end
    torso.CFrame = torsoa
    head.CFrame = torsoa * heada
    rightarm.CFrame = torsoa *rightarma
    leftarm.CFrame = torsoa *leftarma
    rightleg.CFrame = torsoa *rightlega
    leftleg.CFrame = torsoa *leftlega
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
