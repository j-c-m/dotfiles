#!/usr/bin/env bash

# Source:   iterm
# Theme:    ChallengerDeep
# Author:   unknown
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
    print_osc4 0 "14/11/27"
    print_osc4 1 "ff/54/58"
    print_osc4 2 "62/d1/96"
    print_osc4 3 "ff/b3/78"
    print_osc4 4 "65/b2/ff"
    print_osc4 5 "90/6c/ff"
    print_osc4 6 "63/f2/f1"
    print_osc4 7 "a6/b3/cc"
    print_osc4 8 "56/55/75"
    print_osc4 9 "ff/80/80"
    print_osc4 10 "95/ff/a4"
    print_osc4 11 "ff/e9/aa"
    print_osc4 12 "91/dd/ff"
    print_osc4 13 "c9/91/e1"
    print_osc4 14 "aa/ff/e4"
    print_osc4 15 "cb/e3/e7"

    print_osc_rgb 10 "cb/e0/e7"
    print_osc_rgb 11 "1e/1c/31"
    print_osc_rgb 12 "fb/fc/fc"
    print_osc_rgb 17 "cb/e1/e7"
    print_osc_rgb 19 "1e/1c/31"
}

do_linux() {
    print_linux 0 "#141127"
    print_linux 1 "#ff5458"
    print_linux 2 "#62d196"
    print_linux 3 "#ffb378"
    print_linux 4 "#65b2ff"
    print_linux 5 "#906cff"
    print_linux 6 "#63f2f1"
    print_linux 7 "#cbe0e7"
    print_linux 8 "#565575"
    print_linux 9 "#ff8080"
    print_linux 10 "#95ffa4"
    print_linux 11 "#ffe9aa"
    print_linux 12 "#91ddff"
    print_linux 13 "#c991e1"
    print_linux 14 "#aaffe4"
    print_linux 15 "#cbe3e7"
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
