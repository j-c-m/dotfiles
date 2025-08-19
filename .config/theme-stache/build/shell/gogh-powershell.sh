#!/usr/bin/env bash

# Source:   gogh
# Theme:    Powershell
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
    print_osc4 1 "7e/00/08"
    print_osc4 2 "09/80/03"
    print_osc4 3 "c4/a0/00"
    print_osc4 4 "01/00/83"
    print_osc4 5 "d3/36/82"
    print_osc4 6 "0e/80/7f"
    print_osc4 7 "7f/7c/7f"
    print_osc4 8 "80/80/80"
    print_osc4 9 "ef/29/29"
    print_osc4 10 "1c/fe/3c"
    print_osc4 11 "fe/fe/45"
    print_osc4 12 "26/8a/d2"
    print_osc4 13 "fe/13/fa"
    print_osc4 14 "29/ff/fe"
    print_osc4 15 "c2/c1/c3"

    print_osc_rgb 10 "f6/f6/f7"
    print_osc_rgb 11 "05/24/54"
    print_osc_rgb 12 "f6/f6/f7"
    print_osc_rgb 17 "f6/f6/f7"
    print_osc_rgb 19 "05/24/54"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#7e0008"
    print_linux 2 "#098003"
    print_linux 3 "#c4a000"
    print_linux 4 "#010083"
    print_linux 5 "#d33682"
    print_linux 6 "#0e807f"
    print_linux 7 "#f6f6f7"
    print_linux 8 "#808080"
    print_linux 9 "#ef2929"
    print_linux 10 "#1cfe3c"
    print_linux 11 "#fefe45"
    print_linux 12 "#268ad2"
    print_linux 13 "#fe13fa"
    print_linux 14 "#29fffe"
    print_linux 15 "#c2c1c3"
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
