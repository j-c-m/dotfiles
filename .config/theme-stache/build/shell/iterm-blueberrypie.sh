#!/usr/bin/env bash

# Source:   iterm
# Theme:    BlueBerryPie
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
    print_osc4 0 "0a/4b/61"
    print_osc4 1 "99/23/6d"
    print_osc4 2 "5b/b0/b2"
    print_osc4 3 "e9/b8/a7"
    print_osc4 4 "90/a5/bc"
    print_osc4 5 "9d/53/a7"
    print_osc4 6 "7e/82/cc"
    print_osc4 7 "f0/e7/d5"
    print_osc4 8 "1f/16/37"
    print_osc4 9 "c7/71/71"
    print_osc4 10 "0a/6b/7e"
    print_osc4 11 "79/31/88"
    print_osc4 12 "38/16/3d"
    print_osc4 13 "bc/93/b6"
    print_osc4 14 "5d/5f/71"
    print_osc4 15 "0a/6b/7e"

    print_osc_rgb 10 "ba/ba/b9"
    print_osc_rgb 11 "1c/0b/28"
    print_osc_rgb 12 "fc/fa/d5"
    print_osc_rgb 17 "5f/5f/5f"
    print_osc_rgb 19 "fe/ff/ff"
}

do_linux() {
    print_linux 0 "#0a4b61"
    print_linux 1 "#99236d"
    print_linux 2 "#5bb0b2"
    print_linux 3 "#e9b8a7"
    print_linux 4 "#90a5bc"
    print_linux 5 "#9d53a7"
    print_linux 6 "#7e82cc"
    print_linux 7 "#babab9"
    print_linux 8 "#1f1637"
    print_linux 9 "#c77171"
    print_linux 10 "#0a6b7e"
    print_linux 11 "#793188"
    print_linux 12 "#38163d"
    print_linux 13 "#bc93b6"
    print_linux 14 "#5d5f71"
    print_linux 15 "#0a6b7e"
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
