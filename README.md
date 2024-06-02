# My Dotfiles

## Requirenments

Ensure you have the following installed in your system

> **_NOTE:_**
> Use your OS package manager

### Git

```
# pacman -S git
```

### GNU Stow

```
# pacman -S stow
```

## Installation

First, clone this repo into your $HOME directory using git

```
$ git clone https://github.com/eslam-dv/dotfiles.git
$ cd dotfiles
```

the use GNU Stow to create symlinks

> **_NOTE:_**
> Make sure there is no existing configerations on your system.

```
$ stow .
```

## Hyprland Setup

```
# pacman -S hyprland waybar rofi-wayland mako fastfetch wlogout network-manager-applet pavucontrol pamixer \
playerctl brightnessctl grim slurp sddm hyprlock hyprpaper hypridle thunar firefox eog evince file-roller \
jq alacritty xdg-desktop-portal-hyprland xdg-desktop-portal-gtk polkit-kde-agent gvfs thunar-archive-plugin htop \
nwg-look ttf-jetbrains-mono-nerd
```

```
$ yay -S rofi-emoji
```
