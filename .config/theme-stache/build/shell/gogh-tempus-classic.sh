#!/usr/bin/env bash

# Source:   gogh
# Theme:    Tempus Classic
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "23/23/23"
    print_osc4 1 "d4/82/3d"
    print_osc4 2 "8c/9e/3d"
    print_osc4 3 "b1/94/2b"
    print_osc4 4 "6e/9c/b0"
    print_osc4 5 "b5/8d/88"
    print_osc4 6 "6d/a2/80"
    print_osc4 7 "94/9d/9f"
    print_osc4 8 "31/2e/30"
    print_osc4 9 "d0/91/3d"
    print_osc4 10 "96/a4/2d"
    print_osc4 11 "a8/a0/30"
    print_osc4 12 "8e/9c/c0"
    print_osc4 13 "d5/88/88"
    print_osc4 14 "7a/a8/80"
    print_osc4 15 "ae/ad/af"

    print_osc_rgb 10 "ae/ad/af"
    print_osc_rgb 11 "23/23/23"
    print_osc_rgb 12 "ae/ad/af"
    print_osc_rgb 17 "ae/ad/af"
    print_osc_rgb 19 "23/23/23"
}

do_linux() {
    print_linux 0 "#232323"
    print_linux 1 "#d4823d"
    print_linux 2 "#8c9e3d"
    print_linux 3 "#b1942b"
    print_linux 4 "#6e9cb0"
    print_linux 5 "#b58d88"
    print_linux 6 "#6da280"
    print_linux 7 "#aeadaf"
    print_linux 8 "#312e30"
    print_linux 9 "#d0913d"
    print_linux 10 "#96a42d"
    print_linux 11 "#a8a030"
    print_linux 12 "#8e9cc0"
    print_linux 13 "#d58888"
    print_linux 14 "#7aa880"
    print_linux 15 "#aeadaf"
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
