#!/usr/bin/env bash

# Source:   base24
# Theme:    Alien Blood
# Author:   FredHappyface (https://github.com/fredHappyface)
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
    print_osc4 0 "0f/16/0f"
    print_osc4 1 "7f/2b/26"
    print_osc4 2 "2f/7e/25"
    print_osc4 3 "00/a9/df"
    print_osc4 4 "2f/69/7f"
    print_osc4 5 "47/57/7e"
    print_osc4 6 "31/7f/76"
    print_osc4 7 "5a/6f/5c"
    print_osc4 8 "46/54/2a"
    print_osc4 9 "df/80/08"
    print_osc4 10 "18/e0/00"
    print_osc4 11 "bd/e0/00"
    print_osc4 12 "00/a9/df"
    print_osc4 13 "00/58/df"
    print_osc4 14 "00/df/c3"
    print_osc4 15 "73/f9/90"

    print_osc_rgb 10 "5a/6f/5c"
    print_osc_rgb 11 "0f/16/0f"
    print_osc_rgb 12 "5a/6f/5c"
    print_osc_rgb 17 "64/7d/75"
    print_osc_rgb 19 "11/26/15"
}

do_linux() {
    print_linux 0 "#0f160f"
    print_linux 1 "#7f2b26"
    print_linux 2 "#2f7e25"
    print_linux 3 "#00a9df"
    print_linux 4 "#2f697f"
    print_linux 5 "#47577e"
    print_linux 6 "#317f76"
    print_linux 7 "#5a6f5c"
    print_linux 8 "#46542a"
    print_linux 9 "#df8008"
    print_linux 10 "#18e000"
    print_linux 11 "#bde000"
    print_linux 12 "#00a9df"
    print_linux 13 "#0058df"
    print_linux 14 "#00dfc3"
    print_linux 15 "#73f990"
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
