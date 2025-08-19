#!/usr/bin/env bash

# Source:   iterm
# Theme:    GitHub-Dark-High-Contrast
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "7a/82/8e"
    print_osc4 1 "ff/94/92"
    print_osc4 2 "26/cd/4d"
    print_osc4 3 "f0/b7/2f"
    print_osc4 4 "71/b7/ff"
    print_osc4 5 "cb/9e/ff"
    print_osc4 6 "39/c5/cf"
    print_osc4 7 "d9/de/e3"
    print_osc4 8 "9e/a7/b3"
    print_osc4 9 "ff/b1/af"
    print_osc4 10 "4a/e1/68"
    print_osc4 11 "f7/c8/43"
    print_osc4 12 "91/cb/ff"
    print_osc4 13 "db/b7/ff"
    print_osc4 14 "56/d4/dd"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "f0/f3/f6"
    print_osc_rgb 11 "0a/0c/10"
    print_osc_rgb 12 "71/b7/ff"
    print_osc_rgb 17 "f0/f3/f6"
    print_osc_rgb 19 "0a/0c/10"
}

do_linux() {
    print_linux 0 "#7a828e"
    print_linux 1 "#ff9492"
    print_linux 2 "#26cd4d"
    print_linux 3 "#f0b72f"
    print_linux 4 "#71b7ff"
    print_linux 5 "#cb9eff"
    print_linux 6 "#39c5cf"
    print_linux 7 "#f0f3f6"
    print_linux 8 "#9ea7b3"
    print_linux 9 "#ffb1af"
    print_linux 10 "#4ae168"
    print_linux 11 "#f7c843"
    print_linux 12 "#91cbff"
    print_linux 13 "#dbb7ff"
    print_linux 14 "#56d4dd"
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
