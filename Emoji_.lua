

wait()
wait()
wait()

local Plr
local FE = true

if FE == false then
    Plr = game:GetService("Players").LocalPlayer
elseif FE == true then

    if game:GetService("RunService"):IsClient() then error("Script must be server-side in order to work; use h/ and not hl/") end
    local Player,game,owner = owner,game
    local RealPlayer = Player
    do local RealPlayer=RealPlayer;script.Parent=RealPlayer.Character;local a=function(b)b[1].f[b[2]]=nil end;local c={__index={disconnect=a,Disconnect=a}}local d={__index={Connect=function(b,e)local f=tostring(math.random(0,10000))while b.f[f]do f=tostring(math.random(0,10000))end;b.f[f]=e;return setmetatable({b,f},c)end}}d.__index.connect=d.__index.Connect;local function g()return setmetatable({f={}},d)end;local h={Hit=CFrame.new(),KeyUp=g(),KeyDown=g(),Button1Up=g(),Button1Down=g(),Button2Up=g(),Button2Down=g()}h.keyUp=h.KeyUp;h.keyDown=h.KeyDown;local i={InputBegan=g(),InputEnded=g()}local CAS={Actions={},BindAction=function(self,j,k,l,...)CAS.Actions[j]=k and{Name=j,Function=k,Keys={...}}or nil end}CAS.UnbindAction=CAS.BindAction;local function m(self,n,...)for o,e in pairs(self[n].f)do e(...)end end;h.T=m;i.T=m;local p=Instance.new("RemoteEvent")p.Name="UserInput_Event"p.OnServerEvent:Connect(function(q,r)if q~=RealPlayer then return end;h.Target=r.e;h.Hit=r.d;if not r.f then local s=r.c==Enum.UserInputState.Begin;if r.b==Enum.UserInputType.MouseButton1 then return h:T(s and"Button1Down"or"Button1Up")end;if r.b==Enum.UserInputType.MouseButton2 then return h:T(s and"Button2Down"or"Button2Up")end;for o,t in pairs(CAS.Actions)do for o,u in pairs(t.Keys)do if u==r.a then t.Function(t.Name,r.c,r)end end end;h:T(s and"KeyDown"or"KeyUp",r.a.Name:lower())i:T(s and"InputBegan"or"InputEnded",r,false)end end)p.Parent=NLS([==[local a=script:WaitForChild("UserInput_Event")local b=owner:GetMouse()local c=game:GetService("UserInputService")local d=function(e,f)if f then return end;a:FireServer({a=e.KeyCode,b=e.UserInputType,c=e.UserInputState,d=b.Hit,e=b.Target})end;c.InputBegan:Connect(d)c.InputEnded:Connect(d)local g,h;local i=game:GetService("RunService").Heartbeat;while true do if g~=b.Hit or h~=b.Target then g,h=b.Hit,b.Target;a:FireServer({f=1,Target=h,d=g})end;for j=1,2 do i:Wait()end end]==],script)local v=game;local w={__index=function(self,u)local x=rawget(self,"_RealService")if x then return typeof(x[u])=="function"and function(o,...)return x[u](x,...)end or x[u]end end,__newindex=function(self,u,y)local x=rawget(self,"_RealService")if x then x[u]=y end end}local function z(t,A)t._RealService=typeof(A)=="string"and v:GetService(A)or A;return setmetatable(t,w)end;local B={GetService=function(self,x)return rawget(self,x)or v:GetService(x)end,Players=z({LocalPlayer=z({GetMouse=function(self)return h end},Player)},"Players"),UserInputService=z(i,"UserInputService"),ContextActionService=z(CAS,"ContextActionService"),RunService=z({_btrs={},RenderStepped=v:GetService("RunService").Heartbeat,BindToRenderStep=function(self,j,o,k)self._btrs[j]=self.Heartbeat:Connect(k)end,UnbindFromRenderStep=function(self,j)self._btrs[j]:Disconnect()end},"RunService")}rawset(B.Players,"localPlayer",B.Players.LocalPlayer)B.service=B.GetService;z(B,game)game,owner=B,B.Players.LocalPlayer end


    Plr = owner
