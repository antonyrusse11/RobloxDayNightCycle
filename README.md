Dynamic Day/Night Cycle System for Roblox
A robust and highly customizable day/night cycle script designed for Roblox experiences, ensuring a synchronized and immersive environmental ambiance across all players.

✨ Features
Automated Time Progression: Seamlessly transitions ClockTime from dawn to day, dusk, and night, looping continuously.

Server-Synchronized: Ensures all players in the game experience the exact same time of day and lighting conditions.

Configurable Cycle Length: Easily adjust how long a full 24-hour in-game day takes in real-world minutes.

Dynamic Lighting & Atmosphere: Automatically changes Lighting properties (Ambient, OutdoorAmbient, ColorShift_Top, ColorShift_Bottom) to match the time of day.

Smooth Transitions: Utilizes Roblox's TweenService for gradual, visually appealing fades between day and night lighting presets.

Customizable Presets: Define your own DayColors and NightColors to perfectly match your game's aesthetic.

🛠️ How to Use
Open your Roblox Studio project.

In the Explorer window, navigate to ServerScriptService.

Right-click ServerScriptService and select Insert Object > Script.

Rename the new Script to DayNightCycle (or a name of your choice).

Copy and paste the entire code from DayNightCycle.lua into this new script.

Run your game (Play or Run) to see the day/night cycle in action.

⚙️ Configuration
Adjust these variables at the top of the script to customize the cycle's behavior:

DayLengthInMinutes: The real-world duration (in minutes) for a complete 24-hour in-game cycle.

StartTime: The initial in-game hour (0-24) when the cycle begins when the server starts.

ColorTransitionDuration: The time (in seconds) taken for lighting colors to smoothly fade between day and night presets.

DayColors / NightColors: Tables containing Color3 values for Ambient, OutdoorAmbient, ColorShift_Top, and ColorShift_Bottom to define your desired day and night looks.

📄 License
This project is licensed under the MIT License - see the LICENSE file for details.

✍️ Author
Wolves892 - coolman1276
