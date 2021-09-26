

### Recommended partition scheme

#### UEFI/GPT layout example

| Mount point       | Partition   | Partition type                                                                | File system | Flag   | Suggested size             |
| ----------------- | ----------- | ----------------------------------------------------------------------------- | ----------- | ------ | -------------------------- |
| `/boot` or `/efi` | `/dev/sda1` | [EFI system partition](https://wiki.archlinux.org/title/EFI_system_partition) | `FAT32`     | `boot` | At least 512 MiB           |
| `[SWAP]`          | `/dev/sda2` | Linux [swap](https://wiki.archlinux.org/title/Swap)                           | `linuxswap` | `swap` | At least the amount of RAM |
| `/`               | `/dev/sda3` | Linux x86-64 root                                                             | `ext4`      | `root` | 25 GiB                     |
| `/home`           | `/dev/sda4` |                                                                               | `ext4`      |        | At least 10 GiB            |

###### References
* https://wiki.archlinux.org/title/partitioning










