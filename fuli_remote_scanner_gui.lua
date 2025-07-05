
local CoreGui = game:GetService("CoreGui")

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "FuliRemoteScannerGUI"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Position = UDim2.new(0.1, 0, 0.1, 0)
Frame.Size = UDim2.new(0, 350, 0, 250)
Frame.BackgroundTransparency = 0.2
Frame.BorderSizePixel = 2
Frame.Active = true
Frame.Draggable = true
Frame.Visible = false

local ToggleButton = Instance.new("TextButton", ScreenGui)
ToggleButton.Size = UDim2.new(0, 160, 0, 30)
ToggleButton.Position = UDim2.new(0, 10, 0, 10)
ToggleButton.Text = "Abrir Remote Scanner"
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.TextScaled = true

local LogBox = Instance.new("TextLabel", Frame)
LogBox.Size = UDim2.new(1, -10, 0, 180)
LogBox.Position = UDim2.new(0, 5, 0, 5)
LogBox.Text = "Presiona SCAN para listar remotos."
LogBox.TextWrapped = true
LogBox.TextScaled = true
LogBox.BackgroundTransparency = 1

local ScanButton = Instance.new("TextButton", Frame)
ScanButton.Size = UDim2.new(1, -20, 0, 30)
ScanButton.Position = UDim2.new(0, 10, 0, 190)
ScanButton.Text = "SCAN Remotes"
ScanButton.Font = Enum.Font.SourceSansBold
ScanButton.TextScaled = true

ToggleButton.MouseButton1Click:Connect(function()
    Frame.Visible = not Frame.Visible
end)

ScanButton.MouseButton1Click:Connect(function()
    local result = ""
    for i, v in pairs(game:GetDescendants()) do
        if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
            result = result .. v:GetFullName() .. "\n"
            print("[REMOTE] Encontrado:", v:GetFullName())
        end
    end
    LogBox.Text = result ~= "" and result or "No se encontraron remotos."
end)
