#!/usr/bin/env bash

# Source:   base24
# Theme:    Galaxy
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
    print_osc4 0 "1c/28/36"
    print_osc4 1 "f9/55/5f"
    print_osc4 2 "20/af/89"
    print_osc4 3 "58/9c/f5"
    print_osc4 4 "58/9c/f5"
    print_osc4 5 "93/4d/95"
    print_osc4 6 "1e/9e/e6"
    print_osc4 7 "a1/a1/a1"
    print_osc4 8 "6e/6e/6e"
    print_osc4 9 "fa/8b/8e"
    print_osc4 10 "34/bb/99"
    print_osc4 11 "ff/ff/55"
    print_osc4 12 "58/9c/f5"
    print_osc4 13 "e7/55/98"
    print_osc4 14 "39/78/bb"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "a1/a1/a1"
    print_osc_rgb 11 "1c/28/36"
    print_osc_rgb 12 "a1/a1/a1"
    print_osc_rgb 17 "bb/bb/bb"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#1c2836"
    print_linux 1 "#f9555f"
    print_linux 2 "#20af89"
    print_linux 3 "#589cf5"
    print_linux 4 "#589cf5"
    print_linux 5 "#934d95"
    print_linux 6 "#1e9ee6"
    print_linux 7 "#a1a1a1"
    print_linux 8 "#6e6e6e"
    print_linux 9 "#fa8b8e"
    print_linux 10 "#34bb99"
    print_linux 11 "#ffff55"
    print_linux 12 "#589cf5"
    print_linux 13 "#e75598"
    print_linux 14 "#3978bb"
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
