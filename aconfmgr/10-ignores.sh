# Boot binaries
IgnorePath '/boot/*.img'
IgnorePath '/boot/*/*.EFI'
IgnorePath '/boot/*/*.efi'
IgnorePath '/boot/vmlin*'
IgnorePath '/boot/grub/*'
IgnorePath '/efi/*'
# Certificate databases
IgnorePath '/etc/ca-certificates/extracted/*'
IgnorePath '/etc/ssl/certs/*'
IgnorePath '/etc/pacman.d/gnupg/*'
# Cache and generated files
IgnorePath '/etc/*.cache'
IgnorePath '/etc/*.gen'
# Password files
IgnorePath '/etc/*shadow*'
IgnorePath '/usr/share/*'
IgnorePath '/crypto_keyfile.bin'
IgnorePath '/etc/.pwd.lock'
IgnorePath '/etc/NetworkManager'
IgnorePath '/etc/crypttab'
# Configuration database
IgnorePath '/etc/resolv.conf'
IgnorePath '/etc/dconf'
# Mount files
IgnorePath '*/.updated'
IgnorePath '*/lost+found/*'
IgnorePath '/lost+found'
# Opt packages (check that they don't include config)
IgnorePath '/opt/*'
# Binary libraries
IgnorePath '/usr/lib/*'
IgnorePath '/usr/lib32/*'
IgnorePath '/usr/lib64/*'
IgnorePath '/usr/libexec/*'
IgnorePath '/usr/bin/*'
IgnorePath '/usr/sbin/*'
# Local binaries
IgnorePath '/usr/local/include/*'
IgnorePath '/usr/local/lib/*'
IgnorePath '/usr/local/share/applications/mimeinfo.cache'
# Var databases, logs, swap and temp files
IgnorePath '/var/db/sudo'
IgnorePath '/var/lib/*'
IgnorePath '/var/log/*'
IgnorePath '/var/swap*'
IgnorePath '/var/tmp/*'
IgnorePath '/var/spool/cups/*'
IgnorePath '/etc/xml'
IgnorePath '/etc/adjtime'
# Files created on system setup
IgnorePath '/etc/fstab'
IgnorePath '/etc/lsb-release'
IgnorePath '/etc/machine-id'
IgnorePath '/etc/openvpn/*'
IgnorePath '/etc/pam.d/*'
IgnorePath '/etc/passwd'
IgnorePath '/etc/passwd.OLD'
IgnorePath '/etc/passwd-'
IgnorePath '/etc/subgid'
IgnorePath '/etc/subuid'
IgnorePath '/etc/subgid-'
IgnorePath '/etc/subuid-'
IgnorePath '/etc/sudoers.d/*'
IgnorePath '/etc/sudoers'
IgnorePath '/etc/kernel/cmdline'
# Different on different systems
IgnorePath '/etc/group'
IgnorePath '/etc/group-'
IgnorePath '/etc/hostname'
IgnorePath '/etc/sddm.conf'
IgnorePath '/etc/sddm.conf.d'
IgnorePath '/etc/sddm.conf.d/*'
IgnorePath '/etc/firewalld/*'
# Font settings
IgnorePath '/etc/fonts/*'
# Printer files that keep changing
IgnorePath '/etc/cups/subscriptions.conf'
IgnorePath '/etc/cups/subscriptions.conf.O'
IgnorePath '/etc/printcap'
# SSH keys
IgnorePath '/etc/ssh/ssh_host_*'
# Swapfile
IgnorePath '/swapfile'
# Sockets
IgnorePath '/etc/systemd/system/sockets.target.wants/*'
IgnorePath '/etc/systemd/user/sockets.target.wants/*'
IgnorePath '/usr/*/*.socket'
