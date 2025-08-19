#!/usr/bin/env bash

# Source:   iterm
# Theme:    Unikitty
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
    print_osc4 0 "0c/0c/0c"
    print_osc4 1 "a8/0f/20"
    print_osc4 2 "ba/fc/8b"
    print_osc4 3 "ee/df/4b"
    print_osc4 4 "14/5f/cd"
    print_osc4 5 "ff/36/a2"
    print_osc4 6 "6b/d0/bc"
    print_osc4 7 "e1/d6/e0"
    print_osc4 8 "42/42/42"
    print_osc4 9 "d8/13/29"
    print_osc4 10 "d2/ff/af"
    print_osc4 11 "ff/ee/50"
    print_osc4 12 "00/74/ea"
    print_osc4 13 "fd/d5/e5"
    print_osc4 14 "79/eb/d5"
    print_osc4 15 "ff/f2/fd"

    print_osc_rgb 10 "0b/0b/0b"
    print_osc_rgb 11 "ff/8c/d9"
    print_osc_rgb 12 "ba/fc/8b"
    print_osc_rgb 17 "3e/a9/fe"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#0c0c0c"
    print_linux 1 "#a80f20"
    print_linux 2 "#bafc8b"
    print_linux 3 "#eedf4b"
    print_linux 4 "#145fcd"
    print_linux 5 "#ff36a2"
    print_linux 6 "#6bd0bc"
    print_linux 7 "#0b0b0b"
    print_linux 8 "#424242"
    print_linux 9 "#d81329"
    print_linux 10 "#d2ffaf"
    print_linux 11 "#ffee50"
    print_linux 12 "#0074ea"
    print_linux 13 "#fdd5e5"
    print_linux 14 "#79ebd5"
    print_linux 15 "#fff2fd"
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
