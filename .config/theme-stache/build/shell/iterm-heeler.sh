#!/usr/bin/env bash

# Source:   iterm
# Theme:    heeler
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "00/00/00"
    print_osc4 1 "e4/4b/2e"
    print_osc4 2 "bd/d0/00"
    print_osc4 3 "f4/cd/64"
    print_osc4 4 "5b/a4/f2"
    print_osc4 5 "fe/94/c2"
    print_osc4 6 "fe/97/63"
    print_osc4 7 "fe/fe/fe"
    print_osc4 8 "00/00/00"
    print_osc4 9 "e4/4b/2e"
    print_osc4 10 "bd/d0/00"
    print_osc4 11 "f4/cd/64"
    print_osc4 12 "00/88/fe"
    print_osc4 13 "fe/94/c2"
    print_osc4 14 "8d/a5/e3"
    print_osc4 15 "fe/fe/fe"

    print_osc_rgb 10 "fc/fc/fc"
    print_osc_rgb 11 "21/1e/46"
    print_osc_rgb 12 "fe/fe/fe"
    print_osc_rgb 17 "2b/2b/41"
    print_osc_rgb 19 "2e/fe/58"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#e44b2e"
    print_linux 2 "#bdd000"
    print_linux 3 "#f4cd64"
    print_linux 4 "#5ba4f2"
    print_linux 5 "#fe94c2"
    print_linux 6 "#fe9763"
    print_linux 7 "#fcfcfc"
    print_linux 8 "#000000"
    print_linux 9 "#e44b2e"
    print_linux 10 "#bdd000"
    print_linux 11 "#f4cd64"
    print_linux 12 "#0088fe"
    print_linux 13 "#fe94c2"
    print_linux 14 "#8da5e3"
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
