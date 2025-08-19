#!/usr/bin/env bash

# Source:   gogh
# Theme:    Harper
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "01/01/01"
    print_osc4 1 "f8/b6/3f"
    print_osc4 2 "7f/b5/e1"
    print_osc4 3 "d6/da/25"
    print_osc4 4 "48/9e/48"
    print_osc4 5 "b2/96/c6"
    print_osc4 6 "f5/bf/d7"
    print_osc4 7 "a8/a4/9d"
    print_osc4 8 "72/6e/6a"
    print_osc4 9 "f8/b6/3f"
    print_osc4 10 "7f/b5/e1"
    print_osc4 11 "d6/da/25"
    print_osc4 12 "48/9e/48"
    print_osc4 13 "b2/96/c6"
    print_osc4 14 "f5/bf/d7"
    print_osc4 15 "fe/fb/ea"

    print_osc_rgb 10 "a8/a4/9d"
    print_osc_rgb 11 "01/01/01"
    print_osc_rgb 12 "a8/a4/9d"
    print_osc_rgb 17 "a8/a4/9d"
    print_osc_rgb 19 "01/01/01"
}

do_linux() {
    print_linux 0 "#010101"
    print_linux 1 "#f8b63f"
    print_linux 2 "#7fb5e1"
    print_linux 3 "#d6da25"
    print_linux 4 "#489e48"
    print_linux 5 "#b296c6"
    print_linux 6 "#f5bfd7"
    print_linux 7 "#a8a49d"
    print_linux 8 "#726e6a"
    print_linux 9 "#f8b63f"
    print_linux 10 "#7fb5e1"
    print_linux 11 "#d6da25"
    print_linux 12 "#489e48"
    print_linux 13 "#b296c6"
    print_linux 14 "#f5bfd7"
    print_linux 15 "#fefbea"
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
