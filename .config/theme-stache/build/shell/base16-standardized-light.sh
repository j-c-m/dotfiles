#!/usr/bin/env bash

# Source:   base16
# Theme:    standardized-light
# Author:   ali (https://github.com/ali-githb/base16-standardized-scheme)
# Variant:  light

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
    print_osc4 0 "ff/ff/ff"
    print_osc4 1 "d0/3e/3e"
    print_osc4 2 "31/86/1f"
    print_osc4 3 "ad/82/00"
    print_osc4 4 "31/73/c5"
    print_osc4 5 "9e/57/c2"
    print_osc4 6 "00/99/8f"
    print_osc4 7 "44/44/44"
    print_osc4 8 "76/76/76"
    print_osc4 9 "d0/3e/3e"
    print_osc4 10 "31/86/1f"
    print_osc4 11 "ad/82/00"
    print_osc4 12 "31/73/c5"
    print_osc4 13 "9e/57/c2"
    print_osc4 14 "00/99/8f"
    print_osc4 15 "22/22/22"

    print_osc_rgb 10 "44/44/44"
    print_osc_rgb 11 "ff/ff/ff"
    print_osc_rgb 12 "44/44/44"
    print_osc_rgb 17 "33/33/33"
    print_osc_rgb 19 "ee/ee/ee"
}

do_linux() {
    print_linux 0 "#ffffff"
    print_linux 1 "#d03e3e"
    print_linux 2 "#31861f"
    print_linux 3 "#ad8200"
    print_linux 4 "#3173c5"
    print_linux 5 "#9e57c2"
    print_linux 6 "#00998f"
    print_linux 7 "#444444"
    print_linux 8 "#767676"
    print_linux 9 "#d03e3e"
    print_linux 10 "#31861f"
    print_linux 11 "#ad8200"
    print_linux 12 "#3173c5"
    print_linux 13 "#9e57c2"
    print_linux 14 "#00998f"
    print_linux 15 "#222222"
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
