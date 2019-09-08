# Arch Installation

Steps required to bootstrap a fresh Arch installation for my personal setup.
*NB: If this guide is not completely followed, it is possible the install
will not be in a bootable state and will have to be repaired / re-installed*

1.  Create live USB with bootable image
    *  Download arch .iso [here](https://www.archlinux.org/download/)
    *  Determine path to USB drive and ensure it is not mounted.
    *  Flash .iso to USB drive: `sudo dd bs=1M if=<path to .iso> of=<path to USB /dev/XXX> conv=fsync`
    *  Remove USB drive

2.  Boot machine from USB drive. Select Arch ISO from the menu. 
    You should be automatically logged in as `root@archiso`

3.  Ensure that your network card is up via `ip link`. Connect to either a wired or wireless network.
    *  For wireless: `wifi-menu`
    *  Verify connection: `ping archlinux.org -c3`. This sometimes fails a few times.

4.  Update system clock: `timedatectl set-ntp true`

5.  Set up install target disk
    *  Determine correct disk: `lsblk`
    *  Partition as desired (probably uefi + primary partitions): `parted /dev/XXX`
        *   UEFI:       `mkpart ESP fat32 1MiB 513Mib`, ` set 1 boot on`
        *   Primary:    `mkpart primary ext4 513MiB [ 100% || Swap start ]`
        *   Swap:       `mkpart primary linux-swap [end of primary] 100%`
    *  Format partitions: `mkfs.ext4 /dev/XXX` | `mkfs.fat -F32 /dev/XXX` | `mkswap /dev/XXX`, `swapon /dev/XXX`
    *  Mount primary partition: `mount /dev/XXX# /mnt`
    *  Create mountpoint for efi partition: mkdir `/mnt/efi`
    *  Mount efi partition: `mount /dev/XXX# /mnt/efi`

6.  Install base packages and setup-critical packages. Keep list short to minimize total install time.
    *  `pacstrap /mnt base base-devel grub efibootmgr intel-ucode wpa-supplicant`

7.  Generate file system table: `genfstab -U /mnt >> /mnt/etc/fstab`

8.  Change root into new install: `arch-chroot /mnt`

9.  Setup clocks
    *  `ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime`
    *  `hwclock --systohc`

10. Set locale (en-US UTF-8)
    *  Comment for clarity: `echo "# We are using US English in UTF-8" >> /etc/locale.gen`
    *  Set locale: `echo "en_US.UTF8 UTF-8" >> /etc/locale.gen`
    *  Generate:   `locale-gen`
    *  Setup locale.conf: `echo "LANG=en_US.UTF-8" >> /etc/locale.conf`

11. Configure GRUB (Bootloader):
    *  Install GRUB:   `grub-install --target=x86_64-efi --efi-directory=efi --bootloader-id=GRUB`
    *  Configure GRUB: `grub-mkconfig -o /boot/grub/grub.cfg`

12. Set root password: `passwd`

13. Unmount and power off.
    *  Exit chroot: `exit`
    *  Unmount efi partition: `umount /mnt/efi`
    *  Unmount primary partition: `unmount /mnt`
    *  Shutdown system: `shutdown now`
    *  Remove live USB.

At this point, the system is in a bootable state, assuming the bootloader was configured correctly.
If the bootloader was mis-installed, the system will need to be repaired or this process repeated.
Assuming wpa_supplicant was added via pacstrap, the network should be ready for configuration on reboot.
