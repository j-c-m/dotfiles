#!/usr/bin/env bash

# Source:   gogh
# Theme:    Hardcore
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
    print_osc4 0 "1b/1d/1e"
    print_osc4 1 "f9/26/72"
    print_osc4 2 "a6/e2/2e"
    print_osc4 3 "fd/97/1f"
    print_osc4 4 "66/d9/ef"
    print_osc4 5 "9e/6f/fe"
    print_osc4 6 "5e/71/75"
    print_osc4 7 "cc/cc/c6"
    print_osc4 8 "50/53/54"
    print_osc4 9 "ff/66/9d"
    print_osc4 10 "be/ed/5f"
    print_osc4 11 "e6/db/74"
    print_osc4 12 "66/d9/ef"
    print_osc4 13 "9e/6f/fe"
    print_osc4 14 "a3/ba/bf"
    print_osc4 15 "f8/f8/f2"

    print_osc_rgb 10 "a0/a0/a0"
    print_osc_rgb 11 "12/12/12"
    print_osc_rgb 12 "a0/a0/a0"
    print_osc_rgb 17 "a0/a0/a0"
    print_osc_rgb 19 "12/12/12"
}

do_linux() {
    print_linux 0 "#1b1d1e"
    print_linux 1 "#f92672"
    print_linux 2 "#a6e22e"
    print_linux 3 "#fd971f"
    print_linux 4 "#66d9ef"
    print_linux 5 "#9e6ffe"
    print_linux 6 "#5e7175"
    print_linux 7 "#a0a0a0"
    print_linux 8 "#505354"
    print_linux 9 "#ff669d"
    print_linux 10 "#beed5f"
    print_linux 11 "#e6db74"
    print_linux 12 "#66d9ef"
    print_linux 13 "#9e6ffe"
    print_linux 14 "#a3babf"
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
