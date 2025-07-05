
local CoreGui = game:GetService("CoreGui")
local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "FuliHumanoidDetectorGUI"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Position = UDim2.new(0.1, 0, 0.1, 0)
Frame.Size = UDim2.new(0, 300, 0, 200)
Frame.BackgroundTransparency = 0.2
Frame.BorderSizePixel = 2
Frame.Active = true
Frame.Draggable = true
Frame.Visible = false

local ToggleButton = Instance.new("TextButton", ScreenGui)
ToggleButton.Size = UDim2.new(0, 150, 0, 30)
ToggleButton.Position = UDim2.new(0, 10, 0, 10)
ToggleButton.Text = "Abrir Detector"
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.TextScaled = true

local LogBox = Instance.new("TextLabel", Frame)
LogBox.Size = UDim2.new(1, -10, 1, -10)
LogBox.Position = UDim2.new(0, 5, 0, 5)
LogBox.Text = "Presiona Detectar."
LogBox.TextWrapped = true
LogBox.TextScaled = true
LogBox.BackgroundTransparency = 1

ToggleButton.MouseButton1Click:Connect(function()
    Frame.Visible = not Frame.Visible
end)

local DetectButton = Instance.new("TextButton", Frame)
DetectButton.Size = UDim2.new(1, -20, 0, 30)
DetectButton.Position = UDim2.new(0, 10, 1, -40)
DetectButton.Text = "Detectar Humanoids"
DetectButton.Font = Enum.Font.SourceSansBold
DetectButton.TextScaled = true

DetectButton.MouseButton1Click:Connect(function()
    local result = ""
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Humanoid") then
            result = result .. v.Parent.Name .. "\n"
            print(v.Parent.Name)
        end
    end
    LogBox.Text = result ~= "" and result or "No se encontraron Humanoids."
end)
