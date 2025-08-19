#!/usr/bin/env bash

# Source:   gogh
# Theme:    Nighty
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
    print_osc4 0 "37/3d/48"
    print_osc4 1 "9b/3e/46"
    print_osc4 2 "09/5b/32"
    print_osc4 3 "80/80/20"
    print_osc4 4 "1d/3e/6f"
    print_osc4 5 "82/30/65"
    print_osc4 6 "3a/74/58"
    print_osc4 7 "82/82/82"
    print_osc4 8 "5c/63/70"
    print_osc4 9 "d0/55/5f"
    print_osc4 10 "11/99/55"
    print_osc4 11 "df/e0/48"
    print_osc4 12 "46/74/b8"
    print_osc4 13 "ed/86/c9"
    print_osc4 14 "70/d2/a4"
    print_osc4 15 "df/df/df"

    print_osc_rgb 10 "df/df/df"
    print_osc_rgb 11 "2f/2f/2f"
    print_osc_rgb 12 "df/df/df"
    print_osc_rgb 17 "df/df/df"
    print_osc_rgb 19 "2f/2f/2f"
}

do_linux() {
    print_linux 0 "#373d48"
    print_linux 1 "#9b3e46"
    print_linux 2 "#095b32"
    print_linux 3 "#808020"
    print_linux 4 "#1d3e6f"
    print_linux 5 "#823065"
    print_linux 6 "#3a7458"
    print_linux 7 "#dfdfdf"
    print_linux 8 "#5c6370"
    print_linux 9 "#d0555f"
    print_linux 10 "#119955"
    print_linux 11 "#dfe048"
    print_linux 12 "#4674b8"
    print_linux 13 "#ed86c9"
    print_linux 14 "#70d2a4"
    print_linux 15 "#dfdfdf"
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
