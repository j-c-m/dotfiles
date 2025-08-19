#!/usr/bin/env bash

# Source:   iterm
# Theme:    Monokai Remastered
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
    print_osc4 0 "19/19/19"
    print_osc4 1 "f3/00/5f"
    print_osc4 2 "97/e0/23"
    print_osc4 3 "fd/97/1f"
    print_osc4 4 "9c/64/fe"
    print_osc4 5 "f3/00/5f"
    print_osc4 6 "57/d1/ea"
    print_osc4 7 "c4/c4/b5"
    print_osc4 8 "61/5e/4b"
    print_osc4 9 "f3/00/5f"
    print_osc4 10 "97/e0/23"
    print_osc4 11 "df/d5/61"
    print_osc4 12 "9c/64/fe"
    print_osc4 13 "f3/00/5f"
    print_osc4 14 "57/d1/ea"
    print_osc4 15 "f6/f6/ee"

    print_osc_rgb 10 "d8/d8/d8"
    print_osc_rgb 11 "0b/0b/0b"
    print_osc_rgb 12 "fc/97/1e"
    print_osc_rgb 17 "34/34/34"
    print_osc_rgb 19 "ff/fe/fe"
}

do_linux() {
    print_linux 0 "#191919"
    print_linux 1 "#f3005f"
    print_linux 2 "#97e023"
    print_linux 3 "#fd971f"
    print_linux 4 "#9c64fe"
    print_linux 5 "#f3005f"
    print_linux 6 "#57d1ea"
    print_linux 7 "#d8d8d8"
    print_linux 8 "#615e4b"
    print_linux 9 "#f3005f"
    print_linux 10 "#97e023"
    print_linux 11 "#dfd561"
    print_linux 12 "#9c64fe"
    print_linux 13 "#f3005f"
    print_linux 14 "#57d1ea"
    print_linux 15 "#f6f6ee"
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
