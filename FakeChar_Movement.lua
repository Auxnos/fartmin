local RootPart = {
    CFrame = CFrame.new(0, 15, 0),
    Velocity = Vector3.new(0,0,0)
}
pcall(function()
    local o = table.pack(workspace:GetDescendants(),"SpawnLocation")
    for _,v in pairs(o[1]) do
        if v:IsA(o[2]) == true then
            if v:IsA("BasePart") == true then
                RootPart.CFrame = v.CFrame * CFrame.new(0, 5, 0)
            end
        end
    end
    if RootPart.PotentialCFrame or RootPart.PotentialCFrame == nil or not RootPart.PotentialCFrame then
        RootPart.PotentialCFrame = RootPart.CFrame
    end
end)
local LastPos = RootPart.CFrame
local RayProperties = RaycastParams.new()
RayProperties.IgnoreWater,RayProperties.FilterType = true,Enum.RaycastFilterType.Blacklist
local LastFrame = tick()
local Moving = false
local FlyMode = true
local WalkSpeed = 16
local function KeyDown(Key)
    return not game:GetService("UserInputService"):GetFocusedTextBox() and game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode[Key]) or false
end
local function KeyUp(Key)
    return not game:GetService("UserInputService"):GetFocusedTextBox() and game:GetService("UserInputService"):IsKeyUp(Enum.KeyCode[Key]) or false
end
game:GetService("RunService").Stepped:Connect(function()
    local LookVector = workspace:FindFirstChildOfClass("Camera").CFrame.LookVector
    local _Ray,Closest = nil,math.huge
    local Rays = {}
    Rays[1] = workspace:Raycast(RootPart.CFrame.p - Vector3.new(0,1,0),Vector3.new(0,-9e9,0),RayProperties)
    for b,_Raycast in pairs(Rays) do
        local Magnitude = (RootPart.CFrame.Position-_Raycast.Position).Magnitude
        if Magnitude < Closest then
            Closest,_Ray = Magnitude,_Raycast
        end
    end
    RootPart.Velocity = Vector3.new(RootPart.CFrame.X - LastPos.X, RootPart.CFrame.Y - LastPos.Y, RootPart.CFrame.Z - LastPos.Z)
    if not FlyMode then
        if _Ray then
            RootPart.CFrame = CFrame.new(0,(_Ray.Position.Y-RootPart.CFrame.Y)+3,0)*RootPart.CFrame
        else
            local Base = nil
            for i,v in pairs(workspace:GetDescendants()) do
                if pcall(v.IsA,v,"SpawnLocation") then
                    Base = v
                    break
                end
            end
            if Base then
                RootPart.CFrame = RootPart.CFrame:Lerp(CFrame.new(Base.Position)*CFrame.new(0,(Base.Size.Y/2)+3,0)*RootPart.CFrame-RootPart.CFrame.Position,0.15)
            else
                RootPart.CFrame = RootPart.CFrame:Lerp(CFrame.new(0,100,0)*RootPart.CFrame-RootPart.CFrame.Position,0.15)
            end
        end
    end
    if FlyMode then
        RootPart.PotentialCFrame = CFrame.new(RootPart.CFrame.p,RootPart.CFrame.p+LookVector)
    else
        RootPart.PotentialCFrame = CFrame.new(RootPart.CFrame.p,Vector3.new(RootPart.CFrame.X+LookVector.X,RootPart.CFrame.Y,RootPart.CFrame.Z+LookVector.Z))
    end
    if KeyDown("W") then
        RootPart.PotentialCFrame *= CFrame.new(0,0,-1)
    end
    if KeyDown("A") then
        RootPart.PotentialCFrame  *= CFrame.new(-1,0,0)
    end
    if KeyDown("S") then
        RootPart.PotentialCFrame *= CFrame.new(0,0,1)
    end
    if KeyDown("D") then
        RootPart.PotentialCFrame *= CFrame.new(1,0,0)
    end
    if (RootPart.PotentialCFrame.X ~= LastPos.X or RootPart.PotentialCFrame.Z ~= LastPos.Z) then
        Moving = true
        RootPart.CFrame = CFrame.new(RootPart.CFrame.p,RootPart.PotentialCFrame.p)*CFrame.new(0,0,(tick()-LastFrame)*-(WalkSpeed))
    else
        Moving = false
    end
    LastPos = RootPart.CFrame
    LastFrame = tick()
    pcall(function()
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = RootPart.CFrame
    end)
end)
--[[
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
    ]]
