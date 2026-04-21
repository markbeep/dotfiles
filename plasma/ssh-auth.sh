#!/bin/sh
# Start ssh-agent via keychain and set SSH_AUTH_SOCK for use by VSC devcontainers
export SSH_AUTH_SOCK=/tmp/ssh-agent.sock
keychain --quiet -Q github --ssh-agent-socket /tmp/ssh-agent.sock
