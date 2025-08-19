#!/usr/bin/env bash

# Source:   gogh
# Theme:    Oxocarbon Dark
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "26/26/26"
    print_osc4 1 "ee/53/96"
    print_osc4 2 "42/be/65"
    print_osc4 3 "ff/e9/7b"
    print_osc4 4 "33/b1/ff"
    print_osc4 5 "ff/7e/b6"
    print_osc4 6 "3d/db/d9"
    print_osc4 7 "dd/e1/e6"
    print_osc4 8 "39/39/39"
    print_osc4 9 "ee/53/96"
    print_osc4 10 "42/be/65"
    print_osc4 11 "ff/e9/7b"
    print_osc4 12 "33/b1/ff"
    print_osc4 13 "ff/7e/b6"
    print_osc4 14 "3d/db/d9"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "16/16/16"
    print_osc_rgb 12 "6f/6f/6f"
    print_osc_rgb 17 "ff/ff/ff"
    print_osc_rgb 19 "16/16/16"
}

do_linux() {
    print_linux 0 "#262626"
    print_linux 1 "#ee5396"
    print_linux 2 "#42be65"
    print_linux 3 "#ffe97b"
    print_linux 4 "#33b1ff"
    print_linux 5 "#ff7eb6"
    print_linux 6 "#3ddbd9"
    print_linux 7 "#ffffff"
    print_linux 8 "#393939"
    print_linux 9 "#ee5396"
    print_linux 10 "#42be65"
    print_linux 11 "#ffe97b"
    print_linux 12 "#33b1ff"
    print_linux 13 "#ff7eb6"
    print_linux 14 "#3ddbd9"
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
