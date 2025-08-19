#!/usr/bin/env bash

# Source:   iterm
# Theme:    Desert
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
    print_osc4 0 "4d/4d/4d"
    print_osc4 1 "ff/2b/2b"
    print_osc4 2 "98/fb/98"
    print_osc4 3 "f0/e6/8c"
    print_osc4 4 "cd/85/3f"
    print_osc4 5 "ff/de/ad"
    print_osc4 6 "ff/a0/a0"
    print_osc4 7 "f5/de/b3"
    print_osc4 8 "55/55/55"
    print_osc4 9 "ff/55/55"
    print_osc4 10 "55/ff/55"
    print_osc4 11 "ff/ff/55"
    print_osc4 12 "87/ce/ff"
    print_osc4 13 "ff/55/ff"
    print_osc4 14 "ff/d7/00"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "33/33/33"
    print_osc_rgb 12 "00/ff/00"
    print_osc_rgb 17 "b5/d5/ff"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#4d4d4d"
    print_linux 1 "#ff2b2b"
    print_linux 2 "#98fb98"
    print_linux 3 "#f0e68c"
    print_linux 4 "#cd853f"
    print_linux 5 "#ffdead"
    print_linux 6 "#ffa0a0"
    print_linux 7 "#ffffff"
    print_linux 8 "#555555"
    print_linux 9 "#ff5555"
    print_linux 10 "#55ff55"
    print_linux 11 "#ffff55"
    print_linux 12 "#87ceff"
    print_linux 13 "#ff55ff"
    print_linux 14 "#ffd700"
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
