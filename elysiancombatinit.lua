local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "PulSec Hub",
   Icon = 0,
   LoadingTitle = "Pulsery Initiation",
   LoadingSubtitle = "nitay nitay bl bl",
   Theme = "Default",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true,
   },

   KeySystem = true,
   KeySettings = {
      Title = "PulSec Key System",
      Subtitle = "Go to Pulsery Discord in order to get it",
      Note = "https://discord.gg/8rF2XyQj",
      FileName = "initiatedkey",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"nitaybl"}
   }
})

local function modifyToolAttributes(toolName, attributes)
    local player = game.Players.LocalPlayer
    local tool = player.Backpack:FindFirstChild(toolName) or player.Character:FindFirstChild(toolName)

    if tool then
        for attribute, value in pairs(attributes) do
            tool:SetAttribute(attribute, value)
        end
        print(toolName .. " attributes have been set.")
    else
        print(toolName .. " not found in the Backpack or equipped.")
    end
end

local Tab = Window:CreateTab("Modded World", 0)

local swordTools = {"Sword", "Katana", "Firebrand", "Crescendo"}
local selectedTool = swordTools[1]
local swingRate, lungeRate, offhandSwingRate, windup = "0", "0", "0", "0"

Tab:CreateDropdown({
    Name = "Select Tools",
    Options = swordTools,
    CurrentOption = swordTools[1],
    MultipleOptions = false,
    Callback = function(option)
        selectedTool = option
    end
})

Tab:CreateInput({
    Name = "Swing Rate",
    PlaceholderText = "0",
    Callback = function(value)
        swingRate = value
    end
})

Tab:CreateInput({
    Name = "Lunge Rate",
    PlaceholderText = "0",
    Callback = function(value)
        lungeRate = value
    end
})

Tab:CreateInput({
    Name = "Offhand Swing Rate",
    PlaceholderText = "0",
    Callback = function(value)
        offhandSwingRate = value
    end
})

Tab:CreateInput({
    Name = "Windup(Firebrand&Crescendo)",
    PlaceholderText = "0",
    Callback = function(value)
        windup = value
    end
})

Tab:CreateButton({
    Name = "Apply Mods",
    Callback = function()
        local player = game.Players.LocalPlayer
        local tool = player.Backpack:FindFirstChild(selectedTool) or player.Character:FindFirstChild(selectedTool)
        if tool then
            tool:SetAttribute("Swingrate", tonumber(swingRate) or 0)
            tool:SetAttribute("LungeRate", tonumber(lungeRate) or 0)
            tool:SetAttribute("OffhandSwingRate", tonumber(offhandSwingRate) or 0)
            if selectedTool == "Firebrand" or selectedTool == "Crescendo" then
                tool:SetAttribute("Windup", tonumber(windup) or 0)
            end
            Rayfield:Notify({
                Title = "Success",
                Content = selectedTool .. " attributes have been set!",
                Duration = 3
            })
        else
            Rayfield:Notify({
                Title = "Error",
                Content = selectedTool .. " not found in Backpack or equipped.",
                Duration = 3
            })
        end
    end
})

local Section2 = Tab:CreateSection("Slingshot")
Tab:CreateParagraph({Title = "Slingshot", Content = "Flash Shoots"})

-- Slingshot Section (Rayfield v4 style)

local slingshotTools = {"Slingshot","Flamethrower"} -- Add more if needed
local selectedSlingshot = slingshotTools[1]
local capacity, chargeRate, firerate, spread, projectileSpeed, Cooldown = "10000", "0", "0", "0", "2250", "0"

Tab:CreateDropdown({
    Name = "Select Tools",
    Options = slingshotTools,
    CurrentOption = slingshotTools[1],
    MultipleOptions = false,
    Callback = function(option)
        selectedSlingshot = option
    end
})

Tab:CreateInput({
    Name = "Capacity",
    PlaceholderText = "10000",
    Callback = function(value)
        capacity = value
    end
})

Tab:CreateInput({
    Name = "Charge Rate",
    PlaceholderText = "0",
    Callback = function(value)
        chargeRate = value
    end
})

Tab:CreateInput({
    Name = "Firerate",
    PlaceholderText = "0",
    Callback = function(value)
        firerate = value
    end
})

Tab:CreateInput({
    Name = "Spread",
    PlaceholderText = "0",
    Callback = function(value)
        spread = value
    end
})

Tab:CreateInput({
    Name = "Projectile Speed",
    PlaceholderText = "2250",
    Callback = function(value)
        projectileSpeed = value
    end
})

Tab:CreateInput({
    Name = "Cooldown(Flamethrower)",
    PlaceholderText = "0",
    Callback = function(value)
        Cooldown = value
    end
})

Tab:CreateButton({
    Name = "Apply Mods",
    Callback = function()
        local player = game.Players.LocalPlayer
        local tool = player.Backpack:FindFirstChild(selectedSlingshot) or player.Character:FindFirstChild(selectedSlingshot)
        if tool then
            if selectedSlingshot == "Slingshot" then
                tool:SetAttribute("Capacity", tonumber(capacity) or 10000)
                tool:SetAttribute("ChargeRate", tonumber(chargeRate) or 0)
                tool:SetAttribute("Firerate", tonumber(firerate) or 0)
                tool:SetAttribute("Spread", tonumber(spread) or 0)
                tool:SetAttribute("ProjectileSpeed", tonumber(projectileSpeed) or 2250)
            elseif selectedSlingshot == "Flamethrower" then
                tool:SetAttribute("Cooldown", tonumber(Cooldown) or 0)
            end
            Rayfield:Notify({
                Title = "Success",
                Content = selectedSlingshot .. " attributes have been set!",
                Duration = 3
            })
        else
            Rayfield:Notify({
                Title = "Error",
                Content = selectedSlingshot .. " not found in Backpack or equipped.",
                Duration = 3
            })
        end
    end
})

