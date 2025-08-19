#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base4Tone Classic P
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
    print_osc4 0 "1c/1d/21"
    print_osc4 1 "c0/39/d5"
    print_osc4 2 "13/98/aa"
    print_osc4 3 "3c/ca/dd"
    print_osc4 4 "92/9f/f7"
    print_osc4 5 "a5/7a/f0"
    print_osc4 6 "23/b4/c7"
    print_osc4 7 "e8/e8/ee"
    print_osc4 8 "07/08/0d"
    print_osc4 9 "db/75/eb"
    print_osc4 10 "5a/d2/e2"
    print_osc4 11 "a4/e6/ef"
    print_osc4 12 "d0/d5/fb"
    print_osc4 13 "b7/92/f6"
    print_osc4 14 "c6/cd/fb"
    print_osc4 15 "f6/f6/f9"

    print_osc_rgb 10 "90/92/a2"
    print_osc_rgb 11 "1c/1d/21"
    print_osc_rgb 12 "6a/87/8a"
    print_osc_rgb 17 "90/92/a2"
    print_osc_rgb 19 "1c/1d/21"
}

do_linux() {
    print_linux 0 "#1c1d21"
    print_linux 1 "#c039d5"
    print_linux 2 "#1398aa"
    print_linux 3 "#3ccadd"
    print_linux 4 "#929ff7"
    print_linux 5 "#a57af0"
    print_linux 6 "#23b4c7"
    print_linux 7 "#9092a2"
    print_linux 8 "#07080d"
    print_linux 9 "#db75eb"
    print_linux 10 "#5ad2e2"
    print_linux 11 "#a4e6ef"
    print_linux 12 "#d0d5fb"
    print_linux 13 "#b792f6"
    print_linux 14 "#c6cdfb"
    print_linux 15 "#f6f6f9"
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
