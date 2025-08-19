#!/usr/bin/env bash

# Source:   base16
# Theme:    Material Vivid
# Author:   joshyrobot
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
    print_osc4 0 "20/21/24"
    print_osc4 1 "f4/43/36"
    print_osc4 2 "00/e6/76"
    print_osc4 3 "ff/eb/3b"
    print_osc4 4 "21/96/f3"
    print_osc4 5 "67/3a/b7"
    print_osc4 6 "00/bc/d4"
    print_osc4 7 "80/86/8b"
    print_osc4 8 "44/46/4d"
    print_osc4 9 "f4/43/36"
    print_osc4 10 "00/e6/76"
    print_osc4 11 "ff/eb/3b"
    print_osc4 12 "21/96/f3"
    print_osc4 13 "67/3a/b7"
    print_osc4 14 "00/bc/d4"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "80/86/8b"
    print_osc_rgb 11 "20/21/24"
    print_osc_rgb 12 "80/86/8b"
    print_osc_rgb 17 "9e/9e/9e"
    print_osc_rgb 19 "27/29/2c"
}

do_linux() {
    print_linux 0 "#202124"
    print_linux 1 "#f44336"
    print_linux 2 "#00e676"
    print_linux 3 "#ffeb3b"
    print_linux 4 "#2196f3"
    print_linux 5 "#673ab7"
    print_linux 6 "#00bcd4"
    print_linux 7 "#80868b"
    print_linux 8 "#44464d"
    print_linux 9 "#f44336"
    print_linux 10 "#00e676"
    print_linux 11 "#ffeb3b"
    print_linux 12 "#2196f3"
    print_linux 13 "#673ab7"
    print_linux 14 "#00bcd4"
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
