#!/usr/bin/env bash

# Source:   gogh
# Theme:    Terminix Dark
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
    print_osc4 0 "28/2a/2e"
    print_osc4 1 "a5/42/42"
    print_osc4 2 "a1/b5/6c"
    print_osc4 3 "de/93/5f"
    print_osc4 4 "22/55/55"
    print_osc4 5 "85/67/8f"
    print_osc4 6 "5e/8d/87"
    print_osc4 7 "77/77/77"
    print_osc4 8 "37/3b/41"
    print_osc4 9 "c6/35/35"
    print_osc4 10 "60/83/60"
    print_osc4 11 "fa/80/5a"
    print_osc4 12 "44/9d/a1"
    print_osc4 13 "ba/8b/af"
    print_osc4 14 "86/c1/b9"
    print_osc4 15 "c5/c8/c6"

    print_osc_rgb 10 "86/8a/8c"
    print_osc_rgb 11 "09/11/16"
    print_osc_rgb 12 "86/8a/8c"
    print_osc_rgb 17 "86/8a/8c"
    print_osc_rgb 19 "09/11/16"
}

do_linux() {
    print_linux 0 "#282a2e"
    print_linux 1 "#a54242"
    print_linux 2 "#a1b56c"
    print_linux 3 "#de935f"
    print_linux 4 "#225555"
    print_linux 5 "#85678f"
    print_linux 6 "#5e8d87"
    print_linux 7 "#868a8c"
    print_linux 8 "#373b41"
    print_linux 9 "#c63535"
    print_linux 10 "#608360"
    print_linux 11 "#fa805a"
    print_linux 12 "#449da1"
    print_linux 13 "#ba8baf"
    print_linux 14 "#86c1b9"
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
