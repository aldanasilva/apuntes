# Ubuntu

## Installation

### Recommended Partitioning Scheme

In most cases, at least the following mount points should always be created:

| Name | Size | Type | Use as | Mount point |
| ---- | ---- | ---- | ------ | ----------- |
| `swap` | Size of RAM | Primary | swap area |
| `efi` | 200MB | Primary | EFI System Partition |
| `/boot` | 1024MB | Primary | Ext4 |
| `/` | 30GB | Logical | Ext4 |
| `/home` |  | Logical | Ext4 |

###### Reference:
* https://askubuntu.com/questions/343268/how-to-use-manual-partitioning-during-installation







