AddPackage --foreign aconfmgr-git  # A configuration manager for Arch Linux
AddPackage --foreign dotter-rs-bin # A dotfile manager and templater written in Rust

# SSH
AddPackage openssh # SSH protocol implementation for remote login, command execution and file transfer

# DX
AddPackage --foreign visual-studio-code-bin # Visual Studio Code (vscode): Editor for building and debugging modern web and cloud applications (official binary version)
AddPackage atuin                            # Magical shell history
AddPackage dive                             # A tool for exploring layers in a docker image
AddPackage docker                           # Pack, ship and run any application as a lightweight container
AddPackage docker-buildx                    # Docker CLI plugin for extended build capabilities with BuildKit
AddPackage docker-compose                   # Fast, isolated development environments using Docker
AddPackage fish                             # Smart and user friendly shell intended mostly for interactive use
AddPackage jujutsu                          # Git-compatible VCS that is both simple and powerful
AddPackage kitty                            # A modern, hackable, featureful, OpenGL-based terminal emulator
AddPackage kubectl                          # A command line tool for communicating with a Kubernetes API server
AddPackage kubeseal                         # A Kubernetes controller and tool for one-way encrypted Secrets
AddPackage podman                           # Tool and library for running OCI-based containers in pods
AddPackage starship                         # The cross-shell prompt for astronauts
AddPackage zed                              # A high-performance, multiplayer code editor from the creators of Atom and Tree-sitter
AddPackage lnav                             # A curses-based tool for viewing and analyzing log files


# DX: installed for `cargo install jj-starship`:
AddPackage rustup # The Rust toolchain installer

# DX: local development. 'usage' required for mise
AddPackage mise  # The front-end to your dev env
AddPackage usage # A specification for CLIs

# Required for ssh-agent to run and vscode to be able to use git credentials in dev containers
AddPackage keychain # A front-end to ssh-agent, allowing one long-running ssh-agent process per system, rather than per login
# Pacman Helper
AddPackage --foreign paru-git # Feature packed AUR helper


# {{#if zyre}}
# required for pw management. Required for Zed to maintain the github login
AddPackage gnome-keyring # Stores passwords (required for Zed to maintain the github login)

# Replace dolphin file manager. gvfs is required for volume management of USBs and drives.
AddPackage gvfs          # Virtual filesystem implementation for GIO
AddPackage thunar        # Modern, fast and easy-to-use file manager for Xfce
AddPackage thunar-volman # Automatic management of removable drives and media for Thunar

# Manage displays with a GUI
AddPackage wdisplays # GUI display configurator for wlroots compositors

# Tuxedo Laptop drivers and control center UI
AddPackage --foreign tuxedo-control-center-bin # A tool to help you control performance, energy, fan and comfort settings on TUXEDO laptops.
AddPackage --foreign tuxedo-drivers-dkms       # TUXEDO Computers kernel module drivers for keyboard, keyboard backlight & general hardware I/O using the SysFS interface

# Better network applet in top bar (better than builtin from quickshell)
AddPackage network-manager-applet # Applet for managing network connections
# {{/if}}
