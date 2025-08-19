#!/usr/bin/env bash

# Source:   iterm
# Theme:    Fairyfloss
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
    print_osc4 0 "04/03/03"
    print_osc4 1 "f9/26/72"
    print_osc4 2 "c2/ff/df"
    print_osc4 3 "e6/c0/00"
    print_osc4 4 "c2/ff/df"
    print_osc4 5 "ff/b8/d1"
    print_osc4 6 "c5/a3/ff"
    print_osc4 7 "f8/f8/f0"
    print_osc4 8 "5f/90/ca"
    print_osc4 9 "ff/85/7f"
    print_osc4 10 "c2/ff/df"
    print_osc4 11 "ff/ea/00"
    print_osc4 12 "c2/ff/df"
    print_osc4 13 "ff/b8/d1"
    print_osc4 14 "c5/a3/ff"
    print_osc4 15 "f8/f8/f0"

    print_osc_rgb 10 "f8/f8/f2"
    print_osc_rgb 11 "5a/54/75"
    print_osc_rgb 12 "f8/f8/f0"
    print_osc_rgb 17 "80/77/a8"
    print_osc_rgb 19 "f5/e0/ce"
}

do_linux() {
    print_linux 0 "#040303"
    print_linux 1 "#f92672"
    print_linux 2 "#c2ffdf"
    print_linux 3 "#e6c000"
    print_linux 4 "#c2ffdf"
    print_linux 5 "#ffb8d1"
    print_linux 6 "#c5a3ff"
    print_linux 7 "#f8f8f2"
    print_linux 8 "#5f90ca"
    print_linux 9 "#ff857f"
    print_linux 10 "#c2ffdf"
    print_linux 11 "#ffea00"
    print_linux 12 "#c2ffdf"
    print_linux 13 "#ffb8d1"
    print_linux 14 "#c5a3ff"
    print_linux 15 "#f8f8f0"
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
