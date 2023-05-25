#!/bin/sh
read -p "Enter your email: " email
me="$(whoami)"
ssh-keygen -t ed25519 -C "$email" -f /home/$me/.ssh/id_ed25519
eval "$(ssh-agent -s)"
ssh-add /home/$me/.ssh/id_ed25519
