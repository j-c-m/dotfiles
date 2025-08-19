#!/usr/bin/env bash

# Source:   gogh
# Theme:    Tempus Future
# Author:   Protesilaos Stavrou (https://protesilaos.com)
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
    print_osc4 0 "09/0a/18"
    print_osc4 1 "ff/7e/8f"
    print_osc4 2 "6a/ba/39"
    print_osc4 3 "bf/a5/1a"
    print_osc4 4 "4a/b2/d7"
    print_osc4 5 "e5/8f/84"
    print_osc4 6 "2a/b7/bb"
    print_osc4 7 "a7/a2/c4"
    print_osc4 8 "2b/13/29"
    print_osc4 9 "f7/8e/2f"
    print_osc4 10 "60/ba/80"
    print_osc4 11 "de/9b/1d"
    print_osc4 12 "8b/a7/ea"
    print_osc4 13 "e0/8b/d6"
    print_osc4 14 "2c/ba/b6"
    print_osc4 15 "b4/ab/ac"

    print_osc_rgb 10 "b4/ab/ac"
    print_osc_rgb 11 "09/0a/18"
    print_osc_rgb 12 "b4/ab/ac"
    print_osc_rgb 17 "b4/ab/ac"
    print_osc_rgb 19 "09/0a/18"
}

do_linux() {
    print_linux 0 "#090a18"
    print_linux 1 "#ff7e8f"
    print_linux 2 "#6aba39"
    print_linux 3 "#bfa51a"
    print_linux 4 "#4ab2d7"
    print_linux 5 "#e58f84"
    print_linux 6 "#2ab7bb"
    print_linux 7 "#b4abac"
    print_linux 8 "#2b1329"
    print_linux 9 "#f78e2f"
    print_linux 10 "#60ba80"
    print_linux 11 "#de9b1d"
    print_linux 12 "#8ba7ea"
    print_linux 13 "#e08bd6"
    print_linux 14 "#2cbab6"
    print_linux 15 "#b4abac"
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
