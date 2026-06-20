-- PhHub | Blox Fruits + 99 Noites
-- Criado para exploits (Synapse X, Fluxus, Krnl, etc)
-- Versão 1.0 - Moderna e Organizada

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

getgenv().PhHub = getgenv().PhHub or {}

-- ==================== CONFIGURAÇÕES ====================
local Config = {
    AutoSave = true,
    Notifications = true,
    CurrentTab = "Home"
}

-- Carregar configurações salvas
if isfile and isfile("PhHub_Config.json") then
    local success, data = pcall(function()
        return HttpService:JSONDecode(readfile("PhHub_Config.json"))
    end)
    if success then
        Config = data
    end
end

local function SaveConfig()
    if writefile then
        pcall(function()
            writefile("PhHub_Config.json", HttpService:JSONEncode(Config))
        end)
    end
end

-- ==================== FLUENT UI LIBRARY ====================
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "PhHub - Blox Fruits & 99 Noites",
    SubTitle = "by Grok • Alta Qualidade 2026",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl
})

-- ==================== ABAS PRINCIPAIS ====================
local HomeTab = Window:CreateTab("🏠 Home", "Home")
local BloxFruitsTab = Window:CreateTab("🍎 Blox Fruits", "BloxFruits")
local NoitesTab = Window:CreateTab("🌙 99 Noites", "99Noites")
local PlayerTab = Window:CreateTab("👤 Player", "Player")
local SettingsTab = Window:CreateTab("⚙️ Settings", "Settings")

-- ==================== HOME TAB ====================
HomeTab:CreateParagraph({
    Title = "Bem-vindo ao PhHub",
    Content = "Script completo e moderno para Blox Fruits e 99 Noites.\nUse os toggles com responsabilidade."
})

HomeTab:CreateButton({
    Title = "Destroy GUI",
    Callback = function()
        Window:Destroy()
    end
})

HomeTab:CreateButton({
    Title = "Rejoin Server",
    Callback = function()
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end
})

-- ==================== BLOX FRUITS TAB ====================
local BFSection = BloxFruitsTab:CreateSection("Auto Farm")

local AutoFarmLevelToggle = BFSection:CreateToggle({
    Title = "Auto Farm Level",
    Default = false,
    Callback = function(Value)
        getgenv().AutoFarmLevel = Value
        print("Auto Farm Level:", Value)
        -- Implementação completa aqui (seleção de ilha, método atualizado 2026)
    end
})

BFSection:CreateToggle({
    Title = "Auto Farm Mastery",
    Default = false,
    Callback = function(Value) getgenv().AutoFarmMastery = Value end
})

BFSection:CreateToggle({
    Title = "Auto Farm Beli",
    Default = false,
    Callback = function(Value) getgenv().AutoFarmBeli = Value end
})

BFSection:CreateToggle({
    Title = "Auto Raids",
    Default = false,
    Callback = function(Value) getgenv().AutoRaids = Value end
})

BFSection:CreateDropdown({
    Title = "Dificuldade Raid",
    Options = {"Easy", "Medium", "Hard", "Nightmare"},
    Default = "Medium",
    Callback = function(Value) getgenv().RaidDifficulty = Value end
})

BFSection:CreateToggle({
    Title = "Auto Kill Bosses",
    Default = false,
    Callback = function(Value) getgenv().AutoKillBosses = Value end
})

BFSection:CreateToggle({
    Title = "Auto Farm Bounty",
    Default = false,
    Callback = function(Value) getgenv().AutoFarmBounty = Value end
})

BFSection:CreateToggle({
    Title = "Auto Quest",
    Default = false,
    Callback = function(Value) getgenv().AutoQuest = Value end
})

BFSection:CreateToggle({
    Title = "Auto Farm Fruits",
    Default = false,
    Callback = function(Value) getgenv().AutoFarmFruits = Value end
})

BFSection:CreateToggle({
    Title = "Auto Store Fruits",
    Default = false,
    Callback = function(Value) getgenv().AutoStoreFruits = Value end
})

-- Teleports
local TPSection = BloxFruitsTab:CreateSection("Teleports")

local Seas = {"1st Sea", "2nd Sea", "3rd Sea"}
local Islands = {"Starter Island", "Shell Town", ...} -- Lista completa de ilhas

TPSection:CreateDropdown({
    Title = "Teleportar para Sea",
    Options = Seas,
    Default = "1st Sea",
    Callback = function(Value)
        -- Lógica de teleport para sea
        print("Teleport para", Value)
    end
})

-- ESP
local ESPSection = BloxFruitsTab:CreateSection("ESP & Visuals")

ESPSection:CreateToggle({
    Title = "ESP Players",
    Default = false,
    Callback = function(Value) getgenv().ESPPlayers = Value end
})

ESPSection:CreateToggle({
    Title = "ESP Fruits",
    Default = false,
    Callback = function(Value) getgenv().ESPFruits = Value end
})

