# Debian 11 (bullseye)



## Partition Scheme

swap : size of RAM
efi : EFI Filesystem : 200MB
root : / : 30GB
home : /home : 






## Troubleshootings

### Error: 

```console
$ sudo apt-get install -y ./slack-desktop-*-amd64.deb
[sudo] password for USER:
USER is not in the sudoers file.  This incident will be reported.
```

#### Solution

```console
$ su
Password:
# /sbin/usermod -aG sudo USER
```

Then reboot the pc.

###### References:
* https://linuxize.com/post/how-to-add-user-to-sudoers-in-debian/

### Error: `Depends: libappindicator3-1`

```console
$ sudo apt-get install -y ./slack-desktop-*-amd64.deb

The following packages have unmet dependencies:
 slack-desktop : Depends: libappindicator3-1 but it is not installable
E: Unable to correct problems, you have held broken packages.
```

#### Solution

```console
$ wget http://ftp.mx.debian.org/debian/pool/main/libi/libindicator/libindicator3-7_0.5.0-3+b1_amd64.deb
$ sudo apt-get install -y ./libindicator3-7_*_amd64.deb
$ wget http://ftp.mx.debian.org/debian/pool/main/liba/libappindicator/libappindicator3-1_0.4.92-7_amd64.deb
$ sudo apt-get install -y ./libappindicator3-1_*_amd64.deb
$ sudo apt-get install -y ./slack-desktop-*-amd64.deb
```

###### References:
* https://www.how2shout.com/linux/how-to-install-slack-on-debian-11-bullseye-linux/
* https://packages.debian.org/stretch/amd64/libindicator3-7/download
* https://packages.debian.org/buster/amd64/libappindicator3-1/download



Download image and burn on usb flash drive

```console
# fdisk -l
# fdisk -l /dev/sdX
# dd if=debian-xxx.iso of=/dev/sdX conv=fsync bd=4M status=progress
```

Partitioning - Manual

| # |  size  |  flags   |        use as        | mount point |
|---|--------|----------|----------------------|-------------|
| 1 | 512 MB | Bootable | EFI System Partition |             |
| 2 | 512 MB |          | ext4                 | /boot       |
| 3 | 126 GB |          | do not use           |             |

-> Configure encrypted volumes
-> Create encrypted volumes
-> /dev/sda3 -> Continue
-> Configure the Logical Volume Manager
-> Create volume group -> crypto-debian
-> /dev/sda3

Create logical volumes

| # | name |  size  | use as | mount point | label |
|---|------|--------|--------|-------------|-------|
| 1 | root |  30 GB | ext4   | /           | root  |
| 2 | swap |  16 GB | swap   |             |       |
| 3 | home | 126 GB | ext4   | /home       |       |

-> Finish partitioning and write changes to disk





