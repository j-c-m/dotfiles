#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base2Tone Mall
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
    print_osc4 0 "1e/1e/1f"
    print_osc4 1 "a1/7e/fc"
    print_osc4 2 "75/bf/ff"
    print_osc4 3 "b3/db/ff"
    print_osc4 4 "b2/94/ff"
    print_osc4 5 "75/bf/ff"
    print_osc4 6 "c5/ad/ff"
    print_osc4 7 "97/95/9d"
    print_osc4 8 "5e/5c/60"
    print_osc4 9 "8a/c8/ff"
    print_osc4 10 "2b/2b/2c"
    print_osc4 11 "51/50/53"
    print_osc4 12 "6a/68/6e"
    print_osc4 13 "e5/db/ff"
    print_osc4 14 "69/b5/f7"
    print_osc4 15 "f4/f0/ff"

    print_osc_rgb 10 "97/95/9d"
    print_osc_rgb 11 "1e/1e/1f"
    print_osc_rgb 12 "36/92/e2"
    print_osc_rgb 17 "97/95/9d"
    print_osc_rgb 19 "1e/1e/1f"
}

do_linux() {
    print_linux 0 "#1e1e1f"
    print_linux 1 "#a17efc"
    print_linux 2 "#75bfff"
    print_linux 3 "#b3dbff"
    print_linux 4 "#b294ff"
    print_linux 5 "#75bfff"
    print_linux 6 "#c5adff"
    print_linux 7 "#97959d"
    print_linux 8 "#5e5c60"
    print_linux 9 "#8ac8ff"
    print_linux 10 "#2b2b2c"
    print_linux 11 "#515053"
    print_linux 12 "#6a686e"
    print_linux 13 "#e5dbff"
    print_linux 14 "#69b5f7"
    print_linux 15 "#f4f0ff"
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
