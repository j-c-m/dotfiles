#!/usr/bin/env bash

# Source:   base16
# Theme:    tender
# Author:   Jacobo Tabernero (https://github/com/jacoborus/tender.vim)
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
    print_osc4 0 "28/28/28"
    print_osc4 1 "f4/37/53"
    print_osc4 2 "c9/d0/5c"
    print_osc4 3 "ff/c2/4b"
    print_osc4 4 "b3/de/ef"
    print_osc4 5 "d3/b9/87"
    print_osc4 6 "73/ce/f4"
    print_osc4 7 "ee/ee/ee"
    print_osc4 8 "4c/4c/4c"
    print_osc4 9 "f4/37/53"
    print_osc4 10 "c9/d0/5c"
    print_osc4 11 "ff/c2/4b"
    print_osc4 12 "b3/de/ef"
    print_osc4 13 "d3/b9/87"
    print_osc4 14 "73/ce/f4"
    print_osc4 15 "fe/ff/ff"

    print_osc_rgb 10 "ee/ee/ee"
    print_osc_rgb 11 "28/28/28"
    print_osc_rgb 12 "ee/ee/ee"
    print_osc_rgb 17 "e8/e8/e8"
    print_osc_rgb 19 "38/38/38"
}

do_linux() {
    print_linux 0 "#282828"
    print_linux 1 "#f43753"
    print_linux 2 "#c9d05c"
    print_linux 3 "#ffc24b"
    print_linux 4 "#b3deef"
    print_linux 5 "#d3b987"
    print_linux 6 "#73cef4"
    print_linux 7 "#eeeeee"
    print_linux 8 "#4c4c4c"
    print_linux 9 "#f43753"
    print_linux 10 "#c9d05c"
    print_linux 11 "#ffc24b"
    print_linux 12 "#b3deef"
    print_linux 13 "#d3b987"
    print_linux 14 "#73cef4"
    print_linux 15 "#feffff"
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
