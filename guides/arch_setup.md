# Arch Setup

Instructions for configuring Arch system after installation.

1.  Log in as root.

2.  Enable/configure wifi
    *   `./setup-wifi`

3.  Add personal account
    *   Add user:   `useradd -m <USERNAME>`
    *   Set user password:  `passwd <USERNAME>`
    *   Install sudo:   `pacman -Syyu sudo`
    *   Give "wheel" group sudo permissions:    `echo "%wheel ALL=(ALL) ALL" > /etc/sudoers`
    *   Add new user to wheel group:    `usermod -aG wheel <USERNAME>`
    *   Logout (and log back in as new user): `exit`

4.  Install pacman packages
    *   `./base-pkg-install`

4.  Make zsh the login shell
    *   `chsh -s $(which zsh)`

5.  Tweak system settings to use nvim as editor
    *   Create "vim" and "vi" symlink for nvim:  `sudo ln -s $(which nvim) /usr/bin/vim && sudo ln -s $(which nvim) /usr/bin/vi`
    *   Set system editor environment variables:    ` sudo printf "\nexport EDITOR=/usr/bin/vim\nexport VISUAL=/usr/bin/vim\n" | sudo tee -a /etc/profile`

6.  Install configuration files (zsh, neovim, sway, etc)
    *   `./env-setup`

7.  If on system with hybrid graphics and Nvidia GPU, copy scripts to ~/bin
    *   `cp ./discrete-gpu-off ~/bin/.`
    *   `cp ./pci-rescan ~/bin/.`

