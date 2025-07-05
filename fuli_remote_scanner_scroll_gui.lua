
local CoreGui = game:GetService("CoreGui")

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "FuliRemoteScannerScrollGUI"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Position = UDim2.new(0.1, 0, 0.1, 0)
Frame.Size = UDim2.new(0, 400, 0, 300)
Frame.BackgroundTransparency = 0.2
Frame.BorderSizePixel = 2
Frame.Active = true
Frame.Draggable = true
Frame.Visible = false

local ToggleButton = Instance.new("TextButton", ScreenGui)
ToggleButton.Size = UDim2.new(0, 180, 0, 30)
ToggleButton.Position = UDim2.new(0, 10, 0, 10)
ToggleButton.Text = "Abrir Remote Scanner"
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.TextScaled = true

local ScrollingFrame = Instance.new("ScrollingFrame", Frame)
ScrollingFrame.Size = UDim2.new(1, -10, 1, -50)
ScrollingFrame.Position = UDim2.new(0, 5, 0, 5)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 5, 0)
ScrollingFrame.ScrollBarThickness = 8

local UIListLayout = Instance.new("UIListLayout", ScrollingFrame)
UIListLayout.Padding = UDim.new(0, 2)

local ScanButton = Instance.new("TextButton", Frame)
ScanButton.Size = UDim2.new(1, -20, 0, 30)
ScanButton.Position = UDim2.new(0, 10, 1, -40)
ScanButton.Text = "SCAN Remotes"
ScanButton.Font = Enum.Font.SourceSansBold
ScanButton.TextScaled = true

ToggleButton.MouseButton1Click:Connect(function()
    Frame.Visible = not Frame.Visible
end)

ScanButton.MouseButton1Click:Connect(function()
    -- Limpiar anteriores
    for _, child in pairs(ScrollingFrame:GetChildren()) do
        if child:IsA("TextLabel") then
            child:Destroy()
        end
    end

    for i, v in pairs(game:GetDescendants()) do
        if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
            local label = Instance.new("TextLabel", ScrollingFrame)
            label.Size = UDim2.new(1, -10, 0, 20)
            label.Text = v:GetFullName()
            label.Font = Enum.Font.SourceSans
            label.TextSize = 14
            label.BackgroundTransparency = 1
            label.TextXAlignment = Enum.TextXAlignment.Left
            print("[REMOTE] Encontrado:", v:GetFullName())
        end
    end
end)
