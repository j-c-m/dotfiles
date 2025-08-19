#!/usr/bin/env bash

# Source:   base24
# Theme:    Lavandula
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
    print_osc4 0 "05/00/14"
    print_osc4 1 "7c/15/25"
    print_osc4 2 "33/7e/6f"
    print_osc4 3 "8e/86/df"
    print_osc4 4 "4f/4a/7f"
    print_osc4 5 "59/3f/7e"
    print_osc4 6 "57/76/7f"
    print_osc4 7 "64/5d/6f"
    print_osc4 8 "46/3c/53"
    print_osc4 9 "df/50/66"
    print_osc4 10 "52/e0/c4"
    print_osc4 11 "e0/c2/86"
    print_osc4 12 "8e/86/df"
    print_osc4 13 "a6/75/df"
    print_osc4 14 "9a/d3/df"
    print_osc4 15 "8c/91/fa"

    print_osc_rgb 10 "64/5d/6f"
    print_osc_rgb 11 "05/00/14"
    print_osc_rgb 12 "64/5d/6f"
    print_osc_rgb 17 "73/6e/7d"
    print_osc_rgb 19 "23/00/45"
}

do_linux() {
    print_linux 0 "#050014"
    print_linux 1 "#7c1525"
    print_linux 2 "#337e6f"
    print_linux 3 "#8e86df"
    print_linux 4 "#4f4a7f"
    print_linux 5 "#593f7e"
    print_linux 6 "#57767f"
    print_linux 7 "#645d6f"
    print_linux 8 "#463c53"
    print_linux 9 "#df5066"
    print_linux 10 "#52e0c4"
    print_linux 11 "#e0c286"
    print_linux 12 "#8e86df"
    print_linux 13 "#a675df"
    print_linux 14 "#9ad3df"
    print_linux 15 "#8c91fa"
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