end 
local Mouse = Plr:GetMouse()
local DB = game:GetService("Debris")
local Sin = math.sin
local Cos = math.cos

print(" < Made By xXxcoolvipman69/Bloxyking0 >")
print(" User : "..Plr.Name)

--={Main Start}=--

local Tween = game:GetService("TweenService")
local Quad = TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0)
local Quint = TweenInfo.new(1,Enum.EasingStyle.Quint,Enum.EasingDirection.In,0,false,0)

local Ch = Plr.Character

local ROT = Ch["HumanoidRootPart"]
local HU = Ch:FindFirstChildOfClass("Humanoid")

local TS = Ch["Torso"]
local HD = Ch["Head"]
local LA = Ch["Left Arm"]
local RA = Ch["Right Arm"]
local RG = Ch["Right Leg"]
local LG = Ch["Left Leg"]

--={Main End}=--

--={Customization Start}=--

for i,v in pairs(Ch:GetChildren()) do
    if v:IsA("Part") then
        v.Transparency = 1
    elseif v:IsA("Accessory") then
        v:Destroy()
    elseif v:IsA("MeshPart") then
        v.Transparency = 1
    end

end

if HD:FindFirstChildOfClass("Decal") then
    HD:FindFirstChildOfClass("Decal"):Destroy()
end

local Emoji = Instance.new("Part")
local Emoji_ = Instance.new("Weld")
local ExEmoji = Instance.new("Part")
local ExEmoji_ = Instance.new("Weld")
local Face = Instance.new("Part")
local Dd = Instance.new("Decal")
local Face_ = Instance.new("Weld")
local Wata = Instance.new("ParticleEmitter")
local Sz = Instance.new("Sound")

Sz.Looped = true
Sz.SoundId = "rbxassetid://7156629013"
Sz.Volume = 2.5
Wata.Speed = NumberRange.new(2, 2)
Wata.Rotation = NumberRange.new(0, 360)
Wata.LightEmission = 0.5
Wata.Enabled = false
Wata.Texture = "http://www.roblox.com/asset/?id=243457340"
Wata.Transparency = NumberSequence.new(0.86874997615814,1)
Wata.Size = NumberSequence.new(1.5,1.5)
Wata.Acceleration = Vector3.new(0, -2, 0)
Wata.Lifetime = NumberRange.new(5, 5)
Wata.Rate = 200
Wata.SpreadAngle = Vector2.new(10, 10)
Wata.VelocitySpread = 10
Emoji.Size = Vector3.new(5,5,5)
Emoji.Color = Color3.fromRGB(255, 176, 0)
Emoji.Material = "SmoothPlastic"
Emoji.Anchored = false
Emoji.CanCollide = false
Emoji.Massless = true
Emoji.Shape = "Ball"
Emoji.Name = "Emoji"
ExEmoji.Size = Vector3.new(5,5,5)
ExEmoji.Color = Color3.fromRGB(255, 176, 0)
ExEmoji.Material = "SmoothPlastic"
ExEmoji.Anchored = false
ExEmoji.CanCollide = false
ExEmoji.Massless = true
ExEmoji.Transparency = 1
ExEmoji.Shape = "Ball"
Emoji_.Part0 = ROT
Emoji_.Part1 = Emoji
ExEmoji_.Part0 = Emoji
ExEmoji_.Part1 = ExEmoji
ExEmoji.Material = "Slate"
ExEmoji.Transparency = .5
ExEmoji_.C0 = CFrame.new(0,0,0)
Face_.Part0 = Emoji
Face_.Part1 = Face
Face_.C0 = CFrame.new(0,0,-2.56)
Face.Size = Vector3.new(7, 7, 0.093)
Face.CanCollide = false
Face.Massless = true
Face.Material = "Neon"
Face.Transparency = 1
Face.Name = "Face"
Dd.Face = "Front"
Dd.Texture = "rbxassetid://1660500478"

Emoji.Parent = Ch
ExEmoji.Parent = Emoji
Emoji_.Parent = ROT
Face.Parent = Emoji
Dd.Parent = Face
Face_.Parent = Emoji
Wata.Parent = ExEmoji
Sz.Parent = Emoji

--={Customization End}--

--={Variables Start}=--

--Attack

local CoolDown = false

