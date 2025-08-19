#!/usr/bin/env bash

# Source:   iterm
# Theme:    violite
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
    print_osc4 0 "24/1b/36"
    print_osc4 1 "ec/78/78"
    print_osc4 2 "78/ec/b3"
    print_osc4 3 "ec/e2/78"
    print_osc4 4 "a8/78/ec"
    print_osc4 5 "ec/78/ec"
    print_osc4 6 "78/ec/ec"
    print_osc4 7 "ed/f4/f5"
    print_osc4 8 "49/37/6d"
    print_osc4 9 "ef/8f/8f"
    print_osc4 10 "9e/ef/be"
    print_osc4 11 "ef/e7/8f"
    print_osc4 12 "b6/8f/ef"
    print_osc4 13 "ef/8f/cf"
    print_osc4 14 "9e/ef/ef"
    print_osc4 15 "f7/fa/fb"

    print_osc_rgb 10 "ed/f4/f5"
    print_osc_rgb 11 "24/1b/36"
    print_osc_rgb 12 "ed/f4/f5"
    print_osc_rgb 17 "49/37/6d"
    print_osc_rgb 19 "ed/f4/f5"
}

do_linux() {
    print_linux 0 "#241b36"
    print_linux 1 "#ec7878"
    print_linux 2 "#78ecb3"
    print_linux 3 "#ece278"
    print_linux 4 "#a878ec"
    print_linux 5 "#ec78ec"
    print_linux 6 "#78ecec"
    print_linux 7 "#edf4f5"
    print_linux 8 "#49376d"
    print_linux 9 "#ef8f8f"
    print_linux 10 "#9eefbe"
    print_linux 11 "#efe78f"
    print_linux 12 "#b68fef"
    print_linux 13 "#ef8fcf"
    print_linux 14 "#9eefef"
    print_linux 15 "#f7fafb"
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
