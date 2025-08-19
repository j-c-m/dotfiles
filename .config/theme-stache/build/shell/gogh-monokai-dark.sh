#!/usr/bin/env bash

# Source:   gogh
# Theme:    Monokai Dark
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
    print_osc4 0 "75/71/5e"
    print_osc4 1 "f9/26/72"
    print_osc4 2 "a6/e2/2e"
    print_osc4 3 "f4/bf/75"
    print_osc4 4 "66/d9/ef"
    print_osc4 5 "ae/81/ff"
    print_osc4 6 "2a/a1/98"
    print_osc4 7 "f9/f8/f5"
    print_osc4 8 "27/28/22"
    print_osc4 9 "f9/26/72"
    print_osc4 10 "a6/e2/2e"
    print_osc4 11 "f4/bf/75"
    print_osc4 12 "66/d9/ef"
    print_osc4 13 "ae/81/ff"
    print_osc4 14 "2a/a1/98"
    print_osc4 15 "f8/f8/f2"

    print_osc_rgb 10 "f8/f8/f2"
    print_osc_rgb 11 "27/28/22"
    print_osc_rgb 12 "f8/f8/f2"
    print_osc_rgb 17 "f8/f8/f2"
    print_osc_rgb 19 "27/28/22"
}

do_linux() {
    print_linux 0 "#75715e"
    print_linux 1 "#f92672"
    print_linux 2 "#a6e22e"
    print_linux 3 "#f4bf75"
    print_linux 4 "#66d9ef"
    print_linux 5 "#ae81ff"
    print_linux 6 "#2aa198"
    print_linux 7 "#f8f8f2"
    print_linux 8 "#272822"
    print_linux 9 "#f92672"
    print_linux 10 "#a6e22e"
    print_linux 11 "#f4bf75"
    print_linux 12 "#66d9ef"
    print_linux 13 "#ae81ff"
    print_linux 14 "#2aa198"
    print_linux 15 "#f8f8f2"
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
