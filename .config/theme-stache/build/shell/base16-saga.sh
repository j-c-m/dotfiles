#!/usr/bin/env bash

# Source:   base16
# Theme:    SAGA
# Author:   https://github.com/SAGAtheme/SAGA
# Variant:  dark

# Exit if not on a tty

if [[ ! -t 0 ]]; then
    exit 0
fi

color00="#05080a"    # Black (Host)
color01="#ffd4e9"    # Red (Syntax string)
color02="#f7ddff"    # Green (Command)
color03="#fbebc8"    # Yellow (Command second)
color04="#c9fff7"    # Blue (Path)
color05="#dcc3f9"    # Magenta (Syntax var)
color06="#c5edc1"    # Cyan (Prompt)
color07="#dce2f7"    # White
color08="#141f27"    # Bright Black
color09="#ffd4e9"    # Bright Red (Command error)
color10="#f7ddff"   # Bright Green (Exec)
color11="#fbebc8"   # Bright Yellow
color12="#c9fff7"   # Bright Blue (Folder)
color13="#dcc3f9"   # Bright Magenta
color14="#c5edc1"   # Bright Cyan
color15="#ccd3fe"   # Bright White

foreground="#dce2f7"         # Foreground (Text)
background="#05080a"         # Background
cursor="#dce2f7"                 # Cursor
selection="#f8eae7"           # Selection Background
selection_text="#071518" # Selection Text

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
