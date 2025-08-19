#!/usr/bin/env bash

# Source:   gogh
# Theme:    Nord Light
# Author:   
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "00/3b/4e"
    print_osc4 1 "e6/45/69"
    print_osc4 2 "06/9f/5f"
    print_osc4 3 "da/b7/52"
    print_osc4 4 "43/9e/cf"
    print_osc4 5 "d9/61/dc"
    print_osc4 6 "00/b1/be"
    print_osc4 7 "b3/b3/b3"
    print_osc4 8 "3e/89/a1"
    print_osc4 9 "e4/85/9a"
    print_osc4 10 "a2/cc/a1"
    print_osc4 11 "e1/e3/87"
    print_osc4 12 "6f/bb/e2"
    print_osc4 13 "e5/86/e7"
    print_osc4 14 "96/dc/da"
    print_osc4 15 "de/de/de"

    print_osc_rgb 10 "00/4f/7c"
    print_osc_rgb 11 "eb/ea/f2"
    print_osc_rgb 12 "43/9e/cf"
    print_osc_rgb 17 "00/4f/7c"
    print_osc_rgb 19 "eb/ea/f2"
}

do_linux() {
    print_linux 0 "#003b4e"
    print_linux 1 "#e64569"
    print_linux 2 "#069f5f"
    print_linux 3 "#dab752"
    print_linux 4 "#439ecf"
    print_linux 5 "#d961dc"
    print_linux 6 "#00b1be"
    print_linux 7 "#004f7c"
    print_linux 8 "#3e89a1"
    print_linux 9 "#e4859a"
    print_linux 10 "#a2cca1"
    print_linux 11 "#e1e387"
    print_linux 12 "#6fbbe2"
    print_linux 13 "#e586e7"
    print_linux 14 "#96dcda"
    print_linux 15 "#dedede"
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
