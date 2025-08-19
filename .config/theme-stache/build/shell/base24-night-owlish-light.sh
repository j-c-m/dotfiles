#!/usr/bin/env bash

# Source:   base24
# Theme:    Night Owlish Light
# Author:   FredHappyface (https://github.com/fredHappyface)
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
    print_osc4 0 "ff/ff/ff"
    print_osc4 1 "d3/42/3e"
    print_osc4 2 "2a/a2/98"
    print_osc4 3 "5c/a7/e4"
    print_osc4 4 "48/76/d6"
    print_osc4 5 "40/3f/53"
    print_osc4 6 "08/91/6a"
    print_osc4 7 "7a/81/81"
    print_osc4 8 "7a/81/81"
    print_osc4 9 "f7/6e/6e"
    print_osc4 10 "49/d0/c5"
    print_osc4 11 "da/c2/6b"
    print_osc4 12 "5c/a7/e4"
    print_osc4 13 "69/70/98"
    print_osc4 14 "00/c9/90"
    print_osc4 15 "98/9f/b1"

    print_osc_rgb 10 "7a/81/81"
    print_osc_rgb 11 "ff/ff/ff"
    print_osc_rgb 12 "7a/81/81"
    print_osc_rgb 17 "7a/81/81"
    print_osc_rgb 19 "01/16/27"
}

do_linux() {
    print_linux 0 "#ffffff"
    print_linux 1 "#d3423e"
    print_linux 2 "#2aa298"
    print_linux 3 "#5ca7e4"
    print_linux 4 "#4876d6"
    print_linux 5 "#403f53"
    print_linux 6 "#08916a"
    print_linux 7 "#7a8181"
    print_linux 8 "#7a8181"
    print_linux 9 "#f76e6e"
    print_linux 10 "#49d0c5"
    print_linux 11 "#dac26b"
    print_linux 12 "#5ca7e4"
    print_linux 13 "#697098"
    print_linux 14 "#00c990"
    print_linux 15 "#989fb1"
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
