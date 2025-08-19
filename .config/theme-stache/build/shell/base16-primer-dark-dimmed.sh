#!/usr/bin/env bash

# Source:   base16
# Theme:    Primer Dark Dimmed
# Author:   Jimmy Lin
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
    print_osc4 0 "1c/21/28"
    print_osc4 1 "f4/70/67"
    print_osc4 2 "57/ab/5a"
    print_osc4 3 "c6/90/26"
    print_osc4 4 "53/9b/f5"
    print_osc4 5 "e2/75/ad"
    print_osc4 6 "96/d0/ff"
    print_osc4 7 "90/9d/ab"
    print_osc4 8 "54/5d/68"
    print_osc4 9 "f4/70/67"
    print_osc4 10 "57/ab/5a"
    print_osc4 11 "c6/90/26"
    print_osc4 12 "53/9b/f5"
    print_osc4 13 "e2/75/ad"
    print_osc4 14 "96/d0/ff"
    print_osc4 15 "cd/d9/e5"

    print_osc_rgb 10 "90/9d/ab"
    print_osc_rgb 11 "1c/21/28"
    print_osc_rgb 12 "90/9d/ab"
    print_osc_rgb 17 "ad/ba/c7"
    print_osc_rgb 19 "37/3e/47"
}

do_linux() {
    print_linux 0 "#1c2128"
    print_linux 1 "#f47067"
    print_linux 2 "#57ab5a"
    print_linux 3 "#c69026"
    print_linux 4 "#539bf5"
    print_linux 5 "#e275ad"
    print_linux 6 "#96d0ff"
    print_linux 7 "#909dab"
    print_linux 8 "#545d68"
    print_linux 9 "#f47067"
    print_linux 10 "#57ab5a"
    print_linux 11 "#c69026"
    print_linux 12 "#539bf5"
    print_linux 13 "#e275ad"
    print_linux 14 "#96d0ff"
    print_linux 15 "#cdd9e5"
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
