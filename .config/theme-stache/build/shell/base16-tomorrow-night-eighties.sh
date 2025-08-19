#!/usr/bin/env bash

# Source:   base16
# Theme:    Tomorrow Night Eighties
# Author:   Chris Kempson (http://chriskempson.com)
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
    print_osc4 0 "2d/2d/2d"
    print_osc4 1 "f2/77/7a"
    print_osc4 2 "99/cc/99"
    print_osc4 3 "ff/cc/66"
    print_osc4 4 "66/99/cc"
    print_osc4 5 "cc/99/cc"
    print_osc4 6 "66/cc/cc"
    print_osc4 7 "cc/cc/cc"
    print_osc4 8 "99/99/99"
    print_osc4 9 "f2/77/7a"
    print_osc4 10 "99/cc/99"
    print_osc4 11 "ff/cc/66"
    print_osc4 12 "66/99/cc"
    print_osc4 13 "cc/99/cc"
    print_osc4 14 "66/cc/cc"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "cc/cc/cc"
    print_osc_rgb 11 "2d/2d/2d"
    print_osc_rgb 12 "cc/cc/cc"
    print_osc_rgb 17 "e0/e0/e0"
    print_osc_rgb 19 "39/39/39"
}

do_linux() {
    print_linux 0 "#2d2d2d"
    print_linux 1 "#f2777a"
    print_linux 2 "#99cc99"
    print_linux 3 "#ffcc66"
    print_linux 4 "#6699cc"
    print_linux 5 "#cc99cc"
    print_linux 6 "#66cccc"
    print_linux 7 "#cccccc"
    print_linux 8 "#999999"
    print_linux 9 "#f2777a"
    print_linux 10 "#99cc99"
    print_linux 11 "#ffcc66"
    print_linux 12 "#6699cc"
    print_linux 13 "#cc99cc"
    print_linux 14 "#66cccc"
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
