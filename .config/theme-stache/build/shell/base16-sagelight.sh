#!/usr/bin/env bash

# Source:   base16
# Theme:    Sagelight
# Author:   Carter Veldhuizen
# Variant:  light

# Exit if not on a tty

if [[ ! -t 0 ]]; then
    exit 0
fi

color00="#f8f8f8"    # Black (Host)
color01="#fa8480"    # Red (Syntax string)
color02="#a0d2c8"    # Green (Command)
color03="#ffdc61"    # Yellow (Command second)
color04="#a0a7d2"    # Blue (Path)
color05="#c8a0d2"    # Magenta (Syntax var)
color06="#a2d6f5"    # Cyan (Prompt)
color07="#383838"    # White
color08="#b8b8b8"    # Bright Black
color09="#fa8480"    # Bright Red (Command error)
color10="#a0d2c8"   # Bright Green (Exec)
color11="#ffdc61"   # Bright Yellow
color12="#a0a7d2"   # Bright Blue (Folder)
color13="#c8a0d2"   # Bright Magenta
color14="#a2d6f5"   # Bright Cyan
color15="#181818"   # Bright White

foreground="#383838"         # Foreground (Text)
background="#f8f8f8"         # Background
cursor="#383838"                 # Cursor
selection="#282828"           # Selection Background
selection_text="#d7d7d7" # Selection Text

print_osc4() {
    local color="$1"
    local hex="$2"

    printf "\033]4;%d;rgb:%s\033\\" "$color" "${hex:1:2}/${hex:3:2}/${hex:5:2}"
}

print_osc_rgb() {
    local osc="$1"
    local hex="$2"

    printf "\033]%d;rgb:%s\033\\" "$osc" "${hex:1:2}/${hex:3:2}/${hex:5:2}"
}

print_linux() {
    local color="$1"
    local hex="$2"

    printf "\033]P%x%s" "$color" ${hex:1:6}
}

do_osc() {
    print_osc4 0 "$color00"
    print_osc4 1 "$color01"
    print_osc4 2 "$color02"
    print_osc4 3 "$color03"
    print_osc4 4 "$color04"
    print_osc4 5 "$color05"
    print_osc4 6 "$color06"
    print_osc4 7 "$color07"
    print_osc4 8 "$color08"
    print_osc4 9 "$color09"
    print_osc4 10 "$color10"
    print_osc4 11 "$color11"
    print_osc4 12 "$color12"
    print_osc4 13 "$color13"
    print_osc4 14 "$color14"
    print_osc4 15 "$color15"

    print_osc_rgb 10 "$foreground"
    print_osc_rgb 11 "$background"
    print_osc_rgb 12 "$cursor"
    print_osc_rgb 17 "$selection"
    print_osc_rgb 19 "$selection_text"
}

do_linux() {
    print_linux 0 "$color00"
    print_linux 1 "$color01"
    print_linux 2 "$color02"
    print_linux 3 "$color03"
    print_linux 4 "$color04"
    print_linux 5 "$color05"
    print_linux 6 "$color06"
    print_linux 7 "$color07"
    print_linux 8 "$color08"
    print_linux 9 "$color09"
    print_linux 10 "$color10"
    print_linux 11 "$color11"
    print_linux 12 "$color12"
    print_linux 13 "$color13"
    print_linux 14 "$color14"
    print_linux 15 "$color15"
}

case "$TERM" in
    linux*)
        do_linux
        ;;
    *)
        do_osc
        ;;
esac

unset -f print_osc4
unset -f print_osc_rgb
unset -f print_linux
unset -f do_osc
unset -f do_linux

unset color00
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color10
unset color11
unset color12
unset color13
unset color14
unset color15
unset foreground
unset background
unset cursor
unset selection
unset selection_text
