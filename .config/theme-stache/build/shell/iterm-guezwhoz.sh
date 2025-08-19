#!/usr/bin/env bash

# Source:   iterm
# Theme:    Guezwhoz
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
    print_osc4 0 "33/33/33"
    print_osc4 1 "e7/50/81"
    print_osc4 2 "79/d5/94"
    print_osc4 3 "b6/d0/73"
    print_osc4 4 "59/a0/d5"
    print_osc4 5 "99/8f/df"
    print_osc4 6 "58/d5/cd"
    print_osc4 7 "d9/d9/d9"
    print_osc4 8 "80/80/80"
    print_osc4 9 "e7/50/81"
    print_osc4 10 "af/d6/af"
    print_osc4 11 "d0/ec/85"
    print_osc4 12 "64/b1/ec"
    print_osc4 13 "a2/98/ec"
    print_osc4 14 "61/ec/e3"
    print_osc4 15 "ec/ec/ec"

    print_osc_rgb 10 "d9/d9/d9"
    print_osc_rgb 11 "1c/1c/1c"
    print_osc_rgb 12 "99/d4/b0"
    print_osc_rgb 17 "24/53/53"
    print_osc_rgb 19 "58/d5/cd"
}

do_linux() {
    print_linux 0 "#333333"
    print_linux 1 "#e75081"
    print_linux 2 "#79d594"
    print_linux 3 "#b6d073"
    print_linux 4 "#59a0d5"
    print_linux 5 "#998fdf"
    print_linux 6 "#58d5cd"
    print_linux 7 "#d9d9d9"
    print_linux 8 "#808080"
    print_linux 9 "#e75081"
    print_linux 10 "#afd6af"
    print_linux 11 "#d0ec85"
    print_linux 12 "#64b1ec"
    print_linux 13 "#a298ec"
    print_linux 14 "#61ece3"
    print_linux 15 "#ececec"
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
