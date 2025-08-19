#!/usr/bin/env bash

# Source:   gogh
# Theme:    Monokai Pro Spectrum
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
    print_osc4 0 "36/35/37"
    print_osc4 1 "fc/61/8d"
    print_osc4 2 "7b/d8/8f"
    print_osc4 3 "fc/e5/66"
    print_osc4 4 "fd/93/53"
    print_osc4 5 "94/8a/e3"
    print_osc4 6 "5a/d4/e6"
    print_osc4 7 "f7/f1/ff"
    print_osc4 8 "a1/a1/a1"
    print_osc4 9 "fc/61/8d"
    print_osc4 10 "7b/d8/8f"
    print_osc4 11 "fc/e5/66"
    print_osc4 12 "fd/93/53"
    print_osc4 13 "94/8a/e3"
    print_osc4 14 "5a/d4/e6"
    print_osc4 15 "f7/f1/ff"

    print_osc_rgb 10 "f7/f1/ff"
    print_osc_rgb 11 "36/35/37"
    print_osc_rgb 12 "f7/f1/ff"
    print_osc_rgb 17 "f7/f1/ff"
    print_osc_rgb 19 "36/35/37"
}

do_linux() {
    print_linux 0 "#363537"
    print_linux 1 "#fc618d"
    print_linux 2 "#7bd88f"
    print_linux 3 "#fce566"
    print_linux 4 "#fd9353"
    print_linux 5 "#948ae3"
    print_linux 6 "#5ad4e6"
    print_linux 7 "#f7f1ff"
    print_linux 8 "#a1a1a1"
    print_linux 9 "#fc618d"
    print_linux 10 "#7bd88f"
    print_linux 11 "#fce566"
    print_linux 12 "#fd9353"
    print_linux 13 "#948ae3"
    print_linux 14 "#5ad4e6"
    print_linux 15 "#f7f1ff"
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
