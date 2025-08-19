#!/usr/bin/env bash

# Source:   base16
# Theme:    Still Alive
# Author:   Derrick McKee (derrick.mckee@gmail.com)
# Variant:  light

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
    print_osc4 0 "f0/f0/f0"
    print_osc4 1 "48/78/30"
    print_osc4 2 "5c/5c/6a"
    print_osc4 3 "42/63/95"
    print_osc4 4 "00/18/78"
    print_osc4 5 "90/00/00"
    print_osc4 6 "2c/3c/57"
    print_osc4 7 "d8/00/00"
    print_osc4 8 "f0/18/18"
    print_osc4 9 "48/78/30"
    print_osc4 10 "5c/5c/6a"
    print_osc4 11 "42/63/95"
    print_osc4 12 "00/18/78"
    print_osc4 13 "90/00/00"
    print_osc4 14 "2c/3c/57"
    print_osc4 15 "30/a8/60"

    print_osc_rgb 10 "d8/00/00"
    print_osc_rgb 11 "f0/f0/f0"
    print_osc_rgb 12 "d8/00/00"
    print_osc_rgb 17 "48/90/00"
    print_osc_rgb 19 "f0/d8/48"
}

do_linux() {
    print_linux 0 "#f0f0f0"
    print_linux 1 "#487830"
    print_linux 2 "#5c5c6a"
    print_linux 3 "#426395"
    print_linux 4 "#001878"
    print_linux 5 "#900000"
    print_linux 6 "#2c3c57"
    print_linux 7 "#d80000"
    print_linux 8 "#f01818"
    print_linux 9 "#487830"
    print_linux 10 "#5c5c6a"
    print_linux 11 "#426395"
    print_linux 12 "#001878"
    print_linux 13 "#900000"
    print_linux 14 "#2c3c57"
    print_linux 15 "#30a860"
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