local Section3 = Tab:CreateSection("Paintball Gun")
Tab:CreateParagraph({Title = "Paintball Gun", Content = "Real rifle"})

-- Paintball Gun Section (Rayfield v4 style)

local paintballTools = {"Paintball Gun","BB Gun","Freeze Ray"} -- Add more if needed
local selectedPaintball = paintballTools[1]
local pbFirerate, pbProjectileSpeed, pbMinShots, pbMaxShots, pbChargeTime = "0", "2250", "2", tostring(math.huge), "0"

Tab:CreateDropdown({
    Name = "Select Tools",
    Options = paintballTools,
    CurrentOption = paintballTools[1],
    MultipleOptions = false,
    Callback = function(option)
        selectedPaintball = option
    end
})

Tab:CreateInput({
    Name = "Firerate",
    PlaceholderText = "0",
    Callback = function(value)
        pbFirerate = value
    end
})

Tab:CreateInput({
    Name = "Projectile Speed",
    PlaceholderText = "2250",
    Callback = function(value)
        pbProjectileSpeed = value
    end
})

Tab:CreateInput({
    Name = "Min Shots(BB Gun)",
    PlaceholderText = "2",
    Callback = function(value)
        pbMinShots = value
    end
})

Tab:CreateInput({
    Name = "Max Shots(BB Gun)",
    PlaceholderText = "999999",
    Callback = function(value)
        pbMaxShots = value
    end
})

Tab:CreateInput({
    Name = "Charge Time(Freeze Ray)",
    PlaceholderText = "0",
    Callback = function(value)
        pbChargeTime = value
    end
})

Tab:CreateButton({
    Name = "Apply Mods",
    Callback = function()
        local player = game.Players.LocalPlayer
        local tool = player.Backpack:FindFirstChild(selectedPaintball) or player.Character:FindFirstChild(selectedPaintball)
        if tool then
            if selectedPaintball == "Paintball Gun" then
                tool:SetAttribute("Firerate", tonumber(pbFirerate) or 0)
                tool:SetAttribute("ProjectileSpeed", tonumber(pbProjectileSpeed) or 2250)
            elseif selectedPaintball == "BB Gun" then
                tool:SetAttribute("MinShots", tonumber(pbMinShots) or 2)
                tool:SetAttribute("MaxShots", tonumber(pbMaxShots) or 99999)
                tool:SetAttribute("Firerate", tonumber(pbFirerate) or 0)
                tool:SetAttribute("ProjectileSpeed", tonumber(pbProjectileSpeed) or 2250)
            elseif selectedPaintball == "Freeze Ray" then
                tool:SetAttribute("ChargeTime", tonumber(pbChargeTime) or 0)
                tool:SetAttribute("Firerate", tonumber(pbFirerate) or 0)
                tool:SetAttribute("ProjectileSpeed", tonumber(pbProjectileSpeed) or 2250)
            end
            Rayfield:Notify({
                Title = "Success",
                Content = selectedPaintball .. " attributes have been set!",
                Duration = 3
            })
        else
            Rayfield:Notify({
                Title = "Error",
                Content = selectedPaintball .. " not found in Backpack or equipped.",
                Duration = 3
            })
        end
    end
})

local Section4 = Tab:CreateSection("Superball")
Tab:CreateParagraph({Title = "Superball", Content = "Baller!:D"})

Tab:CreateInput({
    Name = "Throw Rate",
    PlaceholderText = "0",
    Callback = function(value)
        ninjaThrowRate = value
    end
})

Tab:CreateInput({
    Name = "Capacity",
    PlaceholderText = "10000000",
    Callback = function(value)
        ninjaCapacity = value
    end
})

Tab:CreateInput({
    Name = "Charge Rate",
    PlaceholderText = "0",
    Callback = function(value)
        ninjaChargeRate = value
    end
})

Tab:CreateButton({
    Name = "Apply Mods",
    Callback = function()
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Ninja Stars") or game.Players.LocalPlayer.Character:FindFirstChild("Ninja Stars")
        if tool then
            tool:SetAttribute("ThrowRate", tonumber(ninjaThrowRate) or 0)
            tool:SetAttribute("Capacity", tonumber(ninjaCapacity) or 10000000)
            tool:SetAttribute("ChargeRate", tonumber(ninjaChargeRate) or 0)
            Rayfield:Notify({
                Title = "Success",
                Content = "Ninja Stars attributes have been set!",
                Duration = 3
            })
        else
            Rayfield:Notify({
                Title = "Error",
                Content = "Ninja Stars not found in the Backpack or equipped.",
                Duration = 3
            })
        end
    end
})

local Section6 = Tab:CreateSection("Trowel")
Tab:CreateParagraph({Title = "Trowel", Content = "Sentry Dispenser Here:D"})

-- Toggle for Frozen Wrench
Tab:CreateToggle({
	Name = "Frozen Wrench",
	Flag = "Wrench",
	Callback = function(Value)
		local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Wrench") or game.Players.LocalPlayer.Character:FindFirstChild("Wrench")
		if tool then
			tool:SetAttribute("TimeScale", Value and 0 or 1)
		else
			print("Wrench not found in the Backpack or equipped.")
		end
	end
})

