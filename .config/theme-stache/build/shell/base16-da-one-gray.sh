#!/usr/bin/env bash

# Source:   base16
# Theme:    Da One Gray
# Author:   NNB (https://github.com/NNBnh)
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
    print_osc4 0 "18/18/18"
    print_osc4 1 "fa/78/83"
    print_osc4 2 "98/c3/79"
    print_osc4 3 "ff/94/70"
    print_osc4 4 "6b/b8/ff"
    print_osc4 5 "e7/99/ff"
    print_osc4 6 "8a/f5/ff"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "88/88/88"
    print_osc4 9 "fa/78/83"
    print_osc4 10 "98/c3/79"
    print_osc4 11 "ff/94/70"
    print_osc4 12 "6b/b8/ff"
    print_osc4 13 "e7/99/ff"
    print_osc4 14 "8a/f5/ff"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "18/18/18"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "ff/ff/ff"
    print_osc_rgb 19 "28/28/28"
}

do_linux() {
    print_linux 0 "#181818"
    print_linux 1 "#fa7883"
    print_linux 2 "#98c379"
    print_linux 3 "#ff9470"
    print_linux 4 "#6bb8ff"
    print_linux 5 "#e799ff"
    print_linux 6 "#8af5ff"
    print_linux 7 "#ffffff"
    print_linux 8 "#888888"
    print_linux 9 "#fa7883"
    print_linux 10 "#98c379"
    print_linux 11 "#ff9470"
    print_linux 12 "#6bb8ff"
    print_linux 13 "#e799ff"
    print_linux 14 "#8af5ff"
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
