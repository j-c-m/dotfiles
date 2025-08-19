#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base2Tone Desert
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
    print_osc4 0 "29/27/24"
    print_osc4 1 "81/6f/4b"
    print_osc4 2 "ec/92/55"
    print_osc4 3 "ff/b3/80"
    print_osc4 4 "95/7e/50"
    print_osc4 5 "ec/92/55"
    print_osc4 6 "ac/8e/53"
    print_osc4 7 "ad/a5/94"
    print_osc4 8 "7e/77/67"
    print_osc4 9 "f2/9d/63"
    print_osc4 10 "3d/3a/34"
    print_osc4 11 "61/5c/51"
    print_osc4 12 "90/87/74"
    print_osc4 13 "dd/cb/a6"
    print_osc4 14 "e5/87/48"
    print_osc4 15 "f2/ea/d9"

    print_osc_rgb 10 "ad/a5/94"
    print_osc_rgb 11 "29/27/24"
    print_osc_rgb 12 "bc/67/2f"
    print_osc_rgb 17 "ad/a5/94"
    print_osc_rgb 19 "29/27/24"
}

do_linux() {
    print_linux 0 "#292724"
    print_linux 1 "#816f4b"
    print_linux 2 "#ec9255"
    print_linux 3 "#ffb380"
    print_linux 4 "#957e50"
    print_linux 5 "#ec9255"
    print_linux 6 "#ac8e53"
    print_linux 7 "#ada594"
    print_linux 8 "#7e7767"
    print_linux 9 "#f29d63"
    print_linux 10 "#3d3a34"
    print_linux 11 "#615c51"
    print_linux 12 "#908774"
    print_linux 13 "#ddcba6"
    print_linux 14 "#e58748"
    print_linux 15 "#f2ead9"
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
