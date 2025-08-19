#!/usr/bin/env bash

# Source:   base16
# Theme:    Framer
# Author:   Framer (Maintained by Jesse Hoyos)
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
    print_osc4 0 "18/18/18"
    print_osc4 1 "fd/88/6b"
    print_osc4 2 "32/cc/dc"
    print_osc4 3 "fe/cb/6e"
    print_osc4 4 "20/bc/fc"
    print_osc4 5 "ba/8c/fc"
    print_osc4 6 "ac/dd/fd"
    print_osc4 7 "d0/d0/d0"
    print_osc4 8 "74/74/74"
    print_osc4 9 "fd/88/6b"
    print_osc4 10 "32/cc/dc"
    print_osc4 11 "fe/cb/6e"
    print_osc4 12 "20/bc/fc"
    print_osc4 13 "ba/8c/fc"
    print_osc4 14 "ac/dd/fd"
    print_osc4 15 "ee/ee/ee"

    print_osc_rgb 10 "d0/d0/d0"
    print_osc_rgb 11 "18/18/18"
    print_osc_rgb 12 "d0/d0/d0"
    print_osc_rgb 17 "e8/e8/e8"
    print_osc_rgb 19 "15/15/15"
}

do_linux() {
    print_linux 0 "#181818"
    print_linux 1 "#fd886b"
    print_linux 2 "#32ccdc"
    print_linux 3 "#fecb6e"
    print_linux 4 "#20bcfc"
    print_linux 5 "#ba8cfc"
    print_linux 6 "#acddfd"
    print_linux 7 "#d0d0d0"
    print_linux 8 "#747474"
    print_linux 9 "#fd886b"
    print_linux 10 "#32ccdc"
    print_linux 11 "#fecb6e"
    print_linux 12 "#20bcfc"
    print_linux 13 "#ba8cfc"
    print_linux 14 "#acddfd"
    print_linux 15 "#eeeeee"
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
