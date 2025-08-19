#!/usr/bin/env bash

# Source:   iterm
# Theme:    GitHub-Dark-Dimmed
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
    print_osc4 0 "54/5d/68"
    print_osc4 1 "f4/70/67"
    print_osc4 2 "57/ab/5a"
    print_osc4 3 "c6/90/26"
    print_osc4 4 "53/9b/f5"
    print_osc4 5 "b0/83/f0"
    print_osc4 6 "39/c5/cf"
    print_osc4 7 "90/9d/ab"
    print_osc4 8 "63/6e/7b"
    print_osc4 9 "ff/93/8a"
    print_osc4 10 "6b/c4/6d"
    print_osc4 11 "da/aa/3f"
    print_osc4 12 "6c/b6/ff"
    print_osc4 13 "dc/bd/fb"
    print_osc4 14 "56/d4/dd"
    print_osc4 15 "cd/d9/e5"

    print_osc_rgb 10 "ad/ba/c7"
    print_osc_rgb 11 "22/27/2e"
    print_osc_rgb 12 "53/9b/f5"
    print_osc_rgb 17 "ad/ba/c7"
    print_osc_rgb 19 "22/27/2e"
}

do_linux() {
    print_linux 0 "#545d68"
    print_linux 1 "#f47067"
    print_linux 2 "#57ab5a"
    print_linux 3 "#c69026"
    print_linux 4 "#539bf5"
    print_linux 5 "#b083f0"
    print_linux 6 "#39c5cf"
    print_linux 7 "#adbac7"
    print_linux 8 "#636e7b"
    print_linux 9 "#ff938a"
    print_linux 10 "#6bc46d"
    print_linux 11 "#daaa3f"
    print_linux 12 "#6cb6ff"
    print_linux 13 "#dcbdfb"
    print_linux 14 "#56d4dd"
    print_linux 15 "#cdd9e5"
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
