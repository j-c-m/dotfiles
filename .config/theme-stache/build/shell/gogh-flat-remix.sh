#!/usr/bin/env bash

# Source:   gogh
# Theme:    Flat Remix
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
    print_osc4 0 "1f/22/29"
    print_osc4 1 "d4/19/19"
    print_osc4 2 "5e/bd/ab"
    print_osc4 3 "fe/a4/4c"
    print_osc4 4 "36/7b/f0"
    print_osc4 5 "bf/2e/5d"
    print_osc4 6 "49/ae/e6"
    print_osc4 7 "e6/e6/e6"
    print_osc4 8 "8c/42/ab"
    print_osc4 9 "ec/01/01"
    print_osc4 10 "47/d4/b9"
    print_osc4 11 "ff/8a/18"
    print_osc4 12 "27/7f/ff"
    print_osc4 13 "d7/16/55"
    print_osc4 14 "05/a1/f7"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "27/2a/34"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "ff/ff/ff"
    print_osc_rgb 19 "27/2a/34"
}

do_linux() {
    print_linux 0 "#1f2229"
    print_linux 1 "#d41919"
    print_linux 2 "#5ebdab"
    print_linux 3 "#fea44c"
    print_linux 4 "#367bf0"
    print_linux 5 "#bf2e5d"
    print_linux 6 "#49aee6"
    print_linux 7 "#ffffff"
    print_linux 8 "#8c42ab"
    print_linux 9 "#ec0101"
    print_linux 10 "#47d4b9"
    print_linux 11 "#ff8a18"
    print_linux 12 "#277fff"
    print_linux 13 "#d71655"
    print_linux 14 "#05a1f7"
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
