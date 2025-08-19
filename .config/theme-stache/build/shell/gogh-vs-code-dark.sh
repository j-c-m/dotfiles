#!/usr/bin/env bash

# Source:   gogh
# Theme:    Vs Code Dark+
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
    print_osc4 0 "6a/78/7a"
    print_osc4 1 "e9/65/3b"
    print_osc4 2 "39/e9/a8"
    print_osc4 3 "e5/b6/84"
    print_osc4 4 "44/aa/e6"
    print_osc4 5 "e1/75/99"
    print_osc4 6 "3d/d5/e7"
    print_osc4 7 "c3/dd/e1"
    print_osc4 8 "59/84/89"
    print_osc4 9 "e6/50/29"
    print_osc4 10 "00/ff/9a"
    print_osc4 11 "e8/94/40"
    print_osc4 12 "00/9a/fb"
    print_osc4 13 "ff/57/8f"
    print_osc4 14 "5f/ff/ff"
    print_osc4 15 "d9/fb/ff"

    print_osc_rgb 10 "cc/cc/cc"
    print_osc_rgb 11 "1e/1e/1e"
    print_osc_rgb 12 "cc/cc/cc"
    print_osc_rgb 17 "cc/cc/cc"
    print_osc_rgb 19 "1e/1e/1e"
}

do_linux() {
    print_linux 0 "#6a787a"
    print_linux 1 "#e9653b"
    print_linux 2 "#39e9a8"
    print_linux 3 "#e5b684"
    print_linux 4 "#44aae6"
    print_linux 5 "#e17599"
    print_linux 6 "#3dd5e7"
    print_linux 7 "#cccccc"
    print_linux 8 "#598489"
    print_linux 9 "#e65029"
    print_linux 10 "#00ff9a"
    print_linux 11 "#e89440"
    print_linux 12 "#009afb"
    print_linux 13 "#ff578f"
    print_linux 14 "#5fffff"
    print_linux 15 "#d9fbff"
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
