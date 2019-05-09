# Arch Setup

Instructions for configuring Arch system after installation.
Uses following software:

## Shell:           zsh
## Wifi Management: Systemd-networkd
## Editor:          Neovim
## Display Server:  X.Org
## Window Manager:  i3-gaps
## Status Bar:      i3Blocks + i3Status
## Browser:         Mozilla Firefox

1.  Log in as root.

2.  Enable/configure wifi:  `./setup-wifi.sh`

3.  Add personal account
    *   Add user:   `useradd -m <USERNAME>`
    *   Set user password:  `passwd <USERNAME>`
    *   Install sudo:   `pacman -Syyu sudo`
    *   Give "wheel" group sudo permissions:    `echo "%wheel ALL=(ALL) ALL > /etc/sudoers`
    *   Add new user to wheel group:    `usermod -ag wheel <USERNAME>
    *   Logout (and log back in as new user): `exit`


4.  Install pacman packages:    `./base-pkg-install.sh`

4.  Make zsh the login shell:   `chsh -s $(which zsh)`

5.  Tweak system settings to use nvim as editor
    *   Remove nano:    `sudo pacman -Rs nano`
    *   Create "vim" symlink for nvim:  `sudo ln -s $(which nvim) /usr/bin/vim`
    *   Set system editor environment variables:    ` sudo printf "\nexport EDITOR=/usr/bin/vim\nexport VISUAL=/usr/bin/vim\n" | sudo tee -a /etc/profile

6.  Install zsh / neovim configuration files:   `./console-setup.sh`

7.  Install graphical environment (X, i3-gaps, i3status, graphical assets): `./gui-setup.sh`



