#!/bin/bash

# 🍆💦 TAILS SLUT DESKTOP - ONE-CLICK INSTALLER 💋🔥
# Run this to set up everything automatically!

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Colors
PINK='\033[38;5;205m'
HOT_PINK='\033[38;5;198m'
RED='\033[38;5;196m'
PURPLE='\033[38;5;93m'
GREEN='\033[38;5;82m'
RESET='\033[0m'

echo -e "${PURPLE}"
cat << 'EOF'
╔════════════════════════════════════════════════════════════════╗
║                                                                ║
║     🍆💦  TAILS SLUT DESKTOP INSTALLER  💋🔥                  ║
║                                                                ║
║     The most depraved Linux desktop experience ever...        ║
║                                                                ║
╚════════════════════════════════════════════════════════════════╝
EOF
echo -e "${RESET}"

# Menu
show_menu() {
    echo -e "${HOT_PINK}Select installation option:${RESET}"
    echo ""
    echo "  1) 🔥 FULL INSTALL (i3 + all packages + panic button + video viewer)"
    echo "  2) 🖥️  i3 Window Manager + all slutty features"
    echo "  3) 🎨 GNOME/GTK themes only"
    echo "  4) 📦 Install packages only"
    echo "  5) 🚨 Install Panic Button only"
    echo "  6) 🎬 Install Terminal Video Viewer only"
    echo "  7) 📋 Show package list"
    echo "  8) ❌ Exit"
    echo ""
    read -p "Enter choice [1-8]: " choice
    
    case $choice in
        1) full_install ;;
        2) install_i3 ;;
        3) install_gnome ;;
        4) install_packages ;;
        5) install_panic_button ;;
        6) install_video_viewer ;;
        7) show_packages ;;
        8) exit 0 ;;
        *) echo -e "${RED}Invalid choice${RESET}"; show_menu ;;
    esac
}

full_install() {
    echo -e "${RED}🔥 FULL SLUTTY INSTALLATION STARTING...${RESET}"
    install_packages
    install_i3
    install_panic_button
    install_video_viewer
    install_gnome
    
    echo ""
    echo -e "${GREEN}"
    cat << 'EOF'
╔════════════════════════════════════════════════════════════════╗
║                                                                ║
║           ✅ FULL INSTALLATION COMPLETE! ✅                    ║
║                                                                ║
║     Your slutty Tails desktop is ready for maximum filth!      ║
║                                                                ║
║     Hotkeys:                                                   ║
║       Alt+F1  = 🔥 Degenerate Mode                             ║
║       Alt+F2  = 💦 Horny Mode                                  ║
║       Alt+F3  = ✨ Normal Mode                                 ║
║       Mod+Shift+Delete = 🚨 PANIC BUTTON                       ║
║                                                                ║
║     Terminal video player: terminal-video-viewer.sh -h        ║
║                                                                ║
╚════════════════════════════════════════════════════════════════╝
EOF
    echo -e "${RESET}"
}

install_packages() {
    echo -e "${HOT_PINK}📦 Installing all slutty packages...${RESET}"
    
    sudo apt-get update
    
    # Core packages
    sudo apt-get install -y \
        i3 i3-wm i3status i3lock dmenu \
        picom nitrogen kitty rofi polybar \
        gnome-terminal gnome-tweaks \
        ffmpeg mpv mplayer vlc \
        chafa caca-utils libcaca-dev \
        zsh bash-completion \
        feh sxiv imv \
        ranger nnn thunar \
        htop btop dunst libnotify-bin \
        conky-all neofetch cmatrix \
        fortune-mod cowsay lolcat \
        git curl wget 2>/dev/null || {
        echo -e "${RED}⚠️  Some packages may have failed to install${RESET}"
    }
    
    echo -e "${GREEN}✅ Packages installed!${RESET}"
}

