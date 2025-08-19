#!/usr/bin/env bash

# Source:   gogh
# Theme:    Quiet
# Author:   
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
    print_osc4 0 "14/14/14"
    print_osc4 1 "c1/62/62"
    print_osc4 2 "49/b6/85"
    print_osc4 3 "c5/b7/6d"
    print_osc4 4 "49/92/b6"
    print_osc4 5 "81/5b/be"
    print_osc4 6 "41/a4/a4"
    print_osc4 7 "c5/c5/c5"
    print_osc4 8 "50/50/50"
    print_osc4 9 "ed/5e/7a"
    print_osc4 10 "7e/ce/7e"
    print_osc4 11 "db/db/70"
    print_osc4 12 "4d/bf/ff"
    print_osc4 13 "c0/67/e4"
    print_osc4 14 "70/db/d8"
    print_osc4 15 "f0/f0/f0"

    print_osc_rgb 10 "b9/b9/b9"
    print_osc_rgb 11 "14/14/14"
    print_osc_rgb 12 "a0/a0/a0"
    print_osc_rgb 17 "b9/b9/b9"
    print_osc_rgb 19 "14/14/14"
}

do_linux() {
    print_linux 0 "#141414"
    print_linux 1 "#c16262"
    print_linux 2 "#49b685"
    print_linux 3 "#c5b76d"
    print_linux 4 "#4992b6"
    print_linux 5 "#815bbe"
    print_linux 6 "#41a4a4"
    print_linux 7 "#b9b9b9"
    print_linux 8 "#505050"
    print_linux 9 "#ed5e7a"
    print_linux 10 "#7ece7e"
    print_linux 11 "#dbdb70"
    print_linux 12 "#4dbfff"
    print_linux 13 "#c067e4"
    print_linux 14 "#70dbd8"
    print_linux 15 "#f0f0f0"
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
