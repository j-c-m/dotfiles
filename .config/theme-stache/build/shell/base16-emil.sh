#!/usr/bin/env bash

# Source:   base16
# Theme:    emil
# Author:   limelier
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
    print_osc4 0 "ef/ef/ef"
    print_osc4 1 "f4/39/79"
    print_osc4 2 "00/73/a8"
    print_osc4 3 "ff/66/9b"
    print_osc4 4 "47/13/97"
    print_osc4 5 "69/16/b6"
    print_osc4 6 "21/55/d6"
    print_osc4 7 "31/31/45"
    print_osc4 8 "7c/7c/98"
    print_osc4 9 "f4/39/79"
    print_osc4 10 "00/73/a8"
    print_osc4 11 "ff/66/9b"
    print_osc4 12 "47/13/97"
    print_osc4 13 "69/16/b6"
    print_osc4 14 "21/55/d6"
    print_osc4 15 "1a/1a/2f"

    print_osc_rgb 10 "31/31/45"
    print_osc_rgb 11 "ef/ef/ef"
    print_osc_rgb 12 "31/31/45"
    print_osc_rgb 17 "22/22/3a"
    print_osc_rgb 19 "be/be/d2"
}

do_linux() {
    print_linux 0 "#efefef"
    print_linux 1 "#f43979"
    print_linux 2 "#0073a8"
    print_linux 3 "#ff669b"
    print_linux 4 "#471397"
    print_linux 5 "#6916b6"
    print_linux 6 "#2155d6"
    print_linux 7 "#313145"
    print_linux 8 "#7c7c98"
    print_linux 9 "#f43979"
    print_linux 10 "#0073a8"
    print_linux 11 "#ff669b"
    print_linux 12 "#471397"
    print_linux 13 "#6916b6"
    print_linux 14 "#2155d6"
    print_linux 15 "#1a1a2f"
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
