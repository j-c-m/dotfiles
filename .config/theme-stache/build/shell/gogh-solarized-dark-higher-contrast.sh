#!/usr/bin/env bash

# Source:   gogh
# Theme:    Solarized Dark Higher Contrast
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
    print_osc4 0 "00/28/31"
    print_osc4 1 "d1/1c/24"
    print_osc4 2 "6c/be/6c"
    print_osc4 3 "a5/77/06"
    print_osc4 4 "21/76/c7"
    print_osc4 5 "c6/1c/6f"
    print_osc4 6 "25/92/86"
    print_osc4 7 "ea/e3/cb"
    print_osc4 8 "00/64/88"
    print_osc4 9 "f5/16/3b"
    print_osc4 10 "51/ef/84"
    print_osc4 11 "b2/7e/28"
    print_osc4 12 "17/8e/c8"
    print_osc4 13 "e2/4d/8e"
    print_osc4 14 "00/b3/9e"
    print_osc4 15 "fc/f4/dc"

    print_osc_rgb 10 "9c/c2/c3"
    print_osc_rgb 11 "00/1e/27"
    print_osc_rgb 12 "9c/c2/c3"
    print_osc_rgb 17 "9c/c2/c3"
    print_osc_rgb 19 "00/1e/27"
}

do_linux() {
    print_linux 0 "#002831"
    print_linux 1 "#d11c24"
    print_linux 2 "#6cbe6c"
    print_linux 3 "#a57706"
    print_linux 4 "#2176c7"
    print_linux 5 "#c61c6f"
    print_linux 6 "#259286"
    print_linux 7 "#9cc2c3"
    print_linux 8 "#006488"
    print_linux 9 "#f5163b"
    print_linux 10 "#51ef84"
    print_linux 11 "#b27e28"
    print_linux 12 "#178ec8"
    print_linux 13 "#e24d8e"
    print_linux 14 "#00b39e"
    print_linux 15 "#fcf4dc"
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
