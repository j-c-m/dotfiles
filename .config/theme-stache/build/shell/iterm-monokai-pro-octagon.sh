#!/usr/bin/env bash

# Source:   iterm
# Theme:    Monokai Pro Octagon
# Author:   unknown
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
    print_osc4 0 "28/2a/3a"
    print_osc4 1 "ff/65/79"
    print_osc4 2 "b9/d6/61"
    print_osc4 3 "ff/d6/6d"
    print_osc4 4 "ff/9b/5e"
    print_osc4 5 "c3/99/c8"
    print_osc4 6 "9c/d0/ba"
    print_osc4 7 "e9/f1/f0"
    print_osc4 8 "69/6d/77"
    print_osc4 9 "ff/65/79"
    print_osc4 10 "b9/d6/61"
    print_osc4 11 "ff/d6/6d"
    print_osc4 12 "ff/9b/5e"
    print_osc4 13 "c3/99/c8"
    print_osc4 14 "9c/d0/ba"
    print_osc4 15 "e9/f1/f0"

    print_osc_rgb 10 "e9/f1/f0"
    print_osc_rgb 11 "28/2a/3a"
    print_osc_rgb 12 "b2/b9/bd"
    print_osc_rgb 17 "53/57/62"
    print_osc_rgb 19 "e9/f1/f0"
}

do_linux() {
    print_linux 0 "#282a3a"
    print_linux 1 "#ff6579"
    print_linux 2 "#b9d661"
    print_linux 3 "#ffd66d"
    print_linux 4 "#ff9b5e"
    print_linux 5 "#c399c8"
    print_linux 6 "#9cd0ba"
    print_linux 7 "#e9f1f0"
    print_linux 8 "#696d77"
    print_linux 9 "#ff6579"
    print_linux 10 "#b9d661"
    print_linux 11 "#ffd66d"
    print_linux 12 "#ff9b5e"
    print_linux 13 "#c399c8"
    print_linux 14 "#9cd0ba"
    print_linux 15 "#e9f1f0"
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
