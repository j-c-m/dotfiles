#!/usr/bin/env bash

# Source:   iterm
# Theme:    Belafonte Day
# Author:   unknown
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
    print_osc4 0 "20/11/1b"
    print_osc4 1 "be/10/0e"
    print_osc4 2 "85/81/62"
    print_osc4 3 "ea/a5/49"
    print_osc4 4 "42/6a/79"
    print_osc4 5 "97/52/2c"
    print_osc4 6 "98/9a/9c"
    print_osc4 7 "96/8c/83"
    print_osc4 8 "5e/52/52"
    print_osc4 9 "be/10/0e"
    print_osc4 10 "85/81/62"
    print_osc4 11 "ea/a5/49"
    print_osc4 12 "42/6a/79"
    print_osc4 13 "97/52/2c"
    print_osc4 14 "98/9a/9c"
    print_osc4 15 "d5/cc/ba"

    print_osc_rgb 10 "45/37/3c"
    print_osc_rgb 11 "d5/cc/ba"
    print_osc_rgb 12 "45/37/3c"
    print_osc_rgb 17 "96/8c/83"
    print_osc_rgb 19 "45/37/3c"
}

do_linux() {
    print_linux 0 "#20111b"
    print_linux 1 "#be100e"
    print_linux 2 "#858162"
    print_linux 3 "#eaa549"
    print_linux 4 "#426a79"
    print_linux 5 "#97522c"
    print_linux 6 "#989a9c"
    print_linux 7 "#45373c"
    print_linux 8 "#5e5252"
    print_linux 9 "#be100e"
    print_linux 10 "#858162"
    print_linux 11 "#eaa549"
    print_linux 12 "#426a79"
    print_linux 13 "#97522c"
    print_linux 14 "#989a9c"
    print_linux 15 "#d5ccba"
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