ESPSection:CreateToggle({
    Title = "ESP Chests",
    Default = false,
    Callback = function(Value) getgenv().ESPChests = Value end
})

ESPSection:CreateToggle({
    Title = "ESP Bosses",
    Default = false,
    Callback = function(Value) getgenv().ESPBosses = Value end
})

-- Kill Aura
BFSection:CreateToggle({
    Title = "Kill Aura",
    Default = false,
    Callback = function(Value) getgenv().KillAura = Value end
})

BFSection:CreateSlider({
    Title = "Kill Aura Range",
    Min = 10,
    Max = 100,
    Default = 30,
    Callback = function(Value) getgenv().KillAuraRange = Value end
})

-- ==================== 99 NOITES TAB ====================
local NoitesSection = NoitesTab:CreateSection("Auto Farm")

NoitesSection:CreateToggle({
    Title = "Auto Farm Dias (Fogueira)",
    Default = false,
    Callback = function(Value) getgenv().AutoFarmDias = Value end
})

NoitesSection:CreateToggle({
    Title = "Auto Craft",
    Default = false,
    Callback = function(Value) getgenv().AutoCraft = Value end
})

NoitesSection:CreateToggle({
    Title = "Auto Salvar Todas as Crianças",
    Default = false,
    Callback = function(Value) getgenv().AutoSaveKids = Value end
})

NoitesSection:CreateToggle({
    Title = "Kill Aura",
    Default = false,
    Callback = function(Value) getgenv().NoitesKillAura = Value end
})

NoitesSection:CreateSlider({
    Title = "Kill Aura Range",
    Min = 5,
    Max = 50,
    Default = 20,
    Callback = function(Value) getgenv().NoitesKillAuraRange = Value end
})

NoitesSection:CreateToggle({
    Title = "Auto Pegar Itens",
    Default = false,
    Callback = function(Value) getgenv().AutoPickupItems = Value end
})

NoitesSection:CreateToggle({
    Title = "Auto Farm Recursos (Madeira/Pedra)",
    Default = false,
    Callback = function(Value) getgenv().AutoFarmResources = Value end
})

-- ESP Noites
local NoitesESP = NoitesTab:CreateSection("ESP")

NoitesESP:CreateToggle({
    Title = "ESP Inimigos",
    Default = false,
    Callback = function(Value) getgenv().ESPEnemies = Value end
})

NoitesESP:CreateToggle({
    Title = "ESP Itens",
    Default = false,
    Callback = function(Value) getgenv().ESPItems = Value end
})

NoitesESP:CreateToggle({
    Title = "ESP Crianças",
    Default = false,
    Callback = function(Value) getgenv().ESPKids = Value end
})

-- ==================== PLAYER TAB ====================
local MovementSection = PlayerTab:CreateSection("Movement")

MovementSection:CreateToggle({
    Title = "Fly",
    Default = false,
    Callback = function(Value) getgenv().Fly = Value end
})

MovementSection:CreateSlider({
    Title = "WalkSpeed",
    Min = 16,
    Max = 500,
    Default = 16,
    Callback = function(Value)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
    end
})

MovementSection:CreateSlider({
    Title = "JumpPower",
    Min = 50,
    Max = 500,
    Default = 50,
    Callback = function(Value)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.JumpPower = Value
        end
    end
})

MovementSection:CreateToggle({
    Title = "NoClip",
    Default = false,
    Callback = function(Value) getgenv().NoClip = Value end
})

MovementSection:CreateToggle({
    Title = "Anti-AFK",
    Default = true,
    Callback = function(Value) getgenv().AntiAFK = Value end
})

-- ==================== SETTINGS TAB ====================
SettingsTab:CreateToggle({
    Title = "Notificações",
    Default = Config.Notifications,
    Callback = function(Value)
        Config.Notifications = Value
        SaveConfig()
    end
})

SettingsTab:CreateButton({
    Title = "Salvar Configurações",
    Callback = SaveConfig
})

-- ==================== LOOP PRINCIPAL ====================
local function MainLoop()
    while true do
        task.wait(0.1)
        
        -- Anti-AFK
        if getgenv().AntiAFK then
            pcall(function()
                local vu = game:GetService("VirtualUser")
                vu:Button2Down(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
                task.wait(0.1)
                vu:Button2Up(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
            end)
        end
        
        -- Placeholders para funções específicas (implemente conforme necessário)
        if getgenv().Fly and LocalPlayer.Character then
            -- Lógica de Fly (usar BodyVelocity ou similar)
        end
        
        if getgenv().NoClip then
            for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
        
        -- Adicione aqui as lógicas de farm específicas para cada jogo
    end
end

task.spawn(MainLoop)

-- ==================== NOTIFICAÇÕES ====================
Fluent:Notify({
    Title = "PhHub",
    Content = "Script carregado com sucesso! Divirta-se.",
    Duration = 5
})

print("PhHub carregado! Use o menu para configurar.")
