#!/usr/bin/env bash

# Source:   iterm
# Theme:    iTerm2 Tango Dark
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "d7/1e/00"
    print_osc4 2 "5d/a6/02"
    print_osc4 3 "cf/ad/00"
    print_osc4 4 "41/7a/b3"
    print_osc4 5 "88/65/8d"
    print_osc4 6 "00/a7/aa"
    print_osc4 7 "db/de/d8"
    print_osc4 8 "67/69/65"
    print_osc4 9 "f4/41/35"
    print_osc4 10 "98/e3/42"
    print_osc4 11 "fc/ea/60"
    print_osc4 12 "83/af/d8"
    print_osc4 13 "bc/93/b6"
    print_osc4 14 "37/e5/e7"
    print_osc4 15 "f1/f1/ef"

    print_osc_rgb 10 "ff/fe/ff"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "ff/fe/ff"
    print_osc_rgb 17 "c1/dd/ff"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#d71e00"
    print_linux 2 "#5da602"
    print_linux 3 "#cfad00"
    print_linux 4 "#417ab3"
    print_linux 5 "#88658d"
    print_linux 6 "#00a7aa"
    print_linux 7 "#fffeff"
    print_linux 8 "#676965"
    print_linux 9 "#f44135"
    print_linux 10 "#98e342"
    print_linux 11 "#fcea60"
    print_linux 12 "#83afd8"
    print_linux 13 "#bc93b6"
    print_linux 14 "#37e5e7"
    print_linux 15 "#f1f1ef"
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
