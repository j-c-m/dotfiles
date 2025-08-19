#!/usr/bin/env bash

# Source:   base16
# Theme:    Classic Light
# Author:   Jason Heeris (http://heeris.id.au)
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
    print_osc4 0 "f5/f5/f5"
    print_osc4 1 "ac/41/42"
    print_osc4 2 "90/a9/59"
    print_osc4 3 "f4/bf/75"
    print_osc4 4 "6a/9f/b5"
    print_osc4 5 "aa/75/9f"
    print_osc4 6 "75/b5/aa"
    print_osc4 7 "30/30/30"
    print_osc4 8 "b0/b0/b0"
    print_osc4 9 "ac/41/42"
    print_osc4 10 "90/a9/59"
    print_osc4 11 "f4/bf/75"
    print_osc4 12 "6a/9f/b5"
    print_osc4 13 "aa/75/9f"
    print_osc4 14 "75/b5/aa"
    print_osc4 15 "15/15/15"

    print_osc_rgb 10 "30/30/30"
    print_osc_rgb 11 "f5/f5/f5"
    print_osc_rgb 12 "30/30/30"
    print_osc_rgb 17 "20/20/20"
    print_osc_rgb 19 "e0/e0/e0"
}

do_linux() {
    print_linux 0 "#f5f5f5"
    print_linux 1 "#ac4142"
    print_linux 2 "#90a959"
    print_linux 3 "#f4bf75"
    print_linux 4 "#6a9fb5"
    print_linux 5 "#aa759f"
    print_linux 6 "#75b5aa"
    print_linux 7 "#303030"
    print_linux 8 "#b0b0b0"
    print_linux 9 "#ac4142"
    print_linux 10 "#90a959"
    print_linux 11 "#f4bf75"
    print_linux 12 "#6a9fb5"
    print_linux 13 "#aa759f"
    print_linux 14 "#75b5aa"
    print_linux 15 "#151515"
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
