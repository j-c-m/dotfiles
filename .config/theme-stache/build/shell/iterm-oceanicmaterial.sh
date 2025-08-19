#!/usr/bin/env bash

# Source:   iterm
# Theme:    OceanicMaterial
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "ee/2a/29"
    print_osc4 2 "3f/a3/3f"
    print_osc4 3 "fe/e9/2e"
    print_osc4 4 "1d/80/ef"
    print_osc4 5 "88/00/a0"
    print_osc4 6 "16/ae/c9"
    print_osc4 7 "a4/a4/a4"
    print_osc4 8 "76/76/76"
    print_osc4 9 "dc/5b/60"
    print_osc4 10 "70/be/71"
    print_osc4 11 "fe/f0/63"
    print_osc4 12 "53/a4/f3"
    print_osc4 13 "a9/4d/bb"
    print_osc4 14 "42/c6/d9"
    print_osc4 15 "ff/fe/fe"

    print_osc_rgb 10 "c2/c8/d7"
    print_osc_rgb 11 "1c/26/2b"
    print_osc_rgb 12 "b3/b8/c3"
    print_osc_rgb 17 "6d/c2/b8"
    print_osc_rgb 19 "c2/c8/d7"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#ee2a29"
    print_linux 2 "#3fa33f"
    print_linux 3 "#fee92e"
    print_linux 4 "#1d80ef"
    print_linux 5 "#8800a0"
    print_linux 6 "#16aec9"
    print_linux 7 "#c2c8d7"
    print_linux 8 "#767676"
    print_linux 9 "#dc5b60"
    print_linux 10 "#70be71"
    print_linux 11 "#fef063"
    print_linux 12 "#53a4f3"
    print_linux 13 "#a94dbb"
    print_linux 14 "#42c6d9"
    print_linux 15 "#fffefe"
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
