#!/usr/bin/env bash

# Source:   base16
# Theme:    Katy
# Author:   George Essig (https://github.com/gessig)
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
    print_osc4 0 "29/2d/3e"
    print_osc4 1 "6e/98/e1"
    print_osc4 2 "78/c0/6e"
    print_osc4 3 "e0/a5/57"
    print_osc4 4 "82/aa/ff"
    print_osc4 5 "c7/92/ea"
    print_osc4 6 "83/b7/e5"
    print_osc4 7 "95/9d/cb"
    print_osc4 8 "67/6e/95"
    print_osc4 9 "6e/98/e1"
    print_osc4 10 "78/c0/6e"
    print_osc4 11 "e0/a5/57"
    print_osc4 12 "82/aa/ff"
    print_osc4 13 "c7/92/ea"
    print_osc4 14 "83/b7/e5"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "95/9d/cb"
    print_osc_rgb 11 "29/2d/3e"
    print_osc_rgb 12 "95/9d/cb"
    print_osc_rgb 17 "95/9d/cb"
    print_osc_rgb 19 "44/42/67"
}

do_linux() {
    print_linux 0 "#292d3e"
    print_linux 1 "#6e98e1"
    print_linux 2 "#78c06e"
    print_linux 3 "#e0a557"
    print_linux 4 "#82aaff"
    print_linux 5 "#c792ea"
    print_linux 6 "#83b7e5"
    print_linux 7 "#959dcb"
    print_linux 8 "#676e95"
    print_linux 9 "#6e98e1"
    print_linux 10 "#78c06e"
    print_linux 11 "#e0a557"
    print_linux 12 "#82aaff"
    print_linux 13 "#c792ea"
    print_linux 14 "#83b7e5"
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