local rocketTools = {"Rocket Launcher", "Multi-Rocket Launcher", "Bazooka"}
local selectedRocket = rocketTools[1]
local rocketCooldown, rocketFirerate, rocketProjectileSpeed, rocketCapacity = "0", "0", "1000", "0"

Tab:CreateSection("Rocket Launchers")
Tab:CreateParagraph({Title = "Rocket Launchers", Content = "5 big booms:Boom!,Boom!,Boom!,Boom!,BOOM!"})
Tab:CreateDropdown({
    Name = "Select Tools",
    Options = rocketTools,
    CurrentOption = rocketTools[1],
    MultipleOptions = false,
    Callback = function(option)
        selectedRocket = option
    end
})

Tab:CreateInput({
    Name = "Cooldown",
    PlaceholderText = "0",
    Callback = function(value)
        rocketCooldown = value
    end
})

Tab:CreateInput({
    Name = "Firerate",
    PlaceholderText = "0",
    Callback = function(value)
        rocketFirerate = value
    end
})

Tab:CreateInput({
    Name = "Projectile Speed",
    PlaceholderText = "1000",
    Callback = function(value)
        rocketProjectileSpeed = value
    end
})

Tab:CreateInput({
    Name = "Capacity(Bazooka)",
    PlaceholderText = "0",
    Callback = function(value)
        rocketCapacity = value
    end
})

Tab:CreateButton({
    Name = "Apply Mods",
    Callback = function()
        local player = game.Players.LocalPlayer
        local tool = player.Backpack:FindFirstChild(selectedRocket) or player.Character:FindFirstChild(selectedRocket)
        if tool then
            tool:SetAttribute("Cooldown", tonumber(rocketCooldown) or 0)
            tool:SetAttribute("Firerate", tonumber(rocketFirerate) or 0)
            tool:SetAttribute("ProjectileSpeed", tonumber(rocketProjectileSpeed) or 1000)
            if selectedRocket == "Bazooka" then
                tool:SetAttribute("Capacity", tonumber(rocketCapacity) or 0)
            end
            Rayfield:Notify({
                Title = "Success",
                Content = selectedRocket .. " attributes have been set!",
                Duration = 3
            })
        else
            Rayfield:Notify({
                Title = "Error",
                Content = selectedRocket .. " not found in Backpack or equipped.",
                Duration = 3
            })
        end
    end
})

-- Auto Inject Section (Add this after line 46, before the existing Tab creation)
local autoInjectEnabled = false
local selectedAutoTool = "Sword"
local allTools = {}

-- Combine all tools from different categories
for _, tool in ipairs(swordTools) do table.insert(allTools, tool) end
for _, tool in ipairs(slingshotTools) do table.insert(allTools, tool) end  
for _, tool in ipairs(paintballTools) do table.insert(allTools, tool) end
for _, tool in ipairs(rocketTools) do table.insert(allTools, tool) end
table.insert(allTools, "Ninja Stars")
table.insert(allTools, "Wrench")
table.insert(allTools, "Stamina")

-- Auto Inject function
local function autoInjectTool()
    if not autoInjectEnabled then return end
    
    local player = game.Players.LocalPlayer
    local tool = player.Backpack:FindFirstChild(selectedAutoTool) or player.Character:FindFirstChild(selectedAutoTool)
    
    if tool then
        -- Apply mods based on tool type
        if table.find(swordTools, selectedAutoTool) then
            tool:SetAttribute("Swingrate", tonumber(swingRate) or 0)
            tool:SetAttribute("LungeRate", tonumber(lungeRate) or 0)
            tool:SetAttribute("OffhandSwingRate", tonumber(offhandSwingRate) or 0)
            if selectedAutoTool == "Firebrand" or selectedAutoTool == "Crescendo" then
                tool:SetAttribute("Windup", tonumber(windup) or 0)
            end
        elseif table.find(slingshotTools, selectedAutoTool) then
            if selectedAutoTool == "Slingshot" then
                tool:SetAttribute("Capacity", tonumber(capacity) or 10000)
                tool:SetAttribute("ChargeRate", tonumber(chargeRate) or 0)
                tool:SetAttribute("Firerate", tonumber(firerate) or 0)
                tool:SetAttribute("Spread", tonumber(spread) or 0)
                tool:SetAttribute("ProjectileSpeed", tonumber(projectileSpeed) or 2250)
            elseif selectedAutoTool == "Flamethrower" then
                tool:SetAttribute("Cooldown", tonumber(Cooldown) or 0)
            end
        elseif table.find(paintballTools, selectedAutoTool) then
            if selectedAutoTool == "Paintball Gun" then
                tool:SetAttribute("Firerate", tonumber(pbFirerate) or 0)
                tool:SetAttribute("ProjectileSpeed", tonumber(pbProjectileSpeed) or 2250)
            elseif selectedAutoTool == "BB Gun" then
                tool:SetAttribute("MinShots", tonumber(pbMinShots) or 2)
                tool:SetAttribute("MaxShots", tonumber(pbMaxShots) or 999999)
                tool:SetAttribute("Firerate", tonumber(pbFirerate) or 0)
            elseif selectedAutoTool == "Freeze Ray" then
                tool:SetAttribute("ChargeTime", tonumber(pbChargeTime) or 0)
                tool:SetAttribute("Firerate", tonumber(pbFirerate) or 0)
                tool:SetAttribute("ProjectileSpeed", tonumber(pbProjectileSpeed) or 2250)
            end
        elseif table.find(rocketTools, selectedAutoTool) then
            tool:SetAttribute("Cooldown", tonumber(rocketCooldown) or 0)
            tool:SetAttribute("Firerate", tonumber(rocketFirerate) or 0)
            tool:SetAttribute("ProjectileSpeed", tonumber(rocketProjectileSpeed) or 1000)
            if selectedAutoTool == "Bazooka" then
                tool:SetAttribute("Capacity", tonumber(rocketCapacity) or 0)
            end
        elseif selectedAutoTool == "Ninja Stars" then
            tool:SetAttribute("ThrowRate", tonumber(ninjaThrowRate) or 0)
            tool:SetAttribute("Capacity", tonumber(ninjaCapacity) or 10000000)
            tool:SetAttribute("ChargeRate", tonumber(ninjaChargeRate) or 0)
        elseif selectedAutoTool == "Wrench" then
            tool:SetAttribute("TimeScale", 0)
        elseif selectedAutoTool == "Stamina" then
            if player.Character then
                if player.Character:FindFirstChild("Stamina") then
                    player.Character.Stamina.Value = math.huge
                end
                player.Character:SetAttribute("Stamina", math.huge)
                player.Character:SetAttribute("StaminaRegenTime", 0)
            end
        end
    end
