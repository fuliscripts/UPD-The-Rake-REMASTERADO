
for _, v in pairs(workspace:GetDescendants()) do
    if v:IsA("Humanoid") then
        print("Encontrado:", v.Parent.Name)
    end
end
