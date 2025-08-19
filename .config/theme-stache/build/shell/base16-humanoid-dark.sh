#!/usr/bin/env bash

# Source:   base16
# Theme:    Humanoid dark
# Author:   Thomas (tasmo) Friese
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
    print_osc4 0 "23/26/29"
    print_osc4 1 "f1/12/35"
    print_osc4 2 "02/d8/49"
    print_osc4 3 "ff/b6/27"
    print_osc4 4 "00/a6/fb"
    print_osc4 5 "f1/5e/e3"
    print_osc4 6 "0d/d9/d6"
    print_osc4 7 "f8/f8/f2"
    print_osc4 8 "60/61/5d"
    print_osc4 9 "f1/12/35"
    print_osc4 10 "02/d8/49"
    print_osc4 11 "ff/b6/27"
    print_osc4 12 "00/a6/fb"
    print_osc4 13 "f1/5e/e3"
    print_osc4 14 "0d/d9/d6"
    print_osc4 15 "fc/fc/fc"

    print_osc_rgb 10 "f8/f8/f2"
    print_osc_rgb 11 "23/26/29"
    print_osc_rgb 12 "f8/f8/f2"
    print_osc_rgb 17 "fc/fc/f6"
    print_osc_rgb 19 "33/3b/3d"
}

do_linux() {
    print_linux 0 "#232629"
    print_linux 1 "#f11235"
    print_linux 2 "#02d849"
    print_linux 3 "#ffb627"
    print_linux 4 "#00a6fb"
    print_linux 5 "#f15ee3"
    print_linux 6 "#0dd9d6"
    print_linux 7 "#f8f8f2"
    print_linux 8 "#60615d"
    print_linux 9 "#f11235"
    print_linux 10 "#02d849"
    print_linux 11 "#ffb627"
    print_linux 12 "#00a6fb"
    print_linux 13 "#f15ee3"
    print_linux 14 "#0dd9d6"
    print_linux 15 "#fcfcfc"
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