install_i3() {
    echo -e "${HOT_PINK}🖥️  Setting up i3 Window Manager...${RESET}"
    
    # Create i3 config directory
    mkdir -p ~/.config/i3
    mkdir -p ~/.config/i3/scripts
    mkdir -p ~/.config/picom
    
    # Copy i3 configs
    cp "$SCRIPT_DIR/i3/config-degenerate" ~/.config/i3/config-degenerate
    cp "$SCRIPT_DIR/i3/config-horny" ~/.config/i3/config-horny
    cp "$SCRIPT_DIR/i3/config-normal" ~/.config/i3/config-normal
    
    # Copy switch-mode script
    cp "$SCRIPT_DIR/i3/scripts/switch-mode" ~/.config/i3/scripts/switch-mode
    chmod +x ~/.config/i3/scripts/switch-mode
    
    # Copy picom configs
    cp "$SCRIPT_DIR/picom/picom-degenerate.conf" ~/.config/picom/
    cp "$SCRIPT_DIR/picom/picom-horny.conf" ~/.config/picom/
    
    # Set default to normal
    cp ~/.config/i3/config-normal ~/.config/i3/config
    
    # Create i3 session desktop entry if it doesn't exist
    if [ ! -f /usr/share/xsessions/i3.desktop ]; then
        echo -e "${PINK}Note: Select i3 from the session menu at login${RESET}"
    fi
    
    echo -e "${GREEN}✅ i3 configured!${RESET}"
    echo -e "${PINK}   Run 'startx i3' or select i3 from the login session menu${RESET}"
}

install_gnome() {
    echo -e "${HOT_PINK}🎨 Setting up GNOME/GTK themes...${RESET}"
    
    # Run the original setup script
    "$SCRIPT_DIR/scripts/setup.sh"
    
    echo -e "${GREEN}✅ GNOME themes configured!${RESET}"
}

install_panic_button() {
    echo -e "${RED}🚨 Installing Panic Button...${RESET}"
    
    # Copy panic button to i3 scripts
    mkdir -p ~/.config/i3/scripts
    cp "$SCRIPT_DIR/scripts/panic-button.sh" ~/.config/i3/scripts/panic-button
    chmod +x ~/.config/i3/scripts/panic-button
    
    # Copy to main scripts
    cp "$SCRIPT_DIR/scripts/panic-button.sh" ~/panic-button.sh
    chmod +x ~/panic-button.sh
    
    # Create desktop shortcut
    cat > ~/Desktop/🚨-PANIC-BUTTON.desktop << 'EOF'
[Desktop Entry]
Name=🚨 PANIC BUTTON
Comment=Emergency wipe - hides all evidence instantly
Exec=gnome-terminal -- bash -c "~/.config/i3/scripts/panic-button; read -p 'Press Enter...'"
Type=Application
Terminal=false
Icon=dialog-error
Categories=System;Security;
EOF
    chmod +x ~/Desktop/🚨-PANIC-BUTTON.desktop
    
    echo -e "${GREEN}✅ Panic button installed!${RESET}"
    echo -e "${PINK}   Hotkey: Mod+Shift+Delete (in i3)${RESET}"
    echo -e "${PINK}   Desktop: 🚨-PANIC-BUTTON.desktop${RESET}"
}

install_video_viewer() {
    echo -e "${HOT_PINK}🎬 Installing Terminal Video Viewer...${RESET}"
    
    # Copy video viewer
    cp "$SCRIPT_DIR/scripts/terminal-video-viewer.sh" ~/terminal-video.sh
    chmod +x ~/terminal-video.sh
    
    # Create symlink
    ln -sf ~/terminal-video.sh ~/.local/bin/terminal-video 2>/dev/null || true
    
    # Create desktop shortcut
    cat > ~/Desktop/🎬-Terminal-Video.desktop << 'EOF'
[Desktop Entry]
Name=🎬 Terminal Video Player
Comment=Watch videos in ASCII/Sixel in the terminal
Exec=gnome-terminal -- bash -c "~/terminal-video.sh --help; read -p 'Press Enter...'"
Type=Application
Terminal=false
Icon=video-x-generic
Categories=AudioVideo;Player;
EOF
    chmod +x ~/Desktop/🎬-Terminal-Video.desktop
    
    echo -e "${GREEN}✅ Terminal video viewer installed!${RESET}"
    echo -e "${PINK}   Usage: ~/terminal-video.sh -a video.mp4${RESET}"
    echo -e "${PINK}   Modes: -a (ASCII), -s (Sixel), -c (libcaca)${RESET}"
}

show_packages() {
    cat "$SCRIPT_DIR/PACKAGES.md"
}

# Check if running with arguments
if [ -n "$1" ]; then
    case "$1" in
        --full) full_install ;;
        --i3) install_i3 ;;
        --gnome) install_gnome ;;
        --packages) install_packages ;;
        --panic) install_panic_button ;;
        --video) install_video_viewer ;;
        *) show_menu ;;
    esac
else
    show_menu
fi