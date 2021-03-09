### Installation

#### Verify signature

Download the *PGP signature* (under *Checksums* in the [__Download__](https://archlinux.org/download/) page), and verify it with:

```console
[username@localhost Downloads]$ gpg --keyserver-options auto-key-retrieve --verify archlinux-*version*-x86_64.iso.sig
```

#### Set the keyboard layout

To set keyboard distribution of latinoamérica use

```console
root@archiso ~ # loadkeys la-latin1
```
#### 









