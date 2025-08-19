#!/usr/bin/env bash

# Source:   gogh
# Theme:    Relaxed
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
    print_osc4 0 "15/15/15"
    print_osc4 1 "bc/56/53"
    print_osc4 2 "90/9d/63"
    print_osc4 3 "eb/c1/7a"
    print_osc4 4 "6a/87/99"
    print_osc4 5 "b0/66/98"
    print_osc4 6 "c9/df/ff"
    print_osc4 7 "d9/d9/d9"
    print_osc4 8 "63/63/63"
    print_osc4 9 "bc/56/53"
    print_osc4 10 "a0/ac/77"
    print_osc4 11 "eb/c1/7a"
    print_osc4 12 "7e/aa/c7"
    print_osc4 13 "b0/66/98"
    print_osc4 14 "ac/bb/d0"
    print_osc4 15 "f7/f7/f7"

    print_osc_rgb 10 "d9/d9/d9"
    print_osc_rgb 11 "35/3a/44"
    print_osc_rgb 12 "d9/d9/d9"
    print_osc_rgb 17 "d9/d9/d9"
    print_osc_rgb 19 "35/3a/44"
}

do_linux() {
    print_linux 0 "#151515"
    print_linux 1 "#bc5653"
    print_linux 2 "#909d63"
    print_linux 3 "#ebc17a"
    print_linux 4 "#6a8799"
    print_linux 5 "#b06698"
    print_linux 6 "#c9dfff"
    print_linux 7 "#d9d9d9"
    print_linux 8 "#636363"
    print_linux 9 "#bc5653"
    print_linux 10 "#a0ac77"
    print_linux 11 "#ebc17a"
    print_linux 12 "#7eaac7"
    print_linux 13 "#b06698"
    print_linux 14 "#acbbd0"
    print_linux 15 "#f7f7f7"
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
