#!/usr/bin/env bash

# Source:   gogh
# Theme:    Twilight
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "14/14/14"
    print_osc4 1 "c0/6d/44"
    print_osc4 2 "af/b9/7a"
    print_osc4 3 "c2/a8/6c"
    print_osc4 4 "44/47/4a"
    print_osc4 5 "b4/be/7c"
    print_osc4 6 "77/83/85"
    print_osc4 7 "ff/ff/d4"
    print_osc4 8 "26/26/26"
    print_osc4 9 "de/7c/4c"
    print_osc4 10 "cc/d8/8c"
    print_osc4 11 "e2/c4/7e"
    print_osc4 12 "5a/5e/62"
    print_osc4 13 "d0/dc/8e"
    print_osc4 14 "8a/98/9b"
    print_osc4 15 "ff/ff/d4"

    print_osc_rgb 10 "ff/ff/d4"
    print_osc_rgb 11 "14/14/14"
    print_osc_rgb 12 "ff/ff/d4"
    print_osc_rgb 17 "ff/ff/d4"
    print_osc_rgb 19 "14/14/14"
}

do_linux() {
    print_linux 0 "#141414"
    print_linux 1 "#c06d44"
    print_linux 2 "#afb97a"
    print_linux 3 "#c2a86c"
    print_linux 4 "#44474a"
    print_linux 5 "#b4be7c"
    print_linux 6 "#778385"
    print_linux 7 "#ffffd4"
    print_linux 8 "#262626"
    print_linux 9 "#de7c4c"
    print_linux 10 "#ccd88c"
    print_linux 11 "#e2c47e"
    print_linux 12 "#5a5e62"
    print_linux 13 "#d0dc8e"
    print_linux 14 "#8a989b"
    print_linux 15 "#ffffd4"
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
