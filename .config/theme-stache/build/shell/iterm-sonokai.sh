#!/usr/bin/env bash

# Source:   iterm
# Theme:    sonokai
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
    print_osc4 0 "18/18/19"
    print_osc4 1 "fc/5d/7c"
    print_osc4 2 "9e/d0/72"
    print_osc4 3 "e7/c6/64"
    print_osc4 4 "76/cc/e0"
    print_osc4 5 "b3/9d/f3"
    print_osc4 6 "f3/96/60"
    print_osc4 7 "e2/e2/e3"
    print_osc4 8 "7f/84/90"
    print_osc4 9 "fc/5d/7c"
    print_osc4 10 "9e/d0/72"
    print_osc4 11 "e7/c6/64"
    print_osc4 12 "76/cc/e0"
    print_osc4 13 "b3/9d/f3"
    print_osc4 14 "f3/96/60"
    print_osc4 15 "e2/e2/e3"

    print_osc_rgb 10 "e2/e2/e3"
    print_osc_rgb 11 "2c/2e/34"
    print_osc_rgb 12 "e2/e2/e3"
    print_osc_rgb 17 "41/45/50"
    print_osc_rgb 19 "e2/e2/e3"
}

do_linux() {
    print_linux 0 "#181819"
    print_linux 1 "#fc5d7c"
    print_linux 2 "#9ed072"
    print_linux 3 "#e7c664"
    print_linux 4 "#76cce0"
    print_linux 5 "#b39df3"
    print_linux 6 "#f39660"
    print_linux 7 "#e2e2e3"
    print_linux 8 "#7f8490"
    print_linux 9 "#fc5d7c"
    print_linux 10 "#9ed072"
    print_linux 11 "#e7c664"
    print_linux 12 "#76cce0"
    print_linux 13 "#b39df3"
    print_linux 14 "#f39660"
    print_linux 15 "#e2e2e3"
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
