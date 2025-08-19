#!/usr/bin/env bash

# Source:   iterm
# Theme:    terafox
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
    print_osc4 0 "2f/32/39"
    print_osc4 1 "e8/5b/51"
    print_osc4 2 "7a/a3/a1"
    print_osc4 3 "fd/a3/7e"
    print_osc4 4 "5a/92/aa"
    print_osc4 5 "ad/5b/7b"
    print_osc4 6 "a1/cc/d7"
    print_osc4 7 "ea/ea/ea"
    print_osc4 8 "4e/51/57"
    print_osc4 9 "ea/73/6a"
    print_osc4 10 "8e/b1/ae"
    print_osc4 11 "fd/b1/91"
    print_osc4 12 "72/a3/b7"
    print_osc4 13 "b8/73/8f"
    print_osc4 14 "ae/d4/de"
    print_osc4 15 "ed/ed/ed"

    print_osc_rgb 10 "e6/ea/ea"
    print_osc_rgb 11 "15/25/28"
    print_osc_rgb 12 "e6/ea/ea"
    print_osc_rgb 17 "28/3d/3f"
    print_osc_rgb 19 "e6/ea/ea"
}

do_linux() {
    print_linux 0 "#2f3239"
    print_linux 1 "#e85b51"
    print_linux 2 "#7aa3a1"
    print_linux 3 "#fda37e"
    print_linux 4 "#5a92aa"
    print_linux 5 "#ad5b7b"
    print_linux 6 "#a1ccd7"
    print_linux 7 "#e6eaea"
    print_linux 8 "#4e5157"
    print_linux 9 "#ea736a"
    print_linux 10 "#8eb1ae"
    print_linux 11 "#fdb191"
    print_linux 12 "#72a3b7"
    print_linux 13 "#b8738f"
    print_linux 14 "#aed4de"
    print_linux 15 "#ededed"
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
