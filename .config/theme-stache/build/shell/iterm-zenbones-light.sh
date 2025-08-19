#!/usr/bin/env bash

# Source:   iterm
# Theme:    zenbones_light
# Author:   unknown
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "f0/ed/ec"
    print_osc4 1 "a8/33/4c"
    print_osc4 2 "4f/6c/31"
    print_osc4 3 "94/49/26"
    print_osc4 4 "28/63/86"
    print_osc4 5 "88/50/7c"
    print_osc4 6 "3b/89/92"
    print_osc4 7 "2b/35/3b"
    print_osc4 8 "cf/c1/ba"
    print_osc4 9 "94/25/3e"
    print_osc4 10 "3f/5a/21"
    print_osc4 11 "80/3c/1b"
    print_osc4 12 "1c/55/73"
    print_osc4 13 "7b/3b/70"
    print_osc4 14 "2b/74/7c"
    print_osc4 15 "4f/5e/68"

    print_osc_rgb 10 "2b/35/3b"
    print_osc_rgb 11 "f0/ed/ec"
    print_osc_rgb 12 "2b/35/3b"
    print_osc_rgb 17 "cb/d9/e3"
    print_osc_rgb 19 "2b/35/3b"
}

do_linux() {
    print_linux 0 "#f0edec"
    print_linux 1 "#a8334c"
    print_linux 2 "#4f6c31"
    print_linux 3 "#944926"
    print_linux 4 "#286386"
    print_linux 5 "#88507c"
    print_linux 6 "#3b8992"
    print_linux 7 "#2b353b"
    print_linux 8 "#cfc1ba"
    print_linux 9 "#94253e"
    print_linux 10 "#3f5a21"
    print_linux 11 "#803c1b"
    print_linux 12 "#1c5573"
    print_linux 13 "#7b3b70"
    print_linux 14 "#2b747c"
    print_linux 15 "#4f5e68"
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
