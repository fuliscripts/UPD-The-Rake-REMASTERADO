
local CoreGui = game:GetService("CoreGui")
local Workspace = game:GetService("Workspace")

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "FuliInstaKillGUI"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Position = UDim2.new(0.1, 0, 0.1, 0)
Frame.Size = UDim2.new(0, 250, 0, 120)
Frame.BackgroundTransparency = 0.2
Frame.BorderSizePixel = 2
Frame.Active = true
Frame.Draggable = true
Frame.Visible = false

local ToggleButton = Instance.new("TextButton", ScreenGui)
ToggleButton.Size = UDim2.new(0, 150, 0, 30)
ToggleButton.Position = UDim2.new(0, 10, 0, 10)
ToggleButton.Text = "Abrir Insta Kill"
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.TextScaled = true

local StatusLabel = Instance.new("TextLabel", Frame)
StatusLabel.Size = UDim2.new(1, -10, 0, 30)
StatusLabel.Position = UDim2.new(0, 5, 0, 5)
StatusLabel.Text = "Status: Esperando"
StatusLabel.TextScaled = true
StatusLabel.BackgroundTransparency = 1

local KillButton = Instance.new("TextButton", Frame)
KillButton.Size = UDim2.new(1, -20, 0, 30)
KillButton.Position = UDim2.new(0, 10, 0, 50)
KillButton.Text = "Insta Kill Rake"
KillButton.Font = Enum.Font.SourceSansBold
KillButton.TextScaled = true

ToggleButton.MouseButton1Click:Connect(function()
    Frame.Visible = not Frame.Visible
end)

KillButton.MouseButton1Click:Connect(function()
    local Rake = Workspace:FindFirstChild("Rake")
    if Rake and Rake:FindFirstChild("Humanoid") then
        for i = 1, 5 do
            Rake.Humanoid:TakeDamage(20)
            wait(0.1)
        end
        Rake:BreakJoints()
        StatusLabel.Text = "Status: Rake Intentado"
        warn("✅ Rake intentado matar (TakeDamage + BreakJoints)")
    else
        StatusLabel.Text = "Status: No encontrado"
        warn("❌ Rake no encontrado")
    end
end)