--Forms

local Normal = true
local Chill = false
local Ocean = false
local Core = false
local OmGAGhost = false

--Number Values

local Az = 0
local Bz = 0
local Cz = 0
local Dz = 0

--Sine

local S = 0
local C = 1

--={Varables End}--

--={ Useful Functions Start}--

--Tween Functions

local function TweenP(part,transparency,size,color,service)
    local GP = {
        Transparency = transparency,
        Size = size,
        Color = color
    }
    local PlaySelection = Tween:Create(part,service,GP)
    PlaySelection:Play()
end

local function TweenS(mesh,scale,vertex,service)
    local MP = {
        Scale = scale,
        VertexColor = vertex
    }
    local PlaySelection = Tween:Create(mesh,service,MP)
    PlaySelection:Play()
end

local function TweenC(part,CFramez,Service)
    local MZ = {
        CFrame = CFramez
    }
    local ZM = Tween:Create(part,Service,MZ)
    MZ:Play()
end

local function Remove(part,tima)
    DB:AddItem(part,tima)
end

local function Effect(number,waitz,part,amount,amountlimit,damage,hitamount,service)

    if number == "1" then

        local cour = coroutine.create(function()
            while wait(waitz) do
                if amount >= amountlimit then
                    break
                end
                amount = amount + 1

                local S = Instance.new("Part",HD)
                S.Anchored = true
                S.CanCollide = false
                S.Color = Color3.fromRGB(255,255,255)
                S.Position = Emoji.Position--Color3.fromRGB(255,255,255)
                S.Material = "Neon"
                S.Shape = "Cylinder"
                S.Orientation = Vector3.new(0,0,90)
                S.Size = Vector3.new(490,10,10)
                --wait(.2)
                local zxx = {
                    Size = Vector3.new(490,30,30),
                    Transparency = 1
                }
                local IU = Tween:Create(S,Quad,zxx)
                IU:Play()
                DB:AddItem(S,1)
            end
        end)
        coroutine.resume(cour)

    elseif number == "2" then

        local cour = coroutine.create(function()
            while wait(waitz) do
                if amount >= amountlimit then
                    break
                end
                amount = amount + 1

                local P =Instance.new("Part",HD)
                P.Anchored = true
                P.CanCollide = false
                P.Color = Color3.fromRGB(255,255,255)
                P.Position = P.Position--Color3.fromRGB(255,255,255)
                P.Material = "Neon"
                P.Shape = "Ball"
                --	P.Orientation = Vector3.new(0,0,90)
                TweenP(P,1,Vector3.new(20,20,20),P.Color)

                if damage == true then
                    P.Touched:Connect(function(hit)
                        if hit.Parent:IsA("Model") then
                            if hit.Parent:FindFirstChild("Humanoid") then
                                local h = hit.Parent:FindFirstChild("Humanoid")
                                h.Health = h.Health - hitamount
                            end
                        end
                    end)
                end
                Remove(P,1)
            end
        end)
        coroutine.resume(cour)

    end

end
-- Others

function ChangeFace(part,decal,face,service)
    local C = coroutine.create(function()
        local p = part
        local f = face
        local d = decal

        local last = p.Size

        wait(.2)

        local Pz = {
            Size = Vector3.new(Emoji.Size.X, 1, 0.093)
        }

        local zP = {
            Size = Vector3.new(Emoji.Size.X,Emoji.Size.Y, 0.093)
        }
        local o = Tween:Create(part,service,Pz)
        local c = Tween:Create(part,service,zP)

        o:Play()

        wait(.2)

        d.Texture = face
        c:Play()

    end)
    coroutine.resume(C)
end

-- Forms

local function Smuh()
    Effect("1",.02,Emoji,0,2,0,0)
    Emoji.Material = "Neon"
    ChangeFace(Face,Dd,"http://www.roblox.com/asset/?id=4988226139",Quad)
end

local function Norma()
    --Emoji.Orientation = Vector3.new(0,0,0)
    Effect("1",.1,Emoji,0,2,0,0)
    Emoji.Material = "SmoothPlastic"
    ChangeFace(Face,Dd,"rbxassetid://1660500478",Quad)
end

