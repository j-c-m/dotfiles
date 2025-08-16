#!/usr/bin/env bash

# Source:   base24
# Theme:    Deep Oceanic Next
# Author:   spearkkk (https://github.com/spearkkk)
# Variant:  dark

# Exit if not on a tty

if [[ ! -t 0 ]]; then
    exit 0
fi

color00="#001c1f"    # Black (Host)
color01="#d3464d"    # Red (Syntax string)
color02="#63b784"    # Green (Command)
color03="#f3b863"    # Yellow (Command second)
color04="#568ccf"    # Blue (Path)
color05="#8b66d6"    # Magenta (Syntax var)
color06="#4fb7ae"    # Cyan (Prompt)
color07="#d4e1e8"    # White
color08="#004852"    # Bright Black
color09="#ff6670"    # Bright Red (Command error)
color10="#72e1a6"   # Bright Green (Exec)
color11="#ffe08a"   # Bright Yellow
color12="#5caeff"   # Bright Blue (Folder)
color13="#b788ff"   # Bright Magenta
color14="#4de3e3"   # Bright Cyan
color15="#f2f7f9"   # Bright White

foreground="#d4e1e8"         # Foreground (Text)
background="#001c1f"         # Background
cursor="#d4e1e8"                 # Cursor
selection="#e0e9ef"           # Selection Background
selection_text="#002931" # Selection Text

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
    print_linux 7 "$foreground"
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
