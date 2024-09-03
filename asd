game:GetService("Lighting").ColorDeath:Destroy()
game:GetService("Lighting").BlurDeath:Destroy()
--auto deploy
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

local args = {
    [1] = {
        [1] = {
            [1] = "JohnLantern",
            ["n"] = 1
        },
        [2] = "\11"
    }
}

-- Function to fire the event
local function fireEvent()
    ReplicatedStorage.dataRemoteEvent:FireServer(unpack(args))
end

-- Connect the function to the CharacterRemoving event
player.CharacterRemoving:Connect(fireEvent)

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

local function ensureCameraScriptable()
    if camera.CameraType ~= Enum.CameraType.Scriptable then
        camera.CameraType = Enum.CameraType.Scriptable
    end
end

-- Initial check
ensureCameraScriptable()

-- Function to connect to character events
local function connectCharacterEvents(character)
    ensureCameraScriptable()
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.Died:Connect(function()
            ensureCameraScriptable()
        end)
    end
end

-- Connect to CharacterAdded and CharacterRemoving events
player.CharacterAdded:Connect(function(character)
    connectCharacterEvents(character)
end)

player.CharacterRemoving:Connect(function()
    ensureCameraScriptable()
end)

-- Connect to the current character if it exists
if player.Character then
    connectCharacterEvents(player.Character)
end






local player = game:GetService("Players").LocalPlayer
local selectionUI = player.PlayerGui.Menu.SelectionUI.Selection

-- Function to ensure visibility
local function ensureVisibility()
    if not selectionUI.Visible then
        selectionUI.Visible = true
    end
end

-- Initial check
ensureVisibility()

-- Connect to the Changed event to handle future visibility changes
selectionUI.Changed:Connect(function(property)
    if property == "Visible" then
        ensureVisibility()
    end
end)