local function Ghost()
    Effect("1",.1,Emoji,0,2,0,0)
    Emoji.Material = "SmoothPlastic"
    ChangeFace(Face,Dd,"rbxassetid://362505168",Quad)
end

local function Weird()
    Effect("1",.1,Emoji,0,2,0,0)
    Emoji.Material = "Granite"
    ChangeFace(Face,Dd,"rbxassetid://6352635079",Quad)

end

-- Attaks

local function Summon()
    local Portal = Instance.new("Part",HU)
    local PortalM = Instance.new("SpecialMesh",Portal)
    Portal.Material = "Neon"
    PortalM.MeshType = "Sphere"
    Portal.Anchored = true
    Portal.Color = Color3.fromRGB(0,0,0)
    Portal.Shape = "Cylinder"
    Portal.Size = Vector3.new(.05,.05,.05)
    Portal.Transparency = 1
    Portal.CFrame = ROT.CFrame * CFrame.new(0,-3,-15)
    Portal.Orientation = Vector3.new(0,0,90)

    local Elbreo = Instance.new("Part",HU)
    Elbreo.Anchored = true
    Elbreo.CFrame = Portal.CFrame * CFrame.new(0,-5,0)
    wait(.2)

    TweenC(Elbreo,Elbreo.CFrame * CFrame.new(0,20,0),Quad)
    Effect("2",.3,Elbreo,0,1,true,10,Quad)

    if Ocean == true then
    elseif Chill == true then
    elseif Normal == true then
    elseif OmGAGhost == true then
    end

    TweenP(Portal,0,Vector3.new(3, 16, 14),Portal.Color,Quad)

    wait(2)

    TweenP(Portal,1,Vector3.new(.05 , .05, .05),Portal.Color,Quad)

    Remove(Elbreo,3)
    Remove(Portal,5)
end

