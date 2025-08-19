#!/usr/bin/env bash

# Source:   iterm
# Theme:    moonfly
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
    print_osc4 0 "32/34/37"
    print_osc4 1 "ff/54/54"
    print_osc4 2 "8c/c8/5f"
    print_osc4 3 "e3/c7/8a"
    print_osc4 4 "80/a0/ff"
    print_osc4 5 "cf/87/e8"
    print_osc4 6 "79/da/c8"
    print_osc4 7 "c6/c6/c6"
    print_osc4 8 "94/94/94"
    print_osc4 9 "ff/51/89"
    print_osc4 10 "36/c6/92"
    print_osc4 11 "c6/c6/84"
    print_osc4 12 "74/b2/ff"
    print_osc4 13 "ae/81/ff"
    print_osc4 14 "85/dc/85"
    print_osc4 15 "e4/e4/e4"

    print_osc_rgb 10 "bd/bd/bd"
    print_osc_rgb 11 "07/07/07"
    print_osc_rgb 12 "9e/9e/9e"
    print_osc_rgb 17 "b2/ce/ee"
    print_osc_rgb 19 "08/08/08"
}

do_linux() {
    print_linux 0 "#323437"
    print_linux 1 "#ff5454"
    print_linux 2 "#8cc85f"
    print_linux 3 "#e3c78a"
    print_linux 4 "#80a0ff"
    print_linux 5 "#cf87e8"
    print_linux 6 "#79dac8"
    print_linux 7 "#bdbdbd"
    print_linux 8 "#949494"
    print_linux 9 "#ff5189"
    print_linux 10 "#36c692"
    print_linux 11 "#c6c684"
    print_linux 12 "#74b2ff"
    print_linux 13 "#ae81ff"
    print_linux 14 "#85dc85"
    print_linux 15 "#e4e4e4"
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
