#!/usr/bin/env bash

# Source:   iterm
# Theme:    Mellifluous
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
    print_osc4 0 "1a/1a/1a"
    print_osc4 1 "d2/93/93"
    print_osc4 2 "b3/b3/93"
    print_osc4 3 "cb/aa/89"
    print_osc4 4 "a8/a1/be"
    print_osc4 5 "b3/9f/b0"
    print_osc4 6 "c0/af/8c"
    print_osc4 7 "da/da/da"
    print_osc4 8 "5b/5b/5b"
    print_osc4 9 "c9/59/54"
    print_osc4 10 "82/80/40"
    print_osc4 11 "a6/79/4c"
    print_osc4 12 "5a/65/99"
    print_osc4 13 "9c/69/95"
    print_osc4 14 "74/a3/9e"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "da/da/da"
    print_osc_rgb 11 "1a/1a/1a"
    print_osc_rgb 12 "bf/ad/9e"
    print_osc_rgb 17 "2d/2d/2d"
    print_osc_rgb 19 "c0/af/8c"
}

do_linux() {
    print_linux 0 "#1a1a1a"
    print_linux 1 "#d29393"
    print_linux 2 "#b3b393"
    print_linux 3 "#cbaa89"
    print_linux 4 "#a8a1be"
    print_linux 5 "#b39fb0"
    print_linux 6 "#c0af8c"
    print_linux 7 "#dadada"
    print_linux 8 "#5b5b5b"
    print_linux 9 "#c95954"
    print_linux 10 "#828040"
    print_linux 11 "#a6794c"
    print_linux 12 "#5a6599"
    print_linux 13 "#9c6995"
    print_linux 14 "#74a39e"
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
