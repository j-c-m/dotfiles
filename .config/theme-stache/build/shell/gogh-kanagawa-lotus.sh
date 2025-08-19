#!/usr/bin/env bash

# Source:   gogh
# Theme:    Kanagawa Lotus
# Author:   
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
    print_osc4 0 "1f/1f/28"
    print_osc4 1 "c8/40/53"
    print_osc4 2 "6f/89/4e"
    print_osc4 3 "77/71/3f"
    print_osc4 4 "4d/69/9b"
    print_osc4 5 "b3/5b/79"
    print_osc4 6 "59/7b/75"
    print_osc4 7 "54/54/64"
    print_osc4 8 "8a/89/80"
    print_osc4 9 "d7/47/4b"
    print_osc4 10 "6e/91/5f"
    print_osc4 11 "83/6f/4a"
    print_osc4 12 "66/93/bf"
    print_osc4 13 "62/4c/83"
    print_osc4 14 "5e/85/7a"
    print_osc4 15 "43/43/6c"

    print_osc_rgb 10 "54/54/64"
    print_osc_rgb 11 "f2/ec/bc"
    print_osc_rgb 12 "43/43/6c"
    print_osc_rgb 17 "54/54/64"
    print_osc_rgb 19 "f2/ec/bc"
}

do_linux() {
    print_linux 0 "#1f1f28"
    print_linux 1 "#c84053"
    print_linux 2 "#6f894e"
    print_linux 3 "#77713f"
    print_linux 4 "#4d699b"
    print_linux 5 "#b35b79"
    print_linux 6 "#597b75"
    print_linux 7 "#545464"
    print_linux 8 "#8a8980"
    print_linux 9 "#d7474b"
    print_linux 10 "#6e915f"
    print_linux 11 "#836f4a"
    print_linux 12 "#6693bf"
    print_linux 13 "#624c83"
    print_linux 14 "#5e857a"
    print_linux 15 "#43436c"
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
