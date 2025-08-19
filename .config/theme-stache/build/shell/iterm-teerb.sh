#!/usr/bin/env bash

# Source:   iterm
# Theme:    Teerb
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
    print_osc4 0 "1c/1c/1c"
    print_osc4 1 "d6/86/86"
    print_osc4 2 "ae/d6/86"
    print_osc4 3 "d7/af/87"
    print_osc4 4 "86/ae/d6"
    print_osc4 5 "d6/ae/d6"
    print_osc4 6 "8a/db/b4"
    print_osc4 7 "d0/d0/d0"
    print_osc4 8 "1c/1c/1c"
    print_osc4 9 "d6/86/86"
    print_osc4 10 "ae/d6/86"
    print_osc4 11 "e4/c9/af"
    print_osc4 12 "86/ae/d6"
    print_osc4 13 "d6/ae/d6"
    print_osc4 14 "b1/e7/dd"
    print_osc4 15 "ef/ef/ef"

    print_osc_rgb 10 "d0/d0/d0"
    print_osc_rgb 11 "26/26/26"
    print_osc_rgb 12 "e3/c8/ae"
    print_osc_rgb 17 "4d/4d/4d"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#1c1c1c"
    print_linux 1 "#d68686"
    print_linux 2 "#aed686"
    print_linux 3 "#d7af87"
    print_linux 4 "#86aed6"
    print_linux 5 "#d6aed6"
    print_linux 6 "#8adbb4"
    print_linux 7 "#d0d0d0"
    print_linux 8 "#1c1c1c"
    print_linux 9 "#d68686"
    print_linux 10 "#aed686"
    print_linux 11 "#e4c9af"
    print_linux 12 "#86aed6"
    print_linux 13 "#d6aed6"
    print_linux 14 "#b1e7dd"
    print_linux 15 "#efefef"
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
