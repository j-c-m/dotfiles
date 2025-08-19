#!/usr/bin/env bash

# Source:   iterm
# Theme:    tokyonight-day
# Author:   unknown
# Variant:  light

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
    print_osc4 0 "e9/e9/ed"
    print_osc4 1 "f5/2a/65"
    print_osc4 2 "58/75/39"
    print_osc4 3 "8c/6c/3e"
    print_osc4 4 "2e/7d/e9"
    print_osc4 5 "98/54/f1"
    print_osc4 6 "00/71/97"
    print_osc4 7 "61/72/b0"
    print_osc4 8 "a1/a6/c5"
    print_osc4 9 "f5/2a/65"
    print_osc4 10 "58/75/39"
    print_osc4 11 "8c/6c/3e"
    print_osc4 12 "2e/7d/e9"
    print_osc4 13 "98/54/f1"
    print_osc4 14 "00/71/97"
    print_osc4 15 "37/60/bf"

    print_osc_rgb 10 "37/60/bf"
    print_osc_rgb 11 "e1/e2/e7"
    print_osc_rgb 12 "37/60/bf"
    print_osc_rgb 17 "99/a7/df"
    print_osc_rgb 19 "37/60/bf"
}

do_linux() {
    print_linux 0 "#e9e9ed"
    print_linux 1 "#f52a65"
    print_linux 2 "#587539"
    print_linux 3 "#8c6c3e"
    print_linux 4 "#2e7de9"
    print_linux 5 "#9854f1"
    print_linux 6 "#007197"
    print_linux 7 "#3760bf"
    print_linux 8 "#a1a6c5"
    print_linux 9 "#f52a65"
    print_linux 10 "#587539"
    print_linux 11 "#8c6c3e"
    print_linux 12 "#2e7de9"
    print_linux 13 "#9854f1"
    print_linux 14 "#007197"
    print_linux 15 "#3760bf"
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
