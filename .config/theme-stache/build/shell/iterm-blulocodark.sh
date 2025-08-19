#!/usr/bin/env bash

# Source:   iterm
# Theme:    BlulocoDark
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
    print_osc4 0 "40/44/4c"
    print_osc4 1 "fc/2e/51"
    print_osc4 2 "25/a4/5c"
    print_osc4 3 "ff/93/69"
    print_osc4 4 "34/75/fe"
    print_osc4 5 "7a/82/da"
    print_osc4 6 "44/83/aa"
    print_osc4 7 "cd/d3/e0"
    print_osc4 8 "8f/9a/ae"
    print_osc4 9 "ff/63/7f"
    print_osc4 10 "3f/c5/6a"
    print_osc4 11 "f9/c8/58"
    print_osc4 12 "10/b0/fe"
    print_osc4 13 "ff/77/f8"
    print_osc4 14 "5f/b9/bc"
    print_osc4 15 "fe/fe/fe"

    print_osc_rgb 10 "b9/bf/ca"
    print_osc_rgb 11 "27/2b/33"
    print_osc_rgb 12 "fe/cc/00"
    print_osc_rgb 17 "b9/c0/ca"
    print_osc_rgb 19 "27/2b/33"
}

do_linux() {
    print_linux 0 "#40444c"
    print_linux 1 "#fc2e51"
    print_linux 2 "#25a45c"
    print_linux 3 "#ff9369"
    print_linux 4 "#3475fe"
    print_linux 5 "#7a82da"
    print_linux 6 "#4483aa"
    print_linux 7 "#b9bfca"
    print_linux 8 "#8f9aae"
    print_linux 9 "#ff637f"
    print_linux 10 "#3fc56a"
    print_linux 11 "#f9c858"
    print_linux 12 "#10b0fe"
    print_linux 13 "#ff77f8"
    print_linux 14 "#5fb9bc"
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
