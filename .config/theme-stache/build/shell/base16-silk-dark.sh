#!/usr/bin/env bash

# Source:   base16
# Theme:    Silk Dark
# Author:   Gabriel Fontes (https://github.com/Misterio77)
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
    print_osc4 0 "0e/3c/46"
    print_osc4 1 "fb/69/53"
    print_osc4 2 "73/d8/ad"
    print_osc4 3 "fc/e3/80"
    print_osc4 4 "46/bd/dd"
    print_osc4 5 "75/6b/8a"
    print_osc4 6 "3f/b2/b9"
    print_osc4 7 "c7/db/dd"
    print_osc4 8 "58/70/73"
    print_osc4 9 "fb/69/53"
    print_osc4 10 "73/d8/ad"
    print_osc4 11 "fc/e3/80"
    print_osc4 12 "46/bd/dd"
    print_osc4 13 "75/6b/8a"
    print_osc4 14 "3f/b2/b9"
    print_osc4 15 "d2/fa/ff"

    print_osc_rgb 10 "c7/db/dd"
    print_osc_rgb 11 "0e/3c/46"
    print_osc_rgb 12 "c7/db/dd"
    print_osc_rgb 17 "cb/f2/f7"
    print_osc_rgb 19 "1d/49/4e"
}

do_linux() {
    print_linux 0 "#0e3c46"
    print_linux 1 "#fb6953"
    print_linux 2 "#73d8ad"
    print_linux 3 "#fce380"
    print_linux 4 "#46bddd"
    print_linux 5 "#756b8a"
    print_linux 6 "#3fb2b9"
    print_linux 7 "#c7dbdd"
    print_linux 8 "#587073"
    print_linux 9 "#fb6953"
    print_linux 10 "#73d8ad"
    print_linux 11 "#fce380"
    print_linux 12 "#46bddd"
    print_linux 13 "#756b8a"
    print_linux 14 "#3fb2b9"
    print_linux 15 "#d2faff"
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
