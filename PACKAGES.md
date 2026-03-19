# 📦 Package List for Tails Slut Desktop

This document lists all the slutty tools and packages you need for the full degenerate experience on Tails Linux.

---

## 🎯 Core Requirements

### Window Manager (Choose One)

#### Option 1: i3 (Recommended for Degenerates)
```bash
sudo apt-get install -y \
    i3 i3-wm i3status i3lock dmenu \
    picom nitrogen kitty rofi polybar
```

**Why i3?**
- ⚡ Lightweight and fast
- 🔥 Hotkey mode switching (Alt+F1/F2/F3)
- 🖼️ i3-gaps support for sexy window spacing
- 🌫️ Full transparency control via picom
- 💦 Slutty workspace names with emojis

#### Option 2: GNOME (Standard Desktop)
```bash
sudo apt-get install -y \
    gnome-shell gnome-terminal gnome-tweaks \
    dconf-editor gsettings-desktop-schemas
```

---

## 🎨 Visual Packages

### Transparency & Compositing
```bash
sudo apt-get install -y \
    picom compton \
    xcompmgr
```

**Purpose:**
- `picom` - Modern compositor with blur effects
- `compton` - Legacy fallback
- `xcompmgr` - Basic compositing

### Wallpaper Management
```bash
sudo apt-get install -y \
    nitrogen feh
```

**Purpose:**
- `nitrogen` - Browse and set wallpapers
- `feh` - Lightweight image viewer/wallpaper setter

### Theming & GTK
```bash
sudo apt-get install -y \
    gnome-themes-extra \
    gtk2-engines-murrine \
    gtk2-engines-pixbuf
```

---

## 🖥️ Terminal Packages

### Terminal Emulators
```bash
sudo apt-get install -y \
    kitty tilix gnome-terminal
```

**Slutty Features:**
- `kitty` - GPU-accelerated, supports images in terminal
- `tilix` - Tiling terminal with transparency
- `gnome-terminal` - Standard with profile support

### Shell Enhancement
```bash
sudo apt-get install -y \
    zsh bash-completion \
    powerline fonts-powerline
```

---

## 🎬 Media Packages (Terminal Video Viewer)

### Video Players
```bash
sudo apt-get install -y \
    mpv mplayer \
    vlc
```

### Terminal Video Rendering
```bash
sudo apt-get install -y \
    ffmpeg \
    chafa \
    caca-utils \
    libcaca-dev
```

**Purpose:**
- `ffmpeg` - Video processing and frame extraction
- `chafa` - Convert images/video to ASCII/Sixel
- `caca-utils` - Color ASCII art video playback
- `libcaca` - Advanced ASCII art library

### Image Viewers
```bash
sudo apt-get install -y \
    feh sxiv \
    imv
```

---

## 🌐 Browser Packages

### Tor Browser (Pre-installed on Tails)
Tails comes with Tor Browser - use this for all adult site browsing!

### Alternative Browsers
```bash
sudo apt-get install -y \
    firefox-esr \
    chromium
```

---

## 🔧 System Tools

### File Management
```bash
sudo apt-get install -y \
    ranger nnn \
    thunar nautilus
```

### Process Management
```bash
sudo apt-get install -y \
    htop btop \
    glances
```

### Notifications
```bash
sudo apt-get install -y \
    dunst \
    libnotify-bin
```

---

## 🎭 Optional Slutty Extras

### Conky (System Monitor)
```bash
sudo apt-get install -y \
    conky-all
```

*For creating cum-stained system info on your desktop*

### Neofetch (System Info)
```bash
sudo apt-get install -y \
    neofetch
```

*Show off your slutty system specs*

### CMatrix (Terminal Effect)
```bash
sudo apt-get install -y \
    cmatrix
```

*Matrix rain effect - looks cool with pink colors*

### Fortune/Cowsay (Terminal Fun)
```bash
sudo apt-get install -y \
    fortune-mod cowsay lolcat
```

*Slutty fortunes with colorful output*

---

## 🚀 One-Line Install (All Packages)

```bash
# Copy and paste this entire block:
sudo apt-get update && sudo apt-get install -y \
    i3 i3-wm i3status i3lock dmenu \
    picom nitrogen kitty rofi polybar \
    gnome-shell gnome-terminal gnome-tweaks \
    ffmpeg mpv mplayer vlc \
    chafa caca-utils libcaca-dev \
    zsh bash-completion powerline fonts-powerline \
    feh sxiv imv \
    ranger nnn thunar \
    htop btop dunst libnotify-bin \
    conky-all neofetch cmatrix \
    fortune-mod cowsay lolcat \
    git curl wget
```

---

## 📋 Post-Install Checklist

After installing packages:

1. **Set Zsh as default shell** (optional but slutty):
   ```bash
   chsh -s $(which zsh)
   ```

2. **Install Oh-My-Zsh** (for the full whorish prompt):
   ```bash
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```

3. **Set up Tails Slut Desktop**:
   ```bash
   cd ~/TailsSlutDesktop
   ./install.sh
   ```

4. **Choose your session at login:**
   - Select **i3** for maximum degeneracy
   - Select **GNOME** for standard experience

---

## 🔒 Tails-Specific Notes

### Persistence Setup

To save your slutty desktop settings across Tails sessions:

1. **Enable persistence** in Tails:
   - Applications → Tails → Configure persistent volume
   - Enable: Dotfiles, APT Packages, APT Lists

2. **Persist your configs**:
   ```bash
   # Add to your persistence:
   ~/.config/i3/
   ~/.config/picom/
   ~/.config/kitty/
   ~/.config/gtk-3.0/
   ~/.zshrc
   ~/.bashrc
   ~/TailsSlutDesktop/
   ```

### Tor Browser Tips

- Always use Tor Browser for adult sites on Tails
- Enable HTTPS-Only Mode
- Use uBlock Origin (pre-installed)
- Clear cookies after each session

---

## 🆘 Troubleshooting

### Picom/Transparency not working?
```bash
# Check if picom is running
pgrep picom

# Start picom manually
picom --config ~/.config/picom/picom-degenerate.conf -b

# Check for errors
picom --config ~/.config/picom/picom-degenerate.conf --verbose
```

### i3 not starting?
```bash
# Check i3 is installed
which i3

# Check X session
ls /usr/share/xsessions/

# Try starting from TTY
startx /usr/bin/i3
```

### Video player not working?
```bash
# Check video codecs
ffmpeg -codecs | grep -i "hevc\|h264\|vp9"

# Install additional codecs if needed
sudo apt-get install ubuntu-restricted-extras
```

---

## 💋 Stay Filthy!

All packages tested on Tails 6.0+

For issues, check the GitHub repo or contact your slutty AI guide 💦