#!/usr/bin/env bash

# Source:   base24
# Theme:    Ayu Dark
# Author:   Tinted Theming (https://github.com/tinted-theming), Ayu Theme (https://github.com/ayu-theme)
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
    print_osc4 0 "0b/0e/14"
    print_osc4 1 "f0/71/78"
    print_osc4 2 "aa/d9/4c"
    print_osc4 3 "ff/b4/54"
    print_osc4 4 "59/c2/ff"
    print_osc4 5 "d2/a6/ff"
    print_osc4 6 "95/e6/cb"
    print_osc4 7 "e6/e1/cf"
    print_osc4 8 "3e/4b/59"
    print_osc4 9 "f2/6d/78"
    print_osc4 10 "7f/d9/62"
    print_osc4 11 "e6/b6/73"
    print_osc4 12 "73/b8/ff"
    print_osc4 13 "dd/bc/ff"
    print_osc4 14 "39/ba/e6"
    print_osc4 15 "f2/f0/e7"

    print_osc_rgb 10 "e6/e1/cf"
    print_osc_rgb 11 "0b/0e/14"
    print_osc_rgb 12 "e6/e1/cf"
    print_osc_rgb 17 "ec/e8/db"
    print_osc_rgb 19 "13/17/21"
}

do_linux() {
    print_linux 0 "#0b0e14"
    print_linux 1 "#f07178"
    print_linux 2 "#aad94c"
    print_linux 3 "#ffb454"
    print_linux 4 "#59c2ff"
    print_linux 5 "#d2a6ff"
    print_linux 6 "#95e6cb"
    print_linux 7 "#e6e1cf"
    print_linux 8 "#3e4b59"
    print_linux 9 "#f26d78"
    print_linux 10 "#7fd962"
    print_linux 11 "#e6b673"
    print_linux 12 "#73b8ff"
    print_linux 13 "#ddbcff"
    print_linux 14 "#39bae6"
    print_linux 15 "#f2f0e7"
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
