#!/usr/bin/env bash

# Source:   base16
# Theme:    Oxocarbon Dark
# Author:   shaunsingh/IBM
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
    print_osc4 0 "16/16/16"
    print_osc4 1 "3d/db/d9"
    print_osc4 2 "33/b1/ff"
    print_osc4 3 "ee/53/96"
    print_osc4 4 "42/be/65"
    print_osc4 5 "be/95/ff"
    print_osc4 6 "ff/7e/b6"
    print_osc4 7 "f2/f4/f8"
    print_osc4 8 "52/52/52"
    print_osc4 9 "3d/db/d9"
    print_osc4 10 "33/b1/ff"
    print_osc4 11 "ee/53/96"
    print_osc4 12 "42/be/65"
    print_osc4 13 "be/95/ff"
    print_osc4 14 "ff/7e/b6"
    print_osc4 15 "08/bd/ba"

    print_osc_rgb 10 "f2/f4/f8"
    print_osc_rgb 11 "16/16/16"
    print_osc_rgb 12 "f2/f4/f8"
    print_osc_rgb 17 "ff/ff/ff"
    print_osc_rgb 19 "26/26/26"
}

do_linux() {
    print_linux 0 "#161616"
    print_linux 1 "#3ddbd9"
    print_linux 2 "#33b1ff"
    print_linux 3 "#ee5396"
    print_linux 4 "#42be65"
    print_linux 5 "#be95ff"
    print_linux 6 "#ff7eb6"
    print_linux 7 "#f2f4f8"
    print_linux 8 "#525252"
    print_linux 9 "#3ddbd9"
    print_linux 10 "#33b1ff"
    print_linux 11 "#ee5396"
    print_linux 12 "#42be65"
    print_linux 13 "#be95ff"
    print_linux 14 "#ff7eb6"
    print_linux 15 "#08bdba"
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
