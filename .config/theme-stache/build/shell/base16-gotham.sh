#!/usr/bin/env bash

# Source:   base16
# Theme:    Gotham
# Author:   Andrea Leopardi (arranged by Brett Jones)
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
    print_osc4 0 "0c/10/14"
    print_osc4 1 "c2/31/27"
    print_osc4 2 "33/85/9e"
    print_osc4 3 "ed/b4/43"
    print_osc4 4 "19/54/66"
    print_osc4 5 "88/8c/a6"
    print_osc4 6 "2a/a8/89"
    print_osc4 7 "59/9c/ab"
    print_osc4 8 "0a/37/49"
    print_osc4 9 "c2/31/27"
    print_osc4 10 "33/85/9e"
    print_osc4 11 "ed/b4/43"
    print_osc4 12 "19/54/66"
    print_osc4 13 "88/8c/a6"
    print_osc4 14 "2a/a8/89"
    print_osc4 15 "d3/eb/e9"

    print_osc_rgb 10 "59/9c/ab"
    print_osc_rgb 11 "0c/10/14"
    print_osc_rgb 12 "59/9c/ab"
    print_osc_rgb 17 "99/d1/ce"
    print_osc_rgb 19 "11/15/1c"
}

do_linux() {
    print_linux 0 "#0c1014"
    print_linux 1 "#c23127"
    print_linux 2 "#33859e"
    print_linux 3 "#edb443"
    print_linux 4 "#195466"
    print_linux 5 "#888ca6"
    print_linux 6 "#2aa889"
    print_linux 7 "#599cab"
    print_linux 8 "#0a3749"
    print_linux 9 "#c23127"
    print_linux 10 "#33859e"
    print_linux 11 "#edb443"
    print_linux 12 "#195466"
    print_linux 13 "#888ca6"
    print_linux 14 "#2aa889"
    print_linux 15 "#d3ebe9"
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
