#! /bin/sh

printf "Install path [ default ./install ] : "
read INSTALL_DIR
printf "\n"

[ -z $INSTALL_DIR ] && INSTALL_DIR=install

case $INSTALL_DIR in
    /*);;
    *) INSTALL_DIR="$(pwd)/$INSTALL_DIR";;
esac

mkdir -p $INSTALL_DIR

printf "Binplacing configuration files\n"
cp -f configs/Xresources $INSTALL_DIR/Xresources.base
cp -f configs/i3_config $INSTALL_DIR/i3_config.base
cp -f configs/i3status_config $INSTALL_DIR/i3status_config.base
cp -f configs/init.vim $INSTALL_DIR/init.vim.base
cp -f configs/pkglist.txt $INSTALL_DIR/pkglist.txt.base
cp -f configs/wireless.network $INSTALL_DIR/wireless.network.base
cp -f configs/wpa_supplicant.conf $INSTALL_DIR/wpa_supplicant.conf.base
cp -f configs/xinitrc $INSTALL_DIR/xinitrc.base
cp -f configs/zshrc $INSTALL_DIR/zshrc.base

printf "Binplacing scripts\n"
cp -f scripts/* $INSTALL_DIR

printf "Binplacing assets"
cp  -rf assets/* $INSTALL_DIR



