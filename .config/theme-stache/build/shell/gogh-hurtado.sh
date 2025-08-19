#!/usr/bin/env bash

# Source:   gogh
# Theme:    Hurtado
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "57/57/57"
    print_osc4 1 "ff/1b/00"
    print_osc4 2 "a5/e0/55"
    print_osc4 3 "fb/e7/4a"
    print_osc4 4 "49/64/87"
    print_osc4 5 "fd/5f/f1"
    print_osc4 6 "86/e9/fe"
    print_osc4 7 "cb/cc/cb"
    print_osc4 8 "26/26/26"
    print_osc4 9 "d5/1d/00"
    print_osc4 10 "a5/df/55"
    print_osc4 11 "fb/e8/4a"
    print_osc4 12 "89/be/ff"
    print_osc4 13 "c0/01/c1"
    print_osc4 14 "86/ea/fe"
    print_osc4 15 "db/db/db"

    print_osc_rgb 10 "db/db/db"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "db/db/db"
    print_osc_rgb 17 "db/db/db"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#575757"
    print_linux 1 "#ff1b00"
    print_linux 2 "#a5e055"
    print_linux 3 "#fbe74a"
    print_linux 4 "#496487"
    print_linux 5 "#fd5ff1"
    print_linux 6 "#86e9fe"
    print_linux 7 "#dbdbdb"
    print_linux 8 "#262626"
    print_linux 9 "#d51d00"
    print_linux 10 "#a5df55"
    print_linux 11 "#fbe84a"
    print_linux 12 "#89beff"
    print_linux 13 "#c001c1"
    print_linux 14 "#86eafe"
    print_linux 15 "#dbdbdb"
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
