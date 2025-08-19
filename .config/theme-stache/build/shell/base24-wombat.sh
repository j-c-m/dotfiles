#!/usr/bin/env bash

# Source:   base24
# Theme:    Wombat
# Author:   FredHappyface (https://github.com/fredHappyface)
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
    print_osc4 0 "17/17/17"
    print_osc4 1 "ff/60/5a"
    print_osc4 2 "b1/e8/69"
    print_osc4 3 "a5/c7/ff"
    print_osc4 4 "5d/a9/f6"
    print_osc4 5 "e8/6a/ff"
    print_osc4 6 "82/ff/f6"
    print_osc4 7 "b2/af/a6"
    print_osc4 8 "5c/5b/58"
    print_osc4 9 "f5/8b/7f"
    print_osc4 10 "dc/f8/8f"
    print_osc4 11 "ee/e5/b2"
    print_osc4 12 "a5/c7/ff"
    print_osc4 13 "dd/aa/ff"
    print_osc4 14 "b6/ff/f9"
    print_osc4 15 "fe/ff/fe"

    print_osc_rgb 10 "b2/af/a6"
    print_osc_rgb 11 "17/17/17"
    print_osc_rgb 12 "b2/af/a6"
    print_osc_rgb 17 "de/d9/ce"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#171717"
    print_linux 1 "#ff605a"
    print_linux 2 "#b1e869"
    print_linux 3 "#a5c7ff"
    print_linux 4 "#5da9f6"
    print_linux 5 "#e86aff"
    print_linux 6 "#82fff6"
    print_linux 7 "#b2afa6"
    print_linux 8 "#5c5b58"
    print_linux 9 "#f58b7f"
    print_linux 10 "#dcf88f"
    print_linux 11 "#eee5b2"
    print_linux 12 "#a5c7ff"
    print_linux 13 "#ddaaff"
    print_linux 14 "#b6fff9"
    print_linux 15 "#fefffe"
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
