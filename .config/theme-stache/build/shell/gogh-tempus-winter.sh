#!/usr/bin/env bash

# Source:   gogh
# Theme:    Tempus Winter
# Author:   Protesilaos Stavrou (https://protesilaos.com)
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
    print_osc4 0 "20/24/27"
    print_osc4 1 "ed/6e/5a"
    print_osc4 2 "4a/a9/20"
    print_osc4 3 "9a/99/21"
    print_osc4 4 "7b/91/df"
    print_osc4 5 "d1/7e/80"
    print_osc4 6 "4f/a3/94"
    print_osc4 7 "91/95/9b"
    print_osc4 8 "2a/2e/38"
    print_osc4 9 "de/7b/28"
    print_osc4 10 "00/ab/5f"
    print_osc4 11 "af/91/55"
    print_osc4 12 "32/9f/cb"
    print_osc4 13 "ca/77/c5"
    print_osc4 14 "1b/a6/a4"
    print_osc4 15 "8d/a3/b8"

    print_osc_rgb 10 "8d/a3/b8"
    print_osc_rgb 11 "20/24/27"
    print_osc_rgb 12 "8d/a3/b8"
    print_osc_rgb 17 "8d/a3/b8"
    print_osc_rgb 19 "20/24/27"
}

do_linux() {
    print_linux 0 "#202427"
    print_linux 1 "#ed6e5a"
    print_linux 2 "#4aa920"
    print_linux 3 "#9a9921"
    print_linux 4 "#7b91df"
    print_linux 5 "#d17e80"
    print_linux 6 "#4fa394"
    print_linux 7 "#8da3b8"
    print_linux 8 "#2a2e38"
    print_linux 9 "#de7b28"
    print_linux 10 "#00ab5f"
    print_linux 11 "#af9155"
    print_linux 12 "#329fcb"
    print_linux 13 "#ca77c5"
    print_linux 14 "#1ba6a4"
    print_linux 15 "#8da3b8"
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
