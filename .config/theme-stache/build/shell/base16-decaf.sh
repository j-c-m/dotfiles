#!/usr/bin/env bash

# Source:   base16
# Theme:    Decaf
# Author:   Alex Mirrington (https://github.com/alexmirrington)
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
    print_osc4 1 "ff/7f/7b"
    print_osc4 2 "be/da/78"
    print_osc4 3 "ff/d6/7c"
    print_osc4 4 "90/be/e1"
    print_osc4 5 "ef/b3/f7"
    print_osc4 6 "be/d6/ff"
    print_osc4 7 "cc/cc/cc"
    print_osc4 8 "77/77/77"
    print_osc4 9 "ff/7f/7b"
    print_osc4 10 "be/da/78"
    print_osc4 11 "ff/d6/7c"
    print_osc4 12 "90/be/e1"
    print_osc4 13 "ef/b3/f7"
    print_osc4 14 "be/d6/ff"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "cc/cc/cc"
    print_osc_rgb 11 "2d/2d/2d"
    print_osc_rgb 12 "cc/cc/cc"
    print_osc_rgb 17 "e0/e0/e0"
    print_osc_rgb 19 "39/39/39"
}

do_linux() {
    print_linux 0 "#2d2d2d"
    print_linux 1 "#ff7f7b"
    print_linux 2 "#beda78"
    print_linux 3 "#ffd67c"
    print_linux 4 "#90bee1"
    print_linux 5 "#efb3f7"
    print_linux 6 "#bed6ff"
    print_linux 7 "#cccccc"
    print_linux 8 "#777777"
    print_linux 9 "#ff7f7b"
    print_linux 10 "#beda78"
    print_linux 11 "#ffd67c"
    print_linux 12 "#90bee1"
    print_linux 13 "#efb3f7"
    print_linux 14 "#bed6ff"
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
