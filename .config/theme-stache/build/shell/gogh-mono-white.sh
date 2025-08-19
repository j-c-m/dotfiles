#!/usr/bin/env bash

# Source:   gogh
# Theme:    Mono White
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
    print_osc4 0 "3b/3b/3b"
    print_osc4 1 "fa/fa/fa"
    print_osc4 2 "fa/fa/fa"
    print_osc4 3 "fa/fa/fa"
    print_osc4 4 "fa/fa/fa"
    print_osc4 5 "fa/fa/fa"
    print_osc4 6 "fa/fa/fa"
    print_osc4 7 "fa/fa/fa"
    print_osc4 8 "fa/fa/fa"
    print_osc4 9 "fa/fa/fa"
    print_osc4 10 "fa/fa/fa"
    print_osc4 11 "fa/fa/fa"
    print_osc4 12 "fa/fa/fa"
    print_osc4 13 "fa/fa/fa"
    print_osc4 14 "fa/fa/fa"
    print_osc4 15 "fa/fa/fa"

    print_osc_rgb 10 "fa/fa/fa"
    print_osc_rgb 11 "26/26/26"
    print_osc_rgb 12 "fa/fa/fa"
    print_osc_rgb 17 "fa/fa/fa"
    print_osc_rgb 19 "26/26/26"
}

do_linux() {
    print_linux 0 "#3b3b3b"
    print_linux 1 "#fafafa"
    print_linux 2 "#fafafa"
    print_linux 3 "#fafafa"
    print_linux 4 "#fafafa"
    print_linux 5 "#fafafa"
    print_linux 6 "#fafafa"
    print_linux 7 "#fafafa"
    print_linux 8 "#fafafa"
    print_linux 9 "#fafafa"
    print_linux 10 "#fafafa"
    print_linux 11 "#fafafa"
    print_linux 12 "#fafafa"
    print_linux 13 "#fafafa"
    print_linux 14 "#fafafa"
    print_linux 15 "#fafafa"
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
