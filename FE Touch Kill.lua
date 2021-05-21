local dontkill = false --Set to true if you want to fling them a little, not to their death.

--Keybinds
_G.UnReanimateKey = "q" --The keybind for unreanimating.
_G.ReanimateKey = "e" --The keybind for reanimating.
_G.R6ToggleKey = "r" --The keybind for toggling R15 to R6.
_G.GodmodeToggleKey = "t" --The keybind for toggling godmode.
--Options
if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then
_G.GodMode = true --Set to true if you want godmode, currently broken with R15.
else
_G.GodMode = false
end
if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R15 then
_G.R6 = true
else
_G.R6 = false --Set to true if you wanna enable R15 to R6 when your R15.
end
_G.AutoReanimate = true --Set to true if you want to auto reanimate and disable keybinds after executing.

loadstring(game:HttpGet("https://paste.ee/r/5K7Kc/0"))()

local plrs = game:GetService("Players")
local plr = plrs.LocalPlayer
local char = plr.Character
local hrp = char.HumanoidRootPart
local hrp2 = hrp:Clone()

hrp2.Parent = char
hrp.Name = "hi"
hrp.Transparency = 1
hrp.Anchored = false
if hrp:FindFirstChildOfClass("AlignPosition") then
    hrp:FindFirstChildOfClass("AlignPosition"):Destroy()
end
if hrp:FindFirstChildOfClass("AlignOrientation") then
    hrp:FindFirstChildOfClass("AlignOrientation"):Destroy()
end
local bp = Instance.new("BodyPosition", hrp)
bp.D = 9999999
bp.P = 999999999999999
bp.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
flinger = Instance.new("BodyAngularVelocity",hrp)
flinger.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
flinger.P = 1000000000000000000000000000
if dontkill == true then
    flinger.AngularVelocity = Vector3.new(600, 600, 600)
else
    flinger.AngularVelocity = Vector3.new(10000,10000,10000)
end

spawn(function()
    while wait() do
        if char:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R15 then
            bp.Position = char.NullwareReanim.Torso.Position
        else
            bp.Position = char.Torso.Position
        end
    end
end)