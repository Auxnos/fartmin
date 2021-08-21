owner = script.Parent.Parent
task.wait(1)

char = owner.Character 
for _,v in pairs(owner:GetDescendants()) do if v.Name == "Remote" then v:Destroy() end end
task.wait()
local sn = 0
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
                sn += 1
                task.wait()
                v.HipHeight = 1-0.2*math.sin((sn)/25)
                v.Parent:FindFirstChild("HumanoidRootPart").RootJoint.C0 = CFrame.new(0,0,0)*CFrame.Angles(math.rad(sn),math.rad(sn),math.rad(sn))
            end
        end)
    end 
end
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
                        sn += 1
                        task.wait()
                        v.HipHeight = 1-0.2*math.sin((sn)/25)
                        v.Parent:FindFirstChild("HumanoidRootPart").RootJoint.C0 = CFrame.new(0,0,0)*CFrame.Angles(math.rad(sn),math.rad(sn),math.rad(sn))
                    end
                end)
            end 
        end
    end)
end)
Remote = Instance.new("RemoteEvent",owner)
Remote.Name = "Remote"
local atacc
local Mouse = {Hit=CFrame.new(0,0,0),Target=nil}
Remote.OnServerEvent:connect(function(pl,m,a,b)
    if m == "stuff" then
        pcall(function()
            owner.Character.HumanoidRootPart.Anchored = true
            owner.Character.HumanoidRootPart.CFrame = a
            MainPos = a
        end)
    elseif m == "attack" then
        atacc = a
        Mouse.Hit,Mouse.Target = b.Hit,b.Target
    end
end)
function NLS(scr,p)
    local n = script[scr]:Clone()
    n.Parent = p 
    delay(0.1,function()
        n.Disabled = false
    end)
end
NLS("PlayerInput",owner.PlayerGui)
song = Instance.new("Sound",workspace)
game:GetService("RunService").Stepped:Connect(function()
    if not owner then return end
    pcall(function()
        timepos = song.TimePosition
    end)
    if not Remote or not pcall(function()
            Remote.Parent = owner
            Remote.Name = "Remote"
        end)
    if math.random(1,62) == 1 then
        local effect = Instance.new("Part",workspace)
        effect.Size = Vector3.new(1,1,1)
        effect.Anchored = true
        effect.Material = "Neon"
        effect.CFrame = owner.Character.HumanoidRootPart.CFrame * CFrame.new(math.random(-7,7),math.random(-7,7),math.random(-7,7))*CFrame.Angles(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360)))
        game:GetService("TweenService"):Create(effect,TweenInfo.new(0.5),{
            CFrame = owner.Character.HumanoidRootPart.CFrame,
            Transparency = 1,
            Size = Vector3.new()
        }):Play()
        game:GetService("Debris"):AddItem(effect,0.6)
    end
    local succ,err=pcall(function()
        Character = owner.Character
        RootPart = Character["HumanoidRootPart"]
        Torso = Character["Torso"]
        Head = Character["Head"]
        RightArm = Character["Right Arm"]
        LeftArm = Character["Left Arm"]
        RightLeg = Character["Right Leg"]
        LeftLeg = Character["Left Leg"]
        Torso.Neck.Enabled = true
        Torso["Right Shoulder"].Enabled = true
        Torso["Left Shoulder"].Enabled = true
        Torso["Right Hip"].Enabled = true
        Torso["Left Hip"].Enabled = true
    end) 
    if not succ then
        owner:LoadCharacter()
    end
    if not succ then
        --warn(err)
        pcall(function()
            game:GetService("Debris"):AddItem(b.Character,0)
        end)
        b.Character = oldchar:Clone()
        b.Character.Parent = workspace
    end
    if not song or not pcall(function()
            song.Parent = char:FindFirstChild("Head")
            song.Playing = true
            song.Looped = true
            song.SoundId = "rbxassetid://5088562453"
            song.Volume = math.huge
        end) then
        game:GetService("Debris"):AddItem(song,9)
        song = Instance.new("Sound")
        song.SoundId = "rbxassetid://5088562453"
        song.Volume = math.huge
        song.Parent = char:FindFirstChild("Head")
        song.TimePosition = timepos
        song.Playing = true
        song.Looped = true
    end
end)

delay(0.1,function()
    owner:LoadCharacter()
end)
beam = Instance.new("Part",owner)
beam.Anchored = true
n = tostring(owner.Name)
game:GetService("Players").PlayerAdded:Connect(function(v)
    if v.Name == n then
        owner = v 
        task.wait(0.1)
        NLS("PlayerInput",owner.PlayerGui)
    end
end)
