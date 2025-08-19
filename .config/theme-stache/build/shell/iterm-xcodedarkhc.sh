#!/usr/bin/env bash

# Source:   iterm
# Theme:    xcodedarkhc
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
    print_osc4 0 "43/45/4b"
    print_osc4 1 "ff/8a/7a"
    print_osc4 2 "83/c9/bc"
    print_osc4 3 "d9/c6/68"
    print_osc4 4 "4e/c4/e6"
    print_osc4 5 "ff/85/b8"
    print_osc4 6 "cd/a1/ff"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "83/89/91"
    print_osc4 9 "ff/8a/7a"
    print_osc4 10 "b1/fa/eb"
    print_osc4 11 "ff/a1/4f"
    print_osc4 12 "6b/df/ff"
    print_osc4 13 "ff/85/b8"
    print_osc4 14 "e5/cf/ff"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "1f/1f/24"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "43/45/4b"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#43454b"
    print_linux 1 "#ff8a7a"
    print_linux 2 "#83c9bc"
    print_linux 3 "#d9c668"
    print_linux 4 "#4ec4e6"
    print_linux 5 "#ff85b8"
    print_linux 6 "#cda1ff"
    print_linux 7 "#ffffff"
    print_linux 8 "#838991"
    print_linux 9 "#ff8a7a"
    print_linux 10 "#b1faeb"
    print_linux 11 "#ffa14f"
    print_linux 12 "#6bdfff"
    print_linux 13 "#ff85b8"
    print_linux 14 "#e5cfff"
    print_linux 15 "#ffffff"
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
