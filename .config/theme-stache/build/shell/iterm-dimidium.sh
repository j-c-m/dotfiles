#!/usr/bin/env bash

# Source:   iterm
# Theme:    Dimidium
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "cf/49/4c"
    print_osc4 2 "60/b4/42"
    print_osc4 3 "db/9c/11"
    print_osc4 4 "05/75/d8"
    print_osc4 5 "af/5e/d2"
    print_osc4 6 "1d/b6/bb"
    print_osc4 7 "ba/b7/b6"
    print_osc4 8 "80/7e/7d"
    print_osc4 9 "ff/64/3b"
    print_osc4 10 "37/e5/7b"
    print_osc4 11 "fc/cd/1a"
    print_osc4 12 "68/8d/fd"
    print_osc4 13 "ed/6f/e9"
    print_osc4 14 "32/e0/fb"
    print_osc4 15 "d2/d7/d8"

    print_osc_rgb 10 "ba/b7/b6"
    print_osc_rgb 11 "14/14/14"
    print_osc_rgb 12 "37/e5/7b"
    print_osc_rgb 17 "8c/b7/e4"
    print_osc_rgb 19 "14/14/14"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#cf494c"
    print_linux 2 "#60b442"
    print_linux 3 "#db9c11"
    print_linux 4 "#0575d8"
    print_linux 5 "#af5ed2"
    print_linux 6 "#1db6bb"
    print_linux 7 "#bab7b6"
    print_linux 8 "#807e7d"
    print_linux 9 "#ff643b"
    print_linux 10 "#37e57b"
    print_linux 11 "#fccd1a"
    print_linux 12 "#688dfd"
    print_linux 13 "#ed6fe9"
    print_linux 14 "#32e0fb"
    print_linux 15 "#d2d7d8"
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
