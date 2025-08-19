#!/usr/bin/env bash

# Source:   iterm
# Theme:    iTerm2 Default
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
    print_osc4 1 "c9/1b/00"
    print_osc4 2 "00/c2/00"
    print_osc4 3 "c7/c4/00"
    print_osc4 4 "22/24/c4"
    print_osc4 5 "c9/30/c7"
    print_osc4 6 "00/c5/c7"
    print_osc4 7 "ff/fe/fe"
    print_osc4 8 "67/67/67"
    print_osc4 9 "ff/6d/67"
    print_osc4 10 "5f/f9/67"
    print_osc4 11 "fe/fb/67"
    print_osc4 12 "68/71/ff"
    print_osc4 13 "ff/76/ff"
    print_osc4 14 "5f/fd/ff"
    print_osc4 15 "ff/fe/ff"

    print_osc_rgb 10 "ff/fe/fe"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "e5/e5/e5"
    print_osc_rgb 17 "c1/dd/ff"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#c91b00"
    print_linux 2 "#00c200"
    print_linux 3 "#c7c400"
    print_linux 4 "#2224c4"
    print_linux 5 "#c930c7"
    print_linux 6 "#00c5c7"
    print_linux 7 "#fffefe"
    print_linux 8 "#676767"
    print_linux 9 "#ff6d67"
    print_linux 10 "#5ff967"
    print_linux 11 "#fefb67"
    print_linux 12 "#6871ff"
    print_linux 13 "#ff76ff"
    print_linux 14 "#5ffdff"
    print_linux 15 "#fffeff"
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
