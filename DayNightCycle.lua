-- SCRIPT: Dynamic Day/Night Cycle
-- AUTHOR: Wolves892 - coolman1276
-- COPYRIGHT © 2025 Wolves892 - coolman1276. All rights reserved under the MIT License.
-- DESCRIPTION: Manages the game's time progression and environmental lighting.
-- PLACEMENT: ServerScriptService (Synchronizes time and lighting across all players)

-- Services
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")

-- Configuration
local DayLengthInMinutes = 10     -- Real-world minutes for one full 24-hour in-game cycle
local StartTime = 6               -- Initial in-game hour (0-24) when the server starts
local ColorTransitionDuration = 10 -- Duration (in seconds) for smooth lighting color fades

-- Calculates how much ClockTime increments per second
local ClockTimeIncrementPerSecond = (24) / (DayLengthInMinutes * 60)

-- Lighting Color Presets
local DayColors = {
	Ambient = Color3.new(0.6, 0.6, 0.6),
	OutdoorAmbient = Color3.new(0.6, 0.6, 0.6),
	ColorShift_Top = Color3.new(0.5, 0.5, 0.5),
	ColorShift_Bottom = Color3.new(0.3, 0.3, 0.3)
}

local NightColors = {
	Ambient = Color3.new(0.1, 0.1, 0.2),
	OutdoorAmbient = Color3.new(0.1, 0.1, 0.2),
	ColorShift_Top = Color3.new(0, 0, 0.1),
	ColorShift_Bottom = Color3.new(0, 0, 0.05)
}

-- Function to apply lighting colors smoothly
local function setLightingColors(targetColors)
	local tweenInfo = TweenInfo.new(ColorTransitionDuration)
	TweenService:Create(Lighting, tweenInfo, {
		Ambient = targetColors.Ambient,
		OutdoorAmbient = targetColors.OutdoorAmbient,
		ColorShift_Top = targetColors.ColorShift_Top,
		ColorShift_Bottom = targetColors.ColorShift_Bottom
	}):Play()
end

-- Initialize game time and apply initial lighting colors
Lighting.ClockTime = StartTime
if Lighting.ClockTime > 5 and Lighting.ClockTime < 19 then
	setLightingColors(DayColors)
else
	setLightingColors(NightColors)
end

-- Main Day/Night Cycle Loop
while true do
	-- Increment ClockTime, wrapping from 24 to 0 using the modulo operator for continuity
	Lighting.ClockTime = (Lighting.ClockTime + ClockTimeIncrementPerSecond) % 24

	-- Update lighting colors based on whether it's currently "day" or "night"
	if Lighting.ClockTime > 5 and Lighting.ClockTime < 19 then -- Roughly 5 AM to 7 PM for day colors
		setLightingColors(DayColors)
	else -- Roughly 7 PM to 5 AM for night colors
		setLightingColors(NightColors)
	end

	-- Pause to control update frequency and optimize performance
	task.wait(0.1)
end
