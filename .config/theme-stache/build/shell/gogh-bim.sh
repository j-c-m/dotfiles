#!/usr/bin/env bash

# Source:   gogh
# Theme:    Bim
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
    print_osc4 0 "2c/24/23"
    print_osc4 1 "f5/57/a0"
    print_osc4 2 "a9/ee/55"
    print_osc4 3 "f5/a2/55"
    print_osc4 4 "5e/a2/ec"
    print_osc4 5 "a9/57/ec"
    print_osc4 6 "5e/ee/a0"
    print_osc4 7 "91/89/88"
    print_osc4 8 "91/89/88"
    print_osc4 9 "f5/79/b2"
    print_osc4 10 "bb/ee/78"
    print_osc4 11 "f5/b3/78"
    print_osc4 12 "81/b3/ec"
    print_osc4 13 "bb/79/ec"
    print_osc4 14 "81/ee/b2"
    print_osc4 15 "f5/ee/ec"

    print_osc_rgb 10 "a9/be/d8"
    print_osc_rgb 11 "01/28/49"
    print_osc_rgb 12 "a9/be/d8"
    print_osc_rgb 17 "a9/be/d8"
    print_osc_rgb 19 "01/28/49"
}

do_linux() {
    print_linux 0 "#2c2423"
    print_linux 1 "#f557a0"
    print_linux 2 "#a9ee55"
    print_linux 3 "#f5a255"
    print_linux 4 "#5ea2ec"
    print_linux 5 "#a957ec"
    print_linux 6 "#5eeea0"
    print_linux 7 "#a9bed8"
    print_linux 8 "#918988"
    print_linux 9 "#f579b2"
    print_linux 10 "#bbee78"
    print_linux 11 "#f5b378"
    print_linux 12 "#81b3ec"
    print_linux 13 "#bb79ec"
    print_linux 14 "#81eeb2"
    print_linux 15 "#f5eeec"
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
