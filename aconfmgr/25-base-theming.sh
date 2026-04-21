AddPackage ttf-fira-code               # Monospaced font with programming ligatures
AddPackage ttf-nerd-fonts-symbols-mono # High number of extra glyphs from popular 'iconic fonts' (monospace)

# {{#if zyre}} Dank Material Shell https://github.com/AvengeMedia/DankMaterialShell
AddPackage --foreign dms-shell-bin                       # Desktop shell for wayland compositors built with Quickshell & GO
AddPackage --foreign emote                               # Modern popup emoji picker
AddPackage --foreign google-breakpad                     # An open-source multi-platform crash reporting system
AddPackage --foreign matugen-bin                         # A material you color generation tool with templates
AddPackage --foreign python-pywalfox                     # Native app used alongside the Pywalfox browser extension
AddPackage --foreign quickshell-git                      # Flexible toolkit for making desktop shells with QtQuick
AddPackage --foreign ttf-material-icons-git              # Material Design icons by Google - classic fonts
AddPackage --foreign ttf-material-symbols-variable-git   # Material Design icons by Google - variable fonts
AddPackage --foreign woff2-material-symbols-variable-git # Material Design icons by Google - variable fonts
AddPackage adw-gtk-theme                                 # Unofficial GTK 3 port of the libadwaita theme
AddPackage brightnessctl                                 # Lightweight brightness control tool
AddPackage cli11                                         # Command line parser for C++11
AddPackage cmake                                         # A cross-platform open-source make system
AddPackage dgop                                          # System monitoring CLI + REST API
AddPackage gammastep                                     # Adjust the color temperature of your screen according to your surroundings.
AddPackage go                                            # Core compiler tools for the Go programming language
AddPackage inter-font                                    # A typeface specially designed for user interfaces
AddPackage mate-polkit                                   # PolicyKit integration for the MATE desktop
AddPackage ninja                                         # Small build system with a focus on speed
AddPackage niri                                          # A scrollable-tiling Wayland compositor
# qt6 required for quickshell
AddPackage qt6-wayland                                   # Provides APIs for Wayland
AddPackage wayland-protocols                             # Specifications of extended Wayland protocols
AddPackage wl-clipboard                                  # Command-line copy/paste utilities for Wayland
AddPackage xdg-desktop-portal-gtk                        # A backend implementation for xdg-desktop-portal using GTK
AddPackage xwayland-satellite                            # Xwayland outside your Wayland

CopyFile /etc/bluetooth/main.conf
CopyFile /etc/bluetooth/main.conf.pacnew
CreateLink /etc/systemd/system/bluetooth.target.wants/bluetooth.service /usr/lib/systemd/system/bluetooth.service
CreateLink /etc/systemd/system/dbus-org.bluez.service /usr/lib/systemd/system/bluetooth.service
CreateLink /etc/systemd/system/multi-user.target.wants/tccd.service /usr/lib/systemd/system/tccd.service
CreateLink /etc/systemd/system/sleep.target.wants/tccd-sleep.service /usr/lib/systemd/system/tccd-sleep.service

RemoveFile /etc/systemd/user/default.target.wants/xdg-user-dirs-update.service
RemoveFile /etc/systemd/user/default.target.wants
# {{/if}}
