#!/usr/bin/env bash

# Source:   iterm
# Theme:    VibrantInk
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "87/87/87"
    print_osc4 1 "ff/66/00"
    print_osc4 2 "cc/ff/04"
    print_osc4 3 "ff/cc/00"
    print_osc4 4 "44/b3/cc"
    print_osc4 5 "99/33/cc"
    print_osc4 6 "44/b3/cc"
    print_osc4 7 "f5/f5/f5"
    print_osc4 8 "55/55/55"
    print_osc4 9 "ff/00/00"
    print_osc4 10 "00/ff/00"
    print_osc4 11 "ff/ff/00"
    print_osc4 12 "00/00/ff"
    print_osc4 13 "ff/00/ff"
    print_osc4 14 "00/ff/ff"
    print_osc4 15 "e5/e5/e5"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "b4/d5/ff"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#878787"
    print_linux 1 "#ff6600"
    print_linux 2 "#ccff04"
    print_linux 3 "#ffcc00"
    print_linux 4 "#44b3cc"
    print_linux 5 "#9933cc"
    print_linux 6 "#44b3cc"
    print_linux 7 "#ffffff"
    print_linux 8 "#555555"
    print_linux 9 "#ff0000"
    print_linux 10 "#00ff00"
    print_linux 11 "#ffff00"
    print_linux 12 "#0000ff"
    print_linux 13 "#ff00ff"
    print_linux 14 "#00ffff"
    print_linux 15 "#e5e5e5"
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
