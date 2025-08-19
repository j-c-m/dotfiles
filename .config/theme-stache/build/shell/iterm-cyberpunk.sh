#!/usr/bin/env bash

# Source:   iterm
# Theme:    cyberpunk
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "ff/70/92"
    print_osc4 2 "00/fa/ac"
    print_osc4 3 "fe/f9/6a"
    print_osc4 4 "00/be/ff"
    print_osc4 5 "de/95/ff"
    print_osc4 6 "85/cb/fd"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "00/00/00"
    print_osc4 9 "ff/89/a3"
    print_osc4 10 "20/f6/bb"
    print_osc4 11 "ff/f6/87"
    print_osc4 12 "1b/cb/fc"
    print_osc4 13 "e5/ad/fd"
    print_osc4 14 "99/d6/fc"
    print_osc4 15 "fe/ff/ff"

    print_osc_rgb 10 "e5/e5/e5"
    print_osc_rgb 11 "32/29/57"
    print_osc_rgb 12 "20/f6/bb"
    print_osc_rgb 17 "c1/dd/ff"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#ff7092"
    print_linux 2 "#00faac"
    print_linux 3 "#fef96a"
    print_linux 4 "#00beff"
    print_linux 5 "#de95ff"
    print_linux 6 "#85cbfd"
    print_linux 7 "#e5e5e5"
    print_linux 8 "#000000"
    print_linux 9 "#ff89a3"
    print_linux 10 "#20f6bb"
    print_linux 11 "#fff687"
    print_linux 12 "#1bcbfc"
    print_linux 13 "#e5adfd"
    print_linux 14 "#99d6fc"
    print_linux 15 "#feffff"
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
