#!/usr/bin/env bash

# Source:   iterm
# Theme:    iTerm2 Smoooooth
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
    print_osc4 0 "14/19/1e"
    print_osc4 1 "b4/3c/29"
    print_osc4 2 "00/c2/00"
    print_osc4 3 "c7/c4/00"
    print_osc4 4 "27/43/c7"
    print_osc4 5 "bf/3f/bd"
    print_osc4 6 "00/c5/c7"
    print_osc4 7 "c7/c7/c7"
    print_osc4 8 "67/67/67"
    print_osc4 9 "dc/79/74"
    print_osc4 10 "57/e6/90"
    print_osc4 11 "ec/e1/00"
    print_osc4 12 "a6/aa/f1"
    print_osc4 13 "e0/7d/e0"
    print_osc4 14 "5f/fd/ff"
    print_osc4 15 "fe/ff/ff"

    print_osc_rgb 10 "db/db/db"
    print_osc_rgb 11 "14/19/1e"
    print_osc_rgb 12 "fe/ff/fe"
    print_osc_rgb 17 "b3/d7/ff"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#14191e"
    print_linux 1 "#b43c29"
    print_linux 2 "#00c200"
    print_linux 3 "#c7c400"
    print_linux 4 "#2743c7"
    print_linux 5 "#bf3fbd"
    print_linux 6 "#00c5c7"
    print_linux 7 "#dbdbdb"
    print_linux 8 "#676767"
    print_linux 9 "#dc7974"
    print_linux 10 "#57e690"
    print_linux 11 "#ece100"
    print_linux 12 "#a6aaf1"
    print_linux 13 "#e07de0"
    print_linux 14 "#5ffdff"
    print_linux 15 "#feffff"
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
