#!/usr/bin/env bash

# Source:   iterm
# Theme:    kanagawabones
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
    print_osc4 0 "1f/1f/28"
    print_osc4 1 "e4/69/77"
    print_osc4 2 "98/bc/6c"
    print_osc4 3 "e5/c2/83"
    print_osc4 4 "7e/b3/c9"
    print_osc4 5 "95/7f/b8"
    print_osc4 6 "7e/b3/c9"
    print_osc4 7 "dd/d8/bb"
    print_osc4 8 "3b/3b/51"
    print_osc4 9 "ec/81/8c"
    print_osc4 10 "9e/c9/67"
    print_osc4 11 "f1/c9/82"
    print_osc4 12 "7b/c2/df"
    print_osc4 13 "a9/8f/d2"
    print_osc4 14 "7b/c2/df"
    print_osc4 15 "a8/a4/8d"

    print_osc_rgb 10 "dd/d8/bb"
    print_osc_rgb 11 "1f/1f/28"
    print_osc_rgb 12 "e6/e0/c2"
    print_osc_rgb 17 "49/47/3e"
    print_osc_rgb 19 "dd/d8/bb"
}

do_linux() {
    print_linux 0 "#1f1f28"
    print_linux 1 "#e46977"
    print_linux 2 "#98bc6c"
    print_linux 3 "#e5c283"
    print_linux 4 "#7eb3c9"
    print_linux 5 "#957fb8"
    print_linux 6 "#7eb3c9"
    print_linux 7 "#ddd8bb"
    print_linux 8 "#3b3b51"
    print_linux 9 "#ec818c"
    print_linux 10 "#9ec967"
    print_linux 11 "#f1c982"
    print_linux 12 "#7bc2df"
    print_linux 13 "#a98fd2"
    print_linux 14 "#7bc2df"
    print_linux 15 "#a8a48d"
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
