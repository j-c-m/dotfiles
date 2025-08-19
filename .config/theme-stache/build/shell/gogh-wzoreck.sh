#!/usr/bin/env bash

# Source:   gogh
# Theme:    Wzoreck
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
    print_osc4 0 "2e/34/36"
    print_osc4 1 "fc/63/86"
    print_osc4 2 "a9/dc/76"
    print_osc4 3 "fc/e9/4f"
    print_osc4 4 "fb/97/6b"
    print_osc4 5 "75/50/7b"
    print_osc4 6 "34/e2/e2"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "98/95/95"
    print_osc4 9 "fc/63/86"
    print_osc4 10 "a9/dc/76"
    print_osc4 11 "fc/e9/4f"
    print_osc4 12 "fb/97/6b"
    print_osc4 13 "ab/9d/f2"
    print_osc4 14 "34/e2/e2"
    print_osc4 15 "d1/d1/c0"

    print_osc_rgb 10 "fc/fc/fa"
    print_osc_rgb 11 "42/40/43"
    print_osc_rgb 12 "fc/fc/fa"
    print_osc_rgb 17 "fc/fc/fa"
    print_osc_rgb 19 "42/40/43"
}

do_linux() {
    print_linux 0 "#2e3436"
    print_linux 1 "#fc6386"
    print_linux 2 "#a9dc76"
    print_linux 3 "#fce94f"
    print_linux 4 "#fb976b"
    print_linux 5 "#75507b"
    print_linux 6 "#34e2e2"
    print_linux 7 "#fcfcfa"
    print_linux 8 "#989595"
    print_linux 9 "#fc6386"
    print_linux 10 "#a9dc76"
    print_linux 11 "#fce94f"
    print_linux 12 "#fb976b"
    print_linux 13 "#ab9df2"
    print_linux 14 "#34e2e2"
    print_linux 15 "#d1d1c0"
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
