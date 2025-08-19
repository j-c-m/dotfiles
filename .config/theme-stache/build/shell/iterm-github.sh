#!/usr/bin/env bash

# Source:   iterm
# Theme:    Github
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "3e/3e/3e"
    print_osc4 1 "97/0b/16"
    print_osc4 2 "07/96/2a"
    print_osc4 3 "f8/ee/c7"
    print_osc4 4 "00/3e/8a"
    print_osc4 5 "e9/46/91"
    print_osc4 6 "89/d1/ec"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "66/66/66"
    print_osc4 9 "de/00/00"
    print_osc4 10 "87/d5/a2"
    print_osc4 11 "f1/d0/07"
    print_osc4 12 "2e/6c/ba"
    print_osc4 13 "ff/a2/9f"
    print_osc4 14 "1c/fa/fe"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "3e/3e/3e"
    print_osc_rgb 11 "f4/f4/f4"
    print_osc_rgb 12 "3f/3f/3f"
    print_osc_rgb 17 "a9/c1/e2"
    print_osc_rgb 19 "53/53/53"
}

do_linux() {
    print_linux 0 "#3e3e3e"
    print_linux 1 "#970b16"
    print_linux 2 "#07962a"
    print_linux 3 "#f8eec7"
    print_linux 4 "#003e8a"
    print_linux 5 "#e94691"
    print_linux 6 "#89d1ec"
    print_linux 7 "#3e3e3e"
    print_linux 8 "#666666"
    print_linux 9 "#de0000"
    print_linux 10 "#87d5a2"
    print_linux 11 "#f1d007"
    print_linux 12 "#2e6cba"
    print_linux 13 "#ffa29f"
    print_linux 14 "#1cfafe"
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
