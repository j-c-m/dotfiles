#!/usr/bin/env bash

# Source:   iterm
# Theme:    Shaman
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
    print_osc4 0 "01/20/26"
    print_osc4 1 "b1/2f/2c"
    print_osc4 2 "00/a9/40"
    print_osc4 3 "5d/8a/a9"
    print_osc4 4 "44/99/85"
    print_osc4 5 "00/59/9c"
    print_osc4 6 "5c/7e/19"
    print_osc4 7 "40/55/54"
    print_osc4 8 "37/43/50"
    print_osc4 9 "ff/42/42"
    print_osc4 10 "2a/ea/5e"
    print_osc4 11 "8d/d3/fd"
    print_osc4 12 "61/d4/b9"
    print_osc4 13 "12/98/ff"
    print_osc4 14 "98/cf/28"
    print_osc4 15 "58/fa/d6"

    print_osc_rgb 10 "40/55/55"
    print_osc_rgb 11 "00/10/14"
    print_osc_rgb 12 "49/fc/d5"
    print_osc_rgb 17 "41/55/54"
    print_osc_rgb 19 "5a/f9/d6"
}

do_linux() {
    print_linux 0 "#012026"
    print_linux 1 "#b12f2c"
    print_linux 2 "#00a940"
    print_linux 3 "#5d8aa9"
    print_linux 4 "#449985"
    print_linux 5 "#00599c"
    print_linux 6 "#5c7e19"
    print_linux 7 "#405555"
    print_linux 8 "#374350"
    print_linux 9 "#ff4242"
    print_linux 10 "#2aea5e"
    print_linux 11 "#8dd3fd"
    print_linux 12 "#61d4b9"
    print_linux 13 "#1298ff"
    print_linux 14 "#98cf28"
    print_linux 15 "#58fad6"
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
