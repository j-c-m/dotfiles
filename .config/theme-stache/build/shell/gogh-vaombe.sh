#!/usr/bin/env bash

# Source:   gogh
# Theme:    Vaombe
# Author:   Daniel Perez (https://www.github.com/sysaloe)
# Variant:  Dark

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
    print_osc4 0 "11/14/13"
    print_osc4 1 "8f/32/32"
    print_osc4 2 "3b/5c/3b"
    print_osc4 3 "7a/63/22"
    print_osc4 4 "28/40/5c"
    print_osc4 5 "46/28/5c"
    print_osc4 6 "34/66/66"
    print_osc4 7 "d1/d1/d1"
    print_osc4 8 "21/29/27"
    print_osc4 9 "b8/42/42"
    print_osc4 10 "57/a3/55"
    print_osc4 11 "db/bb/60"
    print_osc4 12 "51/83/b8"
    print_osc4 13 "93/5f/b8"
    print_osc4 14 "51/b8/b0"
    print_osc4 15 "f5/ff/fd"

    print_osc_rgb 10 "f5/ff/fd"
    print_osc_rgb 11 "01/0a/08"
    print_osc_rgb 12 "9d/f5/e2"
    print_osc_rgb 17 "f5/ff/fd"
    print_osc_rgb 19 "01/0a/08"
}

do_linux() {
    print_linux 0 "#111413"
    print_linux 1 "#8f3232"
    print_linux 2 "#3b5c3b"
    print_linux 3 "#7a6322"
    print_linux 4 "#28405c"
    print_linux 5 "#46285c"
    print_linux 6 "#346666"
    print_linux 7 "#f5fffd"
    print_linux 8 "#212927"
    print_linux 9 "#b84242"
    print_linux 10 "#57a355"
    print_linux 11 "#dbbb60"
    print_linux 12 "#5183b8"
    print_linux 13 "#935fb8"
    print_linux 14 "#51b8b0"
    print_linux 15 "#f5fffd"
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
