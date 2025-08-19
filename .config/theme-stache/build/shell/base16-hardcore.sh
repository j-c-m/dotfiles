#!/usr/bin/env bash

# Source:   base16
# Theme:    Hardcore
# Author:   Chris Caller
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
    print_osc4 0 "21/21/21"
    print_osc4 1 "f9/26/72"
    print_osc4 2 "a6/e2/2e"
    print_osc4 3 "e6/db/74"
    print_osc4 4 "66/d9/ef"
    print_osc4 5 "9e/6f/fe"
    print_osc4 6 "70/83/87"
    print_osc4 7 "cd/cd/cd"
    print_osc4 8 "4a/4a/4a"
    print_osc4 9 "f9/26/72"
    print_osc4 10 "a6/e2/2e"
    print_osc4 11 "e6/db/74"
    print_osc4 12 "66/d9/ef"
    print_osc4 13 "9e/6f/fe"
    print_osc4 14 "70/83/87"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "cd/cd/cd"
    print_osc_rgb 11 "21/21/21"
    print_osc_rgb 12 "cd/cd/cd"
    print_osc_rgb 17 "e5/e5/e5"
    print_osc_rgb 19 "30/30/30"
}

do_linux() {
    print_linux 0 "#212121"
    print_linux 1 "#f92672"
    print_linux 2 "#a6e22e"
    print_linux 3 "#e6db74"
    print_linux 4 "#66d9ef"
    print_linux 5 "#9e6ffe"
    print_linux 6 "#708387"
    print_linux 7 "#cdcdcd"
    print_linux 8 "#4a4a4a"
    print_linux 9 "#f92672"
    print_linux 10 "#a6e22e"
    print_linux 11 "#e6db74"
    print_linux 12 "#66d9ef"
    print_linux 13 "#9e6ffe"
    print_linux 14 "#708387"
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
