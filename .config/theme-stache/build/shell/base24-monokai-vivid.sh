#!/usr/bin/env bash

# Source:   base24
# Theme:    Monokai Vivid
# Author:   FredHappyface (https://github.com/fredHappyface)
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
    print_osc4 0 "12/12/12"
    print_osc4 1 "fa/28/34"
    print_osc4 2 "97/e1/23"
    print_osc4 3 "04/42/fe"
    print_osc4 4 "04/42/fe"
    print_osc4 5 "f8/00/f8"
    print_osc4 6 "01/b6/ed"
    print_osc4 7 "df/df/df"
    print_osc4 8 "a1/a1/a1"
    print_osc4 9 "f5/66/9c"
    print_osc4 10 "b0/e0/5e"
    print_osc4 11 "fe/f2/6c"
    print_osc4 12 "04/42/fe"
    print_osc4 13 "f2/00/f5"
    print_osc4 14 "50/cd/fe"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "df/df/df"
    print_osc_rgb 11 "12/12/12"
    print_osc_rgb 12 "df/df/df"
    print_osc_rgb 17 "ff/fe/fe"
    print_osc_rgb 19 "12/12/12"
}

do_linux() {
    print_linux 0 "#121212"
    print_linux 1 "#fa2834"
    print_linux 2 "#97e123"
    print_linux 3 "#0442fe"
    print_linux 4 "#0442fe"
    print_linux 5 "#f800f8"
    print_linux 6 "#01b6ed"
    print_linux 7 "#dfdfdf"
    print_linux 8 "#a1a1a1"
    print_linux 9 "#f5669c"
    print_linux 10 "#b0e05e"
    print_linux 11 "#fef26c"
    print_linux 12 "#0442fe"
    print_linux 13 "#f200f5"
    print_linux 14 "#50cdfe"
    print_linux 15 "#ffffff"
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