end

-- Add Auto Inject controls to Tab (Add this after line 47, right after Tab creation)
local AutoSection = Tab:CreateSection("Auto Inject")

Tab:CreateToggle({
    Name = "Auto Inject",
    CurrentValue = false,
    Callback = function(Value)
        autoInjectEnabled = Value
        if Value then
            -- Connect to respawn
            if not getgenv().AutoInjectConnection then
                getgenv().AutoInjectConnection = game.Players.LocalPlayer.CharacterAdded:Connect(function()
                    task.wait(2) -- Wait for tools to load
                    autoInjectTool()
                end)
            end
            -- Apply immediately
            autoInjectTool()
        else
            -- Disconnect when disabled
            if getgenv().AutoInjectConnection then
                getgenv().AutoInjectConnection:Disconnect()
                getgenv().AutoInjectConnection = nil
            end
        end
    end
})


Tab:CreateDropdown({
    Name = "Auto Inject Tool",
    Options = allTools,
    CurrentOption = allTools[1],
    MultipleOptions = false,
    Callback = function(option)
        selectedAutoTool = option
        if autoInjectEnabled then
            autoInjectTool()
        end
    end
})

local Tab2 = Window:CreateTab("Pogo Editor", 0)

Tab2:CreateInput({
    Name = "Melee Range (5 = +500%)",
    CurrentValue = "5",
    RemoveTextAfterFocusLost = false,
    PlaceholderText = "",
    Flag = "meleerangevalue",
    Callback = function(Value)
        Rayfield.Flags["meleerangevalue"] = Value
    end	  
})

Tab2:CreateInput({
    Name = "Pogo Range (5 = +500%)",
    CurrentValue = "5",
    RemoveTextAfterFocusLost = false,
    PlaceholderText = "",
    Flag = "pogorangevalue",
    Callback = function(Value)
        Rayfield.Flags["pogorangevalue"] = Value
    end	  
})

Tab2:CreateButton({
    Name = "Bandit/Stage Prop (Melee Range & Pogo Range)",
    Callback = function()
        local character = game.Players.LocalPlayer.Character
        if character then
            local accessoryEffects = character:FindFirstChild("AccessoryEffects")
            if accessoryEffects then
                accessoryEffects:SetAttribute("Melee_Range", tonumber(Rayfield.Flags["meleerangevalue"]) or 1)
                accessoryEffects:SetAttribute("Pogo_Range", tonumber(Rayfield.Flags["pogorangevalue"]) or 1)
            else
                print("AccessoryEffects not found.")
            end
        else
            print("Character not found.")
        end
    end
})

local Tab3 = Window:CreateTab("Character")

Tab3:CreateToggle({
    Name = "Infinite Dashes",
    CurrentValue = false,
    Flag = "InfiniteDashesToggle",
    Callback = function(Value)
        getgenv().InfiniteDashesEnabled = Value
        
        if getgenv().InfiniteDashesConnection then
            getgenv().InfiniteDashesConnection:Disconnect()
            getgenv().InfiniteDashesConnection = nil
        end
        
        if Value then
            -- Apply immediately
            local character = game.Players.LocalPlayer.Character
            if character then
                character:SetAttribute("DashRegenTime", 0.05)
            end
            
            getgenv().InfiniteDashesConnection = game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
                task.wait(1)
                if getgenv().InfiniteDashesEnabled then
                    character:SetAttribute("DashRegenTime", 0.05)
                end
            end)
        end
    end
})

Tab3:CreateToggle({
    Name = "Anti-Fling",
    CurrentValue = false,
    Flag = "AntiFlingToggle",
    Callback = function(enabled)
        if getgenv().AntiFlingConnection then
            getgenv().AntiFlingConnection:Disconnect()
            getgenv().AntiFlingConnection = nil
        end
        if enabled then
            local lastCFrame = nil
            local lastTime = tick()
            local updateDelay = 0
            
            getgenv().AntiFlingConnection = game:GetService("RunService").Heartbeat:Connect(function()
                local character = game.Players.LocalPlayer.Character
                local hrp = character and character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local currentTime = tick()
                    
                    if lastCFrame then
                        local dist = (hrp.Position - lastCFrame.Position).Magnitude
                        local dt = currentTime - lastTime
                        
                        if dist > 50 and dt < 0.1 and hrp.AssemblyLinearVelocity.Magnitude > 100 then
                            hrp.CFrame = lastCFrame
                            hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                            hrp.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                        end
                    end
                    
                    if currentTime - updateDelay > 0.2 then
                        lastCFrame = hrp.CFrame
                        updateDelay = currentTime
                    end
                    lastTime = currentTime
                end
            end)
        end
    end
})

