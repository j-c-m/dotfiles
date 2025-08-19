#!/usr/bin/env bash

# Source:   iterm
# Theme:    Everblush
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
    print_osc4 0 "23/2a/2d"
    print_osc4 1 "e5/74/74"
    print_osc4 2 "8c/cf/7e"
    print_osc4 3 "e5/c7/6b"
    print_osc4 4 "67/b0/e8"
    print_osc4 5 "c4/7f/d5"
    print_osc4 6 "6c/bf/bf"
    print_osc4 7 "b3/b9/b8"
    print_osc4 8 "2d/34/37"
    print_osc4 9 "ef/7e/7e"
    print_osc4 10 "96/d9/88"
    print_osc4 11 "f4/d6/7a"
    print_osc4 12 "71/ba/f2"
    print_osc4 13 "ce/89/df"
    print_osc4 14 "67/cb/e7"
    print_osc4 15 "bd/c3/c2"

    print_osc_rgb 10 "da/da/da"
    print_osc_rgb 11 "14/1b/1e"
    print_osc_rgb 12 "da/da/da"
    print_osc_rgb 17 "14/1b/1e"
    print_osc_rgb 19 "da/da/da"
}

do_linux() {
    print_linux 0 "#232a2d"
    print_linux 1 "#e57474"
    print_linux 2 "#8ccf7e"
    print_linux 3 "#e5c76b"
    print_linux 4 "#67b0e8"
    print_linux 5 "#c47fd5"
    print_linux 6 "#6cbfbf"
    print_linux 7 "#dadada"
    print_linux 8 "#2d3437"
    print_linux 9 "#ef7e7e"
    print_linux 10 "#96d988"
    print_linux 11 "#f4d67a"
    print_linux 12 "#71baf2"
    print_linux 13 "#ce89df"
    print_linux 14 "#67cbe7"
    print_linux 15 "#bdc3c2"
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
