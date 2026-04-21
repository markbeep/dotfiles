#!/bin/sh
# Dotfiles install script for devcontainers

# git
cp git ~/.gitconfig

mkdir -p ~/.config
# jj
cp -r jj ~/.config/jj
# fish
cp -r fish ~/.config/fish
