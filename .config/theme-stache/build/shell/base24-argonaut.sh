#!/usr/bin/env bash

# Source:   base24
# Theme:    Argonaut
# Author:   FredHappyface (https://github.com/fredHappyface)
# Variant:  dark

# Exit if not on a tty

if [[ ! -t 0 ]]; then
    exit 0
fi

print_osc4() {
    local color="$1"
    local hexterm="$2"

    printf "\033]4;%d;rgb:%s\033\\" "$color" "$hexterm"
}

print_osc_rgb() {
    local osc="$1"
    local hexterm="$2"

    printf "\033]%d;rgb:%s\033\\" "$osc" "$hexterm"
}

print_linux() {
    local color="$1"
    local hex="$2"

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "0d/0f/18"
    print_osc4 1 "ff/00/0f"
    print_osc4 2 "8c/e0/0a"
    print_osc4 3 "00/92/ff"
    print_osc4 4 "00/8d/f8"
    print_osc4 5 "6c/43/a5"
    print_osc4 6 "00/d7/eb"
    print_osc4 7 "d0/d0/d0"
    print_osc4 8 "72/72/72"
    print_osc4 9 "ff/27/3f"
    print_osc4 10 "ab/e0/5a"
    print_osc4 11 "ff/d1/41"
    print_osc4 12 "00/92/ff"
    print_osc4 13 "9a/5f/eb"
    print_osc4 14 "67/ff/ef"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "d0/d0/d0"
    print_osc_rgb 11 "0d/0f/18"
    print_osc_rgb 12 "d0/d0/d0"
    print_osc_rgb 17 "ff/ff/ff"
    print_osc_rgb 19 "22/22/22"
}

do_linux() {
    print_linux 0 "#0d0f18"
    print_linux 1 "#ff000f"
    print_linux 2 "#8ce00a"
    print_linux 3 "#0092ff"
    print_linux 4 "#008df8"
    print_linux 5 "#6c43a5"
    print_linux 6 "#00d7eb"
    print_linux 7 "#d0d0d0"
    print_linux 8 "#727272"
    print_linux 9 "#ff273f"
    print_linux 10 "#abe05a"
    print_linux 11 "#ffd141"
    print_linux 12 "#0092ff"
    print_linux 13 "#9a5feb"
    print_linux 14 "#67ffef"
    print_linux 15 "#ffffff"
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
