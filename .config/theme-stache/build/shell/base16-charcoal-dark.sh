#!/usr/bin/env bash

# Source:   base16
# Theme:    Charcoal Dark
# Author:   Mubin Muhammad (https://github.com/mubin6th)
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
    print_osc4 0 "12/0f/09"
    print_osc4 1 "88/72/54"
    print_osc4 2 "92/7a/60"
    print_osc4 3 "c0/a1/79"
    print_osc4 4 "d6/b8/91"
    print_osc4 5 "a2/86/62"
    print_osc4 6 "a2/86/62"
    print_osc4 7 "c0/a1/79"
    print_osc4 8 "66/55/3f"
    print_osc4 9 "88/72/54"
    print_osc4 10 "92/7a/60"
    print_osc4 11 "c0/a1/79"
    print_osc4 12 "d6/b8/91"
    print_osc4 13 "a2/86/62"
    print_osc4 14 "a2/86/62"
    print_osc4 15 "29/20/16"

    print_osc_rgb 10 "c0/a1/79"
    print_osc_rgb 11 "12/0f/09"
    print_osc_rgb 12 "c0/a1/79"
    print_osc_rgb 17 "d6/b8/91"
    print_osc_rgb 19 "1e/18/12"
}

do_linux() {
    print_linux 0 "#120f09"
    print_linux 1 "#887254"
    print_linux 2 "#927a60"
    print_linux 3 "#c0a179"
    print_linux 4 "#d6b891"
    print_linux 5 "#a28662"
    print_linux 6 "#a28662"
    print_linux 7 "#c0a179"
    print_linux 8 "#66553f"
    print_linux 9 "#887254"
    print_linux 10 "#927a60"
    print_linux 11 "#c0a179"
    print_linux 12 "#d6b891"
    print_linux 13 "#a28662"
    print_linux 14 "#a28662"
    print_linux 15 "#292016"
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
