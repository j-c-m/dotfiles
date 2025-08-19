#!/usr/bin/env bash

# Source:   gogh
# Theme:    Tempus Summer
# Author:   Protesilaos Stavrou (https://protesilaos.com)
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
    print_osc4 0 "20/2c/3d"
    print_osc4 1 "fe/6f/70"
    print_osc4 2 "4e/b0/75"
    print_osc4 3 "ba/9a/0a"
    print_osc4 4 "60/a1/e6"
    print_osc4 5 "d2/85/ad"
    print_osc4 6 "3d/ae/9f"
    print_osc4 7 "94/9c/bf"
    print_osc4 8 "39/30/4f"
    print_osc4 9 "ec/7f/4f"
    print_osc4 10 "5b/af/4f"
    print_osc4 11 "be/98/1f"
    print_osc4 12 "85/99/ef"
    print_osc4 13 "cc/82/d7"
    print_osc4 14 "2a/ac/bf"
    print_osc4 15 "a0/ab/ae"

    print_osc_rgb 10 "a0/ab/ae"
    print_osc_rgb 11 "20/2c/3d"
    print_osc_rgb 12 "a0/ab/ae"
    print_osc_rgb 17 "a0/ab/ae"
    print_osc_rgb 19 "20/2c/3d"
}

do_linux() {
    print_linux 0 "#202c3d"
    print_linux 1 "#fe6f70"
    print_linux 2 "#4eb075"
    print_linux 3 "#ba9a0a"
    print_linux 4 "#60a1e6"
    print_linux 5 "#d285ad"
    print_linux 6 "#3dae9f"
    print_linux 7 "#a0abae"
    print_linux 8 "#39304f"
    print_linux 9 "#ec7f4f"
    print_linux 10 "#5baf4f"
    print_linux 11 "#be981f"
    print_linux 12 "#8599ef"
    print_linux 13 "#cc82d7"
    print_linux 14 "#2aacbf"
    print_linux 15 "#a0abae"
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
