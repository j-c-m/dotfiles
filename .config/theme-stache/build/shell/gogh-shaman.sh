#!/usr/bin/env bash

# Source:   gogh
# Theme:    Shaman
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
    print_osc4 0 "01/20/26"
    print_osc4 1 "b2/30/2d"
    print_osc4 2 "00/a9/41"
    print_osc4 3 "5e/8b/aa"
    print_osc4 4 "44/9a/86"
    print_osc4 5 "00/59/9d"
    print_osc4 6 "5d/7e/19"
    print_osc4 7 "40/55/55"
    print_osc4 8 "38/44/51"
    print_osc4 9 "ff/42/42"
    print_osc4 10 "2a/ea/5e"
    print_osc4 11 "8e/d4/fd"
    print_osc4 12 "61/d5/ba"
    print_osc4 13 "12/98/ff"
    print_osc4 14 "98/d0/28"
    print_osc4 15 "58/fb/d6"

    print_osc_rgb 10 "40/55/55"
    print_osc_rgb 11 "00/10/15"
    print_osc_rgb 12 "40/55/55"
    print_osc_rgb 17 "40/55/55"
    print_osc_rgb 19 "00/10/15"
}

do_linux() {
    print_linux 0 "#012026"
    print_linux 1 "#b2302d"
    print_linux 2 "#00a941"
    print_linux 3 "#5e8baa"
    print_linux 4 "#449a86"
    print_linux 5 "#00599d"
    print_linux 6 "#5d7e19"
    print_linux 7 "#405555"
    print_linux 8 "#384451"
    print_linux 9 "#ff4242"
    print_linux 10 "#2aea5e"
    print_linux 11 "#8ed4fd"
    print_linux 12 "#61d5ba"
    print_linux 13 "#1298ff"
    print_linux 14 "#98d028"
    print_linux 15 "#58fbd6"
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