Tab3:CreateInput({
    Name = "Utility Boost Value",
    CurrentValue = "2",
    RemoveTextAfterFocusLost = false,
    PlaceholderText = "",
    Flag = "utilityboostvalue",
    Callback = function(Value)
        Rayfield.Flags["utilityboostvalue"] = Value
    end
})

Tab3:CreateButton({
    Name = "Utility Boost",
    Callback = function()
        local character = game.Players.LocalPlayer.Character
        if character then
            character:SetAttribute("UtilityBoost", tonumber(Rayfield.Flags["utilityboostvalue"]) or 2)
        else
            print("Character not found.")
        end
    end
})

Tab3:CreateSlider({
    Name = "Field of View",
    Range = {50, 125},
    Increment = 1,
    CurrentValue = 70,
    Flag = "FOVSlider",
    Callback = function(Value)
        local camera = workspace.CurrentCamera
        if camera then
            camera.FieldOfView = Value
        end
    end
})

EnemiesTab:CreateToggle({
    Name = "Freeze Enemies(Beta)",
    CurrentValue = false,
    Flag = "FreezeEnemiesToggle",
    Callback = function(Value)
        local enemiesFolder = workspace:FindFirstChild("Enemies")
        if not enemiesFolder then return end

        for _, enemy in ipairs(enemiesFolder:GetChildren()) do
            local hrp = enemy:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.Anchored = Value
            end
            -- Disable Animator and stop all animations
            local humanoid = enemy:FindFirstChild("Humanoid")
            if humanoid then
                local animator = humanoid:FindFirstChildOfClass("Animator")
                if animator then
                    animator:StopAnimations()
                    animator.Parent = nil -- Optionally remove animator
                end
                -- Stop any playing AnimationTracks
                for _, anim in ipairs(humanoid:GetPlayingAnimationTracks()) do
                    anim:Stop()
                end
            end
        end
    end
})

    local EnemiesTab = Window:CreateTab("Enemies")

    EnemiesTab:CreateToggle({
    Name = "Attention Hiding",
    CurrentValue = false,
    Flag = "AttentionHidingToggle",
    Callback = function(Value)
        local character = game.Players.LocalPlayer.Character
        if character then
            if Value then
                character:SetAttribute("AggroMultiplier", 0)
                print("Attention Hiding enabled.")
            else
                character:SetAttribute("AggroMultiplier", 1) -- Reset to default if needed
                print("Attention Hiding disabled.")
            end
        else
            print("Character not found.")
        end
    end
})

    EnemiesTab:CreateToggle({
    Name = "Enemies Baiting",
    CurrentValue = false,
    Flag = "EnemiesBaitingToggle",
    Callback = function(Value)
        local character = game.Players.LocalPlayer.Character
        if character then
            if Value then
                character:SetAttribute("AggroMultiplier", math.huge)
                print("Enemies Baiting enabled.")
            else
                character:SetAttribute("AggroMultiplier", 1) -- Reset to default if needed
                print("Enemies Baiting disabled.")
            end
        else
            print("Character not found.")
        end
    end
})

local espColor = Color3.fromRGB(255, 0, 0) -- Default color

EnemiesTab:CreateColorPicker({
    Name = "ESP Color",
    Color = espColor,
    Flag = "ESPColorPicker",
    Callback = function(color)
        espColor = color
        -- Update all current highlights and drawings if ESP is enabled
        local enemiesFolder = workspace:FindFirstChild("Enemies")
        if enemiesFolder then
            for _, enemy in ipairs(enemiesFolder:GetChildren()) do
                local highlight = enemy:FindFirstChild("EspHighlight")
                if highlight then
                    highlight.FillColor = espColor
                end
                -- Drawing API color update
                if enemy:FindFirstChild("EspDrawingTag") then
                    if enemy.EspBox then enemy.EspBox.Color = espColor end
                    if enemy.EspTracer then enemy.EspTracer.Color = espColor end
                end
            end
        end
    end
})

