#!/usr/bin/env bash

# Source:   gogh
# Theme:    Arc Light
# Author:   https://hesamrad.com
# Variant:  Light

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
    print_osc4 0 "0d/11/17"
    print_osc4 1 "c3/24/24"
    print_osc4 2 "24/c3/91"
    print_osc4 3 "c3/a9/24"
    print_osc4 4 "24/55/c3"
    print_osc4 5 "c2/24/c3"
    print_osc4 6 "24/ba/c3"
    print_osc4 7 "e8/ec/f2"
    print_osc4 8 "3b/4d/68"
    print_osc4 9 "be/23/23"
    print_osc4 10 "23/be/8d"
    print_osc4 11 "be/a4/23"
    print_osc4 12 "23/51/be"
    print_osc4 13 "be/23/be"
    print_osc4 14 "23/b6/be"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "33/33/33"
    print_osc_rgb 11 "e8/ec/f2"
    print_osc_rgb 12 "00/ff/00"
    print_osc_rgb 17 "33/33/33"
    print_osc_rgb 19 "e8/ec/f2"
}

do_linux() {
    print_linux 0 "#0d1117"
    print_linux 1 "#c32424"
    print_linux 2 "#24c391"
    print_linux 3 "#c3a924"
    print_linux 4 "#2455c3"
    print_linux 5 "#c224c3"
    print_linux 6 "#24bac3"
    print_linux 7 "#333333"
    print_linux 8 "#3b4d68"
    print_linux 9 "#be2323"
    print_linux 10 "#23be8d"
    print_linux 11 "#bea423"
    print_linux 12 "#2351be"
    print_linux 13 "#be23be"
    print_linux 14 "#23b6be"
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
