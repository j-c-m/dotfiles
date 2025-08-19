#!/usr/bin/env bash

# Source:   iterm
# Theme:    idleToes
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
    print_osc4 0 "32/32/32"
    print_osc4 1 "d2/52/52"
    print_osc4 2 "7f/e1/73"
    print_osc4 3 "ff/c6/6d"
    print_osc4 4 "40/98/ff"
    print_osc4 5 "f5/7f/ff"
    print_osc4 6 "be/d6/ff"
    print_osc4 7 "ee/ee/ec"
    print_osc4 8 "53/53/53"
    print_osc4 9 "f0/70/70"
    print_osc4 10 "9d/ff/90"
    print_osc4 11 "ff/e4/8b"
    print_osc4 12 "5e/b7/f7"
    print_osc4 13 "ff/9d/ff"
    print_osc4 14 "dc/f4/ff"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "32/32/32"
    print_osc_rgb 12 "d6/d6/d6"
    print_osc_rgb 17 "5b/5b/5b"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#323232"
    print_linux 1 "#d25252"
    print_linux 2 "#7fe173"
    print_linux 3 "#ffc66d"
    print_linux 4 "#4098ff"
    print_linux 5 "#f57fff"
    print_linux 6 "#bed6ff"
    print_linux 7 "#ffffff"
    print_linux 8 "#535353"
    print_linux 9 "#f07070"
    print_linux 10 "#9dff90"
    print_linux 11 "#ffe48b"
    print_linux 12 "#5eb7f7"
    print_linux 13 "#ff9dff"
    print_linux 14 "#dcf4ff"
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