EnemiesTab:CreateToggle({
    Name = "Enemy ESP",
    CurrentValue = false,
    Flag = "EnemyESPToggle",
    Callback = function(Value)
        local enemiesFolder = workspace:FindFirstChild("Enemies")
        if not enemiesFolder then return end

        -- Helper to remove all ESP from an enemy
        local function removeESP(enemy)
            local highlight = enemy:FindFirstChild("EspHighlight")
            if highlight then highlight:Destroy() end
            local hrp = enemy:FindFirstChild("HumanoidRootPart")
            if hrp then
                local gui = hrp:FindFirstChild("EspHealthGui")
                if gui then gui:Destroy() end
                local distGui = hrp:FindFirstChild("EspDistanceGui")
                if distGui then distGui:Destroy() end
            end
            if enemy.EspBox then enemy.EspBox:Remove() enemy.EspBox = nil end
            if enemy.EspTracer then enemy.EspTracer:Remove() enemy.EspTracer = nil end
            if enemy:FindFirstChild("EspDrawingTag") then enemy.EspDrawingTag:Destroy() end
            if enemy.EspDistance then enemy.EspDistance:Remove() enemy.EspDistance = nil end
            if enemy._espConn then enemy._espConn:Disconnect() enemy._espConn = nil end
        end

        -- Helper to add all ESP to an enemy
        local function addESP(enemy)
            -- Always add highlight to the enemy model
            if not enemy:FindFirstChild("EspHighlight") then
                local highlight = Instance.new("Highlight")
                highlight.Name = "EspHighlight"
                highlight.FillColor = espColor
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.FillTransparency = 0.5
                highlight.Parent = enemy
            end

            local hrp = enemy:FindFirstChild("HumanoidRootPart")
            local humanoid = enemy:FindFirstChild("Humanoid")
            if hrp and humanoid then
                -- Health Bar (BillboardGui)
                if not hrp:FindFirstChild("EspHealthGui") then
                    local gui = Instance.new("BillboardGui")
                    gui.Name = "EspHealthGui"
                    gui.Adornee = hrp
                    gui.Size = UDim2.new(4,0,0.5,0)
                    gui.StudsOffset = Vector3.new(0, 4, 0)
                    gui.AlwaysOnTop = true

                    local bar = Instance.new("Frame")
                    bar.Name = "HealthBar"
                    bar.BackgroundColor3 = Color3.fromRGB(0,255,0)
                    bar.BorderSizePixel = 0
                    bar.Size = UDim2.new(1,0,1,0)
                    bar.Parent = gui

                    gui.Parent = hrp

                    -- Update health bar
                    local function updateBar()
                        if humanoid and bar then
                            bar.Size = UDim2.new(math.clamp(humanoid.Health/humanoid.MaxHealth,0,1),0,1,0)
                            if humanoid.Health/humanoid.MaxHealth < 0.3 then
                                bar.BackgroundColor3 = Color3.fromRGB(255,0,0)
                            else
                                bar.BackgroundColor3 = Color3.fromRGB(0,255,0)
                            end
                        end
                    end
                    humanoid:GetPropertyChangedSignal("Health"):Connect(updateBar)
                    updateBar()
                end

                -- Distance (BillboardGui)
                if not hrp:FindFirstChild("EspDistanceGui") then
                    local distGui = Instance.new("BillboardGui")
                    distGui.Name = "EspDistanceGui"
                    distGui.Adornee = hrp
                    distGui.Size = UDim2.new(4,0,0.5,0)
                    distGui.StudsOffset = Vector3.new(0, 5, 0)
                    distGui.AlwaysOnTop = true

                    local distLabel = Instance.new("TextLabel")
                    distLabel.Name = "DistanceLabel"
                    distLabel.BackgroundTransparency = 1
                    distLabel.Size = UDim2.new(1,0,1,0)
                    distLabel.TextColor3 = Color3.fromRGB(255,255,255)
                    distLabel.TextStrokeTransparency = 0
                    distLabel.TextScaled = true
                    distLabel.Font = Enum.Font.SourceSansBold
                    distLabel.Parent = distGui

                    distGui.Parent = hrp

                    -- Update distance
                    local function updateDist()
                        local player = game.Players.LocalPlayer
                        local myhrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                        local dist = myhrp and (myhrp.Position - hrp.Position).Magnitude or 0
                        distLabel.Text = string.format("%.0f studs", dist)
                    end
                    game:GetService("RunService").RenderStepped:Connect(updateDist)
                    updateDist()
                end
            end

            if Drawing then
                if not enemy:FindFirstChild("EspDrawingTag") then
                    local tag = Instance.new("BoolValue")
                    tag.Name = "EspDrawingTag"
                    tag.Parent = enemy
                end

                local camera = workspace.CurrentCamera
                local player = game.Players.LocalPlayer
                -- Disconnect previous connection if any
                if enemy._espConn then enemy._espConn:Disconnect() end
                enemy._espConn = game:GetService("RunService").RenderStepped:Connect(function()
                    if not enemy.Parent then
                        removeESP(enemy)
                        return
                    end
                    local hrp = enemy:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        local pos, onScreen = camera:WorldToViewportPoint(hrp.Position)
                        if onScreen then
                            -- Box
                            if not enemy.EspBox then
                                enemy.EspBox = Drawing.new("Square")
                                enemy.EspBox.Color = espColor
                                enemy.EspBox.Thickness = 2
                                enemy.EspBox.Filled = false
                            end
                            enemy.EspBox.Visible = true
                            enemy.EspBox.Position = Vector2.new(pos.X-25, pos.Y-50)
                            enemy.EspBox.Size = Vector2.new(50,100)

                            -- Tracer
                            if not enemy.EspTracer then
                                enemy.EspTracer = Drawing.new("Line")
                                enemy.EspTracer.Color = espColor
                                enemy.EspTracer.Thickness = 2
                            end
                            enemy.EspTracer.Visible = true
                            enemy.EspTracer.From = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y)
                            enemy.EspTracer.To = Vector2.new(pos.X, pos.Y)
                        else
                            if enemy.EspBox then enemy.EspBox.Visible = false end
                            if enemy.EspTracer then enemy.EspTracer.Visible = false end
                        end
                    end
                end)
            end
        end

        -- Disconnect previous listeners if any
        if getgenv().EnemyESPConnections then
            for _, conn in ipairs(getgenv().EnemyESPConnections) do
                conn:Disconnect()
            end
            getgenv().EnemyESPConnections = nil
        end

        if not getgenv().EnemyESPConnections then
            getgenv().EnemyESPConnections = {}
        end
        table.insert(getgenv().EnemyESPConnections, enemiesFolder.ChildAdded:Connect(function(enemy)
            if Value then addESP(enemy) end
        end))
        table.insert(getgenv().EnemyESPConnections, enemiesFolder.ChildRemoved:Connect(function(enemy)
            removeESP(enemy)
        end))

        for _, enemy in ipairs(enemiesFolder:GetChildren()) do
            if Value then
                addESP(enemy)
            else
                removeESP(enemy)
            end
        end
    end
})

