char = owner.Character 
COS = math.cos
SIN = math.sin
local SINE= 0
RAD = math.rad
for _,v in pairs(owner:GetDescendants()) do if v.Name == "Remote" or v.Name == "MouseEvent" then v:Destroy() end end
task.wait()
local sn = 0
removed = nil
owner.CharacterRemoving:connect(function()
    delay(0,function()
        pcall(function()
            removed:Disconnect()
        end)
    end)
end)
owner.CharacterAdded:connect(function(newchar)
    char = newchar
    delay(0,function()
        pcall(function()
            removed:Disconnect()
        end)
        for _,v in next, char:GetDescendants() do 
            if v:IsA("Motor6D") then 
                v.C0 = CFrame.new(CFrame.new(v.C0.X*0.5, v.C0.Y*0.5, v.C0.Z*0.5).p)
                v.C1 = CFrame.new(CFrame.new(v.C1.X*0.5, v.C1.Y*0.5, v.C1.Z*0.5).p)
                v.Part1.Size *= 0.5
            elseif v:IsA("Accessory") then
                BasePart = v:FindFirstChildOfClass("Part")
                BasePart.Size *= 0.5
                pcall(function()
                    BasePart:FindFirstChildOfClass("SpecialMesh").Scale *= 0.5
                end)
                Weld = BasePart:FindFirstChildOfClass("Weld")
                Weld.C0 = CFrame.new(CFrame.new(Weld.C0.X*0.5, Weld.C0.Y*0.5, Weld.C0.Z*0.5).p)
                Weld.C1 = CFrame.new(CFrame.new(Weld.C1.X*0.5, Weld.C1.Y*0.5, Weld.C1.Z*0.5).p)
            elseif v.Name == "Animate" or v.Name == "Animator" then
                pcall(v.Destroy,v)
            elseif v.Name == "HumanoidRootPart" then
                v.Size *= 0.5
            elseif v.Name == "Humanoid" then
                task.spawn(function()
                    while v:IsDescendantOf(game) do
                        sn += 3
                        task.wait()
                        v.Parent:FindFirstChild("HumanoidRootPart").RootJoint.Enabled = false
                        v.Parent.Torso.Anchored = true
                        v.Parent.Torso.CFrame = v.Parent.HumanoidRootPart.CFrame * CFrame.new(-1.35 * COS(sn / 30), -2 + 0.7 * SIN(sn / 90), 0 + 2 * SIN(sn / 40)) * CFrame.Angles(RAD(0 + 5 * SIN(sn / 60)), RAD(-0 + 7 * SIN(sn / 60)), RAD(-0 + 7 * SIN(sn / 60)))
                    end
                end)
            end 
        end
    end)
end)
Remote = Instance.new("RemoteEvent",owner)
Remote.Name = "Remote"
local Sounds = {"rbxassetid://5088562453","rbxassetid://5170646860","rbxassetid://233850204","rbxassetid://3660329829","rbxassetid://2360574256"}
Song = Sounds[math.random(1,#Sounds)]
local atacc
local Mouse = {Hit=CFrame.new(0,0,0),Target=nil}
Mouse.Button1Down = Instance.new("BindableEvent",owner)
Mouse.Button1Down.Name = "MouseEvent"
Mouse.KeyDown = Instance.new("BindableEvent",owner)
Mouse.KeyDown.Name = "MouseEvent"
Mouse.KeyUp = Instance.new("BindableEvent",owner)
Mouse.KeyUp.Name = "MouseEvent"
Remote.OnServerEvent:connect(function(pl,m,a,b)
    if m == "stuff" then
        pcall(function()
            owner.Character.HumanoidRootPart.Anchored = true
            owner.Character.HumanoidRootPart.CFrame = a
            MainPos = a
        end)
    elseif m == "mouse" then
        Mouse.Hit,Mouse.Target = a,b
    elseif m == "button1down" then
        Mouse.Button1Down:Fire(a)
    elseif m == "keydown" then
        Mouse.KeyDown:Fire(a)
    elseif m == "keyup" then
        Mouse.KeyUp:Fire()
    elseif m == "Song" then
        Song = Sounds[math.random(1,#Sounds)]
    end
end)
Mouse.Button1Down.Event:Connect(function()
    local Part = Instance.new("Part")
    Part.Size = Vector3.new(5,0,5)
    Part.CanCollide = true
    Part.Anchored = true
    Part.CFrame = CFrame.new(Mouse.Hit.p)
    Part.Material = "Slate"
    Part.Color = Color3.fromRGB(105, 64, 40)
    Part.Parent = workspace.Terrain
    local pos  = CFrame.new(Mouse.Hit.p).p
    for _,v in pairs(workspace:GetDescendants()) do
        pcall(function()
            if v.Name:sub(1,4):lower() ~= "base" and v ~= Part then
                if (v.Position - pos).Magnitude <= 5 then
                    local CFrameChanged = v:GetPropertyChangedSignal("CFrame"):Connect(function()
                        if v.CFrame ~= CFrame.new(0,9e9,0) then
                            v.CFrame = CFrame.new(0,9e9,0)
                        end
                    end)
                    v.CFrame = CFrame.new(0,9e9,0)
                    v.Anchored = true
                    local AncestryChanged
                    AncestryChanged = v.AncestryChanged:Connect(function(v)
                        if v.Parent ~= workspace then
                            CFrameChanged:Disconnect()
                            AncestryChanged:Disconnect()
                        end
                    end)
                end
            end
        end)
    end
    task.spawn(function()
        tween1 = game:GetService("TweenService"):Create(Part,TweenInfo.new(1),{
            Size = Vector3.new(15,200,15)
        })
        tween1:Play()
        tween1.Completed:Wait()
        task.wait()
        wait(1)
        tween1 = game:GetService("TweenService"):Create(Part,TweenInfo.new(1),{
            Transparency = 1
        })
        tween1:Play()
        tween1.Completed:Wait()
        game:GetService("Debris"):AddItem(Part,0)
    end)
end)
zhold = false
Mouse.KeyUp.Event:Connect(function(Key)
    if Key == "z" then
        zhold = false
    end
end)
Mouse.KeyDown.Event:Connect(function(Key)
    if Key == "z" then
        if zhold then return end
        zhold = true
        task.spawn(function()
            Part = Instance.new("Part")
            Part.Size = Vector3.new(5,0,5)
            Part.CanCollide = true
            Part.Anchored = true
            Part.CFrame = CFrame.new(Mouse.Hit.p)
            Part.Material = "Slate"
            Part.Color = Color3.fromRGB(105, 64, 40)
            Part.Parent = workspace.Terrain
            repeat
                Dist = 2048
                task.wait()
                if not Part or not pcall(function()
                        Part.Size = Vector3.new(5,5,2048)
                        Part.CanCollide = true
                        Part.Anchored = true
                        Part.CFrame = CFrame.new(owner.Character.Torso.CFrame,Mouse.Hit.p)*CFrame.new(0,0,-Dist/2)
                        Part.Material = "Slate"
                        Part.Color = Color3.fromRGB(105, 64, 40)
                        Part.Parent = workspace.Terrain
                    end) then
                    game:GetService("Debris"):AddItem(Part,0)
                    Part = Instance.new("Part")
                    Part.Size = Vector3.new(5,0,5)
                    Part.CanCollide = true
                    Part.Anchored = true
                    Part.CFrame = CFrame.new(Mouse.Hit.p)
                    Part.Material = "Slate"
                    Part.Color = Color3.fromRGB(105, 64, 40)
                    Part.Parent = workspace.Terrain
                end
            until not zhold
            if Part then
                game:GetService("Debris"):AddItem(Part,2.5)
                game:GetService("TweenService"):Create(Part,TweenInfo.new(1),{
                    Size = Vector3.new(0,0,2048),
                    Transparency = 1
                }):Play()
            end
        end)
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
        task.spawn(function()
    owner.Remote:FireServer("keydown",Input.KeyCode.Name:lower())
    end)
    if Input.UserInputType == Enum.UserInputType.MouseButton1 then
    task.spawn(function()
    owner.Remote:FireServer("button1down")
    end)
    end
    if Input.KeyCode == Enum.KeyCode.F then
        FlyMode = not FlyMode
    end
        if Input.KeyCode == Enum.KeyCode.N then
        task.spawn(function()
        owner.Remote:FireServer("Song")
        end)
    end
end)
game:GetService'UserInputService'.InputEnded:Connect(function(Input,sa)
if sa then return end
        task.spawn(function()
    owner.Remote:FireServer("keyup",Input.KeyCode.Name:lower())
    end)
end)
warn("same")

game:GetService("RunService").RenderStepped:Connect(function()
    MouseProps.FilterType = Enum.RaycastFilterType.Blacklist
    pcall(function()
    owner.Remote:FireServer("mouse",Hit,Target)
    end)
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
FlyMode = true
    pcall(function()
        workspace:FindFirstChild(LocalPlayer.Name).Humanoid.walkspeed = 0
    end)
    pcall(function()
        game:GetService'TweenService':Create(CFrameValue,TweenInfo.new(0.1),{
            Value = mainpos
        }):Play()
        owner.Remote:FireServer("stuff",CFrameValue.Value,Moving)
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
Aura = Instance.new("ParticleEmitter",workspace.Terrain)
song = Instance.new("Sound",workspace)
local CF,ANGLES = CFrame.new,CFrame.Angles
local ROOTC0 = CF(0, 0, 0) * ANGLES(RAD(-90), RAD(0), RAD(-180))
local NECKC0 = CF(0, 1, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local RIGHTSHOULDERC0 = CF(1, 0.5, 0) * ANGLES(RAD(0), RAD(90), RAD(0))
local LEFTSHOULDERC0 = CF(-1, 0.5, 0) * ANGLES(RAD(0), RAD(-90), RAD(0))
function Clerp(x,y,z)
    return x:Lerp(y,math.floor(z))
end
game:GetService("RunService").Stepped:Connect(function()
    pcall(function()
        timepos = song.TimePosition
    end)
    SINE += 1
    if not Aura or not pcall(function()
            Aura.Parent = owner.Character.Torso
            if not vis then
                Aura.Color = ColorSequence.new(Color3.fromRGB(255,255,255),Color3.fromRGB(0,0,0))
            else
                Aura.Color = ColorSequence.new(owner.Character.Torso.Color,Color3.fromRGB(0,0,0))
            end
            Aura.Texture = "rbxassetid://6883806180"
            Aura.ZOffset = 2
            Aura.Transparency = NumberSequence.new(0,1,0 ,0.097589, 0.96875,0, 0.36969, 0.94375, 0, 0.839265, 0.975, 0, 1, 1, 0)
            Aura.Size = NumberSequence.new(0,0.6,0.61,0.62,0.62,0.62,0.62,0.62,0.62,0.62,0.62,0.62,0.62,0.62,0.62,0.62,0.62,0.62,0.62,0.62,0.62,0.61,0.60,0,0)
            Aura.Rotation = NumberRange.new(-360, 360)
            Aura.Rate = 3
            Aura.Lifetime = NumberRange.new(1,2)
            Aura.SpreadAngle = Vector2.new(-360, 360)
            Aura.Speed = NumberRange.new(1,5.5)
            Aura.Drag = NumberRange.new(5)
            Aura.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
        end) then
        game:GetService("Debris"):AddItem(Aura,0)
        Aura = Instance.new("ParticleEmitter",nil)
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
    if not song or not pcall(function()
            song.Parent = char:FindFirstChild("Head")
            song.Playing = true
            song.Looped = true
            song.SoundId = Song
            song.Volume = 1
        end) then
        game:GetService("Debris"):AddItem(song,0)
        song = Instance.new("Sound")
        song.SoundId = "rbxassetid://5088562453"
        song.Volume = math.huge
        song.Parent = char:FindFirstChild("Head")
        song.TimePosition = timepos
        song.Playing = true
        song.Looped = true
    end
    for _,v in pairs(owner.Character:GetDescendants()) do
        if v:IsA("Accessory") or v:IsA("Shirt") or v:IsA("Pants") or v:IsA("BodyColors") or v:IsA("CharacterMesh") or v:IsA("SpecialMesh") then
            v:Destroy()
        elseif v:IsA("BasePart") then
            pcall(function()
                v.Material = "Neon"
                if v.Name~="HumanoidRootPart" then
                    v.Transparency = 0.8*math.sin(SINE/45)
                end
                if v.Name ~= "Torso" and v.Name:find("Arm") then
                    v.Color = Color3.fromRGB(215, 197, 154)
                else
                    v.Color = Color3.fromRGB(215, 197, 154)
                end
            end)
        elseif v:IsA("Decal") then
            pcall(function()
                if v:IsDescendantOf(owner.Character.Head) then
                    v.Texture = ""
                end
            end)
        end
    end
    local succ,err=pcall(function()
        Character = owner.Character
        Character.Humanoid.RequiresNeck = false
        RootPart = Character["HumanoidRootPart"]
        Torso = Character["Torso"]
        Head = Character["Head"]
        RightArm = Character["Right Arm"]
        LeftArm = Character["Left Arm"]
        RightLeg = Character["Right Leg"]
        LeftLeg = Character["Left Leg"]
        Torso.Neck.Enabled = false
        Torso["Right Shoulder"].Enabled = false
        Torso["Left Shoulder"].Enabled = false
        Torso["Right Hip"].Enabled = false
        Torso["Left Hip"].Enabled = false
        Neck = Torso.Neck
        RightShoulder = Torso["Right Shoulder"]
        LeftShoulder = Torso["Left Shoulder"]
        RightHip = Torso["Right Hip"]
        LeftHip = Torso["Left Hip"]
        Head.Size = Vector3.new(1*0.5, 1*0.5, 1*0.5)
        RightArm.Size = Vector3.new(1*0.5, 2*0.5, 1*0.5)
        LeftArm.Size = Vector3.new(1*0.5, 2*0.5, 1*0.5)
        RightLeg.Size = Vector3.new(1*0.5, 2*0.5, 1*0.5)
        LeftLeg.Size = Vector3.new(1*0.5, 2*0.5, 1*0.5)
        Torso.Size = Vector3.new(2*0.5, 2*0.5, 1*0.5)
        CF,ANGLES = CFrame.new,CFrame.Angles
        RightLeg.Anchored = true
        Head.Anchored = true
        local epic = RootPart.CFrame * CFrame.new(-1.35 * COS(sn / 30), -2 + 0.7 * SIN(sn / 90), 0 + 2 * SIN(sn / 40)) * CFrame.Angles(RAD(0 + 5 * SIN(sn / 60)), RAD(-0 + 7 * SIN(sn / 60)), RAD(-0 + 7 * SIN(sn / 60)))
        Head.CFrame = epic * CFrame.new(0,1.5*0.5,0)
        LeftLeg.Anchored = true
        RightArm.Anchored = true
        LeftArm.Anchored = true
        RightArm.CFrame = epic * CFrame.new(1.5*0.5,-0.2*0.5,0)*CFrame.Angles(0,math.rad(24+16*math.sin(SINE/25)),math.rad(8+4*math.sin(SINE/25)))
        LeftArm.CFrame = epic * CFrame.new(-1.5*0.5,-0.2*0.5,0)*CFrame.Angles(0,math.rad(-24-16*math.sin(SINE/25)),math.rad(-8-4*math.sin(SINE/25)))
        RightLeg.CFrame = epic * CFrame.new(0.5*0.5,-2*0.5,-0.3)*CFrame.Angles(math.rad(-24+8*math.sin(SINE/25)),0,0)
        LeftLeg.CFrame = epic * CFrame.new(-0.5*0.5,-2*0.5,-0.3)*CFrame.Angles(math.rad(-24+8*math.sin(SINE/25)),0,0)
    end) 
    if not succ then
        owner:LoadCharacter()
    end
    if not song or not pcall(function()
            song.Parent = char:FindFirstChild("Head")
            song.Playing = true
            song.Looped = true
            song.SoundId = Song
            song.Volume = 1
        end) then
        game:GetService("Debris"):AddItem(song,0)
        song = Instance.new("Sound")
        song.SoundId = "rbxassetid://5088562453"
        song.Volume = math.huge
        song.Parent = char:FindFirstChild("Head")
        song.TimePosition = timepos
        song.Playing = true
        song.Looped = true
    end
end)
