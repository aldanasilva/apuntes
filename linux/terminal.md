


## Compress and Uncompress files

### `tar`

#### Packing

```console
$ tar cvf archive.tar file1 file2 ...
```

* `c`: activates *create mode*
* `v`: activates verbose diagnostic output
* `f`: the file option. The next argument on the command line after this flag must be the archive file for tar to create (archive.tar).
* `p`: preserve permissions. The default when working as the superuser

#### Table of contents mode

```console
$ tar t archive.tar
```

#### Unpacking

```console
$ tar xcf archive.tar
```

* `x`: puts tar into *extract (unpack) mode*

### `gzip`

#### Compress

```console
$ gzip uncompressed_file
```

#### Uncompress

```console
$ gzip compressed_file.gz
```

### More efficient ways

#### Unpack

```console
$ zcat file.tar.gz | tar xvf -
```

or

```console
$ tar zxvf file.tar.gz
```

* `z`: automatically invoke gzip on the archive, this works both for extracting an archive and creating one.










