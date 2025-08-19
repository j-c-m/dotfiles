#!/usr/bin/env bash

# Source:   base16
# Theme:    SAGA
# Author:   https://github.com/SAGAtheme/SAGA
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
    print_osc4 0 "05/08/0a"
    print_osc4 1 "ff/d4/e9"
    print_osc4 2 "f7/dd/ff"
    print_osc4 3 "fb/eb/c8"
    print_osc4 4 "c9/ff/f7"
    print_osc4 5 "dc/c3/f9"
    print_osc4 6 "c5/ed/c1"
    print_osc4 7 "dc/e2/f7"
    print_osc4 8 "14/1f/27"
    print_osc4 9 "ff/d4/e9"
    print_osc4 10 "f7/dd/ff"
    print_osc4 11 "fb/eb/c8"
    print_osc4 12 "c9/ff/f7"
    print_osc4 13 "dc/c3/f9"
    print_osc4 14 "c5/ed/c1"
    print_osc4 15 "cc/d3/fe"

    print_osc_rgb 10 "dc/e2/f7"
    print_osc_rgb 11 "05/08/0a"
    print_osc_rgb 12 "dc/e2/f7"
    print_osc_rgb 17 "f8/ea/e7"
    print_osc_rgb 19 "0a/10/14"
}

do_linux() {
    print_linux 0 "#05080a"
    print_linux 1 "#ffd4e9"
    print_linux 2 "#f7ddff"
    print_linux 3 "#fbebc8"
    print_linux 4 "#c9fff7"
    print_linux 5 "#dcc3f9"
    print_linux 6 "#c5edc1"
    print_linux 7 "#dce2f7"
    print_linux 8 "#141f27"
    print_linux 9 "#ffd4e9"
    print_linux 10 "#f7ddff"
    print_linux 11 "#fbebc8"
    print_linux 12 "#c9fff7"
    print_linux 13 "#dcc3f9"
    print_linux 14 "#c5edc1"
    print_linux 15 "#ccd3fe"
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
