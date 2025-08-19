#!/usr/bin/env bash

# Source:   base16
# Theme:    Materia
# Author:   Defman21
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
    print_osc4 0 "26/32/38"
    print_osc4 1 "ec/5f/67"
    print_osc4 2 "8b/d6/49"
    print_osc4 3 "ff/cc/00"
    print_osc4 4 "89/dd/ff"
    print_osc4 5 "82/aa/ff"
    print_osc4 6 "80/cb/c4"
    print_osc4 7 "cd/d3/de"
    print_osc4 8 "70/78/80"
    print_osc4 9 "ec/5f/67"
    print_osc4 10 "8b/d6/49"
    print_osc4 11 "ff/cc/00"
    print_osc4 12 "89/dd/ff"
    print_osc4 13 "82/aa/ff"
    print_osc4 14 "80/cb/c4"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "cd/d3/de"
    print_osc_rgb 11 "26/32/38"
    print_osc_rgb 12 "cd/d3/de"
    print_osc_rgb 17 "d5/db/e5"
    print_osc_rgb 19 "2c/39/3f"
}

do_linux() {
    print_linux 0 "#263238"
    print_linux 1 "#ec5f67"
    print_linux 2 "#8bd649"
    print_linux 3 "#ffcc00"
    print_linux 4 "#89ddff"
    print_linux 5 "#82aaff"
    print_linux 6 "#80cbc4"
    print_linux 7 "#cdd3de"
    print_linux 8 "#707880"
    print_linux 9 "#ec5f67"
    print_linux 10 "#8bd649"
    print_linux 11 "#ffcc00"
    print_linux 12 "#89ddff"
    print_linux 13 "#82aaff"
    print_linux 14 "#80cbc4"
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
