#! /bin/sh

CONFIG_BASE_PATH=~/.config

printf "Backing up and deleting old .zshrc\n"
ZSHRC_PATH=~/.zshrc
[ -e $ZSHRC_PATH ] && mv $ZSHRC_PATH "$ZSHRC_PATH.bak"

printf "Setting up zsh config\n"
mkdir -p "$CONFIG_BASE_PATH/zsh"
ZSH_CONFIG_PATH=$CONFIG_BASE_PATH/zsh/zshrc
mv zshrc.base $ZSH_CONFIG_PATH
ln -sf $ZSH_CONFIG_PATH $ZSHRC_PATH

printf "Setting up neovim config\n"
mkdir -p $CONFIG_BASE_PATH/nvim
NVIM_CONFIG_PATH=$CONFIG_BASE_PATH/nvim/init.vim
mv init.vim.base $NVIM_CONFIG_PATH


