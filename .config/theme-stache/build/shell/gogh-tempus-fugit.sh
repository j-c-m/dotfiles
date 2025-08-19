#!/usr/bin/env bash

# Source:   gogh
# Theme:    Tempus Fugit
# Author:   Protesilaos Stavrou (https://protesilaos.com)
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
    print_osc4 0 "4d/59/5f"
    print_osc4 1 "c6/1a/14"
    print_osc4 2 "35/72/00"
    print_osc4 3 "82/5e/00"
    print_osc4 4 "16/66/b0"
    print_osc4 5 "a8/38/84"
    print_osc4 6 "00/70/72"
    print_osc4 7 "ef/e6/e4"
    print_osc4 8 "79/62/71"
    print_osc4 9 "b9/3f/1a"
    print_osc4 10 "43/75/20"
    print_osc4 11 "98/59/00"
    print_osc4 12 "48/5a/df"
    print_osc4 13 "a2/34/c0"
    print_osc4 14 "00/75/6a"
    print_osc4 15 "ff/f5/f3"

    print_osc_rgb 10 "4d/59/5f"
    print_osc_rgb 11 "ff/f5/f3"
    print_osc_rgb 12 "4d/59/5f"
    print_osc_rgb 17 "4d/59/5f"
    print_osc_rgb 19 "ff/f5/f3"
}

do_linux() {
    print_linux 0 "#4d595f"
    print_linux 1 "#c61a14"
    print_linux 2 "#357200"
    print_linux 3 "#825e00"
    print_linux 4 "#1666b0"
    print_linux 5 "#a83884"
    print_linux 6 "#007072"
    print_linux 7 "#4d595f"
    print_linux 8 "#796271"
    print_linux 9 "#b93f1a"
    print_linux 10 "#437520"
    print_linux 11 "#985900"
    print_linux 12 "#485adf"
    print_linux 13 "#a234c0"
    print_linux 14 "#00756a"
    print_linux 15 "#fff5f3"
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
