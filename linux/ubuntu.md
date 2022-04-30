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

## Install programs

There are many ways to install programs, you can use:

* `sudo apt-get install -y PACKAGE`
* `sudo apt-get install -y ./DOWNLOADED_PACKAGE.deb`
* `sh ./DOWNLOADED_PACKAGE.sh`
* `sudo snap install PACKAGE`
* `dpkg -i DOWNLOADED_PACKAGE.deb`.

To install programs you have to open your terminal and go to `~/Downloads` folder. Here are a list of programs to install.

* Packages installed downloading and running `sudo apt-get install -y ./DOWNLOADED_PACKAGE.deb`
  * [Google Chrome](https://www.google.com/chrome/)
  * [Visual Studio Code](https://code.visualstudio.com/)
  * [Slack](https://slack.com/downloads/linux) (Available in `snap` like `slack`)
  * [Zoom](https://zoom.us/download)
  * [AnyDesk](https://anydesk.com/en/downloads/linux)
  * [JDownloader](https://jdownloader.org/download/index)
  * [MEGASync](https://mega.io/desktop)
  * [Virtual Box](https://www.virtualbox.org/wiki/Linux_Downloads)
* Packages installed running `sudo apt-get install -y PACKAGE`
  * `simplescreenrecorder`
  * `ranger`
  * `gnome-tweaks`
  * `git`
* Packages installed downloading and running `sh ./DOWNLOADED_PACKAGE.sh`
  * [Miniconda](https://docs.conda.io/en/latest/miniconda.html#latest-miniconda-installer-links)
* Packages installed running `sudo snap install PACKAGE`
  * `vlc` ([website](https://www.videolan.org/vlc/download-ubuntu.html))
  * `spotify`
  * `audacity`
  * `remmina` ([website](https://remmina.org/how-to-install-remmina/))
* Packages installed running `pip install PACKAGE`
  * `jupyterlab` (Jupyter Lab, running with `jupyter-lab`, [website](https://jupyter.org/install))
  * `notebook` (Jupyter Notebook, running with `notebook`)
* [Docker](https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script)
* []()



- GIMP
  - https://www.gimp.org/downloads/

- 
- Tranmission
  - Store
- R
  - rstudio
- stellarium
- blender
- chrome-remote-desktop



## Cheat sheets

* git
  * https://training.github.com/
  * https://education.github.com/git-cheat-sheet-education.pdf
* conda
  * https://docs.conda.io/projects/conda/en/latest/user-guide/cheatsheet.html


## conda

```console
$ conda create --name my-env python[=3.9]
$ conda info --envs
$ conda activate my-env
```



## git basic conf

```console
$ git config --global user.name "[firstname lastname]"
$ git config --global user.email "[valid-email]"
$ git config --global alias.s "status --short --branch"
$ git config --global alias.lg "log --oneline --branches --graph --decorate"
```

## vscode with conda

`Ctrl + Shift + P` -> `Python: Select Interpreter`

* https://code.visualstudio.com/docs/python/environments#_work-with-python-interpreters





## Add fonts

Download `Hack Nerd Font` from [here](https://www.nerdfonts.com/font-downloads), then `unzip` the file into `/usr/share/fonts/Hack`.

```console
$ cd /usr/share/fonts
$ sudo unzip ~/Downloads/Hack.zip -d Hack
```













## Setting gnome themes

```console
$ gsettings get org.gnome.desktop.interface gtk-theme
'Yaru-prussiangreen-dark'
$ gsettings get org.gnome.desktop.wm.preferences theme    
'Adwaita'
$ gsettings set org.gnome.desktop.wm.preferences theme Mojave-dark 
$ gsettings set org.gnome.desktop.interface gtk-theme Mojave-dark
```





