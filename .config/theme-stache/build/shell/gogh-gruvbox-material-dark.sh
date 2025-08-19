#!/usr/bin/env bash

# Source:   gogh
# Theme:    Gruvbox Material Dark
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
    print_osc4 0 "3c/38/36"
    print_osc4 1 "ea/69/62"
    print_osc4 2 "a9/b6/65"
    print_osc4 3 "d8/a6/57"
    print_osc4 4 "7d/ae/a3"
    print_osc4 5 "d3/86/9b"
    print_osc4 6 "89/b4/82"
    print_osc4 7 "d4/be/98"
    print_osc4 8 "3c/38/36"
    print_osc4 9 "ea/69/62"
    print_osc4 10 "a9/b6/65"
    print_osc4 11 "d8/a6/57"
    print_osc4 12 "7d/ae/a3"
    print_osc4 13 "d3/86/9b"
    print_osc4 14 "89/b4/82"
    print_osc4 15 "d4/be/98"

    print_osc_rgb 10 "d4/be/98"
    print_osc_rgb 11 "28/28/28"
    print_osc_rgb 12 "d4/be/98"
    print_osc_rgb 17 "d4/be/98"
    print_osc_rgb 19 "28/28/28"
}

do_linux() {
    print_linux 0 "#3c3836"
    print_linux 1 "#ea6962"
    print_linux 2 "#a9b665"
    print_linux 3 "#d8a657"
    print_linux 4 "#7daea3"
    print_linux 5 "#d3869b"
    print_linux 6 "#89b482"
    print_linux 7 "#d4be98"
    print_linux 8 "#3c3836"
    print_linux 9 "#ea6962"
    print_linux 10 "#a9b665"
    print_linux 11 "#d8a657"
    print_linux 12 "#7daea3"
    print_linux 13 "#d3869b"
    print_linux 14 "#89b482"
    print_linux 15 "#d4be98"
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
