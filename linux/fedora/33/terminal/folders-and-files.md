# Terminal

To open the terminal, most Linux systems use the same default keyboard shortcut: **Ctrl-Alt-D**. And to close it, you can use the keyboard shortcut **Ctrl-D** or use the command `exit`.

## Commands

!important: The command line is case sensitive!

To print the current working directory use `pwd` (an abbreviation of **p**rint **w**orking **d**irectory)

```console
[username@localhost ~]$ pwd
/home/username
```

`pwd` print out the shell’s current working directory. The shell has a notion of a default location in which any file operations will take place. This is its working directory. If you try to create new files or directories, view existing files, or even delete them, the shell will assume you’re looking for them in the current working directory unless you take steps to specify otherwise.

To change the working directory use `cd` (**c**hange **d**irectory)

```console
[username@localhost ~]$ cd /
[username@localhost /]$ pwd
/
[username@localhost /]$ cd /usr/share
[username@localhost share]$ pwd
/usr/share
[username@localhost share]$ cd
[username@localhost ~]$ cd Music/Rock
[username@localhost Rock]$ pwd
/home/username/Music/Rock
[username@localhost Rock]$ cd ..
[username@localhost Music]$ pwd
/home/username/Music
[username@localhost Music]$ cd ../Desktop
[username@localhost Desktop]$ pwd
/home/username/Desktop
[username@localhost Desktop]$ cd ~/Downloads
[username@localhost Downloads]$ pwd
/home/username/Downloads
[username@localhost Downloads]$
```

When a path begin with `/` is an **absolute** path, otherwise is a **relative** path. 





# Folders and Files





# File Permissions

There are 3 type of permissions:

* `r`: read
* `w`: write
* `x`: execute

Each permission (`rwx`) can be controlled at three levels:

* `u`: user (yourself)
* `g`: group (can be people in the same project)
* `o`: other (everyone on the system)

File or Directory permission can be displayed by running `ls -l` command:

* `-rwxrwxrwx`

Command to change permission:

* `chmod`

Example of use

```console
$ ls -l bart
-rw-r--r--. 1 andresaldana andresaldana 0 Apr 15 23:49 bart

$ chmod o-r bart   
$ ls -l bart
-rw-r-----. 1 andresaldana andresaldana 0 Apr 15 23:49 bart

$ chmod a-r bart
$ ls -l bart
--w-------. 1 andresaldana andresaldana 0 Apr 15 23:49 bart

$ chmod ug+rw bart
$ ls -l bart
-rw-rw----. 1 andresaldana andresaldana 0 Apr 15 23:49 bart
```

Assign permissions with numerical syntax

| Number | Permisson          | Symbol |
| :----: | ------------------ | :----: |
| `0`    | No permisson       | `---`  |
| `1`    | Execute            | `--x`  |
| `2`    | Write              | `-w-`  |
| `3`    | Write-Execute      | `-wx`  |
| `4`    | Read               | `r--`  |
| `5`    | Read-Execute       | `r-x`  |
| `6`    | Read-Write         | `rw-`  |
| `7`    | Read-Write-Execute | `rwx`  |

```console
$ ls -l bart
-rw-rw----. 1 andresaldana andresaldana 0 Apr 15 23:49 bart

$ chmod 764 bart   
$ ls -l bart    
-rwxrw-r--. 1 andresaldana andresaldana 0 Apr 15 23:49 bart

$ chmod 000 bart
$ ls -l bart    
----------. 1 andresaldana andresaldana 0 Apr 15 23:49 bart

$ chmod 777 bart   
$ ls -l bart    
-rwxrwxrwx. 1 andresaldana andresaldana 0 Apr 15 23:49 bart
```

# File Ownership

Every file, directory, link, etc. has an owner and a group, you can change that owner and/or group using `chown` and `chgrp`.

```console
$ ls -l bart
-rw-rw-rw-. 1 andresaldana andresaldana 0 Apr 15 23:49 bart

$ sudo chown root bart                                                                1 ↵
$ ls -l bart
-rw-rw-rw-. 1 root andresaldana 0 Apr 15 23:49 bart

$ sudo chgrp root bart
$ ls -l bart
-rw-rw-rw-. 1 root root 0 Apr 15 23:49 bart

$ sudo chown :andresaldana bart                   
$ ls -l bart
-rw-rw-rw-. 1 root andresaldana 0 Apr 15 23:49 bart

$ sudo chown andresaldana:andresaldana bart       
$ ls -l bart
-rw-rw-rw-. 1 andresaldana andresaldana 0 Apr 15 23:49 bart
```









































