#!/usr/bin/env bash

# Source:   gogh
# Theme:    Hemisu Light
# Author:   
# Variant:  light

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
    print_osc4 0 "77/77/77"
    print_osc4 1 "ff/00/55"
    print_osc4 2 "73/91/00"
    print_osc4 3 "50/3d/15"
    print_osc4 4 "53/80/91"
    print_osc4 5 "5b/34/5e"
    print_osc4 6 "53/80/91"
    print_osc4 7 "99/99/99"
    print_osc4 8 "99/99/99"
    print_osc4 9 "d6/5e/76"
    print_osc4 10 "9c/c7/00"
    print_osc4 11 "94/75/55"
    print_osc4 12 "9d/b3/cd"
    print_osc4 13 "a1/84/a4"
    print_osc4 14 "85/b2/aa"
    print_osc4 15 "ba/ba/ba"

    print_osc_rgb 10 "44/44/44"
    print_osc_rgb 11 "ef/ef/ef"
    print_osc_rgb 12 "ff/00/54"
    print_osc_rgb 17 "44/44/44"
    print_osc_rgb 19 "ef/ef/ef"
}

do_linux() {
    print_linux 0 "#777777"
    print_linux 1 "#ff0055"
    print_linux 2 "#739100"
    print_linux 3 "#503d15"
    print_linux 4 "#538091"
    print_linux 5 "#5b345e"
    print_linux 6 "#538091"
    print_linux 7 "#444444"
    print_linux 8 "#999999"
    print_linux 9 "#d65e76"
    print_linux 10 "#9cc700"
    print_linux 11 "#947555"
    print_linux 12 "#9db3cd"
    print_linux 13 "#a184a4"
    print_linux 14 "#85b2aa"
    print_linux 15 "#bababa"
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
