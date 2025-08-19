#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base2Tone Heath
# Author:   
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
    print_osc4 0 "22/20/22"
    print_osc4 1 "8f/6c/93"
    print_osc4 2 "cc/8c/33"
    print_osc4 3 "ff/d5/99"
    print_osc4 4 "9a/81/9c"
    print_osc4 5 "cc/8c/33"
    print_osc4 6 "cb/79/d2"
    print_osc4 7 "9e/99/9f"
    print_osc4 8 "63/5f/63"
    print_osc4 9 "d9/b9/8c"
    print_osc4 10 "2f/2d/2f"
    print_osc4 11 "57/51/58"
    print_osc4 12 "6f/6b/70"
    print_osc4 13 "ea/a8/f0"
    print_osc4 14 "c3/80/22"
    print_osc4 15 "fd/eb/ff"

    print_osc_rgb 10 "9e/99/9f"
    print_osc_rgb 11 "22/20/22"
    print_osc_rgb 12 "99/59/00"
    print_osc_rgb 17 "9e/99/9f"
    print_osc_rgb 19 "22/20/22"
}

do_linux() {
    print_linux 0 "#222022"
    print_linux 1 "#8f6c93"
    print_linux 2 "#cc8c33"
    print_linux 3 "#ffd599"
    print_linux 4 "#9a819c"
    print_linux 5 "#cc8c33"
    print_linux 6 "#cb79d2"
    print_linux 7 "#9e999f"
    print_linux 8 "#635f63"
    print_linux 9 "#d9b98c"
    print_linux 10 "#2f2d2f"
    print_linux 11 "#575158"
    print_linux 12 "#6f6b70"
    print_linux 13 "#eaa8f0"
    print_linux 14 "#c38022"
    print_linux 15 "#fdebff"
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
