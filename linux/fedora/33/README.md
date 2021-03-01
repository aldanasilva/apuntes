# Linux Fedora

## Table of Contents

* [Installation](#installation)
  * [Recommended Partitioning Scheme](#recommended-partitioning-scheme)
* [Terminal](#terminal)
* [Package management system](#package-management-system)
  * [yum – Yellowdog Updater Modified](#yum--yellowdog-updater-modified)
  * [dnf – Dandified yum](#dnf--dandified-yum)
  * [rpm – RPM package manager](#rpm--rpm-package-manager)
* [Install .tar.gz, .sh and .rpm packages](#install-targz-sh-and-rpm-packages)
* [RPM Fusion](#rpm-fusion)
* [Customisation](#customisation)
  * [GNOME Tweaks](#gnome-tweaks)
  * [Dash to Panel](#dash-to-panel)
  * [System Fonts](#system-fonts)
  * [KDE](#kde)
* [Install some programs](#install-some-programs)
  * [Sound](#sound)
    * [PulseAudio Volume Control](#pulseaudio-volume-control)
  * [Development](#development)
    * [Google Chrome](#google-chrome)
    * [GIT](#git)
    * [Java 8 (OpenJDK)](#java-8-openjdk)
    * [Spring Tool Suite](#spring-tool-suite)
    * [PostgreSQL](#postgresql)
    * [Postman](#postman)
    * [Node.js](#nodejs)
      * [TypeScipt](#typescript)
      * [Angular CLI](#angular-cli)
    * [Visual Studio Code](#visual-studio-code)
  * [Connectivity](#connectivity)
    * [Skype](#skype)
    * [Chrome Remote Desktop](#chrome-remote-desktop)
    * [AnyDesk](#anydesk)
    * [Microsfot Teams](#microsoft-teams)
  * [More](#more)
    * [unrar](#unrar)
    * [Transmission](#transmission)
    * [JDownloader](#jdownloader)
    * [Stellarium](#stellarium)
    * [Blender](#blender)
    * [VLC](#vlc)
    * [Adobe Flash](#adobe-flash)
* [Desktop entries](#desktop-entries)
* [Troubleshooting](#troubleshooting)
  * [Sound - Pops when starting and stopping playback](#sound---pops-when-starting-and-stopping-playback)
  * [Display frozen](#display-frozen)
  * [Unable to access location](#unable-to-access-location)


## Installation

### Recommended Partitioning Scheme

In most cases, at least the following mount points should always be created:

#### /boot - 1 GB

This partition contains the operating system kernel, which allows Fedora to boot. It also contains other files used during the bootstrap process. Due to the limitations of most firmware, creating a separate, small standard partition for this directory is recommended. In most scenarios, a 1 GB `/boot` partition is adequate.

Important: note that the `/boot` directory can not be placed on a LVM logical volume. Use a standard partition.

#### / (root) - 25 GB

This is where the root directory is located. The root directory is the top level of the directory structure. By default, all files are written to this partition unless a different partition is mounted in the path being written to (for example, `/boot` or `/home`). If you follow the recommended scheme described in this section, this will be the partition where most software packages will be installed.

Note: The `/` mount point is the top of the Linux Filesystem Hierarchy, and is referred to as the root file system, or root. The `/root` directory, sometimes pronounced "slash-root", is the home directory for the `root` user.

#### /home - at least 10 GB

To store user data separately from system data, create a dedicated mount point for the `/home` directory. This partition should be sized based on the amount of data that will be stored locally, number of users, and so on. This will allow you to upgrade or reinstall Fedora without erasing user data files. During the installation, a separate `/home` partition will be created if there are 50 GB or more free space for your Fedora installation.

When using Fedora as a workstation for normal use with a graphical environment, this mount point should have the most disk space assigned to it, as it will likely hold the most data (user settings, images, videos, etc).

#### swap - based on your system parameters

Swap partitions support virtual memory; data is written to them when there is not enough RAM to store the data your system is processing. This partition’s size is a function of system memory workload, not total system memory, and therefore is not equal to the total system memory size. Therefore, it is important to analyze what applications a system will be running and the load those applications will serve in order to determine the system memory workload. Application providers and developers should be able to provide some guidance.

When the system runs out of swap space, the kernel terminates processes as the system RAM memory is exhausted. Configuring too much swap space results in storage devices being allocated but idle and is a poor use of resources. Too much swap space can also hide memory leaks. The maximum size for a swap partition and other additional information can be found in the mkswap(8) man page.

The table below provides the recommended size of a swap partition depending on the amount of RAM in your system and whether you want sufficient memory for your system to hibernate. If you let the installation program partition your system automatically, the swap partition size will be established using these guidelines. Automatic partitioning setup assumes hibernation is not in use, and the maximum size of the swap partition is limited to 10% of the total size of the hard drive. If you want to set up enough swap space to allow for hibernation, or if you want to set the swap partition size to more than 10% of the system’s storage space, you must edit the partitioning layout manually.

**Recommended System Swap Space**
| Amount of RAM in the system | Recommended swap space | Recommended swap space if allowing for hibernation |
| --------------------------- | ---------------------- | -------------------------------------------------- |
| less than 2 GB | 2 times the amount of RAM | 3 times the amount of RAM |
| 2 GB - 8 GB | Equal to the amount of RAM | 2 times the amount of RAM |
| 8 GB - 64 GB | 0.5 times the amount of RAM | 1.5 times the amount of RAM |
| more than 64 GB | workload dependent | hibernation not recommended |

At the border between each range listed above (for example, a system with 2 GB, 8 GB, or 64 GB of system RAM), discretion can be exercised with regard to chosen swap space and hibernation support. If your system resources allow for it, increasing the swap space may lead to better performance.

Distributing swap space over multiple storage devices - particularly on systems with fast drives, controllers and interfaces - also improves swap space performance.

#### EFI System Partition (200 MB)

UEFI-based systems require an EFI System Partition at least 50 MB in size (recommended size is 200 MB), regardless of the partitioning scheme.

>**Important:** If your system requires an EFI System Partition, this partition must be created as a standard physical partition. It can not reside on an LVM volume or a Btrfs subvolume.

###### Reference:
* https://docs.fedoraproject.org/en-US/fedora/f33/install-guide/install/Installing_Using_Anaconda/#sect-installation-gui-manual-partitioning-recommended


## Terminal

### Basic Commands

| &nbsp;&nbsp;Command&nbsp;&nbsp; | Meaning | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Examples&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| ------- | ------- | -------- |
| `whoami` | current username | |
| `pwd` | **p**rint **w**orking **d**irectory | |
| `cd` | **c**hange **d**irectory | |
| `mkdir` | **m**a**k**e **dir**ectory | |
| `ls` | **l**i**s**t (using: -a, list all) | |
| `mv` | **m**o**v**e | `mv origen destino` |
| `cp` | **c**o**p**y | `cp origen destino` |
| `rm` | **r**e**m**ove (with -r removes recursively, with this option you can remove a folder) | `rm <file_path>` |
| `rmdir` | **r**e**m**ove **dir**ectory | |
| `wc` | **w**ord **c**ount (using -l switch to tell we only want line count, -w is count of words and ) | |
| `man` | **man**ual | `man dnf` |
| `su` | **s**uper**u**ser or **s**witch **u**ser (When used with no arguments it assumes you want to change to the root user (hence the first interpretation of the name), but you can pass a username to it in order to switch to a specific user account (the second interpretation)). Logout using Ctrl-D shortcut. | |
| `sudo` | **s**witch **u**ser and **do** this command | |
| `cat` | concatenate (is used to view the content of a file, like less) | `cat <file_name>` |
| `less` | is a reader of files | `cat <file_name> \| less` |
| `sort` | sort the contents of a file alphabetically | |

`su` se usa para iniciar sesión como `root`, el principal problema al intentar iniciar sesión como `root`, es que no sirva ninguna contraseña dado que no se ha asignado al usuario `root`. Para asignar una contraseña a root se usa el comando `sudo passwd root`.

###### Reference:
* https://fedora.fandom.com/wiki/Basic_Commands
* https://ubuntu.com/tutorials/command-line-for-beginners#3-opening-a-terminal


## Package management system

Fedora is a distribution that uses a package management system. This system is based on rpm , the RPM Package Manager, with several higher level tools built on top of it, most notably PackageKit (default gui) and yum (command line tool). As of Fedora 22, yum has been replaced by dnf. The Gnome Package Manager is another GUI package manager.

###### Reference:
* https://fedoraproject.org/wiki/Package_management_system

### yum – Yellowdog Updater Modified

yum is a software package manager that installs, updates, and removes packages on RPM-based systems. It automatically computes dependencies and figures out what things should occur to install packages. yum makes it easier to maintain groups of machines without having to manually update each one using rpm.

yum uses an online repository by default, but you can also configure it to use a local repository of packages.

Important: As of Fedora 22, yum has been replaced with DNF.

###### Reference:
* https://fedoraproject.org/wiki/Yum  
* http://yum.baseurl.org/wiki/YumCommands.html

### dnf – Dandified yum

DNF is a software package manager that installs, updates, and removes packages on RPM-based Linux distributions. It automatically computes dependencies and determines the actions required to install packages. DNF also makes it easier to maintain groups of machines, eliminating the need to manually update each one using rpm. Introduced in Fedora 18, it has been the default package manager since Fedora 22.

DNF or Dandified yum is the next generation version of yum. It roughly maintains CLI compatibility with yum and defines a strict API for extensions and plugins. Plugins can modify or extend features of DNF or provide additional CLI commands on top of those mentioned below. If you know the name of such a command (including commands mentioned bellow), you may find/install the package which provides it using the appropriate virtual provide in the form of dnf-command(<alias>) where <alias> is the name of the command; e.g. dnf-command(repoquery) for a repoquery command (the same applies to specifying dependencies of packages that require a particular command).

###### Reference:
* https://fedoraproject.org/wiki/DNF

### rpm – RPM package manager

The RPM Package Manager (RPM) is a powerful command line driven package management system capable of installing, uninstalling, verifying, querying, and updating computer software packages. Each software package consists of an archive of files along with information about the package like its version, a description, dependencies and other metadata.

RPM is a low level utility and end users generally use dnf or yum or a graphical utility that interfaces with dnf|yum instead of using RPM directly.

#### Running rpm commands

The main rpm operators

| Operation | Short Option | Long Option |     |
| --------- | ------------ | ----------- | --- |
| install | `-I` | `--install` | The –i option tells the rpm command to run an installation operation, which, as you’d suspect, installs packages. You should normally install packages with rpm -U, not rpm -i. One of the main reasons is that rpm -i allows you to install multiple instances of the same (identical) package. This is usually not what you want. |
| upgrade/install | `-U` | `--upgrade` | The rpm –U command works for both installation of new packages and for upgrading. |
| remove | `-e` | `--erase` | To remove a package, use the -e option to the rpm command, short for erase. |
| hence (feedback during -U) | `-h` | | The -h option to the rpm command prints out # signs, also called hash marks (hence the -h). These hash marks provide some confirmation that the rpm command is still running. This is important, since large packages may take a long time to install or upgrade. |
| verbose (feedback during -U) | `-v` | `--verbose` | In addition to hash marks, you can get more verbose output from the tight-lipped rpm command. The -v option to the rpm command tells the command to print out verbose information as the command runs. |
| query | `-q` | `--query` | The -q option tells the rpm command to query the RPM database. Use the rpm –q command to quickly verify a package has been installed. To verify, you need to use the name of the installed package, not the name of the RPM file. |
|all | `-a` | `--all` | The –a option tells the rpm command to query for all packages. |

#### Some rpm commands

To install or upgrade a package

```console
[username@localhost ~]$ sudo rpm -U path/filename.rpm
```

To get extra feedback, you can use a command like the following, with the -h and -v options in conjunction with the –U option (When you run this command you will see more output than the default, which is no output unless there are errors.)

```console
[username@localhost ~]$ sudo rpm -Uvh path/filename.rpm
```

To remove a package (called erase in RPM terminology)

```console
[username@localhost ~]$ sudo rpm –e package_name
```

To list every RPM package installed on your system

```console
[username@localhost ~]$ sudo rpm –qa
```

To verify if a package is installed

```console
[username@localhost ~]$ sudo rpm -q package_name
```

The Linux (and Unix) grep command provides a powerful tool for filtering through textual data. If you pipe the output of the rpm –qa command into the grep command, you have a powerful search engine at your fingertips.

```console
[username@localhost ~]$ sudo rpm -qa | grep part_of_package_name
```

###### Reference:
* https://fedoraproject.org/wiki/Rpm  
* http://rpm.org/  
* https://docs.fedoraproject.org/ro/Fedora_Draft_Documentation/0.1/html/RPM_Guide/ch02s03.html  
* https://docs.fedoraproject.org/en-US/Fedora_Draft_Documentation/0.1/html-single/RPM_Guide/index.html#ch-using-rpm


## Install .tar.gz, .sh and .rpm packages

### Install .tar.gz program

```console
[username@localhost ~]$ tar xvf <archive>.tar.gz
[username@localhost ~]$ cd <archive>
[username@localhost ~]$ sudo make
```

As this package is made with the GNU autotools you should run `./configure` inside the distribution directory for configuring the source tree. After that you should run `make` for compilation and `make install` (as root) for installation of `<package>`.


###### Reference:
* https://forums.fedoraforum.org/showthread.php?262523-How-do-I-install-a-tar-gz-file  
* http://www.linuxandubuntu.com/home/how-to-install-targz-or-tgz-packages-in-linux  
* https://askubuntu.com/questions/25961/how-do-i-install-a-tar-gz-or-tar-bz2-file
* https://freedesktop.org/software/pulseaudio/pavucontrol/#installation

### Install .sh program

```console
[username@localhost ~]$ sh <program>.sh
```

### Install .rpm programas

```console
[username@localhost ~]$ sudo dnf install <program>.rpm
```


## RPM Fusion

RPM Fusion provides software that the Fedora Project or Red Hat doesn't want to ship. That software is provided as precompiled RPMs for all current Fedora versions and current Red Hat Enterprise Linux or clones versions; you can use the RPM Fusion repositories with tools like yum and PackageKit.

To enable the Free repository, use:

```console
[username@localhost ~]$ sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
```

Optionally, enable the Nonfree repository:

```console
[username@localhost ~]$ sudo dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

The first time you attempt to install packages from these repositories, the dnf utility prompts you to confirm the signature of the repositories. Confirm it.

###### Reference:
* https://rpmfusion.org/  
* https://docs.fedoraproject.org/en-US/quick-docs/setup_rpmfusion/


## Customisation

### GNOME Tweaks

Don't require RPM Fusion

```console
[username@localhost ~]$ sudo dnf install gnome-tweaks
```

Con la herramienta Tweaks, se puede modificar la interfaz de linux, adicionando botones de minimizar y maximizar en las ventanas, etc. Tweaks se descarga en la termina con el siguiente comando
sudo dnf install gnome-tweak-tool

### Dash to panel

Active or download dash-to-panel from https://extensions.gnome.org/extension/1160/dash-to-panel/

More information in:
* https://docs.fedoraproject.org/en-US/quick-docs/gnome-shell-extensions/

### System fonts

System fonts are installed for all users. Anyone with an account on the machine will be able to use these fonts.

You can find fonts to download in:

* https://fonts.google.com/
* https://www.nerdfonts.com/

To install fonts create a new directory _/usr/share/fonts/<font-family-name>_ for the new font family

```console
[username@localhost ~]$ sudo mkdir /usr/share/fonts/robofont
```

Copy font files (e.g. .ttf files) to the new directory

```console
[username@localhost ~]$ sudo cp ~/Downloads/robofont.ttf /usr/share/fonts/robofont
```

Update the font cache

```console
[username@localhost ~]$ sudo fc-cache -v
```

###### Reference:
* https://docs.fedoraproject.org/en-US/quick-docs/fonts/
* https://docs.fedoraproject.org/en-US/quick-docs/fonts/#system-fonts

### KDE

```console
[username@localhost ~]$ sudo dnf install @kde-desktop
```

###### Reference:
* https://docs.fedoraproject.org/en-US/quick-docs/switching-desktop-environments/
* https://fedoraproject.org/wiki/KDE

## Install some programs

### Sound

#### PulseAudio Volume Control

PulseAudio Volume Control (`pavucontrol`) is a simple GTK based volume control tool ("mixer") for the [PulseAudio sound server](https://www.freedesktop.org/wiki/Software/PulseAudio/). In contrast to classic mixer tools this one allows you to control both the volume of hardware devices and of each playback stream separately.

```console
[username@localhost ~]$ sudo dnf install pavucontrol
```

###### Reference:
* https://freedesktop.org/software/pulseaudio/pavucontrol/

### Development

#### Google Chrome

Download it from https://www.google.com/chrome/

#### GIT

Don't require RPM Fusion

```console
[username@localhost ~]$ sudo dnf install git
```

###### Reference:
* https://git-scm.com/download/linux

#### Java 8 (OpenJDK)

Don't require RPM Fusion

```console
[username@localhost ~]$ sudo dnf install java-1.8.0-openjdk
```

###### Reference:
* https://docs.fedoraproject.org/en-US/quick-docs/installing-java/
* https://jdk.java.net/

#### Spring Tool Suite

Download it from https://spring.io/tools

To change editor's font:
* Window -> Preferences
  * General -> Appearance -> Colors and Fonts
    * Basic -> Text Font

#### PostgreSQL

Log as `root` to do this

Install the repository RPM:

```console
[root@localhost ~]# dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/F-33-x86_64/pgdg-fedora-repo-latest.noarch.rpm
```

Install PostgreSQL:

```console
[root@localhost ~]# dnf install -y postgresql13-server
```

Initialize the database and enable automatic start:

```console
[root@localhost ~]# /usr/pgsql-13/bin/postgresql-13-setup initdb
[root@localhost ~]# systemctl enable postgresql-13
[root@localhost ~]# systemctl start postgresql-13
```

User Creation and Database Creation

Switch user to interact with postgres:

```console
[root@localhost ~]# su - postgres
```

Run postgre’s interactive shell:

```console
[postgresql@localhost ~]$ psql
psql (13.1)
Type “help” for help

postgres=#
```

Add password for postgres user:

```console
postgres=# \password postgres
```

(Optional) Create other users:

```console
postgres=# CREATE USER lenny WITH PASSWORD ‘leonard’;
postgres=# CREATE DATABASE carl OWNER lenny;
```

Log out of postgre’s interactive shell and postgre@localhost user:

```console
postgres=# exit
[postgres@localhost ~]$ exit
logout
[root@localhost ~]#
```


Configuration
Paso 7 en el video de youtube

Modificar las líneas 59 y 63 del archivo /var/lib/pgsql/13/data/postgresql.conf

Quitar comentarios hechos con #

Paso 8

Modificar las líneas 80, 82, 84, 87, 88 y 89 del archivo /var/lib/pgsql/13/data/pg_hba.conf

Cambiar los valores de METHOD a md5

Paso 9: Reiniciar el servicio

```console
[root@localhost ~]# systemctl stop postgresql-13
[root@localhost ~]# systemctl start postgresql-13
```


Install the repository of pgAdmin 4

```console
[root@localhost ~]# rpm -i https://ftp.postgresql.org/pub/pgadmin/pgadmin4/yum/pgadmin4-fedora-repo-1-1.noarch.rpm
```

Install pgAdmin 4 for both desktop and web modes.

```console
[root@localhost ~]# dnf install -y pgadmin4
```

Finally, if you have installed pgadmin4 or pgadmin4-web, run the web setup script to configure the system to run in web mode:

```console
[root@localhost ~]# /usr/pgadmin4/bin/setup-web.sh
```

Then open pgAdmin 4 and add a new server:

Add New Server
  - General
    - name: <server_name>
  - Connection
    - Host name/address: localhost
    - port: 5432
    - username: postgres
    - password: <password>

###### Reference:
* https://www.postgresql.org/download/linux/redhat/  
* https://fedoraproject.org/wiki/PostgreSQL#User_Creation_and_Database_Creation  
* https://fedoraproject.org/wiki/PostgreSQL#Configuration  
* https://www.pgadmin.org/download/pgadmin-4-rpm/  
* https://www.youtube.com/watch?v=uPqX3hKUaFQ

#### Postman

Download it from https://www.postman.com/downloads/

#### Node.js

Don't require RPM Fusion

```console
[username@localhost ~]$ sudo dnf install nodejs
```

###### Reference:
* https://nodejs.org/en/download/package-manager/#centos-fedora-and-red-hat-enterprise-linux

#### TypeScript

Requires Node.js

```console
[username@localhost ~]$ sudo npm install --global typescript
```

###### Reference:
* https://www.typescriptlang.org/#installation

#### Angular CLI

Requires Node.js and TypeScript

```console
[username@localhost ~]$ sudo npm install --global @angular/cli
```

###### Reference:
* https://cli.angular.io/

#### Visual Studio Code

Install the key and repository of VS Codey:

```console
[username@localhost ~]$ sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
[username@localhost ~]$ sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
```

Then update the package cache and install the package using dnf (Fedora 22 and above):

```console
[username@localhost ~]$ sudo dnf check-update
[username@localhost ~]$ sudo dnf install code
```

###### Reference:
* https://code.visualstudio.com/docs/setup/linux#_rhel-fedora-and-centos-based-distributions

### Connectivity

#### Skype

Download it from https://www.skype.com/en/get-skype/

#### Chrome Remote Desktop

Download it from https://remotedesktop.google.com/access

#### AnyDesk

Run commands as root (`su` or `sudo -i`)

Add the repository

```console
[root@localhost ~]# cat > /etc/yum.repos.d/AnyDesk-Fedora.repo << "EOF" 
[anydesk]
name=AnyDesk Fedora - stable
baseurl=http://rpm.anydesk.com/fedora/$basearch/
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://keys.anydesk.com/repos/RPM-GPG-KEY
EOF
```

Install AnyDesk

```console
[root@localhost ~]# dnf install anydesk
```

If you have the next error

```console
Error: 
 Problem: conflicting requests
  - nothing provides libpangox-1.0.so.0()(64bit) needed by anydesk-6.0.1-1.x86_64
```

Install pangox-compat and try to install AnyDesk again

```console
[root@localhost ~]# dnf --releasever=32 install pangox-compat.x86_64
```

###### Reference:
* http://rpm.anydesk.com/howto.html  
* https://www.reddit.com/r/AnyDesk/comments/jojdq1/fedora_33_install_anydesk_through_dnf/

#### Microsoft Teams

Download it [here](https://www.microsoft.com/en-ww/microsoft-teams/download-app)

### More

#### unrar

Requires RPM Fusion

```console
[username@localhost ~]$ sudo dnf install unrar
```

###### Reference:
* https://fedora.pkgs.org/33/rpmfusion-nonfree-x86_64/unrar-5.9.4-3.fc33.x86_64.rpm.html

Para descomprimir un archivo con WinRar use

```console
[username@localhost ~]$ unrar x archive.rar
```

###### Reference:
* https://www.tecmint.com/how-to-open-extract-and-create-rar-files-in-linux/  
* https://unix.stackexchange.com/questions/246535/how-to-open-rar-file-in-linux

#### Transmission

Don't require RPM Fusion

```console
[username@localhost ~]$ sudo dnf install transmission
```

Transmission is used to download from torrent

#### JDownloader

Douwnload it from https://jdownloader.org/download/index

#### Stellarium

Don't require RPM Fusion

```console
[username@localhost ~]$ sudo dnf install stellarium
```

#### Blender

Don't require RPM Fusion

```console
[username@localhost ~]$ sudo dnf install blender
```

#### VLC

Requires RPM Fusion

```console
[username@localhost ~]$ sudo dnf install vlc
```

###### Reference:
* https://docs.fedoraproject.org/en-US/quick-docs/installing-and-running-vlc/

#### Adobe Flash

It is not free and open source software.

Install the Adobe DNF repository

```console
[username@localhost ~]$ sudo dnf install http://linuxdownload.adobe.com/adobe-release/adobe-release-x86_64-1.0-1.noarch.rpm
```

Install Adobe Flash

```console
[username@localhost ~]$ sudo dnf install flash-plugin alsa-plugins-pulseaudio libcurl
```

###### Reference:
* https://docs.fedoraproject.org/en-US/quick-docs/using-adobe-flash/


## Desktop entries

To create a shortcut to a non-installed application, you must create a `<shortcut-name>.desktop` document in `/usr/share/applications/`.

The basic structure of `<shortcut-name>.desktop` is:

```
[Desktop Entry]
Name=Name of Application
Exec=/path/to/executable
Icon=/path/to/icon
Terminal=false
Type=Application
Categories=Development;IDE;
```

### Example for Spring Tool Suite 4

```console
[username@localhost ~]$ sudo nano /usr/share/application/sts.desktop
```

The content of `sts.desktop` is:

```
[Desktop Entry]
Name=Spring Tool Suite 4
Exec=/home/aldanasilva/programs/sts-4.8.1.RELEASE/SpringToolSuite4
Icon=/home/aldanasilva/programs/sts-4.8.1.RELEASE/icon.xpm
Terminal=false
Type=Application
Categories=Development;IDE;
```

Revisar referencias!!!

###### References:
* https://developer.gnome.org/integration-guide/stable/desktop-files.html.en
* https://wiki.archlinux.org/index.php/desktop_entries


## Troubleshooting

### Sound - Pops when starting and stopping playback

PulseAudio can suspend sinks after a period of inactivity. This can make an audible noise (like a crack/pop/scratch). Sometimes even when move the slider volume, or open and close windows (KDE4). This behavior is enabled in default configuration files:

/etc/pulse/default.pa

    load-module module-suspend-on-idle

/etc/pulse/system.pa

    load-module module-suspend-on-idle

Commenting that line in relevant file fixes that issue. Next you must to restart the PulseAudio service

then restart pulseaudio by executing

```console
[username@localhost ~]$ pulseaudio -k
[username@localhost ~]$ pulseaudio --start
```

###### Reference:
* https://www.freedesktop.org/wiki/Software/PulseAudio/
* https://fedoraproject.org/wiki/How_to_debug_sound_problems
* https://fedoraproject.org/wiki/How_to_debug_PulseAudio_problems  
* https://wiki.archlinux.org/index.php/PulseAudio/Troubleshooting#Pops_when_starting_and_stopping_playback
* https://wiki.archlinux.org/index.php/Advanced_Linux_Sound_Architecture/Troubleshooting
* https://alsa.opensrc.org/Troubleshooting

### Display frozen

Si la pantalla se queda congelada en cualquier momento, y el pc no responde en nada, reiniciarlo y tan pronto inicie sesión, abra la consola de comandos

Abra el monitor del sistema con el comando `top -i`

Si ve un proceso llamado `systemd-journal` ejecutándose y ocupando casi el 100% del CPU, vea el log de `journal` ejecutando el comando `journalctl`

Cuando haya abierto el log de journal, presione la tecla END para ir al final del log.

Si ve el siguiente error

```console
Jan 15 14:36:48 localhost.localdomain kernel: pcieport 0000:00:1d.0: AER: Corrected error received: 0000:00:1d.0
Jan 15 14:36:48 localhost.localdomain kernel: pcieport 0000:00:1d.0: PCIe Bus Error: severity=Corrected, type=Physical Layer, (Receiver ID)
Jan 15 14:36:48 localhost.localdomain kernel: pcieport 0000:00:1d.0:   device [8086:a29e] error status/mask=00000001/00002000
Jan 15 14:36:48 localhost.localdomain kernel: pcieport 0000:00:1d.0:    [ 0] RxErr
```

Agregue la opción `pci=nommconf` al kernel, esta opción se ediciona en el archivo `/etc/default/grub`, se agrega al final de la línea `GRUB_CMDLINE_LINUX`

```console
[username@localhost ~]$ sudo cat /etc/default/grub
[sudo] password for username: 
GRUB_TIMEOUT=5
GRUB_DISTRIBUTOR="$(sed 's, release .*$,,g' /etc/system-release)"
GRUB_DEFAULT=saved
GRUB_DISABLE_SUBMENU=true
GRUB_TERMINAL_OUTPUT="console"
GRUB_CMDLINE_LINUX="resume=UUID=7a096366-bfc0-4ebd-a592-ba72625eebc6 rhgb quiet pci=nommconf"
GRUB_DISABLE_RECOVERY="true"
GRUB_ENABLE_BLSCFG=true
```

Luego se reinicia el pc.

Si el problema no se ha arreglado aún, genere de nuevo el archivo ejecutando el comando

```console
[username@localhost ~]$ sudo grub2-mkconfig
```

Y reinicie el PC. Luego valide que en los procesos ejecutándose ya no aparezca systemd-journal

###### Reference:
* https://wiki.archlinux.org/index.php/Dell_XPS_15_9560#Troubleshooting  
* https://unix.stackexchange.com/questions/327730/what-causes-this-pcieport-00000003-0-pcie-bus-error-aer-bad-tlp  
* https://docs.fedoraproject.org/en-US/fedora/rawhide/system-administrators-guide/kernel-module-driver-configuration/Working_with_the_GRUB_2_Boot_Loader/

### Unable to access location

Error mounting /dev/sdX as /run/media/username/disk:
mount(2) system call failed: Structure needs cleaning

See manual of `fsck` (check and repair a Linux filesystem)

```console
[username@localhost ~]$ man fsck
```

Repair

```console
[username@localhost ~]$ sudo fsck.ext4 -y /dev/sdaX
```

https://askubuntu.com/questions/910078/structure-needs-cleaning-error-cannot-mount-partition
















PackageKit – PackageKit gui tool (‘add/remove software’ in your menu)
yumex – Yum Extender


Angular

ng serve
ng serve -o
ng serve --port 4201




PostgreSQL
https://www.postgresql.org/docs/13/datatype.html
https://www.postgresqltutorial.com/postgresql-cast/
https://www.postgresql.org/docs/13/functions-string.html
https://www.postgresql.org/docs/13/sql-createfunction.html

https://stackoverflow.com/questions/32843115/how-to-configure-spring-data-to-use-postgres-with-hibernate-without-xml
https://docs.spring.io/spring-cloud-dataflow/docs/2.7.x/reference/htmlsingle/#_postgresql




pgsql






https://www.postgresql.org/docs/13/creating-cluster.html














https://fedoraproject.org/wiki/Cinnamon




https://fedoraproject.org/wiki/User_Guide_-_Managing_Software


https://docs.fedoraproject.org/en-US/fedora/f33/


https://eftalor.medium.com/11-things-to-do-after-installing-fedora-33-f68751eef156

https://www.debugpoint.com/2020/10/10-things-to-do-fedora-33-after-install/



https://www.hostinger.com/tutorials/linux-commands




https://docs.fedoraproject.org/en-US/quick-docs/dnf-system-upgrade/


Due to patent issues ffmpeg (which is used by Firefox for video decoding) doesn't have support of some popular media codecs (e.g. H.264, H.265 and AAC). You need to install ffmpeg package from rpmfusion repo (and probably gstreamer plugins as well, they are used by some other programs).

Para problemas con el video en YouTube, después de agregar los repositorios de RPM Fusion, instalar ffmpeg

sudo dnf install ffmpeg

ffmpeg

https://www.reddit.com/r/Fedora/comments/aekg9n/video_playback_problems/



Installing ptugins for playing movies and music

https://docs.fedoraproject.org/en-US/quick-docs/assembly_installing-plugins-for-playing-movies-and-music/

https://unix.stackexchange.com/questions/154106/show-address-bar-w-full-path-in-nautilus-instead-of-breadcrumbs-bar



Revisar manuales de

systemctl














https://docs.fedoraproject.org/en-US/Fedora/23/html/System_Administrators_Guide/sec-Listing_Packages.html




Ubuntu








https://unix.stackexchange.com/questions/89348/how-to-permanently-disable-the-insert-key-on-linux





https://askubuntu.com/questions/343268/how-to-use-manual-partitioning-during-installation



### Fedora Magazine

* https://fedoramagazine.org/5-cool-tiling-window-managers/
* https://fedoramagazine.org/taking-screencast-fedora/
  * https://github.com/EasyScreenCast/EasyScreenCast
* https://fedoramagazine.org/commandline-quick-tips-locate-file/






gnome-theme.css

https://ogbe.net/blog/gnome_titles.html
https://askubuntu.com/questions/1043426/how-can-i-access-org-gnome-shell-theme-which-is-referred-to-in-the-ubuntu-css
https://developer.gnome.org/gtk3/stable/chap-css-overview.html
https://linuxhint.com/modify_style_gnome_shell_themes/
https://developer.gnome.org/gtk3/stable/chap-css-properties.html
https://unix.stackexchange.com/questions/257163/reduce-title-bar-height-in-gnome-3-gtk-3



