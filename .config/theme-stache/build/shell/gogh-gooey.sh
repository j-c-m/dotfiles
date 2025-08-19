#!/usr/bin/env bash

# Source:   gogh
# Theme:    Gooey
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "00/00/09"
    print_osc4 1 "bb/4f/6c"
    print_osc4 2 "72/cc/ae"
    print_osc4 3 "c6/5e/3d"
    print_osc4 4 "58/b6/ca"
    print_osc4 5 "64/88/c4"
    print_osc4 6 "8d/84/c6"
    print_osc4 7 "85/88/93"
    print_osc4 8 "1f/22/2d"
    print_osc4 9 "ee/82/9f"
    print_osc4 10 "a5/ff/e1"
    print_osc4 11 "f9/91/70"
    print_osc4 12 "8b/e9/fd"
    print_osc4 13 "97/bb/f7"
    print_osc4 14 "c0/b7/f9"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "eb/ee/f9"
    print_osc_rgb 11 "0d/10/1b"
    print_osc_rgb 12 "eb/ee/f9"
    print_osc_rgb 17 "eb/ee/f9"
    print_osc_rgb 19 "0d/10/1b"
}

do_linux() {
    print_linux 0 "#000009"
    print_linux 1 "#bb4f6c"
    print_linux 2 "#72ccae"
    print_linux 3 "#c65e3d"
    print_linux 4 "#58b6ca"
    print_linux 5 "#6488c4"
    print_linux 6 "#8d84c6"
    print_linux 7 "#ebeef9"
    print_linux 8 "#1f222d"
    print_linux 9 "#ee829f"
    print_linux 10 "#a5ffe1"
    print_linux 11 "#f99170"
    print_linux 12 "#8be9fd"
    print_linux 13 "#97bbf7"
    print_linux 14 "#c0b7f9"
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
