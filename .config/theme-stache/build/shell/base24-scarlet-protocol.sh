#!/usr/bin/env bash

# Source:   base24
# Theme:    Scarlet Protocol
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
    print_osc4 0 "1b/15/3c"
    print_osc4 1 "ff/00/51"
    print_osc4 2 "00/dc/84"
    print_osc4 3 "68/71/ff"
    print_osc4 4 "02/71/b6"
    print_osc4 5 "c9/30/c7"
    print_osc4 6 "00/c5/c7"
    print_osc4 7 "af/af/af"
    print_osc4 8 "7f/7f/7f"
    print_osc4 9 "ff/6d/67"
    print_osc4 10 "5f/f9/67"
    print_osc4 11 "fe/fb/67"
    print_osc4 12 "68/71/ff"
    print_osc4 13 "bc/35/eb"
    print_osc4 14 "5f/fd/ff"
    print_osc4 15 "fe/ff/ff"

    print_osc_rgb 10 "af/af/af"
    print_osc_rgb 11 "1b/15/3c"
    print_osc_rgb 12 "af/af/af"
    print_osc_rgb 17 "c7/c7/c7"
    print_osc_rgb 19 "10/11/16"
}

do_linux() {
    print_linux 0 "#1b153c"
    print_linux 1 "#ff0051"
    print_linux 2 "#00dc84"
    print_linux 3 "#6871ff"
    print_linux 4 "#0271b6"
    print_linux 5 "#c930c7"
    print_linux 6 "#00c5c7"
    print_linux 7 "#afafaf"
    print_linux 8 "#7f7f7f"
    print_linux 9 "#ff6d67"
    print_linux 10 "#5ff967"
    print_linux 11 "#fefb67"
    print_linux 12 "#6871ff"
    print_linux 13 "#bc35eb"
    print_linux 14 "#5ffdff"
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
