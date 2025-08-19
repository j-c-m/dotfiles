#!/usr/bin/env bash

# Source:   base16
# Theme:    ShadeSmear Light
# Author:   Kyle Giammarco (http://kyle.giammar.co)
# Variant:  light

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
    print_osc4 0 "db/db/db"
    print_osc4 1 "cc/54/50"
    print_osc4 2 "71/98/3b"
    print_osc4 3 "30/78/78"
    print_osc4 4 "37/63/88"
    print_osc4 5 "d7/ab/54"
    print_osc4 6 "c5/7d/42"
    print_osc4 7 "23/23/23"
    print_osc4 8 "4e/4e/4e"
    print_osc4 9 "cc/54/50"
    print_osc4 10 "71/98/3b"
    print_osc4 11 "30/78/78"
    print_osc4 12 "37/63/88"
    print_osc4 13 "d7/ab/54"
    print_osc4 14 "c5/7d/42"
    print_osc4 15 "e4/e4/e4"

    print_osc_rgb 10 "23/23/23"
    print_osc_rgb 11 "db/db/db"
    print_osc_rgb 12 "23/23/23"
    print_osc_rgb 17 "1c/1c/1c"
    print_osc_rgb 19 "e4/e4/e4"
}

do_linux() {
    print_linux 0 "#dbdbdb"
    print_linux 1 "#cc5450"
    print_linux 2 "#71983b"
    print_linux 3 "#307878"
    print_linux 4 "#376388"
    print_linux 5 "#d7ab54"
    print_linux 6 "#c57d42"
    print_linux 7 "#232323"
    print_linux 8 "#4e4e4e"
    print_linux 9 "#cc5450"
    print_linux 10 "#71983b"
    print_linux 11 "#307878"
    print_linux 12 "#376388"
    print_linux 13 "#d7ab54"
    print_linux 14 "#c57d42"
    print_linux 15 "#e4e4e4"
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
