#!/usr/bin/env bash

# Source:   gogh
# Theme:    Argonaut
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
    print_osc4 0 "23/23/23"
    print_osc4 1 "ff/00/0f"
    print_osc4 2 "8c/e1/0b"
    print_osc4 3 "ff/b9/00"
    print_osc4 4 "00/8d/f8"
    print_osc4 5 "6d/43/a6"
    print_osc4 6 "00/d8/eb"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "44/44/44"
    print_osc4 9 "ff/27/40"
    print_osc4 10 "ab/e1/5b"
    print_osc4 11 "ff/d2/42"
    print_osc4 12 "00/92/ff"
    print_osc4 13 "9a/5f/eb"
    print_osc4 14 "67/ff/f0"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ff/fa/f4"
    print_osc_rgb 11 "0e/10/19"
    print_osc_rgb 12 "ff/fa/f4"
    print_osc_rgb 17 "ff/fa/f4"
    print_osc_rgb 19 "0e/10/19"
}

do_linux() {
    print_linux 0 "#232323"
    print_linux 1 "#ff000f"
    print_linux 2 "#8ce10b"
    print_linux 3 "#ffb900"
    print_linux 4 "#008df8"
    print_linux 5 "#6d43a6"
    print_linux 6 "#00d8eb"
    print_linux 7 "#fffaf4"
    print_linux 8 "#444444"
    print_linux 9 "#ff2740"
    print_linux 10 "#abe15b"
    print_linux 11 "#ffd242"
    print_linux 12 "#0092ff"
    print_linux 13 "#9a5feb"
    print_linux 14 "#67fff0"
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
