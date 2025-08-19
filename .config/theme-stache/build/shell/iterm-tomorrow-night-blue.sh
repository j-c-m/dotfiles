#!/usr/bin/env bash

# Source:   iterm
# Theme:    Tomorrow Night Blue
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
    print_osc4 1 "ff/9d/a3"
    print_osc4 2 "d1/f1/a9"
    print_osc4 3 "ff/ee/ad"
    print_osc4 4 "bb/da/ff"
    print_osc4 5 "eb/bb/ff"
    print_osc4 6 "99/ff/ff"
    print_osc4 7 "ff/fe/fe"
    print_osc4 8 "00/00/00"
    print_osc4 9 "ff/9c/a3"
    print_osc4 10 "d0/f0/a8"
    print_osc4 11 "ff/ed/ac"
    print_osc4 12 "ba/da/ff"
    print_osc4 13 "eb/ba/ff"
    print_osc4 14 "99/ff/ff"
    print_osc4 15 "ff/fe/fe"

    print_osc_rgb 10 "ff/fe/fe"
    print_osc_rgb 11 "00/24/51"
    print_osc_rgb 12 "ff/fe/fe"
    print_osc_rgb 17 "00/3f/8e"
    print_osc_rgb 19 "ff/fe/fe"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#ff9da3"
    print_linux 2 "#d1f1a9"
    print_linux 3 "#ffeead"
    print_linux 4 "#bbdaff"
    print_linux 5 "#ebbbff"
    print_linux 6 "#99ffff"
    print_linux 7 "#fffefe"
    print_linux 8 "#000000"
    print_linux 9 "#ff9ca3"
    print_linux 10 "#d0f0a8"
    print_linux 11 "#ffedac"
    print_linux 12 "#badaff"
    print_linux 13 "#ebbaff"
    print_linux 14 "#99ffff"
    print_linux 15 "#fffefe"
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
