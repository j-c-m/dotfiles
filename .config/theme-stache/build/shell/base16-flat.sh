#!/usr/bin/env bash

# Source:   base16
# Theme:    Flat
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
    print_osc4 0 "2c/3e/50"
    print_osc4 1 "e7/4c/3c"
    print_osc4 2 "2e/cc/71"
    print_osc4 3 "f1/c4/0f"
    print_osc4 4 "34/98/db"
    print_osc4 5 "9b/59/b6"
    print_osc4 6 "1a/bc/9c"
    print_osc4 7 "e0/e0/e0"
    print_osc4 8 "95/a5/a6"
    print_osc4 9 "e7/4c/3c"
    print_osc4 10 "2e/cc/71"
    print_osc4 11 "f1/c4/0f"
    print_osc4 12 "34/98/db"
    print_osc4 13 "9b/59/b6"
    print_osc4 14 "1a/bc/9c"
    print_osc4 15 "ec/f0/f1"

    print_osc_rgb 10 "e0/e0/e0"
    print_osc_rgb 11 "2c/3e/50"
    print_osc_rgb 12 "e0/e0/e0"
    print_osc_rgb 17 "f5/f5/f5"
    print_osc_rgb 19 "34/49/5e"
}

do_linux() {
    print_linux 0 "#2c3e50"
    print_linux 1 "#e74c3c"
    print_linux 2 "#2ecc71"
    print_linux 3 "#f1c40f"
    print_linux 4 "#3498db"
    print_linux 5 "#9b59b6"
    print_linux 6 "#1abc9c"
    print_linux 7 "#e0e0e0"
    print_linux 8 "#95a5a6"
    print_linux 9 "#e74c3c"
    print_linux 10 "#2ecc71"
    print_linux 11 "#f1c40f"
    print_linux 12 "#3498db"
    print_linux 13 "#9b59b6"
    print_linux 14 "#1abc9c"
    print_linux 15 "#ecf0f1"
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
