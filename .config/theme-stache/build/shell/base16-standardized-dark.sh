#!/usr/bin/env bash

# Source:   base16
# Theme:    standardized-dark
# Author:   ali (https://github.com/ali-githb/base16-standardized-scheme)
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
    print_osc4 0 "22/22/22"
    print_osc4 1 "e1/5d/67"
    print_osc4 2 "5d/b1/29"
    print_osc4 3 "e1/b3/1a"
    print_osc4 4 "00/a3/f2"
    print_osc4 5 "b4/6e/e0"
    print_osc4 6 "21/c9/92"
    print_osc4 7 "c0/c0/c0"
    print_osc4 8 "89/89/89"
    print_osc4 9 "e1/5d/67"
    print_osc4 10 "5d/b1/29"
    print_osc4 11 "e1/b3/1a"
    print_osc4 12 "00/a3/f2"
    print_osc4 13 "b4/6e/e0"
    print_osc4 14 "21/c9/92"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "c0/c0/c0"
    print_osc_rgb 11 "22/22/22"
    print_osc_rgb 12 "c0/c0/c0"
    print_osc_rgb 17 "e0/e0/e0"
    print_osc_rgb 19 "30/30/30"
}

do_linux() {
    print_linux 0 "#222222"
    print_linux 1 "#e15d67"
    print_linux 2 "#5db129"
    print_linux 3 "#e1b31a"
    print_linux 4 "#00a3f2"
    print_linux 5 "#b46ee0"
    print_linux 6 "#21c992"
    print_linux 7 "#c0c0c0"
    print_linux 8 "#898989"
    print_linux 9 "#e15d67"
    print_linux 10 "#5db129"
    print_linux 11 "#e1b31a"
    print_linux 12 "#00a3f2"
    print_linux 13 "#b46ee0"
    print_linux 14 "#21c992"
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
