#!/usr/bin/env bash

# Source:   gogh
# Theme:    Kibble
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
    print_osc4 0 "4d/4d/4d"
    print_osc4 1 "c7/00/31"
    print_osc4 2 "29/cf/13"
    print_osc4 3 "d8/e3/0e"
    print_osc4 4 "34/49/d1"
    print_osc4 5 "84/00/ff"
    print_osc4 6 "07/98/ab"
    print_osc4 7 "e2/d1/e3"
    print_osc4 8 "5a/5a/5a"
    print_osc4 9 "f0/15/78"
    print_osc4 10 "6c/e0/5c"
    print_osc4 11 "f3/f7/9e"
    print_osc4 12 "97/a4/f7"
    print_osc4 13 "c4/95/f0"
    print_osc4 14 "68/f2/e0"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "f7/f7/f7"
    print_osc_rgb 11 "0e/10/0a"
    print_osc_rgb 12 "f7/f7/f7"
    print_osc_rgb 17 "f7/f7/f7"
    print_osc_rgb 19 "0e/10/0a"
}

do_linux() {
    print_linux 0 "#4d4d4d"
    print_linux 1 "#c70031"
    print_linux 2 "#29cf13"
    print_linux 3 "#d8e30e"
    print_linux 4 "#3449d1"
    print_linux 5 "#8400ff"
    print_linux 6 "#0798ab"
    print_linux 7 "#f7f7f7"
    print_linux 8 "#5a5a5a"
    print_linux 9 "#f01578"
    print_linux 10 "#6ce05c"
    print_linux 11 "#f3f79e"
    print_linux 12 "#97a4f7"
    print_linux 13 "#c495f0"
    print_linux 14 "#68f2e0"
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
