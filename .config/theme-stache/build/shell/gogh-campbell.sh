#!/usr/bin/env bash

# Source:   gogh
# Theme:    Campbell
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
    print_osc4 0 "0c/0c/0c"
    print_osc4 1 "c5/0f/1f"
    print_osc4 2 "13/a1/0e"
    print_osc4 3 "c1/9c/00"
    print_osc4 4 "00/37/da"
    print_osc4 5 "88/17/98"
    print_osc4 6 "3a/96/dd"
    print_osc4 7 "cc/cc/cc"
    print_osc4 8 "76/76/76"
    print_osc4 9 "e7/48/56"
    print_osc4 10 "16/c6/0c"
    print_osc4 11 "f9/f1/a5"
    print_osc4 12 "3b/78/ff"
    print_osc4 13 "b4/00/9e"
    print_osc4 14 "61/d6/d6"
    print_osc4 15 "f2/f2/f2"

    print_osc_rgb 10 "cc/cc/cc"
    print_osc_rgb 11 "0c/0c/0c"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "cc/cc/cc"
    print_osc_rgb 19 "0c/0c/0c"
}

do_linux() {
    print_linux 0 "#0c0c0c"
    print_linux 1 "#c50f1f"
    print_linux 2 "#13a10e"
    print_linux 3 "#c19c00"
    print_linux 4 "#0037da"
    print_linux 5 "#881798"
    print_linux 6 "#3a96dd"
    print_linux 7 "#cccccc"
    print_linux 8 "#767676"
    print_linux 9 "#e74856"
    print_linux 10 "#16c60c"
    print_linux 11 "#f9f1a5"
    print_linux 12 "#3b78ff"
    print_linux 13 "#b4009e"
    print_linux 14 "#61d6d6"
    print_linux 15 "#f2f2f2"
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
