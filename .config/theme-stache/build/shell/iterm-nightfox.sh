#!/usr/bin/env bash

# Source:   iterm
# Theme:    nightfox
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
    print_osc4 0 "39/3b/44"
    print_osc4 1 "c9/4f/6d"
    print_osc4 2 "81/b1/99"
    print_osc4 3 "da/c0/73"
    print_osc4 4 "70/9b/d6"
    print_osc4 5 "9c/79/d6"
    print_osc4 6 "63/cc/ce"
    print_osc4 7 "df/df/e0"
    print_osc4 8 "57/58/5f"
    print_osc4 9 "d0/68/83"
    print_osc4 10 "8e/b9/a3"
    print_osc4 11 "e0/c9/88"
    print_osc4 12 "85/ab/dc"
    print_osc4 13 "b9/a1/e1"
    print_osc4 14 "7a/d5/d6"
    print_osc4 15 "e3/e3/e4"

    print_osc_rgb 10 "cc/cd/ce"
    print_osc_rgb 11 "19/22/30"
    print_osc_rgb 12 "cc/cd/ce"
    print_osc_rgb 17 "2a/3b/51"
    print_osc_rgb 19 "cc/cd/ce"
}

do_linux() {
    print_linux 0 "#393b44"
    print_linux 1 "#c94f6d"
    print_linux 2 "#81b199"
    print_linux 3 "#dac073"
    print_linux 4 "#709bd6"
    print_linux 5 "#9c79d6"
    print_linux 6 "#63ccce"
    print_linux 7 "#cccdce"
    print_linux 8 "#57585f"
    print_linux 9 "#d06883"
    print_linux 10 "#8eb9a3"
    print_linux 11 "#e0c988"
    print_linux 12 "#85abdc"
    print_linux 13 "#b9a1e1"
    print_linux 14 "#7ad5d6"
    print_linux 15 "#e3e3e4"
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
