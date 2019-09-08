# Arch Setup

Instructions for configuring Arch system after installation.

1.  Log in as root.

2.  Enable/configure wifi:  `./setup-wifi`

3.  Add personal account
    *   Add user:   `useradd -m <USERNAME>`
    *   Set user password:  `passwd <USERNAME>`
    *   Install sudo:   `pacman -Syyu sudo`
    *   Give "wheel" group sudo permissions:    `echo "%wheel ALL=(ALL) ALL" > /etc/sudoers`
    *   Add new user to wheel group:    `usermod -aG wheel <USERNAME>`
    *   Logout (and log back in as new user): `exit`


4.  Install pacman packages:    `./base-pkg-install`

4.  Make zsh the login shell:   `chsh -s $(which zsh)`

5.  Tweak system settings to use nvim as editor
    *   Remove nano:    `sudo pacman -Rs nano`
    *   Create "vim" symlink for nvim:  `sudo ln -s $(which nvim) /usr/bin/vim`
    *   Set system editor environment variables:    ` sudo printf "\nexport EDITOR=/usr/bin/vim\nexport VISUAL=/usr/bin/vim\n" | sudo tee -a /etc/profile`

6.  Install zsh / neovim configuration files:   `./console-setup`

7.  Install graphical environment (Wayland, Sway, i3status, graphical assets): `./gui-setup`



