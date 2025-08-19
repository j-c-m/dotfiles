#!/usr/bin/env bash

# Source:   gogh
# Theme:    Blazer
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "b8/7a/7a"
    print_osc4 2 "7a/b8/7a"
    print_osc4 3 "b8/b8/7a"
    print_osc4 4 "7a/7a/b8"
    print_osc4 5 "b8/7a/b8"
    print_osc4 6 "7a/b8/b8"
    print_osc4 7 "d9/d9/d9"
    print_osc4 8 "26/26/26"
    print_osc4 9 "db/bd/bd"
    print_osc4 10 "bd/db/bd"
    print_osc4 11 "db/db/bd"
    print_osc4 12 "bd/bd/db"
    print_osc4 13 "db/bd/db"
    print_osc4 14 "bd/db/db"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "d9/e6/f2"
    print_osc_rgb 11 "0d/19/26"
    print_osc_rgb 12 "d9/e6/f2"
    print_osc_rgb 17 "d9/e6/f2"
    print_osc_rgb 19 "0d/19/26"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#b87a7a"
    print_linux 2 "#7ab87a"
    print_linux 3 "#b8b87a"
    print_linux 4 "#7a7ab8"
    print_linux 5 "#b87ab8"
    print_linux 6 "#7ab8b8"
    print_linux 7 "#d9e6f2"
    print_linux 8 "#262626"
    print_linux 9 "#dbbdbd"
    print_linux 10 "#bddbbd"
    print_linux 11 "#dbdbbd"
    print_linux 12 "#bdbddb"
    print_linux 13 "#dbbddb"
    print_linux 14 "#bddbdb"
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
