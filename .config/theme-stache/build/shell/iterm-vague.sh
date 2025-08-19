#!/usr/bin/env bash

# Source:   iterm
# Theme:    Vague
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "13/13/15"
    print_osc4 1 "de/67/81"
    print_osc4 2 "8b/b5/6d"
    print_osc4 3 "f2/be/7c"
    print_osc4 4 "7d/98/e7"
    print_osc4 5 "c2/c2/d5"
    print_osc4 6 "9a/b4/bc"
    print_osc4 7 "cc/cc/cc"
    print_osc4 8 "86/86/86"
    print_osc4 9 "de/67/81"
    print_osc4 10 "8b/b5/6d"
    print_osc4 11 "f2/be/7c"
    print_osc4 12 "7d/98/e7"
    print_osc4 13 "c2/c2/d5"
    print_osc4 14 "9a/b4/bc"
    print_osc4 15 "cc/cc/cc"

    print_osc_rgb 10 "cc/cc/cc"
    print_osc_rgb 11 "13/13/15"
    print_osc_rgb 12 "cc/cc/cc"
    print_osc_rgb 17 "86/86/86"
    print_osc_rgb 19 "cc/cc/cc"
}

do_linux() {
    print_linux 0 "#131315"
    print_linux 1 "#de6781"
    print_linux 2 "#8bb56d"
    print_linux 3 "#f2be7c"
    print_linux 4 "#7d98e7"
    print_linux 5 "#c2c2d5"
    print_linux 6 "#9ab4bc"
    print_linux 7 "#cccccc"
    print_linux 8 "#868686"
    print_linux 9 "#de6781"
    print_linux 10 "#8bb56d"
    print_linux 11 "#f2be7c"
    print_linux 12 "#7d98e7"
    print_linux 13 "#c2c2d5"
    print_linux 14 "#9ab4bc"
    print_linux 15 "#cccccc"
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
