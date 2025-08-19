#!/usr/bin/env bash

# Source:   base16
# Theme:    Codeschool
# Author:   blockloop
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
    print_osc4 0 "23/2c/31"
    print_osc4 1 "2a/54/91"
    print_osc4 2 "23/79/86"
    print_osc4 3 "a0/3b/1e"
    print_osc4 4 "48/4d/79"
    print_osc4 5 "c5/98/20"
    print_osc4 6 "b0/2f/30"
    print_osc4 7 "9e/a7/a6"
    print_osc4 8 "3f/49/44"
    print_osc4 9 "2a/54/91"
    print_osc4 10 "23/79/86"
    print_osc4 11 "a0/3b/1e"
    print_osc4 12 "48/4d/79"
    print_osc4 13 "c5/98/20"
    print_osc4 14 "b0/2f/30"
    print_osc4 15 "b5/d8/f6"

    print_osc_rgb 10 "9e/a7/a6"
    print_osc_rgb 11 "23/2c/31"
    print_osc_rgb 12 "9e/a7/a6"
    print_osc_rgb 17 "a7/cf/a3"
    print_osc_rgb 19 "1c/36/57"
}

do_linux() {
    print_linux 0 "#232c31"
    print_linux 1 "#2a5491"
    print_linux 2 "#237986"
    print_linux 3 "#a03b1e"
    print_linux 4 "#484d79"
    print_linux 5 "#c59820"
    print_linux 6 "#b02f30"
    print_linux 7 "#9ea7a6"
    print_linux 8 "#3f4944"
    print_linux 9 "#2a5491"
    print_linux 10 "#237986"
    print_linux 11 "#a03b1e"
    print_linux 12 "#484d79"
    print_linux 13 "#c59820"
    print_linux 14 "#b02f30"
    print_linux 15 "#b5d8f6"
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
