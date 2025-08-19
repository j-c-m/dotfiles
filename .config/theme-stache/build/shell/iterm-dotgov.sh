#!/usr/bin/env bash

# Source:   iterm
# Theme:    DotGov
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
    print_osc4 0 "18/18/18"
    print_osc4 1 "bf/08/1d"
    print_osc4 2 "3d/97/51"
    print_osc4 3 "f6/bb/33"
    print_osc4 4 "16/b1/df"
    print_osc4 5 "77/2f/b0"
    print_osc4 6 "8b/d1/ed"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "18/18/18"
    print_osc4 9 "bf/08/1d"
    print_osc4 10 "3d/97/51"
    print_osc4 11 "f6/bb/33"
    print_osc4 12 "16/b1/df"
    print_osc4 13 "77/2f/b0"
    print_osc4 14 "8b/d1/ed"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ea/ea/ea"
    print_osc_rgb 11 "25/2b/35"
    print_osc_rgb 12 "d9/00/2f"
    print_osc_rgb 17 "19/40/80"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#181818"
    print_linux 1 "#bf081d"
    print_linux 2 "#3d9751"
    print_linux 3 "#f6bb33"
    print_linux 4 "#16b1df"
    print_linux 5 "#772fb0"
    print_linux 6 "#8bd1ed"
    print_linux 7 "#eaeaea"
    print_linux 8 "#181818"
    print_linux 9 "#bf081d"
    print_linux 10 "#3d9751"
    print_linux 11 "#f6bb33"
    print_linux 12 "#16b1df"
    print_linux 13 "#772fb0"
    print_linux 14 "#8bd1ed"
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
