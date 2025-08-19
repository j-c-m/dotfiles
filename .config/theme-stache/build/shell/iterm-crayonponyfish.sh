#!/usr/bin/env bash

# Source:   iterm
# Theme:    CrayonPonyFish
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
    print_osc4 0 "2a/1a/1c"
    print_osc4 1 "90/00/2a"
    print_osc4 2 "57/95/23"
    print_osc4 3 "aa/30/1b"
    print_osc4 4 "8b/87/af"
    print_osc4 5 "68/2e/50"
    print_osc4 6 "e8/a7/66"
    print_osc4 7 "68/52/59"
    print_osc4 8 "3c/2a/2e"
    print_osc4 9 "c5/24/5c"
    print_osc4 10 "8d/ff/56"
    print_osc4 11 "c7/37/1d"
    print_osc4 12 "cf/c9/ff"
    print_osc4 13 "fb/6c/b9"
    print_osc4 14 "ff/ce/ae"
    print_osc4 15 "af/94/9d"

    print_osc_rgb 10 "68/52/59"
    print_osc_rgb 11 "14/06/07"
    print_osc_rgb 12 "68/52/59"
    print_osc_rgb 17 "2a/1a/1c"
    print_osc_rgb 19 "69/52/59"
}

do_linux() {
    print_linux 0 "#2a1a1c"
    print_linux 1 "#90002a"
    print_linux 2 "#579523"
    print_linux 3 "#aa301b"
    print_linux 4 "#8b87af"
    print_linux 5 "#682e50"
    print_linux 6 "#e8a766"
    print_linux 7 "#685259"
    print_linux 8 "#3c2a2e"
    print_linux 9 "#c5245c"
    print_linux 10 "#8dff56"
    print_linux 11 "#c7371d"
    print_linux 12 "#cfc9ff"
    print_linux 13 "#fb6cb9"
    print_linux 14 "#ffceae"
    print_linux 15 "#af949d"
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
