#!/usr/bin/env bash

# Source:   gogh
# Theme:    Monokai Pro Light
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
    print_osc4 0 "fe/fa/f9"
    print_osc4 1 "e1/47/75"
    print_osc4 2 "26/9d/69"
    print_osc4 3 "cc/7a/0a"
    print_osc4 4 "e1/60/32"
    print_osc4 5 "70/58/be"
    print_osc4 6 "1c/8c/a8"
    print_osc4 7 "29/24/2a"
    print_osc4 8 "6e/6b/6a"
    print_osc4 9 "e1/47/75"
    print_osc4 10 "26/9d/69"
    print_osc4 11 "cc/7a/0a"
    print_osc4 12 "e1/60/32"
    print_osc4 13 "70/58/be"
    print_osc4 14 "1c/8c/a8"
    print_osc4 15 "29/24/2a"

    print_osc_rgb 10 "29/24/2a"
    print_osc_rgb 11 "fe/fa/f9"
    print_osc_rgb 12 "29/24/2a"
    print_osc_rgb 17 "29/24/2a"
    print_osc_rgb 19 "fe/fa/f9"
}

do_linux() {
    print_linux 0 "#fefaf9"
    print_linux 1 "#e14775"
    print_linux 2 "#269d69"
    print_linux 3 "#cc7a0a"
    print_linux 4 "#e16032"
    print_linux 5 "#7058be"
    print_linux 6 "#1c8ca8"
    print_linux 7 "#29242a"
    print_linux 8 "#6e6b6a"
    print_linux 9 "#e14775"
    print_linux 10 "#269d69"
    print_linux 11 "#cc7a0a"
    print_linux 12 "#e16032"
    print_linux 13 "#7058be"
    print_linux 14 "#1c8ca8"
    print_linux 15 "#29242a"
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