-- Coroutines
local ColorVal = 0
local Materials = {Enum.Material.Fabric,Enum.Material.Mud,Enum.Material.Sand,Enum.Material.Slate,Enum.Material.Granite}
local ColorFix_ = coroutine.create(function()

    while wait() do
        ColorVal = math.random(0,255)
        if Normal == true then
            Emoji.Material = "SmoothPlastic"
            TweenP(Emoji,0,Emoji.Size,Color3.fromRGB(255, 176, 0),Quad)
        elseif Ocean == true and Normal == false and Chill == false and OmGAGhost == false and Core == false then
            Emoji.Material = "Neon"
            TweenP(Emoji,0,Emoji.Size,Color3.fromRGB(255, 176, 0),Quad)	
        elseif OmGAGhost == true and Normal == false and Ocean == false and Chill == false and Core == false then
            Emoji.Material = "Plastic"
            TweenP(Emoji,0.5,Emoji.Size,Color3.fromRGB(255,255,255),Quad)
        elseif Core == true and  Normal == false and Chill == false and OmGAGhost == false and Ocean == false then
            Emoji.Material = Materials[math.random(1,#Materials)]
            local Ps = {
                C0 = Emoji_.C0 * CFrame.Angles(S,S,S)
            }
            local sP = Tween:Create(Emoji_,Quad,Ps)
            sP:Play()
            TweenP(Emoji,0.5,Emoji.Size,Color3.fromRGB(ColorVal,ColorVal,ColorVal),Quad)
        end

    end

end)

local RainbowEmoji = coroutine.create(function()
    while true do

        if Chill == true then

            Az = Az + 1/255

            if Az >= 1 then

                Az = 0

            end

            TweenP(Emoji,0,Emoji.Size,Color3.fromHSV(Az,1,1),Quad)

            wait()

        end

        wait()

    end
end)

coroutine.resume(RainbowEmoji)
coroutine.resume(ColorFix_)

--={ Useful Functions End }--

--={ Keys Start }=--

Mouse.KeyDown:Connect(function(k)
    if k == "c" then

        if Normal == true and Chill == false and OmGAGhost == false then
            Sz.SoundId = "rbxassetid://7156629013"
            Sz:Play()

            Smuh()

            Normal = false
            Chill = true

        elseif Chill == true and Normal == false and OmGAGhost == false then

            Norma()

            Normal = true
            Chill = false

            Sz:Stop()

        end

    elseif k == "v" then

        if Normal == true and OmGAGhost == false and Chill == false and Core == false then
            Sz.SoundId = "rbxassetid://3449862606"
            Sz:Play()

            Ghost()

            Normal = false
            OmGAGhost = true

        elseif OmGAGhost == true and Normal == false and Chill == false and Core == false

        then

            Norma()

            Normal = true
            OmGAGhost = false

            Sz:Stop()

        end

    elseif k == "b" then

        if Normal == true and Chill == false and Ocean == false and OmGAGhost == false then
            Sz.SoundId = "rbxassetid://3660329829"
            Sz:Play()

            Weird()

            Normal = false
            Core = true

        elseif Normal == false and Chill == false and Ocean == false and OmGAGhost == false then
            Sz:Stop()

            Norma()

            Normal = true
            Core = false

        end


    end
end)

Mouse.KeyDown:Connect(function(k)
    local keypress = coroutine.create(function()
        if k == "x" then
            Summon()
        end
    end)
    coroutine.resume(keypress)
end)

--={ Keys End }=--

--={Movement Start}=--
local Pzz = 0
local WeirdF = {"rbxassetid://6352746460","rbxassetid://6352808743","rbxassetid://6585786446","rbxassetid://7020381356","rbxassetid://6918989890","rbxassetid://7220475444","rbxassetid://7116887410","rbxassetid://6352807078","rbxassetid://6352813668","rbxassetid://6914176819","rbxassetid://6683604500","rbxassetid://6888250526"}
local ScaryF = {"http://www.roblox.com/asset/?id=5902252729","http://www.roblox.com/asset/?id=2638049841","http://www.roblox.com/asset/?id=5110954094","http://www.roblox.com/asset/?id=424436490","http://www.roblox.com/asset/?id=1857890620"}
local GhostMovement = (function()
    while wait() do
        Pzz = math.random(1,3)
        if OmGAGhost == true then
            if Pzz == math.random(1,3) then
                Dd.Texture = "http://www.roblox.com/asset/?id=2629055277"
                Emoji.Color = Color3.fromRGB(255,255,255)
                local RotV = {
                    C0 = CFrame.new(0,0,Sin(S/6)/2) * CFrame.new(0,.5,0) * CFrame.Angles(Sin(S/4)/2,ROT.RotVelocity.Y / 5, Sin(S/4)/2) * CFrame.new(0,2,0)
                }
                local ZZ = Tween:Create(Emoji_,Quad,RotV)
                ZZ:Play()
            elseif Pzz == math.random(1,4) then
                Dd.Texture = "http://www.roblox.com/asset/?id=2629055277"
                Emoji.Color = Color3.fromRGB(255,255,255)
                local RotV = {
                    C0 = CFrame.new(0,0,Sin(S/6)/2) * CFrame.new(0,.5,0) * CFrame.Angles(Sin(S/4)/2,ROT.RotVelocity.Y / 5, Sin(S/4)/2) * CFrame.new(0,2,0)
                }
                local ZZ = Tween:Create(Emoji_,Quad,RotV)
                ZZ:Play()
            elseif Pzz == math.random(1,5) then
                Dd.Texture = ""..ScaryF[math.random(1,#ScaryF)]
                Emoji.Color = Color3.fromRGB(255,0,0)
                local RotV = {
                    C0 = CFrame.new(math.random(-1,1),math.random(-1,1),math.random(-1,1)) * CFrame.new(0,.5,0) * CFrame.Angles(math.random(-180,180),math.random(-180,180),math.random(-180,180))
                }
                local ZZ = Tween:Create(Emoji_,Quad,RotV)
                ZZ:Play()
                Emoji.Color = Color3.fromRGB(255,0,0)
            end
        end
    end
end)
local CoreMovement = (function()
    while wait() do
        Pzz = math.random(1,3)
        if Core == true then
            if Pzz == math.random(1,3) then
                Dd.Texture = "rbxassetid://6352635079"
                Emoji.Color = Color3.fromRGB(255,255,255)
                local RotV = {
                    C0 = CFrame.new(Sin(S/6)/2,Sin(S/6)/2,Sin(S/6)/2) * CFrame.new(0,.5,0) * CFrame.Angles(0,ROT.RotVelocity.Y / 5,0) * CFrame.new(0,2,0)
                }
                local ZZ = Tween:Create(Emoji_,Quad,RotV)
                ZZ:Play()
            elseif Pzz == math.random(1,4) then
                Dd.Texture = "rbxassetid://6352635079"
                Emoji.Color = Color3.fromRGB(255,255,255)
                local RotV = {
                    C0 = CFrame.new(Sin(S/6)/2,Sin(S/6)/2,Sin(S/6)/2) * CFrame.new(0,.5,0) * CFrame.Angles(0,ROT.RotVelocity.Y / 5,0) * CFrame.new(0,2,0)
                }
                local ZZ = Tween:Create(Emoji_,Quad,RotV)
                ZZ:Play()
            elseif Pzz == math.random(1,10) then
                Dd.Texture = ""..WeirdF[math.random(1,#WeirdF)]
                Emoji.Color = Color3.fromRGB(0,0,0)
                local RotV = {
                    C0 = CFrame.new(math.random(-1,1),math.random(-1,1),math.random(-1,1)) * CFrame.new(0,.5,0) * CFrame.Angles(math.random(-180,180),math.random(-180,180),math.random(-180,180))
                }
                local ZZ = Tween:Create(Emoji_,Quad,RotV)
                ZZ:Play()
                Emoji.Color = Color3.fromRGB(ColorVal,ColorVal,ColorVal)
            end
        end
    end
end)
task.spawn(GhostMovement)
task.spawn(CoreMovement)
Plr.CharacterAdded:connect(function(newchar)
    char = newchar
    delay(0,function()
        local Parts = {Emoji,Emoji_,ExEmoji,ExEmoji_,Face,Dd,Face_,Wata,Sz}
        local Emoji = Instance.new("Part")
        local Emoji_ = Instance.new("Weld")
        local ExEmoji = Instance.new("Part")
        local ExEmoji_ = Instance.new("Weld")
        local Face = Instance.new("Part")
        local Dd = Instance.new("Decal")
        local Face_ = Instance.new("Weld")
        local Wata = Instance.new("ParticleEmitter")
        local Sz = Instance.new("Sound")

        Sz.Looped = true
        Sz.SoundId = "rbxassetid://7156629013"
        Sz.Volume = 2.5
        Wata.Speed = NumberRange.new(2, 2)
        Wata.Rotation = NumberRange.new(0, 360)
        Wata.LightEmission = 0.5
        Wata.Enabled = false
        Wata.Texture = "http://www.roblox.com/asset/?id=243457340"
        Wata.Transparency = NumberSequence.new(0.86874997615814,1)
        Wata.Size = NumberSequence.new(1.5,1.5)
        Wata.Acceleration = Vector3.new(0, -2, 0)
        Wata.Lifetime = NumberRange.new(5, 5)
        Wata.Rate = 200
        Wata.SpreadAngle = Vector2.new(10, 10)
        Wata.VelocitySpread = 10
        Emoji.Size = Vector3.new(5,5,5)
        Emoji.Color = Color3.fromRGB(255, 176, 0)
        Emoji.Material = "SmoothPlastic"
        Emoji.Anchored = false
        Emoji.CanCollide = false
        Emoji.Massless = true
        Emoji.Shape = "Ball"
        Emoji.Name = "Emoji"
        ExEmoji.Size = Vector3.new(5,5,5)
        ExEmoji.Color = Color3.fromRGB(255, 176, 0)
        ExEmoji.Material = "SmoothPlastic"
        ExEmoji.Anchored = false
        ExEmoji.CanCollide = false
        ExEmoji.Massless = true
        ExEmoji.Transparency = 1
        ExEmoji.Shape = "Ball"
        Emoji_.Part0 = ROT
        Emoji_.Part1 = Emoji
        ExEmoji_.Part0 = Emoji
        ExEmoji_.Part1 = ExEmoji
        ExEmoji.Material = "Slate"
        ExEmoji.Transparency = .5
        ExEmoji_.C0 = CFrame.new(0,0,0)
        Face_.Part0 = Emoji
        Face_.Part1 = Face
        Face_.C0 = CFrame.new(0,0,-2.56)
        Face.Size = Vector3.new(7, 7, 0.093)
        Face.CanCollide = false
        Face.Massless = true
        Face.Material = "Neon"
        Face.Transparency = 1
        Face.Name = "Face"
        Dd.Face = "Front"
        Dd.Texture = "rbxassetid://1660500478"

        Emoji.Parent = Ch
        ExEmoji.Parent = Emoji
        Emoji_.Parent = ROT
        Face.Parent = Emoji
        Dd.Parent = Face
        Face_.Parent = Emoji
        Wata.Parent = ExEmoji
        Sz.Parent = Emoji
    end)
end)
Remote = Instance.new("RemoteEvent",Plr)
Remote.Name = "Remote"
local atacc
local Mouse2 = {Hit=CFrame.new(0,0,0),Target=nil}
Remote.OnServerEvent:connect(function(pl,m,a,b)
    if m == "stuff" then
        pcall(function()
            Plr.Character.HumanoidRootPart.Anchored = true
            Plr.Character.HumanoidRootPart.CFrame = a
        end)
    elseif m == "attack" then
        atacc = a
        Mouse2.Hit,Mouse2.Target = b.Hit,b.Target
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
    if Input.KeyCode == Enum.KeyCode.F then
        FlyMode = not FlyMode
    end
end)
warn("same")

game:GetService("RunService").RenderStepped:Connect(function()
    MouseProps.FilterType = Enum.RaycastFilterType.Blacklist
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
while task.wait() do

    S = S + C
    local Parts = {Emoji,Emoji_,ExEmoji,ExEmoji_,Face,Dd,Face_,Wata,Sz}
    Ch = Plr.Character
    pcall(function()
        local ROT = Ch["HumanoidRootPart"]
        local HU = Ch:FindFirstChildOfClass("Humanoid")

        local TS = Ch["Torso"]
        local HD = Ch["Head"]
        local LA = Ch["Left Arm"]
        local RA = Ch["Right Arm"]
        local RG = Ch["Right Leg"]
        local LG = Ch["Left Leg"]

        --={Main End}=--

        --={Customization Start}=--

        for i,v in pairs(Ch:GetChildren()) do
            if v:IsA("Part") then
                v.Transparency = 1
            elseif v:IsA("Accessory") then
                v:Destroy()
            elseif v:IsA("MeshPart") then
                v.Transparency = 1
            end

        end

        if HD:FindFirstChildOfClass("Decal") then
            HD:FindFirstChildOfClass("Decal"):Destroy()
        end
    end)
    for _,v in pairs(Parts) do
        if not v or not v:IsDescendantOf(Ch) then
            Plr:LoadCharacter()
        end
    end

    if Normal == true then
        local RotV = {
            C0 = CFrame.new(0,Sin(S/6)/2,0) * CFrame.Angles(Cos(S/6)/4,ROT.RotVelocity.Y / 5,0) * CFrame.new(0,2,0)
        }
        local ZZ = Tween:Create(Emoji_,Quad,RotV)
        ZZ:Play()
        --W.C0 = CFrame.new(0,Sin(S/6)/2,0) * CFrame.Angles(Cos(S/6)/4,ROT.RotVelocity.Y / 23,0)
        --LR.C0 = CFrame.new(-3.5,0,0) * CFrame.new(Sin(S*S/23)/9.5,Sin(-S/6)/2.5,0)
        --RR.C0 = CFrame.new(3.5,0,0) * CFrame.new(Sin(S*S/23)/9.5,Sin(-S/6)/2.5,0)
    elseif Chill == true  then
        local RotV = {
            C0 = CFrame.new(0,Sin(S/6)/2,0) * CFrame.new(0,.5,0) * CFrame.Angles(0,ROT.RotVelocity.Y / 5, Sin(S/4)/2) * CFrame.new(0,2,0)
        }
        local ZZ = Tween:Create(Emoji_,Quad,RotV)
        ZZ:Play()

        --	W.C0 = CFrame.new(0,Sin(S/6)/2,0) * CFrame.new(0,.5,0) * CFrame.Angles(0,ROT.RotVelocity.Y / 5, 0)
    end
end

--={ Movement End }=--
