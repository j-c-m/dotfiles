#!/usr/bin/env bash

# Source:   gogh
# Theme:    Tempus Autumn
# Author:   Protesilaos Stavrou (https://protesilaos.com)
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
    print_osc4 0 "30/24/20"
    print_osc4 1 "f4/6f/55"
    print_osc4 2 "85/a4/00"
    print_osc4 3 "b0/96/40"
    print_osc4 4 "79/9a/ca"
    print_osc4 5 "df/79/8e"
    print_osc4 6 "52/a8/85"
    print_osc4 7 "a8/94/8a"
    print_osc4 8 "36/30/2a"
    print_osc4 9 "e2/7e/3d"
    print_osc4 10 "43/aa/7a"
    print_osc4 11 "ba/94/00"
    print_osc4 12 "95/8f/df"
    print_osc4 13 "ce/7d/c4"
    print_osc4 14 "2f/a6/b7"
    print_osc4 15 "a9/a2/a6"

    print_osc_rgb 10 "a9/a2/a6"
    print_osc_rgb 11 "30/24/20"
    print_osc_rgb 12 "a9/a2/a6"
    print_osc_rgb 17 "a9/a2/a6"
    print_osc_rgb 19 "30/24/20"
}

do_linux() {
    print_linux 0 "#302420"
    print_linux 1 "#f46f55"
    print_linux 2 "#85a400"
    print_linux 3 "#b09640"
    print_linux 4 "#799aca"
    print_linux 5 "#df798e"
    print_linux 6 "#52a885"
    print_linux 7 "#a9a2a6"
    print_linux 8 "#36302a"
    print_linux 9 "#e27e3d"
    print_linux 10 "#43aa7a"
    print_linux 11 "#ba9400"
    print_linux 12 "#958fdf"
    print_linux 13 "#ce7dc4"
    print_linux 14 "#2fa6b7"
    print_linux 15 "#a9a2a6"
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
