#!/usr/bin/env bash

# Source:   iterm
# Theme:    Raycast_Dark
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
    print_osc4 1 "ff/53/60"
    print_osc4 2 "59/d4/99"
    print_osc4 3 "ff/c5/31"
    print_osc4 4 "56/c2/ff"
    print_osc4 5 "cf/2f/98"
    print_osc4 6 "52/ee/e5"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "00/00/00"
    print_osc4 9 "ff/63/63"
    print_osc4 10 "59/d4/99"
    print_osc4 11 "ff/c5/31"
    print_osc4 12 "56/c2/ff"
    print_osc4 13 "cf/2f/98"
    print_osc4 14 "52/ee/e5"
    print_osc4 15 "fe/ff/ff"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "19/19/19"
    print_osc_rgb 12 "cc/cc/cc"
    print_osc_rgb 17 "33/33/33"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#ff5360"
    print_linux 2 "#59d499"
    print_linux 3 "#ffc531"
    print_linux 4 "#56c2ff"
    print_linux 5 "#cf2f98"
    print_linux 6 "#52eee5"
    print_linux 7 "#ffffff"
    print_linux 8 "#000000"
    print_linux 9 "#ff6363"
    print_linux 10 "#59d499"
    print_linux 11 "#ffc531"
    print_linux 12 "#56c2ff"
    print_linux 13 "#cf2f98"
    print_linux 14 "#52eee5"
    print_linux 15 "#feffff"
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
