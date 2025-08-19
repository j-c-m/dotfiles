#!/usr/bin/env bash

# Source:   iterm
# Theme:    duckbones
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
    print_osc4 0 "0d/10/1a"
    print_osc4 1 "e0/35/00"
    print_osc4 2 "5d/cd/97"
    print_osc4 3 "e3/95/00"
    print_osc4 4 "00/a3/cb"
    print_osc4 5 "79/5c/cc"
    print_osc4 6 "00/a3/cb"
    print_osc4 7 "eb/ef/c0"
    print_osc4 8 "2b/2f/46"
    print_osc4 9 "ff/48/21"
    print_osc4 10 "58/db/9e"
    print_osc4 11 "f6/a1/00"
    print_osc4 12 "00/b4/e0"
    print_osc4 13 "b3/a1/e6"
    print_osc4 14 "00/b4/e0"
    print_osc4 15 "b3/b6/92"

    print_osc_rgb 10 "eb/ef/c0"
    print_osc_rgb 11 "0d/10/1a"
    print_osc_rgb 12 "ed/f2/c2"
    print_osc_rgb 17 "36/38/2c"
    print_osc_rgb 19 "eb/ef/c0"
}

do_linux() {
    print_linux 0 "#0d101a"
    print_linux 1 "#e03500"
    print_linux 2 "#5dcd97"
    print_linux 3 "#e39500"
    print_linux 4 "#00a3cb"
    print_linux 5 "#795ccc"
    print_linux 6 "#00a3cb"
    print_linux 7 "#ebefc0"
    print_linux 8 "#2b2f46"
    print_linux 9 "#ff4821"
    print_linux 10 "#58db9e"
    print_linux 11 "#f6a100"
    print_linux 12 "#00b4e0"
    print_linux 13 "#b3a1e6"
    print_linux 14 "#00b4e0"
    print_linux 15 "#b3b692"
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
