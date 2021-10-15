

### Recommended partition scheme

#### UEFI/GPT layout example

| Mount point       | Partition   | Partition type                                                                | File system | Flag   | Suggested size             | Format                      |
| ----------------- | ----------- | ----------------------------------------------------------------------------- | ----------- | ------ | -------------------------- | --------------------------- |
| `/boot` or `/efi` | `/dev/sda1` | [EFI system partition](https://wiki.archlinux.org/title/EFI_system_partition) | `FAT32`     | `boot` | At least 512 MiB           | `# mkfs.fat -F32 /dev/sda1` |
| `[SWAP]`          | `/dev/sda2` | Linux [swap](https://wiki.archlinux.org/title/Swap)                           | `linuxswap` | `swap` | At least the amount of RAM | `# mkswap /dev/sda2`      |
| `/`               | `/dev/sda3` | Linux x86-64 root                                                             | `ext4`      | `root` | 25 GiB                     | `# mkfs.ext4 /dev/sda3` |
| `/home`           | `/dev/sda4` |                                                                               | `ext4`      |        | At least 10 GiB            | `# mkfs.ext4 /dev/sda4` |

###### References
* https://wiki.archlinux.org/title/Installation_guide
* https://wiki.archlinux.org/title/partitioning
* https://wiki.archlinux.org/title/EFI_system_partition










