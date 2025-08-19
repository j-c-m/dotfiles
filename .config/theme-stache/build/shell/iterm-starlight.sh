#!/usr/bin/env bash

# Source:   iterm
# Theme:    starlight
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
    print_osc4 0 "24/23/23"
    print_osc4 1 "f5/2b/59"
    print_osc4 2 "47/b3/12"
    print_osc4 3 "e3/c4/00"
    print_osc4 4 "24/ab/d4"
    print_osc4 5 "f1/ae/fd"
    print_osc4 6 "13/c1/98"
    print_osc4 7 "e6/e5/e5"
    print_osc4 8 "61/60/60"
    print_osc4 9 "fe/4d/50"
    print_osc4 10 "35/d3/4f"
    print_osc4 11 "e9/e7/35"
    print_osc4 12 "5d/c4/f8"
    print_osc4 13 "fd/aa/f2"
    print_osc4 14 "24/de/c4"
    print_osc4 15 "fe/fe/fe"

    print_osc_rgb 10 "fe/fe/fe"
    print_osc_rgb 11 "24/23/23"
    print_osc_rgb 12 "fe/fe/fe"
    print_osc_rgb 17 "fe/fe/fe"
    print_osc_rgb 19 "24/23/23"
}

do_linux() {
    print_linux 0 "#242323"
    print_linux 1 "#f52b59"
    print_linux 2 "#47b312"
    print_linux 3 "#e3c400"
    print_linux 4 "#24abd4"
    print_linux 5 "#f1aefd"
    print_linux 6 "#13c198"
    print_linux 7 "#fefefe"
    print_linux 8 "#616060"
    print_linux 9 "#fe4d50"
    print_linux 10 "#35d34f"
    print_linux 11 "#e9e735"
    print_linux 12 "#5dc4f8"
    print_linux 13 "#fdaaf2"
    print_linux 14 "#24dec4"
    print_linux 15 "#fefefe"
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
