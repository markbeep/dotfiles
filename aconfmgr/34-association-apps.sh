# Slack for VIS
# {{#if otis}}
AddPackage --foreign slack-desktop # Slack Desktop (Beta) for Linux
# {{else if zyre}}
AddPackage --foreign slack-desktop-wayland # Slack Desktop (Beta) for Linux with Wayland Support
# {{/if}}

# Used to install oidc login for kubectl
AddPackage krew # Find and install kubectl plugins

# GRPC debugging
AddPackage --foreign grpcui-bin # An interactive web UI for gRPC, along the lines of postman (binary release)

# Office/Excel Support
# Installed for viewing grade statistics excel file
AddPackage libreoffice-still
