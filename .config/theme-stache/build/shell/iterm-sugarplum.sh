#!/usr/bin/env bash

# Source:   iterm
# Theme:    Sugarplum
# Author:   unknown
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
    print_osc4 0 "11/11/47"
    print_osc4 1 "5c/a8/dc"
    print_osc4 2 "53/b3/97"
    print_osc4 3 "24/9a/84"
    print_osc4 4 "db/7d/dd"
    print_osc4 5 "d0/be/ee"
    print_osc4 6 "f9/f3/f9"
    print_osc4 7 "a1/75/d4"
    print_osc4 8 "11/11/47"
    print_osc4 9 "5c/b5/dc"
    print_osc4 10 "52/de/b5"
    print_osc4 11 "01/f5/c7"
    print_osc4 12 "fa/5d/fd"
    print_osc4 13 "c6/a5/fd"
    print_osc4 14 "ff/ff/ff"
    print_osc4 15 "b5/77/fd"

    print_osc_rgb 10 "db/7d/dd"
    print_osc_rgb 11 "11/11/47"
    print_osc_rgb 12 "53/b3/97"
    print_osc_rgb 17 "5c/a8/dc"
    print_osc_rgb 19 "d0/be/ee"
}

do_linux() {
    print_linux 0 "#111147"
    print_linux 1 "#5ca8dc"
    print_linux 2 "#53b397"
    print_linux 3 "#249a84"
    print_linux 4 "#db7ddd"
    print_linux 5 "#d0beee"
    print_linux 6 "#f9f3f9"
    print_linux 7 "#db7ddd"
    print_linux 8 "#111147"
    print_linux 9 "#5cb5dc"
    print_linux 10 "#52deb5"
    print_linux 11 "#01f5c7"
    print_linux 12 "#fa5dfd"
    print_linux 13 "#c6a5fd"
    print_linux 14 "#ffffff"
    print_linux 15 "#b577fd"
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
