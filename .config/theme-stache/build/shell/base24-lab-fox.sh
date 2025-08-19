#!/usr/bin/env bash

# Source:   base24
# Theme:    Lab Fox
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "2e/2e/2e"
    print_osc4 1 "fc/6d/26"
    print_osc4 2 "3e/b3/83"
    print_osc4 3 "db/50/1f"
    print_osc4 4 "db/3b/21"
    print_osc4 5 "38/0d/75"
    print_osc4 6 "6e/49/cb"
    print_osc4 7 "cf/d0/d0"
    print_osc4 8 "73/73/73"
    print_osc4 9 "ff/65/17"
    print_osc4 10 "52/e9/a8"
    print_osc4 11 "fc/a0/12"
    print_osc4 12 "db/50/1f"
    print_osc4 13 "44/10/90"
    print_osc4 14 "7d/53/e7"
    print_osc4 15 "fe/ff/ff"

    print_osc_rgb 10 "cf/d0/d0"
    print_osc_rgb 11 "2e/2e/2e"
    print_osc_rgb 12 "cf/d0/d0"
    print_osc_rgb 17 "fe/ff/ff"
    print_osc_rgb 19 "2e/2e/2e"
}

do_linux() {
    print_linux 0 "#2e2e2e"
    print_linux 1 "#fc6d26"
    print_linux 2 "#3eb383"
    print_linux 3 "#db501f"
    print_linux 4 "#db3b21"
    print_linux 5 "#380d75"
    print_linux 6 "#6e49cb"
    print_linux 7 "#cfd0d0"
    print_linux 8 "#737373"
    print_linux 9 "#ff6517"
    print_linux 10 "#52e9a8"
    print_linux 11 "#fca012"
    print_linux 12 "#db501f"
    print_linux 13 "#441090"
    print_linux 14 "#7d53e7"
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
