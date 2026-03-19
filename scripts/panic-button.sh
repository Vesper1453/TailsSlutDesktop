#!/bin/bash

# 🚨 PANIC BUTTON - EMERGENCY WIPE SCRIPT 🚨
# For when you need to instantly hide all evidence of your filthy activities

set -e

PINK='\033[38;5;205m'
RED='\033[38;5;196m'
WHITE='\033[38;5;255m'
RESET='\033[0m'

panic_wipe() {
    echo -e "${RED}"
    cat << 'EOF'
╔════════════════════════════════════════════════════════════╗
║                                                            ║
║                    🚨 PANIC MODE ACTIVATED 🚨              ║
║                                                            ║
║              Instantly hiding all evidence...              ║
║                                                            ║
╚════════════════════════════════════════════════════════════╝
EOF
    echo -e "${RESET}"
    
    # Kill all adult site browser tabs/windows
    echo -e "${PINK}💋 Closing all browser instances...${RESET}"
    pkill -f "firefox" 2>/dev/null || true
    pkill -f "tor-browser" 2>/dev/null || true
    pkill -f "chromium" 2>/dev/null || true
    pkill -f "chrome" 2>/dev/null || true
    
    # Clear browser history/cache
    echo -e "${PINK}💋 Clearing browser data...${RESET}"
    rm -rf ~/.cache/mozilla/firefox/*/cache2/* 2>/dev/null || true
    rm -rf ~/.cache/google-chrome/Default/Cache/* 2>/dev/null || true
    rm -rf ~/.var/app/com.google.Chrome/cache/* 2>/dev/null || true
    
    # Remove desktop shortcuts temporarily
    echo -e "${PINK}💋 Hiding adult site shortcuts...${RESET}"
    mkdir -p ~/.panic-hidden
    mv ~/Desktop/🔥-ADULT-SITES 2>/dev/null ~/.panic-hidden/ || true
    mv ~/Desktop/🔥-DEGENERATE-MODE.desktop 2>/dev/null ~/.panic-hidden/ || true
    mv ~/Desktop/💦-HORNY-MODE.desktop 2>/dev/null ~/.panic-hidden/ || true
    
    # Switch to normal mode
    echo -e "${PINK}💋 Switching to clean normal mode...${RESET}"
    if [ -f ~/TailsSlutDesktop/scripts/mode-switcher.sh ]; then
        ~/TailsSlutDesktop/scripts/mode-switcher.sh normal 2>/dev/null || true
    fi
    
    # Clear recent files
    echo -e "${PINK}💋 Clearing recent files...${RESET}"
    rm -rf ~/.local/share/recently-used.xbel 2>/dev/null || true
    rm -rf ~/.config/gtk-3.0/bookmarks 2>/dev/null || true
    
    # Clear terminal history
    echo -e "${PINK}💋 Clearing terminal history...${RESET}"
    history -c 2>/dev/null || true
    rm -f ~/.bash_history 2>/dev/null || true
    rm -f ~/.zsh_history 2>/dev/null || true
    
    # Kill any adult media players
    echo -e "${PINK}💋 Stopping media players...${RESET}"
    pkill -f "mpv" 2>/dev/null || true
    pkill -f "vlc" 2>/dev/null || true
    pkill -f "ffplay" 2>/dev/null || true
    
    # Clear any temp adult content
    echo -e "${PINK}💋 Clearing temporary files...${RESET}"
    rm -rf /tmp/*porn* 2>/dev/null || true
    rm -rf /tmp/*xxx* 2>/dev/null || true
    rm -rf /tmp/*adult* 2>/dev/null || true
    rm -rf ~/.cache/thumbnails/* 2>/dev/null || true
    
    echo ""
    echo -e "${WHITE}"
    cat << 'EOF'
╔════════════════════════════════════════════════════════════╗
║                                                            ║
║              ✅ PANIC WIPE COMPLETE ✅                      ║
║                                                            ║
║   All evidence hidden! Desktop is now clean and safe.      ║
║                                                            ║
║   To restore shortcuts later, run:                         ║
║   ~/.panic-hidden/restore.sh                               ║
║                                                            ║
╚════════════════════════════════════════════════════════════╝
EOF
    echo -e "${RESET}"
    
    # Create restore script
    cat > ~/.panic-hidden/restore.sh << 'RESTOREEOF'
#!/bin/bash
echo "Restoring hidden shortcuts..."
mv ~/.panic-hidden/🔥-ADULT-SITES ~/Desktop/ 2>/dev/null || true
mv ~/.panic-hidden/🔥-DEGENERATE-MODE.desktop ~/Desktop/ 2>/dev/null || true
mv ~/.panic-hidden/💦-HORNY-MODE.desktop ~/Desktop/ 2>/dev/null || true
echo "Done! Your slutty desktop is back 💋"
RESTOREEOF
    chmod +x ~/.panic-hidden/restore.sh 2>/dev/null || true
}

# Create hotkey trigger file for i3
if [ "$1" == "--install-hotkey" ]; then
    mkdir -p ~/.config/i3/scripts
    cp "$0" ~/.config/i3/scripts/panic-button
    chmod +x ~/.config/i3/scripts/panic-button
    echo "Panic button installed to ~/.config/i3/scripts/panic-button"
    echo "Add this to your i3 config: bindsym $mod+Shift+Delete exec ~/.config/i3/scripts/panic-button"
    exit 0
fi

# Run panic wipe
panic_wipe