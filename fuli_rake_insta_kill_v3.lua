
-- FULI Insta Kill Rake v3.0.0 Prototype

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Buscando el Rake en el workspace
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

-- Hookear funciones sospechosas
for _, v in pairs(getgc(true)) do
    if type(v) == "function" then
        local info = debug.getinfo(v)
        if info.name == "Kill" then
            hookfunction(v, function(...)
                return true -- Bypass
            end)
        elseif info.name == "Detected" then
            hookfunction(v, function(...)
                return true -- No detección
            end)
        end
    end
end

-- Desactivar estado Enraged si existe
if Rake:FindFirstChild("State") then
    Rake.State.Value = "Normal"
end

-- Dañar un poco al Rake para evitar bug de recompensa
if Rake:FindFirstChild("Humanoid") then
    Rake.Humanoid:TakeDamage(5)
end

-- Forzar la vida a 0
if Rake:FindFirstChild("Humanoid") then
    Rake.Humanoid.Health = 0
end

warn("✅ Rake Insta Kill ejecutado (experimental)")
