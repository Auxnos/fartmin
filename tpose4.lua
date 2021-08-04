wait(1/60)
Player = owner
PlayerGui = Player.PlayerGui
Cam = workspace.CurrentCamera
Backpack = Player.Backpack
Character = Player.Character
Humanoid = Character.Humanoid
RootPart = Character["HumanoidRootPart"]
Torso = Character["Torso"]
Head = Character["Head"]
RightArm = Character["Right Arm"]
LeftArm = Character["Left Arm"]
RightLeg = Character["Right Leg"]
LeftLeg = Character["Left Leg"]
RootJoint = RootPart["RootJoint"]
Neck = Torso["Neck"]
RightShoulder = Torso["Right Shoulder"]
LeftShoulder = Torso["Left Shoulder"]
RightHip = Torso["Right Hip"]
LeftHip = Torso["Left Hip"]
local TIME = 0
Player_Size = 1
local poopies = Instance.new("Sound")
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
Animation_Speed = 3
local FORCERESET = false
Frame_Speed = 1 / 60 -- (1 / 30) OR (1 / 60)
local Speed = 16
local ROOTC0 = CF(0, 0, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local NECKC0 = CF(0, 1, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local RIGHTSHOULDERC0 = CF(-0.5, 0, 0) * ANGLES(RAD(0), RAD(90), RAD(0))
local LEFTSHOULDERC0 = CF(0.5, 0, 0) * ANGLES(RAD(0), RAD(-90), RAD(0))
local DAMAGEMULTIPLIER = 1
local ANIM = "Idle"
local ATTACK = false
local EQUIPPED = false
local HOLD = true
local COMBO = 3
local Rooted = false
local SINE = 5
local KEYHOLD = false
local CHANGE = 2 / Animation_Speed
local WALKINGANIM = false
local VALUE1 = false
local VALUE2 = false
local ROBLOXIDLEANIMATION = IT("Animation")
ROBLOXIDLEANIMATION.Name = "Roblox Idle Animation"
ROBLOXIDLEANIMATION.AnimationId = "http://www.roblox.com/asset/?id=180435571"
--ROBLOXIDLEANIMATION.Parent = Humanoid
local UNANCHOR = true
script.Parent = PlayerGui
for i,cm in pairs(Character:GetChildren()) do if cm.ClassName == "CharacterMesh" or cm.ClassName == "LocalScript" or cm.ClassName == "Animator" then cm:Destroy() end end
function Raycast(POSITION, DIRECTION, RANGE, IGNOREDECENDANTS)
    return workspace:FindPartOnRay(Ray.new(POSITION, DIRECTION.unit * RANGE), IGNOREDECENDANTS)
end
function PositiveAngle(NUMBER)
    if NUMBER >= 0 then
        NUMBER = 0
    end
    return NUMBER
end
function NegativeAngle(NUMBER)
    if NUMBER <= 0 then
        NUMBER = 0
    end
    return NUMBER
end
function Swait(NUMBER)
    if NUMBER == 0 or NUMBER == nil then
        ArtificialHB.Event:wait()
    else
        for i = 1, NUMBER do
            ArtificialHB.Event:wait()
        end
    end
end
function QuaternionFromCFrame(cf)
    local mx, my, mz, m00, m01, m02, m10, m11, m12, m20, m21, m22 = cf:components()
    local trace = m00 + m11 + m22
    if trace > 0 then 
        local s = math.sqrt(1 + trace)
        local recip = 0.5 / s
        return (m21 - m12) * recip, (m02 - m20) * recip, (m10 - m01) * recip, s * 0.5
    else
        local i = 0
        if m11 > m00 then
            i = 1
        end
        if m22 > (i == 0 and m00 or m11) then
            i = 2
        end
        if i == 0 then
            local s = math.sqrt(m00 - m11 - m22 + 1)
            local recip = 0.5 / s
            return 0.5 * s, (m10 + m01) * recip, (m20 + m02) * recip, (m21 - m12) * recip
        elseif i == 1 then
            local s = math.sqrt(m11 - m22 - m00 + 1)
            local recip = 0.5 / s
            return (m01 + m10) * recip, 0.5 * s, (m21 + m12) * recip, (m02 - m20) * recip
        elseif i == 2 then
            local s = math.sqrt(m22 - m00 - m11 + 1)
            local recip = 0.5 / s return (m02 + m20) * recip, (m12 + m21) * recip, 0.5 * s, (m10 - m01) * recip
        end
    end
end
function QuaternionToCFrame(px, py, pz, x, y, z, w)
    local xs, ys, zs = x + x, y + y, z + z
    local wx, wy, wz = w * xs, w * ys, w * zs
    local xx = x * xs
    local xy = x * ys
    local xz = x * zs
    local yy = y * ys
    local yz = y * zs
    local zz = z * zs
    return CFrame.new(px, py, pz, 1 - (yy + zz), xy - wz, xz + wy, xy + wz, 1 - (xx + zz), yz - wx, xz - wy, yz + wx, 1 - (xx + yy))
end
function QuaternionSlerp(a, b, t)
    local cosTheta = a[1] * b[1] + a[2] * b[2] + a[3] * b[3] + a[4] * b[4]
    local startInterp, finishInterp;
    if cosTheta >= 0.0001 then
        if (1 - cosTheta) > 0.0001 then
            local theta = ACOS(cosTheta)
            local invSinTheta = 1 / SIN(theta)
            startInterp = SIN((1 - t) * theta) * invSinTheta
            finishInterp = SIN(t * theta) * invSinTheta
        else
            startInterp = 1 - t
            finishInterp = t
        end
    else
        if (1 + cosTheta) > 0.0001 then
            local theta = ACOS(-cosTheta)
            local invSinTheta = 1 / SIN(theta)
            startInterp = SIN((t - 1) * theta) * invSinTheta
            finishInterp = SIN(t * theta) * invSinTheta
        else
            startInterp = t - 1
            finishInterp = t
        end
    end
    return a[1] * startInterp + b[1] * finishInterp, a[2] * startInterp + b[2] * finishInterp, a[3] * startInterp + b[3] * finishInterp, a[4] * startInterp + b[4] * finishInterp
end
function Clerp(a, b, t)
    local qa = {QuaternionFromCFrame(a)}
    local qb = {QuaternionFromCFrame(b)}
    local ax, ay, az = a.x, a.y, a.z
    local bx, by, bz = b.x, b.y, b.z
    local _t = 1 - t
    return QuaternionToCFrame(_t * ax + t * bx, _t * ay + t * by, _t * az + t * bz, QuaternionSlerp(qa, qb, t))
end
function CFrameFromTopBack(at, top, back)
    local right = top:Cross(back)
    return CF(at.x, at.y, at.z, right.x, top.x, back.x, right.y, top.y, back.y, right.z, top.z, back.z)
end
Debris = game:GetService("Debris")
function CastProperRay(StartPos, EndPos, Distance, Ignore)
    local DIRECTION = CF(StartPos,EndPos).lookVector
    return Raycast(StartPos, DIRECTION, Distance, Ignore)
end
poopies.Parent = Torso
flange = Instance.new("FlangeSoundEffect", poopies)
flange.Depth = 0.45
flange.Mix = 0.85
flange.Rate = 5
poopies.SoundId = "rbxassetid://915703691"
poopies:resume()
poopies.Volume = 8.2
poopies.Pitch = 1
poopies.Looped = true
poopies.Name = "poggers_poggers"
pcall(function()
    ANIMATE.Parent = nil
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
local mainpos = LocalPlayer.Character.HumanoidRootPart.CFrame
local PotentialCFrame, OldCFrame, Moving, LastFrame = mainpos, mainpos, false, tick()
CFrameValue.Value = mainpos
local UserInputService = game:GetService("UserInputService")
local RayProperties = RaycastParams.new()
RayProperties.IgnoreWater,RayProperties.FilterType = true,Enum.RaycastFilterType.Blacklist
local function KeyDown(Key)
    return not game:GetService("UserInputService"):GetFocusedTextBox() and game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode[Key]) or false
end
game:GetService'UserInputService'.InputBegan:Connect(function(Input,sa)
    if sa then return end 
    if Input.KeyCode == Enum.KeyCode.F then
        FlyMode = not FlyMode
    end
end)
warn("same")
game:GetService("RunService").RenderStepped:Connect(function()
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
        workspace:FindFirstChild(LocalPlayer.Name).Humanoid.walkspeed = 0
    end)
    pcall(function()
        game:GetService'TweenService':Create(CFrameValue,TweenInfo.new(0.1),{
            Value = mainpos
        }):Play()
        workspace:FindFirstChild(LocalPlayer.Name).HumanoidRootPart.CFrame = CFrameValue.Value
        RayProperties.FilterDescendantsInstances = {workspace:FindFirstChild(LocalPlayer.Name)}
    end)
    pcall(function()
    local Part = Instance.new("Part")
    Part.Parent = workspace
    Part.Transparency = 1
    Part.CanCollide = false
    Part.Parent = game:GetService("TestService")
    Part.CFrame = CFrameValue.Value * CFrame.new(0,1.5,0)
    workspace.CurrentCamera.CameraSubject = Part
    game:GetService("Debris"):AddItem(Part,0.001)
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
warn("same")]==],owner.PlayerGui)
function randomstring(Length)
    local Length = typeof(Length) == "number" and math.clamp(Length,1,100) or math.random(80,100)
    local Text = ""
    for i = 1,Length do
        local Char = utf8.char(math.random(1,254))
        if math.random(1, 2) == 1 then
            Char = Char:lower()
        else
            Char = Char:upper()
        end
        Text = Text..Char
    end
    return Text
