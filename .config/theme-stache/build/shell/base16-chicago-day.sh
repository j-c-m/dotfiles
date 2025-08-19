#!/usr/bin/env bash

# Source:   base16
# Theme:    Chicago Day
# Author:   Wendell, Ryan &lt;ryanjwendell@gmail.com&gt;
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
    print_osc4 0 "e8/f0/ea"
    print_osc4 1 "c6/0c/30"
    print_osc4 2 "00/9b/3a"
    print_osc4 3 "96/84/00"
    print_osc4 4 "52/23/98"
    print_osc4 5 "e2/7e/a6"
    print_osc4 6 "00/a1/de"
    print_osc4 7 "36/4c/40"
    print_osc4 8 "8a/9a/91"
    print_osc4 9 "c6/0c/30"
    print_osc4 10 "00/9b/3a"
    print_osc4 11 "96/84/00"
    print_osc4 12 "52/23/98"
    print_osc4 13 "e2/7e/a6"
    print_osc4 14 "00/a1/de"
    print_osc4 15 "1e/2a/24"

    print_osc_rgb 10 "36/4c/40"
    print_osc_rgb 11 "e8/f0/ea"
    print_osc_rgb 12 "36/4c/40"
    print_osc_rgb 17 "2a/3b/32"
    print_osc_rgb 19 "d1/e0/d7"
}

do_linux() {
    print_linux 0 "#e8f0ea"
    print_linux 1 "#c60c30"
    print_linux 2 "#009b3a"
    print_linux 3 "#968400"
    print_linux 4 "#522398"
    print_linux 5 "#e27ea6"
    print_linux 6 "#00a1de"
    print_linux 7 "#364c40"
    print_linux 8 "#8a9a91"
    print_linux 9 "#c60c30"
    print_linux 10 "#009b3a"
    print_linux 11 "#968400"
    print_linux 12 "#522398"
    print_linux 13 "#e27ea6"
    print_linux 14 "#00a1de"
    print_linux 15 "#1e2a24"
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
