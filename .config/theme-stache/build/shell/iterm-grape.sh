#!/usr/bin/env bash

# Source:   iterm
# Theme:    Grape
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
    print_osc4 0 "2d/28/3e"
    print_osc4 1 "ec/21/60"
    print_osc4 2 "1f/a9/1b"
    print_osc4 3 "8d/dc/1f"
    print_osc4 4 "48/7c/f4"
    print_osc4 5 "8c/35/c8"
    print_osc4 6 "3a/dd/ed"
    print_osc4 7 "9e/9e/a0"
    print_osc4 8 "58/50/6a"
    print_osc4 9 "f0/71/9a"
    print_osc4 10 "52/a9/5d"
    print_osc4 11 "b2/dc/87"
    print_osc4 12 "a9/bb/eb"
    print_osc4 13 "ac/81/c1"
    print_osc4 14 "9c/e3/ea"
    print_osc4 15 "a1/88/f7"

    print_osc_rgb 10 "9e/9e/a0"
    print_osc_rgb 11 "16/14/23"
    print_osc_rgb 12 "a1/88/f7"
    print_osc_rgb 17 "48/3d/70"
    print_osc_rgb 19 "16/14/22"
}

do_linux() {
    print_linux 0 "#2d283e"
    print_linux 1 "#ec2160"
    print_linux 2 "#1fa91b"
    print_linux 3 "#8ddc1f"
    print_linux 4 "#487cf4"
    print_linux 5 "#8c35c8"
    print_linux 6 "#3added"
    print_linux 7 "#9e9ea0"
    print_linux 8 "#58506a"
    print_linux 9 "#f0719a"
    print_linux 10 "#52a95d"
    print_linux 11 "#b2dc87"
    print_linux 12 "#a9bbeb"
    print_linux 13 "#ac81c1"
    print_linux 14 "#9ce3ea"
    print_linux 15 "#a188f7"
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
