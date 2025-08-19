#!/usr/bin/env bash

# Source:   iterm
# Theme:    tokyonight_moon
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
    print_osc4 0 "1b/1c/2b"
    print_osc4 1 "ff/75/7f"
    print_osc4 2 "c3/e8/8d"
    print_osc4 3 "ff/c7/77"
    print_osc4 4 "82/aa/ff"
    print_osc4 5 "c0/99/ff"
    print_osc4 6 "86/e1/fc"
    print_osc4 7 "82/8b/b8"
    print_osc4 8 "44/4a/73"
    print_osc4 9 "ff/75/7f"
    print_osc4 10 "c3/e8/8d"
    print_osc4 11 "ff/c7/77"
    print_osc4 12 "82/aa/ff"
    print_osc4 13 "c0/99/ff"
    print_osc4 14 "86/e1/fc"
    print_osc4 15 "c8/d3/f5"

    print_osc_rgb 10 "c8/d3/f5"
    print_osc_rgb 11 "21/24/35"
    print_osc_rgb 12 "c8/d3/f5"
    print_osc_rgb 17 "2c/3f/76"
    print_osc_rgb 19 "c8/d3/f5"
}

do_linux() {
    print_linux 0 "#1b1c2b"
    print_linux 1 "#ff757f"
    print_linux 2 "#c3e88d"
    print_linux 3 "#ffc777"
    print_linux 4 "#82aaff"
    print_linux 5 "#c099ff"
    print_linux 6 "#86e1fc"
    print_linux 7 "#c8d3f5"
    print_linux 8 "#444a73"
    print_linux 9 "#ff757f"
    print_linux 10 "#c3e88d"
    print_linux 11 "#ffc777"
    print_linux 12 "#82aaff"
    print_linux 13 "#c099ff"
    print_linux 14 "#86e1fc"
    print_linux 15 "#c8d3f5"
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
