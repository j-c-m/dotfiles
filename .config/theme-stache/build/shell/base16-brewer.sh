#!/usr/bin/env bash

# Source:   base16
# Theme:    Brewer
# Author:   Timothée Poisot (http://github.com/tpoisot)
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
    print_osc4 0 "0c/0d/0e"
    print_osc4 1 "e3/1a/1c"
    print_osc4 2 "31/a3/54"
    print_osc4 3 "dc/a0/60"
    print_osc4 4 "31/82/bd"
    print_osc4 5 "75/6b/b1"
    print_osc4 6 "80/b1/d3"
    print_osc4 7 "b7/b8/b9"
    print_osc4 8 "73/74/75"
    print_osc4 9 "e3/1a/1c"
    print_osc4 10 "31/a3/54"
    print_osc4 11 "dc/a0/60"
    print_osc4 12 "31/82/bd"
    print_osc4 13 "75/6b/b1"
    print_osc4 14 "80/b1/d3"
    print_osc4 15 "fc/fd/fe"

    print_osc_rgb 10 "b7/b8/b9"
    print_osc_rgb 11 "0c/0d/0e"
    print_osc_rgb 12 "b7/b8/b9"
    print_osc_rgb 17 "da/db/dc"
    print_osc_rgb 19 "2e/2f/30"
}

do_linux() {
    print_linux 0 "#0c0d0e"
    print_linux 1 "#e31a1c"
    print_linux 2 "#31a354"
    print_linux 3 "#dca060"
    print_linux 4 "#3182bd"
    print_linux 5 "#756bb1"
    print_linux 6 "#80b1d3"
    print_linux 7 "#b7b8b9"
    print_linux 8 "#737475"
    print_linux 9 "#e31a1c"
    print_linux 10 "#31a354"
    print_linux 11 "#dca060"
    print_linux 12 "#3182bd"
    print_linux 13 "#756bb1"
    print_linux 14 "#80b1d3"
    print_linux 15 "#fcfdfe"
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
