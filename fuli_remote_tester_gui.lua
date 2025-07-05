
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "FuliRemoteTesterGUI"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Position = UDim2.new(0.1, 0, 0.1, 0)
Frame.Size = UDim2.new(0, 300, 0, 250)
Frame.BackgroundTransparency = 0.2
Frame.BorderSizePixel = 2
Frame.Active = true
Frame.Draggable = true
Frame.Visible = true

local function createButton(name, position, action)
    local btn = Instance.new("TextButton", Frame)
    btn.Size = UDim2.new(1, -20, 0, 25)
    btn.Position = position
    btn.Text = name
    btn.Font = Enum.Font.SourceSansBold
    btn.TextScaled = true
    btn.MouseButton1Click:Connect(action)
end

local remotes = {
    {"DeadEvent", function() if ReplicatedStorage:FindFirstChild("DeadEvent") then ReplicatedStorage.DeadEvent:FireServer() end end},
    {"FlinchEvent", function() if ReplicatedStorage:FindFirstChild("FlinchEvent") then ReplicatedStorage.FlinchEvent:FireServer() end end},
    {"FD_Event", function() if ReplicatedStorage:FindFirstChild("FD_Event") then ReplicatedStorage.FD_Event:FireServer() end end},
    {"ScrapEvent", function() if ReplicatedStorage:FindFirstChild("ScrapEvent") then ReplicatedStorage.ScrapEvent:FireServer() end end},
    {"WalkieEvent", function() if ReplicatedStorage:FindFirstChild("WalkieEvent") then ReplicatedStorage.WalkieEvent:FireServer() end end},
    {"TrackEvent", function() if ReplicatedStorage:FindFirstChild("TrackEvent") then ReplicatedStorage.TrackEvent:FireServer() end end},
    {"SupplyClientEvent", function() if ReplicatedStorage:FindFirstChild("SupplyClientEvent") then ReplicatedStorage.SupplyClientEvent:FireServer() end end},
}

for i, remote in ipairs(remotes) do
    createButton(remote[1], UDim2.new(0, 10, 0, 10 + (i - 1) * 30), remote[2])
end