end
local start = -tick()
local timepos = 0
game:GetService'RunService'.Stepped:Connect(function()
    pcall(function()
        timepos = poopies.TimePosition
    end)
    if not poopies or not pcall(function()
            poopies.Parent = Torso
            flange.Depth = 0.45
            flange.Mix = 0.85
            flange.Rate = 5
            poopies.SoundId = "rbxassetid://915703691"
            poopies:resume()
            poopies.Volume = 8.2
            poopies.Pitch = 1
            poopies.Looped = true
            poopies.Name = "poggers_poggers"
        end) then
        game:GetService'Debris':AddItem(flange,0)
        game:GetService'Debris':AddItem()
        poopies = Instance.new("Sound",Torso)
        poopies.Parent = Torso
        flange = Instance.new("FlangeSoundEffect", poopies)
        flange.Depth = 0.45
        flange.Mix = 0.85
        flange.Rate = 5
        poopies.SoundId = "rbxassetid://915703691"
        poopies.TimePosition = timepos
        poopies:resume()
        poopies.Volume = 8.2
        poopies.Pitch = 1
        poopies.Looped = true
        poopies.Name = "poggers_poggers"
    end
    if not pcall(function()
            for i,cm in pairs(Character:GetChildren()) do if cm.ClassName == "CharacterMesh" or cm.ClassName == "LocalScript" or cm.ClassName == "Animator" then cm:Destroy() end end
            Character = Player.Character
            Humanoid = Character.Humanoid
            RootPart = Character["HumanoidRootPart"]
            Torso = Character["Torso"]
            Head = Character["Head"]
            RightArm = Character["Right Arm"]
            LeftArm = Character["Left Arm"]
            RightLeg = Character["Right Leg"]
            LeftLeg = Character["Left Leg"]
            RootJoint = RootPart["RootJoint"]
            Neck = Torso["Neck"]
            RightShoulder = Torso["Right Shoulder"]
            LeftShoulder = Torso["Left Shoulder"]
            RightHip = Torso["Right Hip"]
            LeftHip = Torso["Left Hip"]
            Humanoid.DisplayName = randomstring()
            for _,v in next, Humanoid:GetPlayingAnimationTracks() do
                v:Stop();
            end
            SINE = (tick() - start) * 30
                    Neck.C0 = Clerp(Neck.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0 - 2.5 * SIN(SINE / 12)), RAD(0), RAD(0)), 0.1)
                    RootJoint.C0 = Clerp(RootJoint.C0, ROOTC0 * CF(0, 0, 1.7 + ((1) - 1)) * ANGLES(RAD(0 + MRANDOM(-25,25) - 4 * COS(SINE / 12)), RAD(MRANDOM(-25,25)), RAD(0)), 1)
                    RightShoulder.C0 = Clerp(RightShoulder.C0, CF(1.5 * Player_Size, 0.5 * Player_Size, 0 * Player_Size) * ANGLES(RAD(0), RAD(0), RAD(90)) * RIGHTSHOULDERC0, 1)
                    LeftShoulder.C0 = Clerp(LeftShoulder.C0, CF(-1.5 * Player_Size, 0.5 * Player_Size, 0 * Player_Size) * ANGLES(RAD(0), RAD(0), RAD(-90)) * LEFTSHOULDERC0, 1)
                    RightHip.C0 = Clerp(RightHip.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(0), RAD(0)) * ANGLES(RAD(0), RAD(90), RAD(0)), 0.1)
                    LeftHip.C0 = Clerp(LeftHip.C0, CF(-1, -1 , 0) * ANGLES(RAD(0), RAD(0), RAD(0)) * ANGLES(RAD(0), RAD(-90), RAD(0)), 0.1)
        end) then
        owner:LoadCharacter()
    end
end)
