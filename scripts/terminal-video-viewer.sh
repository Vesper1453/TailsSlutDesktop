#!/bin/bash

# 🍆💦 TERMINAL VIDEO VIEWER - Watch porn in the terminal! 💋🔥
# Uses ASCII art or Sixel graphics to play videos in your slutty terminal

PINK='\033[38;5;205m'
HOT_PINK='\033[38;5;198m'
RED='\033[38;5;196m'
RESET='\033[0m'

show_help() {
    echo -e "${HOT_PINK}🍆💦 Terminal Video Player 💋🔥${RESET}"
    echo ""
    echo "Watch videos directly in your terminal with ASCII or Sixel graphics!"
    echo ""
    echo "Usage: terminal-video-viewer.sh [OPTIONS] <video_file_or_url>"
    echo ""
    echo "Options:"
    echo "  -a, --ascii       Use ASCII art mode (works everywhere)"
    echo "  -s, --sixel       Use Sixel graphics (better quality, needs Sixel support)"
    echo "  -c, --caca        Use libcaca (color ASCII art)"
    echo "  -t, --thumbnail   Show thumbnail only"
    echo "  -h, --help        Show this help"
    echo ""
    echo "Examples:"
    echo "  terminal-video-viewer.sh -a ~/Videos/sexy-video.mp4"
    echo "  terminal-video-viewer.sh -s https://example.com/video.mp4"
    echo "  terminal-video-viewer.sh -c ~/Downloads/filth.mp4"
    echo ""
    echo -e "${PINK}Requirements:${RESET}"
    echo "  - ffmpeg (for frame extraction)"
    echo "  - mpv (recommended player backend)"
    echo "  - chafa (for Sixel/ASCII conversion)"
    echo "  - libcaca (optional, for color ASCII)"
    echo ""
}

# Check dependencies
check_deps() {
    local missing=()
    
    if ! command -v ffmpeg &> /dev/null; then
        missing+=("ffmpeg")
    fi
    
    if ! command -v mpv &> /dev/null; then
        missing+=("mpv")
    fi
    
    if ! command -v chafa &> /dev/null; then
        missing+=("chafa")
    fi
    
    if [ ${#missing[@]} -gt 0 ]; then
        echo -e "${RED}❌ Missing dependencies:${RESET}"
        printf '  - %s\n' "${missing[@]}"
        echo ""
        echo "Install with:"
        echo "  sudo apt-get install ffmpeg mpv chafa"
        exit 1
    fi
}

# Play video with ASCII art
play_ascii() {
    local video="$1"
    echo -e "${HOT_PINK}💦 Playing in ASCII mode... Press 'q' to quit${RESET}"
    mpv --vo=tct "$video" 2>/dev/null || \
    ffmpeg -i "$video" -vf "fps=15,scale=80:-1:flags=lanczos,split[s0][s1];[s0]palettegen=max_colors=16[p];[s1][p]paletteuse" -f rawvideo - 2>/dev/null | \
    chafa --format=symbols --size=80x25 --fps=15 2>/dev/null || \
    echo -e "${RED}ASCII playback failed. Try --caca mode.${RESET}"
}

# Play video with Sixel graphics
play_sixel() {
    local video="$1"
    echo -e "${HOT_PINK}💦 Playing in Sixel mode... Press 'q' to quit${RESET}"
    
    # Check if terminal supports Sixel
    if [ -z "$TERM" ] || [[ ! "$TERM" =~ (xterm|vt340|yaft|mlterm|iTerm) ]]; then
        echo -e "${RED}⚠️ Your terminal may not support Sixel graphics${RESET}"
        echo "Trying anyway... (Use iTerm2, mlterm, or yaft for best results)"
        sleep 2
    fi
    
    mpv --vo=sixel "$video" 2>/dev/null || \
    ffmpeg -i "$video" -vf "fps=24,scale=160:-1:flags=lanczos,split[s0][s1];[s0]palettegen=max_colors=256[p];[s1][p]paletteuse" -f sixel - 2>/dev/null || \
    echo -e "${RED}Sixel playback failed. Try --ascii mode.${RESET}"
}

# Play video with libcaca (color ASCII)
play_caca() {
    local video="$1"
    echo -e "${HOT_PINK}💦 Playing in libcaca mode... Press 'q' to quit${RESET}"
    
    if ! command -v cacaview &> /dev/null; then
        echo -e "${RED}❌ libcaca not installed${RESET}"
        echo "Install with: sudo apt-get install caca-utils"
        exit 1
    fi
    
    mplayer -vo caca "$video" 2>/dev/null || \
    mpv --vo=caca "$video" 2>/dev/null || \
    echo -e "${RED}libcaca playback failed.${RESET}"
}

# Show thumbnail only
show_thumbnail() {
    local video="$1"
    echo -e "${HOT_PINK}💦 Generating thumbnail...${RESET}"
    
    local temp_img="/tmp/thumb_$$.png"
    ffmpeg -i "$video" -ss 00:00:01 -vframes 1 -q:v 2 "$temp_img" 2>/dev/null
    
    if [ -f "$temp_img" ]; then
        chafa --size=80x45 "$temp_img"
        rm -f "$temp_img"
    else
        echo -e "${RED}❌ Failed to generate thumbnail${RESET}"
    fi
}

# Main
main() {
    local mode="ascii"
    local video=""
    
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            -a|--ascii)
                mode="ascii"
                shift
                ;;
            -s|--sixel)
                mode="sixel"
                shift
                ;;
            -c|--caca)
                mode="caca"
                shift
                ;;
            -t|--thumbnail)
                mode="thumbnail"
                shift
                ;;
            -h|--help)
                show_help
                exit 0
                ;;
            -*)
                echo -e "${RED}❌ Unknown option: $1${RESET}"
                show_help
                exit 1
                ;;
            *)
                video="$1"
                shift
                ;;
        esac
    done
    
    if [ -z "$video" ]; then
        echo -e "${RED}❌ No video file specified${RESET}"
        show_help
        exit 1
    fi
    
    # Check if URL or local file
    if [[ "$video" =~ ^https?:// ]]; then
        echo -e "${HOT_PINK}💦 URL detected - streaming directly...${RESET}"
        # For URLs, use mpv directly
        case $mode in
            ascii)
                mpv --vo=tct "$video" 2>/dev/null || echo -e "${RED}Stream failed${RESET}"
                ;;
            sixel)
                mpv --vo=sixel "$video" 2>/dev/null || echo -e "${RED}Stream failed${RESET}"
                ;;
            caca)
                mpv --vo=caca "$video" 2>/dev/null || echo -e "${RED}Stream failed${RESET}"
                ;;
            *)
                mpv --vo=tct "$video" 2>/dev/null
                ;;
        esac
        exit 0
    fi
    
    # Check local file exists
    if [ ! -f "$video" ]; then
        echo -e "${RED}❌ File not found: $video${RESET}"
        exit 1
    fi
    
    check_deps
    
    # Play based on mode
    case $mode in
        ascii)
            play_ascii "$video"
            ;;
        sixel)
            play_sixel "$video"
            ;;
        caca)
            play_caca "$video"
            ;;
        thumbnail)
            show_thumbnail "$video"
            ;;
        *)
            play_ascii "$video"
            ;;
    esac
}

# Run
main "$@"