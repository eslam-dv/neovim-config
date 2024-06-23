# My Dotfiles

## Requirenments

Ensure you have the following installed in your system

> **_NOTE:_**
> Use your OS package manager

### Git

```
# xbps-install git
```

### GNU Stow

```
# xbps-install stow
```

## Installation

First, clone this repo into your $HOME directory using git

```
$ git clone git@github.com:eslam-dv/dotfiles.git 
$ cd dotfiles
```

the use GNU Stow to create symlinks

```
$ stow nvim
$ stow bash
etc
```
