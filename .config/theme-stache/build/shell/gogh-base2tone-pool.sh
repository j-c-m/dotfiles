#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base2Tone Pool
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "2a/24/33"
    print_osc4 1 "aa/75/f5"
    print_osc4 2 "f8/79/72"
    print_osc4 3 "ff/b6/b3"
    print_osc4 4 "b8/86/fd"
    print_osc4 5 "f8/79/72"
    print_osc4 6 "c7/a0/fe"
    print_osc4 7 "9a/90/a7"
    print_osc4 8 "63/57/75"
    print_osc4 9 "fc/89/83"
    print_osc4 10 "37/2f/42"
    print_osc4 11 "57/4b/68"
    print_osc4 12 "70/63/83"
    print_osc4 13 "e4/d2/fe"
    print_osc4 14 "f3/6f/68"
    print_osc4 15 "f3/eb/ff"

    print_osc_rgb 10 "9a/90/a7"
    print_osc_rgb 11 "2a/24/33"
    print_osc_rgb 12 "cf/50/4a"
    print_osc_rgb 17 "9a/90/a7"
    print_osc_rgb 19 "2a/24/33"
}

do_linux() {
    print_linux 0 "#2a2433"
    print_linux 1 "#aa75f5"
    print_linux 2 "#f87972"
    print_linux 3 "#ffb6b3"
    print_linux 4 "#b886fd"
    print_linux 5 "#f87972"
    print_linux 6 "#c7a0fe"
    print_linux 7 "#9a90a7"
    print_linux 8 "#635775"
    print_linux 9 "#fc8983"
    print_linux 10 "#372f42"
    print_linux 11 "#574b68"
    print_linux 12 "#706383"
    print_linux 13 "#e4d2fe"
    print_linux 14 "#f36f68"
    print_linux 15 "#f3ebff"
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
