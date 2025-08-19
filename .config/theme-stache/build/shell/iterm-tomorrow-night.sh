#!/usr/bin/env bash

# Source:   iterm
# Theme:    Tomorrow Night
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
    print_osc4 1 "cc/66/66"
    print_osc4 2 "b5/bd/68"
    print_osc4 3 "f0/c6/74"
    print_osc4 4 "81/a2/be"
    print_osc4 5 "b2/93/bb"
    print_osc4 6 "8a/be/b7"
    print_osc4 7 "ff/fe/fe"
    print_osc4 8 "00/00/00"
    print_osc4 9 "cc/66/66"
    print_osc4 10 "b5/bd/68"
    print_osc4 11 "f0/c5/74"
    print_osc4 12 "80/a1/bd"
    print_osc4 13 "b2/94/ba"
    print_osc4 14 "8a/bd/b6"
    print_osc4 15 "ff/fe/fe"

    print_osc_rgb 10 "c5/c8/c6"
    print_osc_rgb 11 "1d/1f/21"
    print_osc_rgb 12 "c4/c8/c5"
    print_osc_rgb 17 "37/3b/41"
    print_osc_rgb 19 "c4/c8/c5"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#cc6666"
    print_linux 2 "#b5bd68"
    print_linux 3 "#f0c674"
    print_linux 4 "#81a2be"
    print_linux 5 "#b293bb"
    print_linux 6 "#8abeb7"
    print_linux 7 "#c5c8c6"
    print_linux 8 "#000000"
    print_linux 9 "#cc6666"
    print_linux 10 "#b5bd68"
    print_linux 11 "#f0c574"
    print_linux 12 "#80a1bd"
    print_linux 13 "#b294ba"
    print_linux 14 "#8abdb6"
    print_linux 15 "#fffefe"
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
