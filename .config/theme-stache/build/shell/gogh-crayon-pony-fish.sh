#!/usr/bin/env bash

# Source:   gogh
# Theme:    Crayon Pony Fish
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
    print_osc4 0 "2b/1b/1d"
    print_osc4 1 "91/00/2b"
    print_osc4 2 "57/95/24"
    print_osc4 3 "ab/31/1b"
    print_osc4 4 "8c/87/b0"
    print_osc4 5 "69/2f/50"
    print_osc4 6 "e8/a8/66"
    print_osc4 7 "68/52/5a"
    print_osc4 8 "3d/2b/2e"
    print_osc4 9 "c5/25/5d"
    print_osc4 10 "8d/ff/57"
    print_osc4 11 "c8/38/1d"
    print_osc4 12 "cf/c9/ff"
    print_osc4 13 "fc/6c/ba"
    print_osc4 14 "ff/ce/af"
    print_osc4 15 "b0/94/9d"

    print_osc_rgb 10 "68/52/5a"
    print_osc_rgb 11 "15/07/07"
    print_osc_rgb 12 "68/52/5a"
    print_osc_rgb 17 "68/52/5a"
    print_osc_rgb 19 "15/07/07"
}

do_linux() {
    print_linux 0 "#2b1b1d"
    print_linux 1 "#91002b"
    print_linux 2 "#579524"
    print_linux 3 "#ab311b"
    print_linux 4 "#8c87b0"
    print_linux 5 "#692f50"
    print_linux 6 "#e8a866"
    print_linux 7 "#68525a"
    print_linux 8 "#3d2b2e"
    print_linux 9 "#c5255d"
    print_linux 10 "#8dff57"
    print_linux 11 "#c8381d"
    print_linux 12 "#cfc9ff"
    print_linux 13 "#fc6cba"
    print_linux 14 "#ffceaf"
    print_linux 15 "#b0949d"
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
