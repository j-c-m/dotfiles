#!/usr/bin/env bash

# Source:   iterm
# Theme:    SleepyHollow
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
    print_osc4 0 "57/20/00"
    print_osc4 1 "b9/39/34"
    print_osc4 2 "90/77/3e"
    print_osc4 3 "b4/56/00"
    print_osc4 4 "5e/62/b4"
    print_osc4 5 "a0/7c/7b"
    print_osc4 6 "8e/ae/a9"
    print_osc4 7 "af/9a/91"
    print_osc4 8 "4e/4b/60"
    print_osc4 9 "d9/44/3e"
    print_osc4 10 "d6/b0/4e"
    print_osc4 11 "f6/67/13"
    print_osc4 12 "80/85/ef"
    print_osc4 13 "e1/c2/ba"
    print_osc4 14 "a4/db/e7"
    print_osc4 15 "d1/c7/a9"

    print_osc_rgb 10 "af/9a/91"
    print_osc_rgb 11 "12/12/13"
    print_osc_rgb 12 "af/9a/91"
    print_osc_rgb 17 "57/51/55"
    print_osc_rgb 19 "d1/c7/a9"
}

do_linux() {
    print_linux 0 "#572000"
    print_linux 1 "#b93934"
    print_linux 2 "#90773e"
    print_linux 3 "#b45600"
    print_linux 4 "#5e62b4"
    print_linux 5 "#a07c7b"
    print_linux 6 "#8eaea9"
    print_linux 7 "#af9a91"
    print_linux 8 "#4e4b60"
    print_linux 9 "#d9443e"
    print_linux 10 "#d6b04e"
    print_linux 11 "#f66713"
    print_linux 12 "#8085ef"
    print_linux 13 "#e1c2ba"
    print_linux 14 "#a4dbe7"
    print_linux 15 "#d1c7a9"
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
