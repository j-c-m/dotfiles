#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base4Tone Classic F
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
    print_osc4 0 "1f/21/1c"
    print_osc4 1 "0b/88/d0"
    print_osc4 2 "a4/8f/04"
    print_osc4 3 "dc/c2/18"
    print_osc4 4 "8b/cf/17"
    print_osc4 5 "15/bc/52"
    print_osc4 6 "c1/aa/15"
    print_osc4 7 "eb/ee/e8"
    print_osc4 8 "0b/0d/07"
    print_osc4 9 "47/b5/f5"
    print_osc4 10 "e6/ca/1a"
    print_osc4 11 "f2/e5/8c"
    print_osc4 12 "dd/f6/b1"
    print_osc4 13 "18/d8/5e"
    print_osc4 14 "cd/f2/8c"
    print_osc4 15 "f8/f9/f6"

    print_osc_rgb 10 "9b/a1/91"
    print_osc_rgb 11 "1f/21/1c"
    print_osc_rgb 12 "85/82/6f"
    print_osc_rgb 17 "9b/a1/91"
    print_osc_rgb 19 "1f/21/1c"
}

do_linux() {
    print_linux 0 "#1f211c"
    print_linux 1 "#0b88d0"
    print_linux 2 "#a48f04"
    print_linux 3 "#dcc218"
    print_linux 4 "#8bcf17"
    print_linux 5 "#15bc52"
    print_linux 6 "#c1aa15"
    print_linux 7 "#9ba191"
    print_linux 8 "#0b0d07"
    print_linux 9 "#47b5f5"
    print_linux 10 "#e6ca1a"
    print_linux 11 "#f2e58c"
    print_linux 12 "#ddf6b1"
    print_linux 13 "#18d85e"
    print_linux 14 "#cdf28c"
    print_linux 15 "#f8f9f6"
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
