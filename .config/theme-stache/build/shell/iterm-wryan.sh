#!/usr/bin/env bash

# Source:   iterm
# Theme:    Wryan
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
    print_osc4 0 "33/33/33"
    print_osc4 1 "8c/46/65"
    print_osc4 2 "28/73/73"
    print_osc4 3 "7c/7c/99"
    print_osc4 4 "39/55/73"
    print_osc4 5 "5e/46/8c"
    print_osc4 6 "31/65/8c"
    print_osc4 7 "89/9c/a1"
    print_osc4 8 "3d/3d/3d"
    print_osc4 9 "bf/4d/80"
    print_osc4 10 "53/a6/a6"
    print_osc4 11 "9e/9e/cb"
    print_osc4 12 "47/7a/b3"
    print_osc4 13 "7e/62/b3"
    print_osc4 14 "60/96/bf"
    print_osc4 15 "c0/c0/c0"

    print_osc_rgb 10 "99/99/93"
    print_osc_rgb 11 "10/10/10"
    print_osc_rgb 12 "9d/9e/ca"
    print_osc_rgb 17 "4d/4d/4d"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#333333"
    print_linux 1 "#8c4665"
    print_linux 2 "#287373"
    print_linux 3 "#7c7c99"
    print_linux 4 "#395573"
    print_linux 5 "#5e468c"
    print_linux 6 "#31658c"
    print_linux 7 "#999993"
    print_linux 8 "#3d3d3d"
    print_linux 9 "#bf4d80"
    print_linux 10 "#53a6a6"
    print_linux 11 "#9e9ecb"
    print_linux 12 "#477ab3"
    print_linux 13 "#7e62b3"
    print_linux 14 "#6096bf"
    print_linux 15 "#c0c0c0"
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
