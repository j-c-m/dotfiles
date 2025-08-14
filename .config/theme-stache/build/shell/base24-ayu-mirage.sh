#!/usr/bin/env bash

# Source:   base24
# Theme:    Ayu Mirage
# Author:   Tinted Theming (https://github.com/tinted-theming), Ayu Theme (https://github.com/ayu-theme)
# Variant:  dark

# Exit if not on a tty

if [[ ! -t 0 ]]; then
    exit 0
fi

color00="#1f2430"    # Black (Host)
color01="#f28779"    # Red (Syntax string)
color02="#d5ff80"    # Green (Command)
color03="#ffd173"    # Yellow (Command second)
color04="#73d0ff"    # Blue (Path)
color05="#d4bfff"    # Magenta (Syntax var)
color06="#95e6cb"    # Cyan (Prompt)
color07="#cccac2"    # White
color08="#4a5059"    # Bright Black
color09="#ff6666"    # Bright Red (Command error)
color10="#87d963"   # Bright Green (Exec)
color11="#ffcc66"   # Bright Yellow
color12="#80b0ff"   # Bright Blue (Folder)
color13="#b692ff"   # Bright Magenta
color14="#5ccfe6"   # Bright Cyan
color15="#f3f4f5"   # Bright White

foreground="#cccac2"         # Foreground (Text)
background="#1f2430"         # Background
cursor="#cccac2"                 # Cursor
selection="#d9d7ce"           # Selection Background
selection_text="#262831" # Selection Text

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
