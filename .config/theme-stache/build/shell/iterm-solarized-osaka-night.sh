#!/usr/bin/env bash

# Source:   iterm
# Theme:    solarized-osaka-night
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
    print_osc4 0 "15/15/1e"
    print_osc4 1 "f6/76/8d"
    print_osc4 2 "9e/cd/69"
    print_osc4 3 "e0/af/67"
    print_osc4 4 "79/a1/f7"
    print_osc4 5 "ba/99/f7"
    print_osc4 6 "7d/ce/fe"
    print_osc4 7 "a9/b0/d6"
    print_osc4 8 "41/47/68"
    print_osc4 9 "f6/76/8d"
    print_osc4 10 "9e/cd/69"
    print_osc4 11 "e0/af/67"
    print_osc4 12 "79/a1/f7"
    print_osc4 13 "ba/99/f7"
    print_osc4 14 "7d/ce/fe"
    print_osc4 15 "c0/c9/f5"

    print_osc_rgb 10 "c0/c9/f5"
    print_osc_rgb 11 "1a/1a/26"
    print_osc_rgb 12 "c0/c9/f5"
    print_osc_rgb 17 "27/33/57"
    print_osc_rgb 19 "c0/c9/f5"
}

do_linux() {
    print_linux 0 "#15151e"
    print_linux 1 "#f6768d"
    print_linux 2 "#9ecd69"
    print_linux 3 "#e0af67"
    print_linux 4 "#79a1f7"
    print_linux 5 "#ba99f7"
    print_linux 6 "#7dcefe"
    print_linux 7 "#c0c9f5"
    print_linux 8 "#414768"
    print_linux 9 "#f6768d"
    print_linux 10 "#9ecd69"
    print_linux 11 "#e0af67"
    print_linux 12 "#79a1f7"
    print_linux 13 "#ba99f7"
    print_linux 14 "#7dcefe"
    print_linux 15 "#c0c9f5"
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
