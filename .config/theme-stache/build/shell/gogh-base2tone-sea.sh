#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base2Tone Sea
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
    print_osc4 0 "1d/26/2f"
    print_osc4 1 "34/65/9d"
    print_osc4 2 "0f/c7/8a"
    print_osc4 3 "47/eb/b4"
    print_osc4 4 "57/71/8e"
    print_osc4 5 "0f/c7/8a"
    print_osc4 6 "6e/9b/cf"
    print_osc4 7 "a1/aa/b5"
    print_osc4 8 "4a/5f/78"
    print_osc4 9 "14/e1/9d"
    print_osc4 10 "27/32/3f"
    print_osc4 11 "40/53/68"
    print_osc4 12 "73/81/91"
    print_osc4 13 "af/d4/fe"
    print_osc4 14 "0d/b5/7d"
    print_osc4 15 "eb/f4/ff"

    print_osc_rgb 10 "a1/aa/b5"
    print_osc_rgb 11 "1d/26/2f"
    print_osc_rgb 12 "06/79/53"
    print_osc_rgb 17 "a1/aa/b5"
    print_osc_rgb 19 "1d/26/2f"
}

do_linux() {
    print_linux 0 "#1d262f"
    print_linux 1 "#34659d"
    print_linux 2 "#0fc78a"
    print_linux 3 "#47ebb4"
    print_linux 4 "#57718e"
    print_linux 5 "#0fc78a"
    print_linux 6 "#6e9bcf"
    print_linux 7 "#a1aab5"
    print_linux 8 "#4a5f78"
    print_linux 9 "#14e19d"
    print_linux 10 "#27323f"
    print_linux 11 "#405368"
    print_linux 12 "#738191"
    print_linux 13 "#afd4fe"
    print_linux 14 "#0db57d"
    print_linux 15 "#ebf4ff"
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
