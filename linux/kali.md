**0x00** - Get a verified copy of the appropriate ISO image of the latest Kali build image for the system you’ll be running it on: see the details on [downloading official Kali Linux images](https://www.kali.org/docs/introduction/download-official-kali-linux-images/).

Verify image

```console
$ echo "e86615de611a4bfdaba6946c618de3409da1b0eae067b44c4ecbe1e8b35a0df3 *kali-linux-2022.4-live-amd64.iso" | sha256sum --check
kali-linux-2022.4-live-amd64.iso: OK
```

**0x01** - Start by imaging the Kali ISO onto your USB drive (ours was /dev/sdb). Once done, you can inspect the USB partition structure using parted /dev/sdb print:

For ease of use, please use a root account. This can be done with “sudo su”.

First check on which drive it will be burned

```console
$ sudo fdisk -l
```

```console
# dd if=kali-linux-2022.4-live-amd64.iso of=/dev/sdb conv=fsync bs=4M
```

**0x02** - Create and format an additional partition on the USB drive. In our example, we create a persistent partition in the empty space above the Kali Live partitions.

```console
# fdisk /dev/sdb <<< $(printf "n\np\n\n\n\nw")
```

When `fdisk` completes, the new partition should have been created at `/dev/sdb3`; this can be verified with the command `lsblk`.

Alternatively, you can choose the size of `/dev/sdb3` using

```console
# fdisk /dev/sdb
```

then select options

* `n` to create new partition
* `p` to make the new partition `primary`
* select `default` for partition number
* select `default` for first sector
* select `+sizeG` for last sector
* select `p` to print the new partition table
* select `w` to write table to disk and exit

**0x03** - Encrypt the partition with LUKS:

```console
# cryptsetup --verbose --verify-passphrase luksFormat /dev/sdb3
```

**0x04** - Open the encrypted partition:

```console
# cryptsetup luksOpen /dev/sdb3 my_usb
```

**0x05** - Create an ext4 filesystem and label it:

```console
# mkfs.ext4 -L persistence /dev/mapper/my_usb
# e2label /dev/mapper/my_usb persistence
```

**0x06** - Mount the partition and create your persistence.conf so changes persist across reboots:

```console
# mkdir -p /mnt/my_usb
# mount /dev/mapper/my_usb /mnt/my_usb
# echo "/ union" | sudo tee /mnt/my_usb/persistence.conf
# umount /dev/mapper/my_usb
```

**0x07** - Close the encrypted partition:

```console
# cryptsetup luksClose /dev/mapper/my_usb
```

Now your USB drive is ready to plug in and reboot into Live USB Encrypted Persistence mode.


References:
* https://www.kali.org/docs/usb/live-usb-install-with-linux/
* https://www.kali.org/docs/usb/usb-persistence-encryption/