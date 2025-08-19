#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base2Tone Forest
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
    print_osc4 0 "2a/2d/2a"
    print_osc4 1 "5c/70/5c"
    print_osc4 2 "bf/d4/54"
    print_osc4 3 "e5/fb/79"
    print_osc4 4 "68/7d/68"
    print_osc4 5 "bf/d4/54"
    print_osc4 6 "8f/ae/8f"
    print_osc4 7 "a1/b5/a1"
    print_osc4 8 "53/5f/53"
    print_osc4 9 "cb/e2/5a"
    print_osc4 10 "35/3b/35"
    print_osc4 11 "48/51/48"
    print_osc4 12 "5e/6e/5e"
    print_osc4 13 "c8/e4/c8"
    print_osc4 14 "b1/c4/4f"
    print_osc4 15 "f0/ff/f0"

    print_osc_rgb 10 "a1/b5/a1"
    print_osc_rgb 11 "2a/2d/2a"
    print_osc_rgb 12 "81/8b/4b"
    print_osc_rgb 17 "a1/b5/a1"
    print_osc_rgb 19 "2a/2d/2a"
}

do_linux() {
    print_linux 0 "#2a2d2a"
    print_linux 1 "#5c705c"
    print_linux 2 "#bfd454"
    print_linux 3 "#e5fb79"
    print_linux 4 "#687d68"
    print_linux 5 "#bfd454"
    print_linux 6 "#8fae8f"
    print_linux 7 "#a1b5a1"
    print_linux 8 "#535f53"
    print_linux 9 "#cbe25a"
    print_linux 10 "#353b35"
    print_linux 11 "#485148"
    print_linux 12 "#5e6e5e"
    print_linux 13 "#c8e4c8"
    print_linux 14 "#b1c44f"
    print_linux 15 "#f0fff0"
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
