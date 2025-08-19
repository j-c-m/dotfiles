#!/usr/bin/env bash

# Source:   gogh
# Theme:    Hybrid
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "28/2a/2e"
    print_osc4 1 "a5/42/42"
    print_osc4 2 "8c/94/40"
    print_osc4 3 "de/93/5f"
    print_osc4 4 "5f/81/9d"
    print_osc4 5 "85/67/8f"
    print_osc4 6 "5e/8d/87"
    print_osc4 7 "96/98/96"
    print_osc4 8 "37/3b/41"
    print_osc4 9 "cc/66/66"
    print_osc4 10 "b5/bd/68"
    print_osc4 11 "f0/c6/74"
    print_osc4 12 "81/a2/be"
    print_osc4 13 "b2/94/bb"
    print_osc4 14 "8a/be/b7"
    print_osc4 15 "c5/c8/c6"

    print_osc_rgb 10 "94/a3/a5"
    print_osc_rgb 11 "14/14/14"
    print_osc_rgb 12 "94/a3/a5"
    print_osc_rgb 17 "94/a3/a5"
    print_osc_rgb 19 "14/14/14"
}

do_linux() {
    print_linux 0 "#282a2e"
    print_linux 1 "#a54242"
    print_linux 2 "#8c9440"
    print_linux 3 "#de935f"
    print_linux 4 "#5f819d"
    print_linux 5 "#85678f"
    print_linux 6 "#5e8d87"
    print_linux 7 "#94a3a5"
    print_linux 8 "#373b41"
    print_linux 9 "#cc6666"
    print_linux 10 "#b5bd68"
    print_linux 11 "#f0c674"
    print_linux 12 "#81a2be"
    print_linux 13 "#b294bb"
    print_linux 14 "#8abeb7"
    print_linux 15 "#c5c8c6"
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
