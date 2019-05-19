#! /bin/sh

if [ `whoami` != "root" ]; then
    printf "Please run this script as root\n"
    exit 1
fi

printf "Enabling 32-bit package installation\n"

printf "\n[multilib]\n" >> /etc/pacman.conf
printf "\nInclude = /etc/pacman.d/mirrorlist\n" >> /etc/pacman.conf

printf "\nInstalling pkglist.txt: Launching pacman.\n"

pacman -Syyu --needed - < pkglist.txt.base

printf "\n All done! Exiting.\n"

