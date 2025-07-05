
-- FULI Insta Kill Rake v3.0.0 con GUI Extendida 💀

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")

-- Crear GUI
local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "FuliInstaKillGui"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Position = UDim2.new(0.1, 0, 0.1, 0)
Frame.Size = UDim2.new(0, 200, 0, 280)
Frame.BackgroundTransparency = 0.2
Frame.BorderSizePixel = 2
Frame.Active = true
Frame.Draggable = true

local function createButton(name, position, action)
    local btn = Instance.new("TextButton", Frame)
    btn.Size = UDim2.new(1, 0, 0.12, 0)
    btn.Position = position
    btn.Text = name
    btn.Font = Enum.Font.SourceSansBold
    btn.TextScaled = true
    btn.MouseButton1Click:Connect(action)
    return btn
end

local StatusLabel = Instance.new("TextLabel", Frame)
StatusLabel.Size = UDim2.new(1, 0, 0.1, 0)
StatusLabel.Position = UDim2.new(0, 0, 0.9, 0)
StatusLabel.Text = "Status: Waiting"
StatusLabel.Font = Enum.Font.SourceSans
StatusLabel.TextScaled = true
StatusLabel.BackgroundTransparency = 1

-- Funciones Exploit
local function InstaKill()
    local Rake = nil
    for _, v in pairs(workspace:GetChildren()) do
        if v.Name == "Rake" then
            Rake = v
            break
        end
    end

    if not Rake then
        warn("❌ Rake no encontrado")
        return
    end

    for _, v in pairs(getgc(true)) do
        if type(v) == "function" then
            local info = debug.getinfo(v)
            if info.name == "Kill" then
                hookfunction(v, function(...)
                    return true
                end)
            elseif info.name == "Detected" then
                hookfunction(v, function(...)
                    return true
                end)
            end
        end
    end

    if Rake:FindFirstChild("State") then
        Rake.State.Value = "Normal"
    end

    if Rake:FindFirstChild("Humanoid") then
        Rake.Humanoid:TakeDamage(5)
        Rake.Humanoid.Health = 0
    end

    warn("✅ Rake Insta Kill ejecutado")
end

local function InfiniteStamina()
    spawn(function()
        while wait(1) do
            pcall(function()
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Stamina") then
                    LocalPlayer.Character.Stamina.Value = 100
                end
            end)
        end
    end)
end

local function Noclip()
    RunService.Stepped:Connect(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)
end

local function NightVision()
    Lighting.Brightness = 5
    Lighting.ClockTime = 12
    Lighting.FogEnd = 100000
end

local function KillPlayers()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Humanoid") then
            p.Character.Humanoid.Health = 0
        end
    end
end

local function TeleportToSafe()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 100, 0)
    end
end

local function AutoFarm()
    spawn(function()
        while wait(2) do
            pcall(function()
                LocalPlayer.leaderstats.Points.Value = LocalPlayer.leaderstats.Points.Value + 10
            end)
        end
    end)
end

local function AntiRake()
    spawn(function()
        while wait(0.5) do
            pcall(function()
                local Rake = workspace:FindFirstChild("Rake")
                if Rake and Rake:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character then
                    local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        local distance = (hrp.Position - Rake.HumanoidRootPart.Position).Magnitude
                        if distance < 40 then
                            hrp.CFrame = hrp.CFrame + Vector3.new(0, 20, 0)
                        end
                    end
                end
            end)
        end
    end)
end

-- Botones
createButton("Insta Kill Rake", UDim2.new(0,0,0,0), function()
    InstaKill()
    StatusLabel.Text = "Status: Insta Kill"
end)

createButton("Infinite Stamina", UDim2.new(0,0,0.12,0), function()
    InfiniteStamina()
    StatusLabel.Text = "Status: Stamina"
end)

createButton("Noclip", UDim2.new(0,0,0.24,0), function()
    Noclip()
    StatusLabel.Text = "Status: Noclip"
end)

createButton("Night Vision", UDim2.new(0,0,0.36,0), function()
    NightVision()
    StatusLabel.Text = "Status: Vision"
end)

createButton("Kill Players", UDim2.new(0,0,0.48,0), function()
    KillPlayers()
    StatusLabel.Text = "Status: Kill All"
end)

createButton("Teleport Safe", UDim2.new(0,0,0.60,0), function()
    TeleportToSafe()
    StatusLabel.Text = "Status: Safe"
end)

createButton("AutoFarm Points", UDim2.new(0,0,0.72,0), function()
    AutoFarm()
    StatusLabel.Text = "Status: AutoFarm"
end)

createButton("Anti-Rake", UDim2.new(0,0,0.84,0), function()
    AntiRake()
    StatusLabel.Text = "Status: AntiRake"
end)
