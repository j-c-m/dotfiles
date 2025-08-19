#!/usr/bin/env bash

# Source:   gogh
# Theme:    Mono Cyan
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
    print_osc4 0 "00/33/40"
    print_osc4 1 "00/cc/ff"
    print_osc4 2 "00/cc/ff"
    print_osc4 3 "00/cc/ff"
    print_osc4 4 "00/cc/ff"
    print_osc4 5 "00/cc/ff"
    print_osc4 6 "00/cc/ff"
    print_osc4 7 "00/cc/ff"
    print_osc4 8 "00/cc/ff"
    print_osc4 9 "00/cc/ff"
    print_osc4 10 "00/cc/ff"
    print_osc4 11 "00/cc/ff"
    print_osc4 12 "00/cc/ff"
    print_osc4 13 "00/cc/ff"
    print_osc4 14 "00/cc/ff"
    print_osc4 15 "00/cc/ff"

    print_osc_rgb 10 "00/cc/ff"
    print_osc_rgb 11 "00/22/2b"
    print_osc_rgb 12 "00/cc/ff"
    print_osc_rgb 17 "00/cc/ff"
    print_osc_rgb 19 "00/22/2b"
}

do_linux() {
    print_linux 0 "#003340"
    print_linux 1 "#00ccff"
    print_linux 2 "#00ccff"
    print_linux 3 "#00ccff"
    print_linux 4 "#00ccff"
    print_linux 5 "#00ccff"
    print_linux 6 "#00ccff"
    print_linux 7 "#00ccff"
    print_linux 8 "#00ccff"
    print_linux 9 "#00ccff"
    print_linux 10 "#00ccff"
    print_linux 11 "#00ccff"
    print_linux 12 "#00ccff"
    print_linux 13 "#00ccff"
    print_linux 14 "#00ccff"
    print_linux 15 "#00ccff"
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
