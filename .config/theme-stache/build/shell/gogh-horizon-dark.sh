#!/usr/bin/env bash

# Source:   gogh
# Theme:    Horizon Dark
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "16/16/1c"
    print_osc4 1 "e9/56/78"
    print_osc4 2 "29/d3/98"
    print_osc4 3 "fa/b7/95"
    print_osc4 4 "26/bb/d9"
    print_osc4 5 "ee/64/ae"
    print_osc4 6 "59/e3/e3"
    print_osc4 7 "fa/da/d1"
    print_osc4 8 "23/25/30"
    print_osc4 9 "ec/6a/88"
    print_osc4 10 "3f/da/a4"
    print_osc4 11 "fb/c3/a7"
    print_osc4 12 "3f/c6/de"
    print_osc4 13 "f0/75/b7"
    print_osc4 14 "6b/e6/e6"
    print_osc4 15 "fd/f0/ed"

    print_osc_rgb 10 "fd/f0/ed"
    print_osc_rgb 11 "1c/1e/26"
    print_osc_rgb 12 "fd/f0/ed"
    print_osc_rgb 17 "fd/f0/ed"
    print_osc_rgb 19 "1c/1e/26"
}

do_linux() {
    print_linux 0 "#16161c"
    print_linux 1 "#e95678"
    print_linux 2 "#29d398"
    print_linux 3 "#fab795"
    print_linux 4 "#26bbd9"
    print_linux 5 "#ee64ae"
    print_linux 6 "#59e3e3"
    print_linux 7 "#fdf0ed"
    print_linux 8 "#232530"
    print_linux 9 "#ec6a88"
    print_linux 10 "#3fdaa4"
    print_linux 11 "#fbc3a7"
    print_linux 12 "#3fc6de"
    print_linux 13 "#f075b7"
    print_linux 14 "#6be6e6"
    print_linux 15 "#fdf0ed"
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
