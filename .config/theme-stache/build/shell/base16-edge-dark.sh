#!/usr/bin/env bash

# Source:   base16
# Theme:    Edge Dark
# Author:   cjayross (https://github.com/cjayross)
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
    print_osc4 0 "26/27/29"
    print_osc4 1 "e7/71/71"
    print_osc4 2 "a1/bf/78"
    print_osc4 3 "db/b7/74"
    print_osc4 4 "73/b3/e7"
    print_osc4 5 "d3/90/e7"
    print_osc4 6 "5e/ba/a5"
    print_osc4 7 "b7/be/c9"
    print_osc4 8 "3e/42/49"
    print_osc4 9 "e7/71/71"
    print_osc4 10 "a1/bf/78"
    print_osc4 11 "db/b7/74"
    print_osc4 12 "73/b3/e7"
    print_osc4 13 "d3/90/e7"
    print_osc4 14 "5e/ba/a5"
    print_osc4 15 "3e/42/49"

    print_osc_rgb 10 "b7/be/c9"
    print_osc_rgb 11 "26/27/29"
    print_osc_rgb 12 "b7/be/c9"
    print_osc_rgb 17 "d3/90/e7"
    print_osc_rgb 19 "88/90/9f"
}

do_linux() {
    print_linux 0 "#262729"
    print_linux 1 "#e77171"
    print_linux 2 "#a1bf78"
    print_linux 3 "#dbb774"
    print_linux 4 "#73b3e7"
    print_linux 5 "#d390e7"
    print_linux 6 "#5ebaa5"
    print_linux 7 "#b7bec9"
    print_linux 8 "#3e4249"
    print_linux 9 "#e77171"
    print_linux 10 "#a1bf78"
    print_linux 11 "#dbb774"
    print_linux 12 "#73b3e7"
    print_linux 13 "#d390e7"
    print_linux 14 "#5ebaa5"
    print_linux 15 "#3e4249"
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
