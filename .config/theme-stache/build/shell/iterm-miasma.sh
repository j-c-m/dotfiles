#!/usr/bin/env bash

# Source:   iterm
# Theme:    miasma
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "68/57/42"
    print_osc4 2 "5f/87/5f"
    print_osc4 3 "b3/6d/43"
    print_osc4 4 "78/82/4b"
    print_osc4 5 "bb/77/44"
    print_osc4 6 "c9/a5/54"
    print_osc4 7 "d7/c4/83"
    print_osc4 8 "66/66/66"
    print_osc4 9 "68/57/42"
    print_osc4 10 "5f/87/5f"
    print_osc4 11 "b3/6d/43"
    print_osc4 12 "78/82/4b"
    print_osc4 13 "bb/77/44"
    print_osc4 14 "c9/a5/54"
    print_osc4 15 "d7/c4/83"

    print_osc_rgb 10 "c2/c2/b0"
    print_osc_rgb 11 "22/22/22"
    print_osc_rgb 12 "c7/c7/c7"
    print_osc_rgb 17 "e4/c3/7a"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#685742"
    print_linux 2 "#5f875f"
    print_linux 3 "#b36d43"
    print_linux 4 "#78824b"
    print_linux 5 "#bb7744"
    print_linux 6 "#c9a554"
    print_linux 7 "#c2c2b0"
    print_linux 8 "#666666"
    print_linux 9 "#685742"
    print_linux 10 "#5f875f"
    print_linux 11 "#b36d43"
    print_linux 12 "#78824b"
    print_linux 13 "#bb7744"
    print_linux 14 "#c9a554"
    print_linux 15 "#d7c483"
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
