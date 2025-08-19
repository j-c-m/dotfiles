#!/usr/bin/env bash

# Source:   gogh
# Theme:    Earthsong
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
    print_osc4 0 "12/14/18"
    print_osc4 1 "c9/42/34"
    print_osc4 2 "85/c5/4c"
    print_osc4 3 "f5/ae/2e"
    print_osc4 4 "13/98/b9"
    print_osc4 5 "d0/63/3d"
    print_osc4 6 "50/95/52"
    print_osc4 7 "e5/c6/aa"
    print_osc4 8 "67/5f/54"
    print_osc4 9 "ff/64/5a"
    print_osc4 10 "98/e0/36"
    print_osc4 11 "e0/d5/61"
    print_osc4 12 "5f/da/ff"
    print_osc4 13 "ff/92/69"
    print_osc4 14 "84/f0/88"
    print_osc4 15 "f6/f7/ec"

    print_osc_rgb 10 "e5/c7/a9"
    print_osc_rgb 11 "29/25/20"
    print_osc_rgb 12 "e5/c7/a9"
    print_osc_rgb 17 "e5/c7/a9"
    print_osc_rgb 19 "29/25/20"
}

do_linux() {
    print_linux 0 "#121418"
    print_linux 1 "#c94234"
    print_linux 2 "#85c54c"
    print_linux 3 "#f5ae2e"
    print_linux 4 "#1398b9"
    print_linux 5 "#d0633d"
    print_linux 6 "#509552"
    print_linux 7 "#e5c7a9"
    print_linux 8 "#675f54"
    print_linux 9 "#ff645a"
    print_linux 10 "#98e036"
    print_linux 11 "#e0d561"
    print_linux 12 "#5fdaff"
    print_linux 13 "#ff9269"
    print_linux 14 "#84f088"
    print_linux 15 "#f6f7ec"
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
