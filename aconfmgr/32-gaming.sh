# {{#if otis }}
AddPackage steam                       # Valve's digital software delivery system
AddPackage lutris                      # Open Gaming Platform
AddPackage --foreign bakkesmod-steam   # A mod aimed at making you better at Rocket League!
AddPackage --foreign forge-gui-desktop # The Magic: The Gathering Rules Engine (now with Shandalar-style adventure mode)
AddPackage --foreign legendary         # A free and open-source replacement for the Epic Games Launcher
AddPackage --foreign r2modman-bin      # A simple and easy to use mod manager for several games using Thunderstore.

# compatibility
AddPackage wine      # A compatibility layer for running Windows programs
AddPackage wine-mono # Wine's built-in replacement for Microsoft's .NET Framework
AddPackage protontricks # Run Winetricks commands for Steam Play/Proton games among other common Wine features
AddPackage umu-launcher # The Unified Launcher for Windows Games on Linux, to run Proton with fixes outside of Steam
AddPackage winetricks # Script to install various redistributable runtime libraries in Wine.

AddPackage --foreign opentrack # Head tracking software
# {{/if }}

AddPackage --foreign littlenavmap-bin  # A Free Open Source Flight Planner, Navigation Tool, Moving Map, Airport Search, and Airport Information System for Flight Simulator X, Prepar3D, Microsoft Flight Simulator 2020, and X-Plane