EnemiesTab:CreateToggle({
    Name = "Trigger Enemies",
    CurrentValue = false,
    Flag = "TriggerEnemiesToggle",
    Callback = function(Value)
        local lp = game.Players.LocalPlayer
        local enemiesFolder = workspace:FindFirstChild("Enemies")
        if not enemiesFolder then return end

        getgenv().Farm = Value
        local distance = 10

        if Value then
            task.spawn(function()
                while getgenv().Farm do
                    local playerHRP = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
                    for _, npc in ipairs(enemiesFolder:GetChildren()) do
                        local npcHRP = npc:FindFirstChild("HumanoidRootPart")
                        local npcHumanoid = npc:FindFirstChild("Humanoid")
                        if playerHRP and npcHRP and npcHumanoid and npcHumanoid.Health > 0 then
                            npcHRP.CFrame = playerHRP.CFrame + playerHRP.CFrame.LookVector * distance
                        end
                    end
                    task.wait(0.1)
                end
            end)
        end
    end
})

local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local camera = workspace.CurrentCamera
local lp = game.Players.LocalPlayer

local aimbotSmoothness = 0.15
local aimbotKey = Enum.KeyCode.Q
getgenv().AimbotActive = false

local function getClosestNPC()
    local closest, minDist = nil, math.huge
    local enemiesFolder = workspace:FindFirstChild("Enemies")
    if not enemiesFolder then return nil end
    
    for _, npc in ipairs(enemiesFolder:GetChildren()) do
        if npc:IsA("Model") then
            local hrp = npc:FindFirstChild("HumanoidRootPart")
            local humanoid = npc:FindFirstChild("Humanoid")
            if hrp and humanoid and humanoid.Health > 0 then
                local screenPos, onScreen = camera:WorldToViewportPoint(hrp.Position)
                if onScreen then
                    local dist = (camera.CFrame.Position - hrp.Position).Magnitude
                    if dist < minDist then
                        closest = hrp
                        minDist = dist
                    end
                end
            end
        end
    end
    return closest
end

local AimbotTab = Window:CreateTab("Aimbot Things")

AimbotTab:CreateSlider({
    Name = "Aimbot Smoothness",
    Range = {0.01, 1},
    Increment = 0.01,
    CurrentValue = 0.15,
    Callback = function(Value)
        aimbotSmoothness = Value
    end
})

AimbotTab:CreateInput({
    Name = "Aimbot Keybind",
    PlaceholderText = "P",
    Callback = function(value)
        local key = value:upper()
        if Enum.KeyCode[key] then
            aimbotKey = Enum.KeyCode[key]
        end
    end
})

UserInputService.InputBegan:Connect(function(input, processed)
    if not processed and input.KeyCode == aimbotKey then
        getgenv().AimbotActive = not getgenv().AimbotActive
        Rayfield:Notify({
            Title = "Aimbot",
            Content = "Aimbot " .. (getgenv().AimbotActive and "enabled" or "disabled"),
            Duration = 2
        })
    end
end)

RunService.RenderStepped:Connect(function()
    if getgenv().AimbotActive then
        local target = getClosestNPC()
        if target and lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
            local currentCF = camera.CFrame
            local targetCF = CFrame.new(currentCF.Position, target.Position)
            camera.CFrame = currentCF:Lerp(targetCF, aimbotSmoothness)
        end
    end
end)

local CoinAimbotEnabled = false

local function getClosestPelletToss()
    local closest, minDist = nil, math.huge
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and obj.Name == "PelletToss" and obj:FindFirstChild("PrimaryPart") then
            local dist = (camera.CFrame.Position - obj.PrimaryPart.Position).Magnitude
            if dist < minDist then
                closest = obj.PrimaryPart
                minDist = dist
            end
        end
    end
    return closest
end

AimbotTab:CreateToggle({
    Name = "Coin Aimbot",
    CurrentValue = false,
    Flag = "CoinAimbotToggle",
    Callback = function(Value)
        CoinAimbotEnabled = Value
        Rayfield:Notify({
            Title = "Coin Aimbot",
            Content = "Coin Aimbot " .. (Value and "enabled" or "disabled"),
            Duration = 2
        })
    end
})

RunService.RenderStepped:Connect(function()
    if CoinAimbotEnabled then
        local target = getClosestPelletToss()
        if target then
            local currentCF = camera.CFrame
            local targetCF = CFrame.new(currentCF.Position, target.Position)
            camera.CFrame = currentCF:Lerp(targetCF, 0.2) -- Adjust smoothness as needed
        end
    end
end)

AutomaticTab:CreateInput({
    Name = "Slingshot Keybind",
    PlaceholderText = "E",
    Callback = function(value)
        local key = value:upper()
        if Enum.KeyCode[key] then
            slingshotKey = Enum.KeyCode[key]
        end
    end
})

