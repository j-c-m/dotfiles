#!/usr/bin/env bash

# Source:   base24
# Theme:    Dimmed Monokai
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "1e/1e/1e"
    print_osc4 1 "be/3e/48"
    print_osc4 2 "86/9a/3a"
    print_osc4 3 "17/6c/e3"
    print_osc4 4 "4e/76/a1"
    print_osc4 5 "85/5b/8d"
    print_osc4 6 "56/8e/a3"
    print_osc4 7 "ac/af/ac"
    print_osc4 8 "94/95/93"
    print_osc4 9 "fb/00/1e"
    print_osc4 10 "0e/71/2e"
    print_osc4 11 "c3/70/33"
    print_osc4 12 "17/6c/e3"
    print_osc4 13 "fb/00/67"
    print_osc4 14 "2d/6f/6c"
    print_osc4 15 "fc/ff/b8"

    print_osc_rgb 10 "ac/af/ac"
    print_osc_rgb 11 "1e/1e/1e"
    print_osc_rgb 12 "ac/af/ac"
    print_osc_rgb 17 "b8/bc/b9"
    print_osc_rgb 19 "3a/3c/43"
}

do_linux() {
    print_linux 0 "#1e1e1e"
    print_linux 1 "#be3e48"
    print_linux 2 "#869a3a"
    print_linux 3 "#176ce3"
    print_linux 4 "#4e76a1"
    print_linux 5 "#855b8d"
    print_linux 6 "#568ea3"
    print_linux 7 "#acafac"
    print_linux 8 "#949593"
    print_linux 9 "#fb001e"
    print_linux 10 "#0e712e"
    print_linux 11 "#c37033"
    print_linux 12 "#176ce3"
    print_linux 13 "#fb0067"
    print_linux 14 "#2d6f6c"
    print_linux 15 "#fcffb8"
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
