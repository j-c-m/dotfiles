#!/usr/bin/env bash

# Source:   base24
# Theme:    Purple Rain
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
    print_osc4 0 "20/08/4a"
    print_osc4 1 "ff/26/0d"
    print_osc4 2 "9a/e2/04"
    print_osc4 3 "00/a5/ff"
    print_osc4 4 "00/a1/f9"
    print_osc4 5 "80/5b/b5"
    print_osc4 6 "00/dd/ef"
    print_osc4 7 "d3/d4/d4"
    print_osc4 8 "7f/7f/7f"
    print_osc4 9 "ff/42/50"
    print_osc4 10 "b8/e3/6d"
    print_osc4 11 "ff/d8/52"
    print_osc4 12 "00/a5/ff"
    print_osc4 13 "ab/7a/ef"
    print_osc4 14 "74/fc/f3"
    print_osc4 15 "fe/ff/ff"

    print_osc_rgb 10 "d3/d4/d4"
    print_osc_rgb 11 "20/08/4a"
    print_osc_rgb 12 "d3/d4/d4"
    print_osc_rgb 17 "fe/ff/ff"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#20084a"
    print_linux 1 "#ff260d"
    print_linux 2 "#9ae204"
    print_linux 3 "#00a5ff"
    print_linux 4 "#00a1f9"
    print_linux 5 "#805bb5"
    print_linux 6 "#00ddef"
    print_linux 7 "#d3d4d4"
    print_linux 8 "#7f7f7f"
    print_linux 9 "#ff4250"
    print_linux 10 "#b8e36d"
    print_linux 11 "#ffd852"
    print_linux 12 "#00a5ff"
    print_linux 13 "#ab7aef"
    print_linux 14 "#74fcf3"
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
