#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base2Tone Cave
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "22/20/21"
    print_osc4 1 "93/6c/7a"
    print_osc4 2 "cc/a1/33"
    print_osc4 3 "ff/cc/4d"
    print_osc4 4 "9c/81/8b"
    print_osc4 5 "cc/a1/33"
    print_osc4 6 "d2/79/98"
    print_osc4 7 "9f/99/9b"
    print_osc4 8 "63/5f/60"
    print_osc4 9 "dd/af/3c"
    print_osc4 10 "2f/2d/2e"
    print_osc4 11 "56/52/54"
    print_osc4 12 "70/6b/6d"
    print_osc4 13 "f0/a8/c1"
    print_osc4 14 "c3/96/22"
    print_osc4 15 "ff/eb/f2"

    print_osc_rgb 10 "9f/99/9b"
    print_osc_rgb 11 "22/20/21"
    print_osc_rgb 12 "99/6e/00"
    print_osc_rgb 17 "9f/99/9b"
    print_osc_rgb 19 "22/20/21"
}

do_linux() {
    print_linux 0 "#222021"
    print_linux 1 "#936c7a"
    print_linux 2 "#cca133"
    print_linux 3 "#ffcc4d"
    print_linux 4 "#9c818b"
    print_linux 5 "#cca133"
    print_linux 6 "#d27998"
    print_linux 7 "#9f999b"
    print_linux 8 "#635f60"
    print_linux 9 "#ddaf3c"
    print_linux 10 "#2f2d2e"
    print_linux 11 "#565254"
    print_linux 12 "#706b6d"
    print_linux 13 "#f0a8c1"
    print_linux 14 "#c39622"
    print_linux 15 "#ffebf2"
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
