#!/usr/bin/env bash

# Source:   base24
# Theme:    Front End Delight
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "1b/1b/1d"
    print_osc4 1 "f8/50/1a"
    print_osc4 2 "56/57/46"
    print_osc4 3 "33/93/c9"
    print_osc4 4 "2c/70/b7"
    print_osc4 5 "f0/2d/4e"
    print_osc4 6 "3b/a0/a5"
    print_osc4 7 "98/ac/9c"
    print_osc4 8 "71/ac/7c"
    print_osc4 9 "f6/43/19"
    print_osc4 10 "74/eb/4c"
    print_osc4 11 "fc/c2/24"
    print_osc4 12 "33/93/c9"
    print_osc4 13 "e7/5e/4e"
    print_osc4 14 "4e/bc/e5"
    print_osc4 15 "8b/73/5a"

    print_osc_rgb 10 "98/ac/9c"
    print_osc_rgb 11 "1b/1b/1d"
    print_osc_rgb 12 "98/ac/9c"
    print_osc_rgb 17 "ac/ac/ac"
    print_osc_rgb 19 "24/24/26"
}

do_linux() {
    print_linux 0 "#1b1b1d"
    print_linux 1 "#f8501a"
    print_linux 2 "#565746"
    print_linux 3 "#3393c9"
    print_linux 4 "#2c70b7"
    print_linux 5 "#f02d4e"
    print_linux 6 "#3ba0a5"
    print_linux 7 "#98ac9c"
    print_linux 8 "#71ac7c"
    print_linux 9 "#f64319"
    print_linux 10 "#74eb4c"
    print_linux 11 "#fcc224"
    print_linux 12 "#3393c9"
    print_linux 13 "#e75e4e"
    print_linux 14 "#4ebce5"
    print_linux 15 "#8b735a"
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
