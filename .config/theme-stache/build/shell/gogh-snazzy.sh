#!/usr/bin/env bash

# Source:   gogh
# Theme:    Snazzy
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
    print_osc4 0 "28/2a/36"
    print_osc4 1 "ff/5c/57"
    print_osc4 2 "5a/f7/8e"
    print_osc4 3 "f3/f9/9d"
    print_osc4 4 "57/c7/ff"
    print_osc4 5 "ff/6a/c1"
    print_osc4 6 "9a/ed/fe"
    print_osc4 7 "f1/f1/f0"
    print_osc4 8 "68/68/68"
    print_osc4 9 "ff/5c/57"
    print_osc4 10 "5a/f7/8e"
    print_osc4 11 "f3/f9/9d"
    print_osc4 12 "57/c7/ff"
    print_osc4 13 "ff/6a/c1"
    print_osc4 14 "9a/ed/fe"
    print_osc4 15 "ef/f0/eb"

    print_osc_rgb 10 "ef/f0/eb"
    print_osc_rgb 11 "28/2a/36"
    print_osc_rgb 12 "97/97/9b"
    print_osc_rgb 17 "ef/f0/eb"
    print_osc_rgb 19 "28/2a/36"
}

do_linux() {
    print_linux 0 "#282a36"
    print_linux 1 "#ff5c57"
    print_linux 2 "#5af78e"
    print_linux 3 "#f3f99d"
    print_linux 4 "#57c7ff"
    print_linux 5 "#ff6ac1"
    print_linux 6 "#9aedfe"
    print_linux 7 "#eff0eb"
    print_linux 8 "#686868"
    print_linux 9 "#ff5c57"
    print_linux 10 "#5af78e"
    print_linux 11 "#f3f99d"
    print_linux 12 "#57c7ff"
    print_linux 13 "#ff6ac1"
    print_linux 14 "#9aedfe"
    print_linux 15 "#eff0eb"
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
