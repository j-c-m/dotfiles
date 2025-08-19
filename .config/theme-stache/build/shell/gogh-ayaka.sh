#!/usr/bin/env bash

# Source:   gogh
# Theme:    Ayaka
# Author:   Ruhannn (https://github.com/ruhannn)
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
    print_osc4 0 "36/28/3d"
    print_osc4 1 "71/ad/e9"
    print_osc4 2 "ab/8c/ae"
    print_osc4 3 "9e/a0/d3"
    print_osc4 4 "8b/b8/e9"
    print_osc4 5 "e1/b4/ce"
    print_osc4 6 "ce/da/eb"
    print_osc4 7 "90/98/a4"
    print_osc4 8 "71/ad/e9"
    print_osc4 9 "ab/8c/ae"
    print_osc4 10 "e5/9d/b1"
    print_osc4 11 "9e/a0/d3"
    print_osc4 12 "8b/b8/e9"
    print_osc4 13 "e1/b4/ce"
    print_osc4 14 "ce/da/eb"
    print_osc4 15 "ff/fe/fe"

    print_osc_rgb 10 "ce/da/eb"
    print_osc_rgb 11 "36/28/3d"
    print_osc_rgb 12 "ce/da/eb"
    print_osc_rgb 17 "ce/da/eb"
    print_osc_rgb 19 "36/28/3d"
}

do_linux() {
    print_linux 0 "#36283d"
    print_linux 1 "#71ade9"
    print_linux 2 "#ab8cae"
    print_linux 3 "#9ea0d3"
    print_linux 4 "#8bb8e9"
    print_linux 5 "#e1b4ce"
    print_linux 6 "#cedaeb"
    print_linux 7 "#cedaeb"
    print_linux 8 "#71ade9"
    print_linux 9 "#ab8cae"
    print_linux 10 "#e59db1"
    print_linux 11 "#9ea0d3"
    print_linux 12 "#8bb8e9"
    print_linux 13 "#e1b4ce"
    print_linux 14 "#cedaeb"
    print_linux 15 "#fffefe"
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
