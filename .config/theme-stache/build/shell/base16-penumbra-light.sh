#!/usr/bin/env bash

# Source:   base16
# Theme:    Penumbra Light
# Author:   Zachary Weiss (https://github.com/zacharyweiss)
# Variant:  light

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
    print_osc4 0 "ff/fd/fb"
    print_osc4 1 "ca/73/6c"
    print_osc4 2 "47/a4/77"
    print_osc4 3 "8d/97/41"
    print_osc4 4 "57/94/d0"
    print_osc4 5 "94/81/cc"
    print_osc4 6 "00/a2/af"
    print_osc4 7 "63/63/63"
    print_osc4 8 "be/be/be"
    print_osc4 9 "ca/73/6c"
    print_osc4 10 "47/a4/77"
    print_osc4 11 "8d/97/41"
    print_osc4 12 "57/94/d0"
    print_osc4 13 "94/81/cc"
    print_osc4 14 "00/a2/af"
    print_osc4 15 "24/27/2b"

    print_osc_rgb 10 "63/63/63"
    print_osc_rgb 11 "ff/fd/fb"
    print_osc_rgb 12 "63/63/63"
    print_osc_rgb 17 "30/33/38"
    print_osc_rgb 19 "ff/f7/ed"
}

do_linux() {
    print_linux 0 "#fffdfb"
    print_linux 1 "#ca736c"
    print_linux 2 "#47a477"
    print_linux 3 "#8d9741"
    print_linux 4 "#5794d0"
    print_linux 5 "#9481cc"
    print_linux 6 "#00a2af"
    print_linux 7 "#636363"
    print_linux 8 "#bebebe"
    print_linux 9 "#ca736c"
    print_linux 10 "#47a477"
    print_linux 11 "#8d9741"
    print_linux 12 "#5794d0"
    print_linux 13 "#9481cc"
    print_linux 14 "#00a2af"
    print_linux 15 "#24272b"
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
