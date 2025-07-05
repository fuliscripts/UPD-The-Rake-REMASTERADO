
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "FuliScannerKillGUI"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Position = UDim2.new(0.1, 0, 0.1, 0)
Frame.Size = UDim2.new(0, 300, 0, 250)
Frame.BackgroundTransparency = 0.2
Frame.BorderSizePixel = 2
Frame.Active = true
Frame.Draggable = true
Frame.Visible = false

local ToggleButton = Instance.new("TextButton", ScreenGui)
ToggleButton.Size = UDim2.new(0, 150, 0, 30)
ToggleButton.Position = UDim2.new(0, 10, 0, 10)
ToggleButton.Text = "Abrir Scanner/Kill"
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.TextScaled = true

local LogBox = Instance.new("TextLabel", Frame)
LogBox.Size = UDim2.new(1, -10, 0, 150)
LogBox.Position = UDim2.new(0, 5, 0, 5)
LogBox.Text = "Presiona SCAN."
LogBox.TextWrapped = true
LogBox.TextScaled = true
LogBox.BackgroundTransparency = 1

local ScanButton = Instance.new("TextButton", Frame)
ScanButton.Size = UDim2.new(1, -20, 0, 30)
ScanButton.Position = UDim2.new(0, 10, 0, 160)
ScanButton.Text = "SCAN Workspace"
ScanButton.Font = Enum.Font.SourceSansBold
ScanButton.TextScaled = true

local KillButton = Instance.new("TextButton", Frame)
KillButton.Size = UDim2.new(1, -20, 0, 30)
KillButton.Position = UDim2.new(0, 10, 0, 200)
KillButton.Text = "Insta Kill Detections"
KillButton.Font = Enum.Font.SourceSansBold
KillButton.TextScaled = true

ToggleButton.MouseButton1Click:Connect(function()
    Frame.Visible = not Frame.Visible
end)

local detected = {}

ScanButton.MouseButton1Click:Connect(function()
    detected = {}
    local names = ""
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("Humanoid") then
            local parentName = v.Parent.Name
            table.insert(detected, v.Parent)
            names = names .. parentName .. "\n"
            print("[SCAN] Encontrado:", parentName)
        end
    end
    LogBox.Text = names ~= "" and names or "Nada encontrado."
end)

KillButton.MouseButton1Click:Connect(function()
    for _, model in pairs(detected) do
        if model and model:FindFirstChildOfClass("Humanoid") then
            model:FindFirstChildOfClass("Humanoid").Health = 0
            model:BreakJoints()
            print("[KILL] Intentado matar:", model.Name)
        end
    end
end)
