#!/usr/bin/env bash

# Source:   gogh
# Theme:    Monokai Pro Machine
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
    print_osc4 0 "27/31/36"
    print_osc4 1 "ff/6d/7e"
    print_osc4 2 "a2/e5/7b"
    print_osc4 3 "ff/ed/72"
    print_osc4 4 "ff/b2/70"
    print_osc4 5 "ba/a0/f8"
    print_osc4 6 "7c/d5/f1"
    print_osc4 7 "f2/ff/fc"
    print_osc4 8 "ad/b1/b4"
    print_osc4 9 "ff/6d/7e"
    print_osc4 10 "a2/e5/7b"
    print_osc4 11 "ff/ed/72"
    print_osc4 12 "ff/b2/70"
    print_osc4 13 "ba/a0/f8"
    print_osc4 14 "7c/d5/f1"
    print_osc4 15 "f2/ff/fc"

    print_osc_rgb 10 "f2/ff/fc"
    print_osc_rgb 11 "27/31/36"
    print_osc_rgb 12 "f2/ff/fc"
    print_osc_rgb 17 "f2/ff/fc"
    print_osc_rgb 19 "27/31/36"
}

do_linux() {
    print_linux 0 "#273136"
    print_linux 1 "#ff6d7e"
    print_linux 2 "#a2e57b"
    print_linux 3 "#ffed72"
    print_linux 4 "#ffb270"
    print_linux 5 "#baa0f8"
    print_linux 6 "#7cd5f1"
    print_linux 7 "#f2fffc"
    print_linux 8 "#adb1b4"
    print_linux 9 "#ff6d7e"
    print_linux 10 "#a2e57b"
    print_linux 11 "#ffed72"
    print_linux 12 "#ffb270"
    print_linux 13 "#baa0f8"
    print_linux 14 "#7cd5f1"
    print_linux 15 "#f2fffc"
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
