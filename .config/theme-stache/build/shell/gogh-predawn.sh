#!/usr/bin/env bash

# Source:   gogh
# Theme:    Predawn
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
    print_osc4 0 "f1/82/60"
    print_osc4 1 "b5/1a/20"
    print_osc4 2 "a6/cc/75"
    print_osc4 3 "fe/d3/3a"
    print_osc4 4 "81/b2/b1"
    print_osc4 5 "eb/6c/4e"
    print_osc4 6 "81/b2/b1"
    print_osc4 7 "ea/ea/ea"
    print_osc4 8 "66/66/66"
    print_osc4 9 "ff/00/0b"
    print_osc4 10 "c4/ee/94"
    print_osc4 11 "e8/e0/6d"
    print_osc4 12 "a5/eb/ea"
    print_osc4 13 "ef/8a/50"
    print_osc4 14 "a5/eb/ea"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "f1/f1/f1"
    print_osc_rgb 11 "28/28/28"
    print_osc_rgb 12 "f1/f1/f1"
    print_osc_rgb 17 "f1/f1/f1"
    print_osc_rgb 19 "28/28/28"
}

do_linux() {
    print_linux 0 "#f18260"
    print_linux 1 "#b51a20"
    print_linux 2 "#a6cc75"
    print_linux 3 "#fed33a"
    print_linux 4 "#81b2b1"
    print_linux 5 "#eb6c4e"
    print_linux 6 "#81b2b1"
    print_linux 7 "#f1f1f1"
    print_linux 8 "#666666"
    print_linux 9 "#ff000b"
    print_linux 10 "#c4ee94"
    print_linux 11 "#e8e06d"
    print_linux 12 "#a5ebea"
    print_linux 13 "#ef8a50"
    print_linux 14 "#a5ebea"
    print_linux 15 "#ffffff"
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
