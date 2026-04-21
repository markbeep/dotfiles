CopyFile /etc/ssh/sshd_config
CreateLink /etc/systemd/system/multi-user.target.wants/containerd.service /usr/lib/systemd/system/containerd.service
CreateLink /etc/systemd/system/multi-user.target.wants/docker.service /usr/lib/systemd/system/docker.service
CreateLink /etc/systemd/user/graphical-session-pre.target.wants/xdg-user-dirs.service /usr/lib/systemd/user/xdg-user-dirs.service
CopyFile /etc/pacman.d/mirrorlist
CopyFile /etc/issue

# Generated & linked nicknames for yp
# https://docs.oracle.com/cd/E19455-01/806-1387/anis1-8/index.html
CreateLink /var/yp/nicknames /etc/nicknames

# Podman registries
CopyFile /etc/containers/registries.conf

# Printer settings on KDE
CreateFile /etc/cups/classes.conf.O 600 '' cups > /dev/null
CopyFile /etc/cups/classes.conf 600
CopyFile /etc/cups/ppd/HP-Laserjet.ppd 640 '' cups
CopyFile /etc/cups/printers.conf 600
CopyFile /etc/cups/printers.conf.O 600 '' cups

# {{#if zyre}} Tuxedo Driver settings
CopyFile /etc/tcc/autosave
CopyFile /etc/tcc/profiles
CopyFile /etc/tcc/settings
# {{else if otis}}
CopyFile /etc/udev/rules.d/90-usb-wakup.rules
CopyFile /etc/udev/rules.d/99-virpil.rules
CreateLink /etc/systemd/system/multi-user.target.wants/sshd.service /usr/lib/systemd/system/sshd.service
CreateLink /etc/systemd/system/multi-user.target.wants/wol@enp14s0.service /etc/systemd/system/wol@.service
CopyFile /etc/systemd/system/wol@.service
CopyFile /etc/ssh/sshd_config
# {{/if}}

CopyFile /etc/locale.conf
CreateLink /etc/systemd/system/autovt@.service /usr/lib/systemd/system/getty@.service
