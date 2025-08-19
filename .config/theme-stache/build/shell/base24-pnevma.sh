#!/usr/bin/env bash

# Source:   base24
# Theme:    Pnevma
# Author:   FredHappyface (https://github.com/fredHappyface)
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
    print_osc4 1 "a3/66/66"
    print_osc4 2 "90/a5/7d"
    print_osc4 3 "a1/bd/ce"
    print_osc4 4 "7f/a5/bd"
    print_osc4 5 "c7/9e/c4"
    print_osc4 6 "8a/db/b4"
    print_osc4 7 "ae/ae/ad"
    print_osc4 8 "6b/6a/67"
    print_osc4 9 "d7/87/87"
    print_osc4 10 "af/be/a2"
    print_osc4 11 "e4/c9/af"
    print_osc4 12 "a1/bd/ce"
    print_osc4 13 "d7/be/da"
    print_osc4 14 "b1/e7/dd"
    print_osc4 15 "ef/ef/ef"

    print_osc_rgb 10 "ae/ae/ad"
    print_osc_rgb 11 "1c/1c/1c"
    print_osc_rgb 12 "ae/ae/ad"
    print_osc_rgb 17 "d0/d0/d0"
    print_osc_rgb 19 "2f/2e/2d"
}

do_linux() {
    print_linux 0 "#1c1c1c"
    print_linux 1 "#a36666"
    print_linux 2 "#90a57d"
    print_linux 3 "#a1bdce"
    print_linux 4 "#7fa5bd"
    print_linux 5 "#c79ec4"
    print_linux 6 "#8adbb4"
    print_linux 7 "#aeaead"
    print_linux 8 "#6b6a67"
    print_linux 9 "#d78787"
    print_linux 10 "#afbea2"
    print_linux 11 "#e4c9af"
    print_linux 12 "#a1bdce"
    print_linux 13 "#d7beda"
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
