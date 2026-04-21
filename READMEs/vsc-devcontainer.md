## Network Mode host

Network mode set to host only properly works on linux, but it is required if you want to be able to access services outside of the devcontainer.

Network host mode can be achieved by adding this to the devcontainer.json:

```json
"runArgs": ["--network=host"],
```

For services to be able to properly run INSIDE of devcontainers with host network mode, the 'Remote: Auto Forward Ports' setting has to be turned off in VSC. This disables VSC from automatically port forwarding ports (like from a webserver), causing the webserver itself from complaining that the port is already used.

But if a dev container is not run with network host mode, ports might have to be manually forwarded. This can be achieved by heading to the PORTS tab and manually adding the port. Or by adding the port as a "forwardedPort" in the devcontainer.json settings.
