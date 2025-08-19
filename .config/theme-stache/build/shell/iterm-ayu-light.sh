#!/usr/bin/env bash

# Source:   iterm
# Theme:    ayu_light
# Author:   unknown
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "ff/33/33"
    print_osc4 2 "86/b3/00"
    print_osc4 3 "f2/97/18"
    print_osc4 4 "41/a6/d9"
    print_osc4 5 "f0/71/78"
    print_osc4 6 "4d/bf/99"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "32/32/32"
    print_osc4 9 "ff/65/65"
    print_osc4 10 "b8/e5/32"
    print_osc4 11 "ff/c9/4a"
    print_osc4 12 "73/d8/ff"
    print_osc4 13 "ff/a3/aa"
    print_osc4 14 "7f/f1/cb"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "5c/67/73"
    print_osc_rgb 11 "fa/fa/fa"
    print_osc_rgb 12 "ff/6a/00"
    print_osc_rgb 17 "f0/ee/e4"
    print_osc_rgb 19 "5c/67/73"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#ff3333"
    print_linux 2 "#86b300"
    print_linux 3 "#f29718"
    print_linux 4 "#41a6d9"
    print_linux 5 "#f07178"
    print_linux 6 "#4dbf99"
    print_linux 7 "#5c6773"
    print_linux 8 "#323232"
    print_linux 9 "#ff6565"
    print_linux 10 "#b8e532"
    print_linux 11 "#ffc94a"
    print_linux 12 "#73d8ff"
    print_linux 13 "#ffa3aa"
    print_linux 14 "#7ff1cb"
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
