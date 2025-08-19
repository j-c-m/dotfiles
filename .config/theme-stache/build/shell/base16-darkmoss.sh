#!/usr/bin/env bash

# Source:   base16
# Theme:    darkmoss
# Author:   Gabriel Avanzi (https://github.com/avanzzzi)
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
    print_osc4 0 "17/1e/1f"
    print_osc4 1 "ff/46/58"
    print_osc4 2 "49/91/80"
    print_osc4 3 "fd/b1/1f"
    print_osc4 4 "49/80/91"
    print_osc4 5 "9b/c0/c8"
    print_osc4 6 "66/d9/ef"
    print_osc4 7 "c7/c7/a5"
    print_osc4 8 "55/5e/5f"
    print_osc4 9 "ff/46/58"
    print_osc4 10 "49/91/80"
    print_osc4 11 "fd/b1/1f"
    print_osc4 12 "49/80/91"
    print_osc4 13 "9b/c0/c8"
    print_osc4 14 "66/d9/ef"
    print_osc4 15 "e1/ea/ef"

    print_osc_rgb 10 "c7/c7/a5"
    print_osc_rgb 11 "17/1e/1f"
    print_osc_rgb 12 "c7/c7/a5"
    print_osc_rgb 17 "e3/e3/c8"
    print_osc_rgb 19 "25/2c/2d"
}

do_linux() {
    print_linux 0 "#171e1f"
    print_linux 1 "#ff4658"
    print_linux 2 "#499180"
    print_linux 3 "#fdb11f"
    print_linux 4 "#498091"
    print_linux 5 "#9bc0c8"
    print_linux 6 "#66d9ef"
    print_linux 7 "#c7c7a5"
    print_linux 8 "#555e5f"
    print_linux 9 "#ff4658"
    print_linux 10 "#499180"
    print_linux 11 "#fdb11f"
    print_linux 12 "#498091"
    print_linux 13 "#9bc0c8"
    print_linux 14 "#66d9ef"
    print_linux 15 "#e1eaef"
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
