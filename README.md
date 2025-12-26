# .dotfiles

My personal dotfiles for Arch Linux with Hyprland window manager.

This repository contains my customized configuration files for a modern, visually appealing desktop environment on Arch Linux. 


<!-- 

## Screenshots

### Desktop Overview
![Desktop](screenshots/desktop.png)

### Widgets and Monitoring
![Widgets](screenshots/widgets.png)

### Notifications
![Notifications](screenshots/notifications.png)

### Terminal
![Terminal](screenshots/terminal.png) 

-->

## Installation

### Prerequisites

ensure your system is up to date:
```bash
sudo pacman -Syu
```

### Core Packages (pacman)

Install the essential packages from official repositories:
```bash
sudo pacman -S hyprland waybar \
    kitty rofi \
    xdg-desktop-portal-hyprland \
    qt5-wayland qt6-wayland \
    pipewire pipewire-pulse wireplumber \
    brightnessctl playerctl pamixer \
    grim slurp wl-clipboard \
    python-pywal imagemagick \
    ttf-font-awesome ttf-jetbrains-mono-nerd \
    network-manager-applet blueman
```

### AUR Packages (yay)

Install additional packages from the AUR:
```bash
yay -S eww \
    swaync \
    hyprpicker \
    hyprlock \
    wlogout \
    swww
```


## Setup

1. Clone this repository in your .config directory:
```bash
cd ~/.config
git clone https://github.com/yourusername/.dotfiles.git .
```



### My bash profile

add to `~/.bash_profile` or `~/.zprofile`:
```bash
if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec Hyprland
fi
```



## Customization

Feel free to modify any configuration to suit your needs. 
This setup is designed to fit my needs and my work flow.

To change the color scheme and the wallpaper:
Place your wallpaper in `~/.config/wallpapers/` and press SUPER + TAB
(I store my wallpapers at <a href="https://github.com/NotSoupCarry/wallpapers">my wallpapers repo</a>)


---

**System Info**
- **OS**: Arch Linux
- **WM**: Hyprland
- **Shell**: bash
- **Terminal**: Kitty
- **Editor**: nvim

