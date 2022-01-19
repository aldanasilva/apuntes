[back](#terminal) [next](#terminal)
# Command Line

The Linux command line is a text interface to your computer. Often referred to as the shell, terminal, console, prompt or various other names, it can give the appearance of being complex and confusing to use. Yet the ability to copy and paste commands from a website, combined with the power and flexibility the command line offers, means that using it may be essential when trying to follow instructions online.


## A brief history

During the formative years of the computer industry, one of the early operating systems was called Unix. It was designed to run as a multi-user system on mainframe computers, with users connecting to it remotely via individual terminals. These terminals were pretty basic by modern standards: just a keyboard and screen, with no power to run programs locally. Instead they would just send keystrokes to the server and display any data they received on the screen. There was no mouse, no fancy graphics, not even any choice of colour. Everything was sent as text, and received as text. Obviously, therefore, any programs that ran on the mainframe had to produce text as an output and accept text as an input.

Compared with graphics, text is very light on resources. Even on machines from the 1970s, running hundreds of terminals across glacially slow network connections (by today’s standards), users were still able to interact with programs quickly and efficiently. The commands were also kept very terse to reduce the number of keystrokes needed, speeding up people’s use of the terminal even more. This speed and efficiency is one reason why this text interface is still widely used today.

When logged into a Unix mainframe via a terminal users still had to manage the sort of file management tasks that you might now perform with a mouse and a couple of windows. Whether creating files, renaming them, putting them into subdirectories or moving them around on disk, users in the 70s could do everything entirely with a textual interface.

Each of these tasks required its own program or command: one to change directories (`cd`), another to list their contents (`ls`), a third to rename or move files (`mv`), and so on. In order to coordinate the execution of each of these programs, the user would connect to one single master program that could then be used to launch any of the others. By wrapping the user’s commands this “shell” program, as it was known, could provide common capabilities to any of them, such as the ability to pass data from one command straight into another, or to use special wildcard characters to work with lots of similarly named files at once. Users could even write simple code (called “shell scripts”) which could be used to automate long series of shell commands in order to make complex tasks easier. The original Unix shell program was just called `sh`, but it has been extended and superceded over the years, so on a modern Linux system you’re most likely to be using a shell called `bash`.

Linux is a sort-of-descendent of Unix. The core part of Linux is designed to behave similarly to a Unix system, such that most of the old shells and other text-based programs run on it quite happily. In theory you could even hook up one of those old 1970s terminals to a modern Linux box, and access the shell through that. But these days it’s far more common to use a software terminal: that same old Unix-style text interface, but running in a window alongside your graphical programs. yourself!

###### Resource:
* https://ubuntu.com/tutorials/command-line-for-beginners#2-a-brief-history-lesson



## `zsh`

Zsh is a shell designed for interactive use, although it is also a powerful scripting language.

### Installation

#### Ububtu

```console
$ sudo apt-get update
$ sudo apt-get install -y zsh
```

#### Fedora

```console
$ sudo dnf install -y zsh
```

###### Resource:
* https://www.zsh.org/

### Oh My Zsh

Oh My Zsh is an open source, community-driven framework for managing your Zsh configuration.

Once installed, your terminal shell will become the talk of the town or your money back! With each keystroke in your command prompt, you'll take advantage of the hundreds of powerful plugins and beautiful themes.

#### Installation

```console
$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

###### Resource
* https://ohmyz.sh/

### Plugins

#### `zsh-syntax-highlighting`

This package provides syntax highlighting for the shell zsh. It enables highlighting of commands whilst they are typed at a zsh prompt into an interactive terminal. This helps in reviewing commands before running them, particularly in catching syntax errors.

##### Installation

Clone the repository inside your oh-my-zsh repo:

```console
$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```

Enable it in your `~/.zshrc` by adding it to your plugin list:

```
  plugins=(... zsh-syntax-highlighting)
```

you can also source it with:

```console
$ echo "source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
```

###### Resource
* https://github.com/zsh-users/zsh-syntax-highlighting

#### `zsh-autosuggestions`

It suggests commands as you type based on history and completions.

As you type commands, you will see a completion offered after the cursor in a muted gray color. This color can be changed by setting the ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE variable.

If you press the `→` key (`forward-char` widget), it will accept the suggestion, replacing the contents of the command line buffer with the suggestion.

If you invoke the `forward-word` widget, it will partially accept the suggestion up to the point that the cursor moves to.

##### Installation

Clone the repository inside your oh-my-zsh repo:

```console
$ git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
```

Enable it in your `~/.zshrc` by adding it to your plugin list:

```
  plugins=(... zsh-autosuggestions)
```

you can also source it with:

```console
$ echo "source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
```

###### Resource
* https://github.com/zsh-users/zsh-autosuggestions


#### Other useful plugins`battery`

* [`battery`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/battery)
* [`colored-man-pages`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/colored-man-pages)
* [`command-not-found`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/command-not-found)
* [`sudo`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo)
* [`themes`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/themes)
* [`zsh-interactive-cd`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/zsh-interactive-cd)

#### Create custom theme

* https://blog.carbonfive.com/writing-zsh-themes-a-quickref/






* https://ubuntu.com/tutorials/command-line-for-beginners#1-overview
