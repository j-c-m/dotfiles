#!/usr/bin/env bash

# Source:   iterm
# Theme:    Calamity
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
    print_osc4 0 "2f/28/33"
    print_osc4 1 "fc/64/4d"
    print_osc4 2 "a5/f6/9c"
    print_osc4 3 "e9/d7/a5"
    print_osc4 4 "3b/79/c7"
    print_osc4 5 "f9/26/72"
    print_osc4 6 "74/d3/de"
    print_osc4 7 "d5/ce/d9"
    print_osc4 8 "7e/6c/88"
    print_osc4 9 "fc/64/4d"
    print_osc4 10 "a5/f6/9c"
    print_osc4 11 "e9/d7/a5"
    print_osc4 12 "3b/79/c7"
    print_osc4 13 "f9/26/72"
    print_osc4 14 "74/d3/de"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "d5/ce/d9"
    print_osc_rgb 11 "2f/28/33"
    print_osc_rgb 12 "d5/ce/d9"
    print_osc_rgb 17 "7e/6c/88"
    print_osc_rgb 19 "d5/ce/d9"
}

do_linux() {
    print_linux 0 "#2f2833"
    print_linux 1 "#fc644d"
    print_linux 2 "#a5f69c"
    print_linux 3 "#e9d7a5"
    print_linux 4 "#3b79c7"
    print_linux 5 "#f92672"
    print_linux 6 "#74d3de"
    print_linux 7 "#d5ced9"
    print_linux 8 "#7e6c88"
    print_linux 9 "#fc644d"
    print_linux 10 "#a5f69c"
    print_linux 11 "#e9d7a5"
    print_linux 12 "#3b79c7"
    print_linux 13 "#f92672"
    print_linux 14 "#74d3de"
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