AutomaticTab:CreateInput({
    Name = "Sword Keybind",
    PlaceholderText = "F",
    Callback = function(value)
        local key = value:upper()
        if Enum.KeyCode[key] then
            swordKey = Enum.KeyCode[key]
        end
    end
})

AutomaticTab:CreateToggle({
    Name = "Auto Slash of Tix",
    CurrentValue = false,
    Flag = "AutoSlashOfTixToggle",
    Callback = function(Value)
        local VirtualInputManager = game:GetService("VirtualInputManager")
        -- Stop any previous loop
        if getgenv().AutoSlashOfTixLoop then
            getgenv().AutoSlashOfTixLoop = false
        end
        -- Start new loop if enabled
        if Value then
            getgenv().AutoSlashOfTixLoop = true
            task.spawn(function()
                while getgenv().AutoSlashOfTixLoop do
                    -- Press Slingshot Key
                    VirtualInputManager:SendKeyEvent(true, slingshotKey, false, game)
                    VirtualInputManager:SendKeyEvent(false, slingshotKey, false, game)
                    task.wait(0.1)
                    -- Press Sword Key
                    VirtualInputManager:SendKeyEvent(true, swordKey, false, game)
                    VirtualInputManager:SendKeyEvent(false, swordKey, false, game)
                    task.wait(1)
                end
            end)
        end
    end
})

AutomaticTab:CreateToggle({
    Name = "Auto TP Farm(Risk)",
    CurrentValue = false,
    Flag = "AutoFarmToggle",
    Callback = function(Value)
        local lp = game.Players.LocalPlayer
        local enemiesFolder = workspace:FindFirstChild("Enemies")
        local VirtualInputManager = game:GetService("VirtualInputManager")

        local function getNearestEnemy()
            local hrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
            if not hrp or not enemiesFolder then return nil end
            local closest, minDist = nil, math.huge
            for _, npc in ipairs(enemiesFolder:GetChildren()) do
                if npc:IsA("Model") then
                    local npcHRP = npc:FindFirstChild("HumanoidRootPart")
                    local humanoid = npc:FindFirstChild("Humanoid")
                    if npcHRP and humanoid and humanoid.Health > 0 then
                        local dist = (hrp.Position - npcHRP.Position).Magnitude
                        if dist < minDist then
                            closest = npcHRP
                            minDist = dist
                        end
                    end
                end
            end
            return closest
        end

        if getgenv().AutoFarmLoop then
            getgenv().AutoFarmLoop = false
        end

        if Value then
            getgenv().AutoFarmLoop = true
            task.spawn(function()
                while getgenv().AutoFarmLoop do
                    local hrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
                    local enemy = getNearestEnemy()
                    if hrp and enemy then
                        -- Teleport to enemy (slightly above)
                        hrp.CFrame = enemy.CFrame + Vector3.new(0, 5, 0)
                        -- Spam mouse click (attack)
                        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
                        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 0)
                    end
                    task.wait(0.15) -- Adjust spam speed as needed
                end
            end)
        else
            getgenv().AutoFarmLoop = false
        end
    end
})

AutomaticTab:CreateToggle({
    Name = "Auto Parry",
    CurrentValue = false,
    Flag = "AutoParryToggle",
    Callback = function(Value)
        local toolNames = {"Sword", "Katana", "Firebrand", "Crescendo"}
        local player = game.Players.LocalPlayer
        local RunService = game:GetService("RunService")
        local VirtualInputManager = game:GetService("VirtualInputManager")
        local autoParryConn

        -- Helper to equip the first found tool
        local function equipTool()
            for _, name in ipairs(toolNames) do
                local tool = player.Backpack:FindFirstChild(name)
                if tool then
                    player.Character.Humanoid:EquipTool(tool)
                    return tool
                end
                tool = player.Character:FindFirstChild(name)
                if tool then
                    return tool
                end
            end
            return nil
        end

        -- Helper to check if an instance is a player or NPC
        local function isPlayerOrNPC(model)
            if model:IsA("Model") then
                if game.Players:GetPlayerFromCharacter(model) then
                    return true
                end
                if model.Parent and model.Parent.Name == "Enemies" then
                    return true
                end
            end
            return false
        end

        -- Disconnect previous connection if any
        if getgenv().AutoParryConn then
            getgenv().AutoParryConn:Disconnect()
            getgenv().AutoParryConn = nil
        end

        if Value then
            getgenv().AutoParryConn = RunService.Heartbeat:Connect(function()
                local character = player.Character
                local hrp = character and character:FindFirstChild("HumanoidRootPart")
                if not hrp then return end

                local tool = equipTool()
                if not tool then return end

                -- Scan for moving objects (exclude players and NPCs)
                for _, obj in ipairs(workspace:GetDescendants()) do
                    if obj:IsA("BasePart") and obj.Parent ~= character then
                        local parentModel = obj.Parent
                        if not isPlayerOrNPC(parentModel) then
                            local dist = (obj.Position - hrp.Position).Magnitude
                            if dist < 10 then -- You can adjust the parry distance here
                                -- Check if it's moving
                                if obj.AssemblyLinearVelocity and obj.AssemblyLinearVelocity.Magnitude > 1 then
                                    -- Simulate click/parry
                                    VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
                                    VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 0)
                                    break
                                end
                            end
                        end
                    end
                end
            end)
        else
            if getgenv().AutoParryConn then
                getgenv().AutoParryConn:Disconnect()
                getgenv().AutoParryConn = nil
            end
        end
    end
})