### Installation

#### Verify signature

Download the *PGP signature* (under *Checksums* in the [__Download__](https://archlinux.org/download/) page), and verify it with:

```console
[username@localhost Downloads]$ gpg --keyserver-options auto-key-retrieve --verify archlinux-*version*-x86_64.iso.sig
```

#### Set the console keyboard layout

To set keyboard distribution of latinoamérica use

```console
root@archiso ~ # loadkeys la-latin1
```
#### Set the console font

```console
root@archiso ~ # setfont /usr/share/kbd/consolefonts/sun12x22.psfu.gz
```

#### Select the mirrors

Back up the existing `/etc/pacman.d/mirrorlist`, rank the mirrors, verify the list of mirrors and syncronize package databases. You can comment a server `#Server = ...` to disable it.

```console
root@archiso ~ # cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
root@archiso ~ # reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
root@archiso ~ # cat /etc/pacman.d/mirrorlist
root@archiso ~ # pacman -Syy
```

###### References
* https://wiki.archlinux.org/title/Mirrors
* https://wiki.archlinux.org/title/Reflector
* https://man.archlinux.org/man/reflector.1#EXAMPLES

#### `lsblk`

Comando para ver unidades de almacenamiento y particiones

#### Partition the disks

```console
root@archiso ~ # gdisk /dev/sdX
```

#### Mount the file systems

```console
root@archiso ~ # mount /dev/root_partition /mnt
root@archiso ~ # mkdir -p /mnt/boot/efi
root@archiso ~ # mkdir /mnt/home
root@archiso ~ # mkswap /dev/swap_partition
root@archiso ~ # ls -la /mnt
root@archiso ~ # mount /dev/boot_partition /mnt/boot/efi
root@archiso ~ # mount /dev/home_partition /mnt/home
root@archiso ~ # swapon /dev/swap_partition
```

#### Install essential packages

```console
root@archiso ~ # pacstrap /mnt base linux linux-firmware vim nano bash-completion linux-headers base-devel
```

### Configure the system

#### `fstab`

Generate an `fstab` file

```console
root@archiso ~ # genfstab -U /mnt >> /mnt/etc/fstab
root@archiso ~ # cat /mnt/etc/fstab
```

#### `chroot`

Change root into the new system

```console
root@archiso ~ # arch-chroot /mnt
```

#### Revisar

```console
[root@archiso /]# pacman -S grub efibootmgr efivar networkmanager amd-ucode
```

If you are using intel then replace `amd-ucode` with `intel-ucode`

##### Install grub boot loader

```console
[root@archiso /]# grub-install /dev/sdX
```

Se pueden modificar algunas cosas en `/etc/default/grub` y luego se escribe el grub config file

```console
[root@archiso /]# grub-mkconfig -o /boot/grub/grub.cfg
```

Enable the network manager service

```console
[root@archiso /]# systemctl enable NetworkManager
```

Chance the `root` password

```console
[root@archiso /]# passwd
```
Ctrl+D

Unmount all mounted partitions

```console
root@archiso ~ # lsblk
root@archiso ~ # umount /mnt/boot/efi
root@archiso ~ # umount /mnt/home
root@archiso ~ # umount /mnt
root@archiso ~ # swapoff /dev/swap_partition
```

Reboot

```console
root@archiso ~ # reboot
```




```console
root@archiso ~ # 
```

```console
root@archiso ~ # 
```

```console
root@archiso ~ # 
```

```console
root@archiso ~ # 
```

```console
root@archiso ~ # 
```

```console
root@archiso ~ # 
```

```console
root@archiso ~ # 
```

```console
root@archiso ~ # 
```

```console
root@archiso ~ # 
```

```console
root@archiso ~ # 
```

```console
root@archiso ~ # 
```









Configure keyboard and timezone

```console
root@archiso ~ # loadkeys la-latin1
root@archiso ~ # timedatectl set-timezone America/Bogota
```

Create partitions, use `lsblk` to see disk and `lsblk`

|Mount point|Partition|Partition type|Suggested size|
|---|---|---|---|
|`/mnt/boot`|/dev/*efi_system_partition*|__EFI system partition__|1GiB|
|`[SWAP]`|/dev/*swap_partition*|Linux swap|More than 512 MiB|
|`/mnt`|/dev/*root_partition*|Linux x86-64 root (/)|At least 30 GiB|
|`/mnt/home`|/dev/*home_partition*|Linux filesystem|Reminder of the device|

Format partitions

```console
root@archiso ~ # mkfs.fat -F 32 /dev/efi_system_partition
root@archiso ~ # mkswap /dev/swap_partition
root@archiso ~ # mkfs.ext4 /dev/root_partition
root@archiso ~ # mkfs.ext4 /dev/home_partition
```

Mount the file systems

```console
root@archiso ~ # mount --mkdir /dev/efi_system_partition /mnt/boot
root@archiso ~ # swapon /dev/swap_partition
root@archiso ~ # mount --mkdir /dev/root_partition /mnt
root@archiso ~ # mount --mkdir /dev/root_partition /mnt/home
```

Select mirrors

```console
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
```

Install essential packages

```console
root@archiso ~ # pacstrap -K /mnt base linux linux-firmware
```

Can add `nano`, `grub`, `networkmanager`, `dhcpcd`, `netctl`, `wpa_supplicant`, `dialog`. (Karla)

```console
root@archiso ~ # genfstab -U /mnt >> /mnt/etc/fstab
root@archiso ~ # ln -sf /usr/share/zoneinfo/America/Bogota /etc/localtime
root@archiso ~ # hwclock --systohc
root@archiso ~ # sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
root@archiso ~ # locale-gen
root@archiso ~ # echo "LANG=en_US.UTF-8" > /etc/locale.conf
root@archiso ~ # echo "KEYMAP=la-latin1" > /etc/vconsole.conf
root@archiso ~ # echo "arch" > /etc/hostname
root@archiso ~ # echo "127.0.0.1 localhost" > /etc/host
```





```console
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
```



```console
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
```




```console
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
```




```console
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
```




```console
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
```




```console
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
```




```console
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
```



```console
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
```



```console
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
root@archiso ~ # 
```







