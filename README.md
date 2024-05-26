# My Dotfiles

## Requirenments

Ensure you have the following installed in your system

### Git

```
dnf install git
```

### GNU Stow

```
dnf install stow
```

## Installation

First, clone this repo into your $HOME directory using git

```
git clone git@github.com/eslam-dv/dotfiles.git
cd dotfiles
```

the use GNU Stow to create symlinks

**_NOTE:_**  Make sure there is no existing configerations on your system.

```
stow .
```
