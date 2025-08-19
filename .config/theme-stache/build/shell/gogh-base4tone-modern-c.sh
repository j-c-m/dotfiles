#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base4Tone Modern C
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
    print_osc4 0 "22/1f/1c"
    print_osc4 1 "5c/6f/eb"
    print_osc4 2 "dd/40/7c"
    print_osc4 3 "f1/7e/aa"
    print_osc4 4 "e6/97/1a"
    print_osc4 5 "1b/bb/a6"
    print_osc4 6 "e9/63/96"
    print_osc4 7 "ee/eb/e8"
    print_osc4 8 "0d/0b/07"
    print_osc4 9 "92/9f/f7"
    print_osc4 10 "f3/91/b6"
    print_osc4 11 "f6/b1/cc"
    print_osc4 12 "f5/d8/a8"
    print_osc4 13 "1e/d2/ba"
    print_osc4 14 "f3/cd/91"
    print_osc4 15 "f9/f8/f6"

    print_osc_rgb 10 "a3/9b/8f"
    print_osc_rgb 11 "22/1f/1c"
    print_osc_rgb 12 "81/74/79"
    print_osc_rgb 17 "a3/9b/8f"
    print_osc_rgb 19 "22/1f/1c"
}

do_linux() {
    print_linux 0 "#221f1c"
    print_linux 1 "#5c6feb"
    print_linux 2 "#dd407c"
    print_linux 3 "#f17eaa"
    print_linux 4 "#e6971a"
    print_linux 5 "#1bbba6"
    print_linux 6 "#e96396"
    print_linux 7 "#a39b8f"
    print_linux 8 "#0d0b07"
    print_linux 9 "#929ff7"
    print_linux 10 "#f391b6"
    print_linux 11 "#f6b1cc"
    print_linux 12 "#f5d8a8"
    print_linux 13 "#1ed2ba"
    print_linux 14 "#f3cd91"
    print_linux 15 "#f9f8f6"
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
