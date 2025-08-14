#!/usr/bin/env bash

# Source:   base16
# Theme:    Unikitty Light
# Author:   Josh W Lewis (@joshwlewis)
# Variant:  light

# Exit if not on a tty

if [[ ! -t 0 ]]; then
    exit 0
fi

color00="#ffffff"    # Black (Host)
color01="#d8137f"    # Red (Syntax string)
color02="#17ad98"    # Green (Command)
color03="#dc8a0e"    # Yellow (Command second)
color04="#775dff"    # Blue (Path)
color05="#aa17e6"    # Magenta (Syntax var)
color06="#149bda"    # Cyan (Prompt)
color07="#6c696e"    # White
color08="#a7a5a8"    # Bright Black
color09="#d8137f"    # Bright Red (Command error)
color10="#17ad98"   # Bright Green (Exec)
color11="#dc8a0e"   # Bright Yellow
color12="#775dff"   # Bright Blue (Folder)
color13="#aa17e6"   # Bright Magenta
color14="#149bda"   # Bright Cyan
color15="#322d34"   # Bright White

foreground="#6c696e"         # Foreground (Text)
background="#ffffff"         # Background
cursor="#6c696e"                 # Cursor
selection="#4f4b51"           # Selection Background
selection_text="#b0b4ae" # Selection Text

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
