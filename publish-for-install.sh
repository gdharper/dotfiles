#! /bin/sh

printf "Install path [ default ./install ] : "
read INSTALL_DIR
printf "\n"

[ -z $INSTALL_DIR ] && INSTALL_DIR=install

case $INSTALL_DIR in
    /*);;
    *) INSTALL_DIR="$(pwd)/$INSTALL_DIR";;
esac

if [ -e $INSTALL_DIR ]; then
    printf "$INSTALL_DIR already exists\n"
    printf "Delete the file system entry and re-run\n"
    exit 1;
fi

mkdir -p $INSTALL_DIR

printf "Binplacing configuration files\n"
cp configs/Xresources $INSTALL_DIR/Xresources.base
cp configs/i3_config $INSTALL_DIR/i3_config.base
cp configs/i3status_config $INSTALL_DIR/i3status_config.base
cp configs/pkglist.txt $INSTALL_DIR/pkglist.txt.base
cp configs/wireless.network $INSTALL_DIR/wireless.network.base
cp configs/wpa_supplicant.conf $INSTALL_DIR/wpa_supplicant.conf.base
cp configs/xinitrc $INSTALL_DIR/xinitrc.base
cp configs/zshrc $INSTALL_DIR/zshrc.base

printf "Binplacing scripts\n"
cp scripts/* $INSTALL_DIR

printf "Binplacing assets"
cp -r assets/* $INSTALL_DIR



