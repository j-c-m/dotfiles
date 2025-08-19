#!/usr/bin/env bash

# Source:   iterm
# Theme:    IRIX Console
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
    print_osc4 0 "19/19/19"
    print_osc4 1 "d4/24/26"
    print_osc4 2 "36/a2/26"
    print_osc4 3 "c1/9c/27"
    print_osc4 4 "07/38/e1"
    print_osc4 5 "91/1f/9c"
    print_osc4 6 "44/96/de"
    print_osc4 7 "cc/cb/cb"
    print_osc4 8 "76/75/75"
    print_osc4 9 "f3/4e/59"
    print_osc4 10 "44/c7/30"
    print_osc4 11 "f9/f1/a7"
    print_osc4 12 "3f/78/ff"
    print_osc4 13 "c2/1b/a2"
    print_osc4 14 "6e/d7/d6"
    print_osc4 15 "f2/f1/f1"

    print_osc_rgb 10 "f2/f2/f2"
    print_osc_rgb 11 "0c/0b/0b"
    print_osc_rgb 12 "c7/c7/c7"
    print_osc_rgb 17 "c1/dd/ff"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#191919"
    print_linux 1 "#d42426"
    print_linux 2 "#36a226"
    print_linux 3 "#c19c27"
    print_linux 4 "#0738e1"
    print_linux 5 "#911f9c"
    print_linux 6 "#4496de"
    print_linux 7 "#f2f2f2"
    print_linux 8 "#767575"
    print_linux 9 "#f34e59"
    print_linux 10 "#44c730"
    print_linux 11 "#f9f1a7"
    print_linux 12 "#3f78ff"
    print_linux 13 "#c21ba2"
    print_linux 14 "#6ed7d6"
    print_linux 15 "#f2f1f1"
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
