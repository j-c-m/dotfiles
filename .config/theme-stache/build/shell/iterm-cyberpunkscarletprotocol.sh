#!/usr/bin/env bash

# Source:   iterm
# Theme:    CyberpunkScarletProtocol
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
    print_osc4 0 "10/10/16"
    print_osc4 1 "fe/00/50"
    print_osc4 2 "00/db/83"
    print_osc4 3 "fa/f8/44"
    print_osc4 4 "01/70/b6"
    print_osc4 5 "c9/30/c7"
    print_osc4 6 "00/c5/c7"
    print_osc4 7 "c7/c7/c7"
    print_osc4 8 "67/67/67"
    print_osc4 9 "fe/6d/67"
    print_osc4 10 "5f/f9/67"
    print_osc4 11 "fe/fb/67"
    print_osc4 12 "68/71/fe"
    print_osc4 13 "bc/35/eb"
    print_osc4 14 "5f/fd/fe"
    print_osc4 15 "fe/fe/fe"

    print_osc_rgb 10 "e3/19/50"
    print_osc_rgb 11 "0f/11/16"
    print_osc_rgb 12 "76/fe/9f"
    print_osc_rgb 17 "c1/dd/fe"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#101016"
    print_linux 1 "#fe0050"
    print_linux 2 "#00db83"
    print_linux 3 "#faf844"
    print_linux 4 "#0170b6"
    print_linux 5 "#c930c7"
    print_linux 6 "#00c5c7"
    print_linux 7 "#e31950"
    print_linux 8 "#676767"
    print_linux 9 "#fe6d67"
    print_linux 10 "#5ff967"
    print_linux 11 "#fefb67"
    print_linux 12 "#6871fe"
    print_linux 13 "#bc35eb"
    print_linux 14 "#5ffdfe"
    print_linux 15 "#fefefe"
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
