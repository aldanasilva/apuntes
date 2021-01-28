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
[username@localhost ~]$ cd /usr/share
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





























































