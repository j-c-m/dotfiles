#!/usr/bin/env bash

# Source:   iterm
# Theme:    Ollie
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "00/00/00"
    print_osc4 1 "ab/2e/30"
    print_osc4 2 "31/ab/60"
    print_osc4 3 "ab/42/00"
    print_osc4 4 "2c/56/ab"
    print_osc4 5 "af/84/27"
    print_osc4 6 "1f/a5/ab"
    print_osc4 7 "8a/8d/ab"
    print_osc4 8 "5a/36/25"
    print_osc4 9 "ff/3d/48"
    print_osc4 10 "3b/ff/99"
    print_osc4 11 "ff/5e/1e"
    print_osc4 12 "44/87/ff"
    print_osc4 13 "ff/c2/1c"
    print_osc4 14 "1e/fa/ff"
    print_osc4 15 "5b/6d/a7"

    print_osc_rgb 10 "8a/8d/ae"
    print_osc_rgb 11 "21/20/24"
    print_osc_rgb 12 "5b/6d/a7"
    print_osc_rgb 17 "1e/39/65"
    print_osc_rgb 19 "8a/8d/ab"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#ab2e30"
    print_linux 2 "#31ab60"
    print_linux 3 "#ab4200"
    print_linux 4 "#2c56ab"
    print_linux 5 "#af8427"
    print_linux 6 "#1fa5ab"
    print_linux 7 "#8a8dae"
    print_linux 8 "#5a3625"
    print_linux 9 "#ff3d48"
    print_linux 10 "#3bff99"
    print_linux 11 "#ff5e1e"
    print_linux 12 "#4487ff"
    print_linux 13 "#ffc21c"
    print_linux 14 "#1efaff"
    print_linux 15 "#5b6da7"
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
