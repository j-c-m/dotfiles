#!/usr/bin/env bash

# Source:   iterm
# Theme:    Monokai Pro Machine
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "27/30/36"
    print_osc4 1 "ff/6d/7e"
    print_osc4 2 "a1/e5/7b"
    print_osc4 3 "ff/ec/71"
    print_osc4 4 "ff/b2/70"
    print_osc4 5 "b9/a0/f7"
    print_osc4 6 "7b/d4/f0"
    print_osc4 7 "f1/ff/fb"
    print_osc4 8 "6a/75/78"
    print_osc4 9 "ff/6d/7e"
    print_osc4 10 "a1/e5/7b"
    print_osc4 11 "ff/ec/71"
    print_osc4 12 "ff/b2/70"
    print_osc4 13 "b9/a0/f7"
    print_osc4 14 "7b/d4/f0"
    print_osc4 15 "f1/ff/fb"

    print_osc_rgb 10 "f1/ff/fb"
    print_osc_rgb 11 "27/30/36"
    print_osc_rgb 12 "b8/c4/c3"
    print_osc_rgb 17 "53/5e/62"
    print_osc_rgb 19 "f1/ff/fb"
}

do_linux() {
    print_linux 0 "#273036"
    print_linux 1 "#ff6d7e"
    print_linux 2 "#a1e57b"
    print_linux 3 "#ffec71"
    print_linux 4 "#ffb270"
    print_linux 5 "#b9a0f7"
    print_linux 6 "#7bd4f0"
    print_linux 7 "#f1fffb"
    print_linux 8 "#6a7578"
    print_linux 9 "#ff6d7e"
    print_linux 10 "#a1e57b"
    print_linux 11 "#ffec71"
    print_linux 12 "#ffb270"
    print_linux 13 "#b9a0f7"
    print_linux 14 "#7bd4f0"
    print_linux 15 "#f1fffb"
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
