#! /bin/sh

ASSET_BASE_PATH=~/.assets
CONFIG_BASE_PATH=~/.config

printf "Setting up X-server / xinit configs\n"
X_CONFIG_BASE_PATH=$CONFIG_BASE_PATH/X
mkdir -p $X_CONFIG_BASE_PATH/xinit
mkdir -p $X_CONFIG_BASE_PATH/server

XINIT_CONFIG_PATH=$X_CONFIG_BASE_PATH/xinit/xinitrc
cp -f xinitrc.base $XINIT_CONFIG_PATH
XINITRC_PATH=~/.xinitrc
ln -sf $XINIT_CONFIG_PATH $XINITRC_PATH

XRESOURCES_CONFIG_PATH=$X_CONFIG_BASE_PATH/server/Xresources
cp -f Xresources.base $XRESOURCES_CONFIG_PATH
XRESOURCES_PATH=~/.Xresources
ln -sf $XRESOURCES_CONFIG_PATH $XRESOURCES_PATH

printf "Setting up i3-gaps / i3status configs\n"
mkdir -p $CONFIG_BASE_PATH/i3
I3_CONFIG_PATH=$CONFIG_BASE_PATH/i3/config
cp -f i3_config.base $I3_CONFIG_PATH

mkdir -p $CONFIG_BASE_PATH/i3status
I3_STATUS_CONFIG_PATH=$CONFIG_BASE_PATH/i3status/config
cp -f i3status_config.base $I3_STATUS_CONFIG_PATH

printf "Setting up asset files\n"
mkdir -p $ASSET_BASE_PATH/icons
mkdir -p $ASSET_BASE_PATH/wallpapers
mkdir -p ~/.icons

printf "Enter cursor theme: "
read CURSOR_THEME
printf "\n"
[ -d $CURSOR_THEME ] || ( printf "Theme does not exist in current dir.\n" && exit 1)

cp -f wallpaper_day.jpg $ASSET_BASE_PATH/wallpapers/
cp -f wallpaper_night.jpg $ASSET_BASE_PATH/wallpapers/
cp -rf $CURSOR_THEME $ASSET_BASE_PATH/icons
cp -rf $ASSET_BASE_PATH/icons/$CURSOR_THEME ~/.icons


