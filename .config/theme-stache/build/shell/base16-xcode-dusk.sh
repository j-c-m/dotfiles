#!/usr/bin/env bash

# Source:   base16
# Theme:    XCode Dusk
# Author:   Elsa Gonsiorowski (https://github.com/gonsie)
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
    print_osc4 0 "28/2b/35"
    print_osc4 1 "b2/18/89"
    print_osc4 2 "df/00/02"
    print_osc4 3 "43/82/88"
    print_osc4 4 "79/0e/ad"
    print_osc4 5 "b2/18/89"
    print_osc4 6 "00/a0/be"
    print_osc4 7 "93/95/99"
    print_osc4 8 "68/6a/71"
    print_osc4 9 "b2/18/89"
    print_osc4 10 "df/00/02"
    print_osc4 11 "43/82/88"
    print_osc4 12 "79/0e/ad"
    print_osc4 13 "b2/18/89"
    print_osc4 14 "00/a0/be"
    print_osc4 15 "be/bf/c2"

    print_osc_rgb 10 "93/95/99"
    print_osc_rgb 11 "28/2b/35"
    print_osc_rgb 12 "93/95/99"
    print_osc_rgb 17 "a9/aa/ae"
    print_osc_rgb 19 "3d/40/48"
}

do_linux() {
    print_linux 0 "#282b35"
    print_linux 1 "#b21889"
    print_linux 2 "#df0002"
    print_linux 3 "#438288"
    print_linux 4 "#790ead"
    print_linux 5 "#b21889"
    print_linux 6 "#00a0be"
    print_linux 7 "#939599"
    print_linux 8 "#686a71"
    print_linux 9 "#b21889"
    print_linux 10 "#df0002"
    print_linux 11 "#438288"
    print_linux 12 "#790ead"
    print_linux 13 "#b21889"
    print_linux 14 "#00a0be"
    print_linux 15 "#bebfc2"
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
