#!/bin/bash

# disable alt+tab
gsettings set org.gnome.desktop.wm.keybindings switch-windows ['']

# disable left windows key
gsettings set org.gnome.mutter overlay-key ''