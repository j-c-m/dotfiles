#!/usr/bin/env bash

# Source:   base16
# Theme:    Github Dark
# Author:   Tinted Theming (https://github.com/tinted-theming)
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
    print_osc4 0 "16/1b/22"
    print_osc4 1 "f8/51/49"
    print_osc4 2 "2e/a0/43"
    print_osc4 3 "bb/80/09"
    print_osc4 4 "38/8b/fd"
    print_osc4 5 "a3/71/f7"
    print_osc4 6 "2a/9d/9a"
    print_osc4 7 "c9/d1/d9"
    print_osc4 8 "6e/76/81"
    print_osc4 9 "f8/51/49"
    print_osc4 10 "2e/a0/43"
    print_osc4 11 "bb/80/09"
    print_osc4 12 "38/8b/fd"
    print_osc4 13 "a3/71/f7"
    print_osc4 14 "2a/9d/9a"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "c9/d1/d9"
    print_osc_rgb 11 "16/1b/22"
    print_osc_rgb 12 "c9/d1/d9"
    print_osc_rgb 17 "f0/f6/fc"
    print_osc_rgb 19 "30/36/3d"
}

do_linux() {
    print_linux 0 "#161b22"
    print_linux 1 "#f85149"
    print_linux 2 "#2ea043"
    print_linux 3 "#bb8009"
    print_linux 4 "#388bfd"
    print_linux 5 "#a371f7"
    print_linux 6 "#2a9d9a"
    print_linux 7 "#c9d1d9"
    print_linux 8 "#6e7681"
    print_linux 9 "#f85149"
    print_linux 10 "#2ea043"
    print_linux 11 "#bb8009"
    print_linux 12 "#388bfd"
    print_linux 13 "#a371f7"
    print_linux 14 "#2a9d9a"
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
