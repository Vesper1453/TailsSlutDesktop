# 📦 Package List for EndeavourOS / Arch Linux

Complete package list for setting up your slutty desktop on **EndeavourOS** (Arch Linux).

---

## 🚀 EndeavourOS Base (Already Installed)

EndeavourOS comes with these pre-installed:
- `firefox` / `firefox-developer-edition`
- `thunderbird`
- `gimp`
- `libreoffice`
- `mpv`
- `yay` (AUR helper) ✨
- `base-devel` (compiling tools)

---

## 📦 Required Packages (Install These)

### Core i3/Desktop
```bash
sudo pacman -S --needed --noconfirm \
    i3-wm i3status i3lock dmenu \
    picom nitrogen kitty rofi polybar \
    dunst lxappearance feh
```

### Terminal Video Playback (Choose one or all)
```bash
# For ASCII/terminal video viewing
sudo pacman -S --needed --noconfirm \
    libcaca libsixel \
    imagemagick chafa

# Optional: Better media player
sudo pacman -S --needed --noconfirm \
    ffmpeg mpv vlc
```

### Terminal Enhancement
```bash
sudo pacman -S --needed --noconfirm \
    zsh zsh-completions \
    zsh-autosuggestions zsh-syntax-highlighting \
    fzf bat eza
```

### System Utilities
```bash
sudo pacman -S --needed --noconfirm \
    htop btop conky neofetch cmatrix \
    wmctrl xdotool xclip \
    ranger thunar nnn \
    git curl wget
```

### Eye Candy
```bash
sudo pacman -S --needed --noconfirm \
    fortune-mod cowsay lolcat \
    cava pipes.sh
```

### Fonts (Important for icons and symbols)
```bash
sudo pacman -S --needed --noconfirm \
    noto-fonts noto-fonts-emoji \
    ttf-nerd-fonts-symbols-mono \
    ttf-font-awesome \
    ttf-dejavu ttf-liberation
```

---

## 🎨 AUR Packages (Use yay)

EndeavourOS comes with `yay` pre-installed! Use it for these:

```bash
# Visualizer for your slutty desktop
yay -S --needed --noconfirm cava

# Additional themes
yay -S --needed --noconfirm \
    sweet-theme-git \
    orchis-theme-git \
    tela-icon-theme

# More terminal emulators (optional)
yay -S --needed --noconfirm \
    alacritty \
    wezterm
```

---

## 🖥️ Display Manager (Optional)

If you want a fancy login screen:

```bash
# LightDM with a slutty theme
sudo pacman -S --needed --noconfirm lightdm lightdm-gtk-greeter
yay -S --needed --noconfirm lightdm-webkit2-theme-glorious

# Enable it
sudo systemctl enable lightdm
```

---

## 🎵 Audio Visualizer (Optional)

```bash
# Cava for terminal audio visualization
yay -S --needed --noconfirm cava

# Configure it in ~/.config/cava/config
```

---

## 🚀 EndeavourOS-Specific Tips

### 1. Use the Welcome App
```bash
# Re-run the EndeavourOS welcome app
eos-welcome

# Or update the system
eos-update
```

### 2. i3 + XFCE Session
EndeavourOS supports running i3 on top of XFCE for a hybrid experience.

### 3. Kernel Options
```bash
# List available kernels
eos-kernel-manager

# Or manually:
sudo pacman -S linux-lts linux-lts-headers  # LTS kernel for stability
```

### 4. Enable Services
```bash
# If using NetworkManager (recommended on EndeavourOS)
sudo systemctl enable NetworkManager

# If using systemd-resolved
sudo systemctl enable systemd-resolved
```

---

## 🔥 Quick Install Script (Copy-Paste Ready)

```bash
#!/bin/bash
# Quick install for EndeavourOS

set -e

echo "🔥 Installing EndeavourOS Slut Desktop..."

# Update system
eos-update

# Install core packages
sudo pacman -S --needed --noconfirm \
    i3-wm i3status i3lock dmenu \
    picom nitrogen kitty rofi polybar \
    dunst feh \
    libcaca libsixel chafa \
    zsh zsh-completions \
    zsh-autosuggestions zsh-syntax-highlighting \
    fzf bat eza \
    htop btop conky neofetch cmatrix \
    wmctrl xdotool xclip \
    ranger thunar \
    fortune-mod cowsay lolcat \
    cava pipes.sh \
    noto-fonts noto-fonts-emoji \
    ttf-nerd-fonts-symbols-mono \
    ttf-font-awesome

# Install AUR packages with yay
yay -S --needed --noconfirm cava

echo "✅ Base packages installed!"
echo "Now run: ./install.sh"
```

Save as `install-base.sh` and run it before the main installer.

---

## 🎭 Differences from Debian/Tails

| Feature | Debian/Tails | Arch/EndeavourOS |
|---------|--------------|------------------|
| Package Manager | `apt` | `pacman` |
| Install Command | `apt-get install` | `pacman -S` |
| Update | `apt-get update` | `pacman -Sy` |
| AUR Helper | Manual install | `yay` (pre-installed on EOS) |
| i3 Package | `i3` | `i3-wm` |
| Terminal Video | `caca-utils` | `libcaca` |

---

## 💋 Stay Filthy!

Your EndeavourOS system is now ready for maximum depravity! 🔥