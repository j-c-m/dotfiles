#!/usr/bin/env bash

# Source:   iterm
# Theme:    Dark Modern
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
    print_osc4 0 "26/26/26"
    print_osc4 1 "f6/49/49"
    print_osc4 2 "2e/a0/42"
    print_osc4 3 "9d/6a/03"
    print_osc4 4 "00/78/d4"
    print_osc4 5 "d0/12/72"
    print_osc4 6 "1c/b4/d5"
    print_osc4 7 "cc/cc/cc"
    print_osc4 8 "5c/5c/5c"
    print_osc4 9 "db/53/52"
    print_osc4 10 "23/d1/8b"
    print_osc4 11 "f5/f5/43"
    print_osc4 12 "3b/8e/ea"
    print_osc4 13 "d6/70/d6"
    print_osc4 14 "29/b8/db"
    print_osc4 15 "e5/e5/e5"

    print_osc_rgb 10 "cc/cc/cc"
    print_osc_rgb 11 "1f/1f/1f"
    print_osc_rgb 12 "fe/ff/ff"
    print_osc_rgb 17 "3a/3d/41"
    print_osc_rgb 19 "e0/e0/e0"
}

do_linux() {
    print_linux 0 "#262626"
    print_linux 1 "#f64949"
    print_linux 2 "#2ea042"
    print_linux 3 "#9d6a03"
    print_linux 4 "#0078d4"
    print_linux 5 "#d01272"
    print_linux 6 "#1cb4d5"
    print_linux 7 "#cccccc"
    print_linux 8 "#5c5c5c"
    print_linux 9 "#db5352"
    print_linux 10 "#23d18b"
    print_linux 11 "#f5f543"
    print_linux 12 "#3b8eea"
    print_linux 13 "#d670d6"
    print_linux 14 "#29b8db"
    print_linux 15 "#e5e5e5"
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
