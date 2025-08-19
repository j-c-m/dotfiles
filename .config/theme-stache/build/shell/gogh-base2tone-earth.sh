#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base2Tone Earth
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
    print_osc4 0 "32/2d/29"
    print_osc4 1 "81/6d/5f"
    print_osc4 2 "d9/b1/54"
    print_osc4 3 "fc/c4/40"
    print_osc4 4 "88/78/6d"
    print_osc4 5 "d9/b1/54"
    print_osc4 6 "96/7e/6e"
    print_osc4 7 "b5/a9/a1"
    print_osc4 8 "6a/5f/58"
    print_osc4 9 "e6/b8/4d"
    print_osc4 10 "3f/3a/37"
    print_osc4 11 "5b/53/4d"
    print_osc4 12 "79/6b/63"
    print_osc4 13 "df/b9/9f"
    print_osc4 14 "cd/a9/56"
    print_osc4 15 "ff/f3/eb"

    print_osc_rgb 10 "b5/a9/a1"
    print_osc_rgb 11 "32/2d/29"
    print_osc_rgb 12 "9c/83/49"
    print_osc_rgb 17 "b5/a9/a1"
    print_osc_rgb 19 "32/2d/29"
}

do_linux() {
    print_linux 0 "#322d29"
    print_linux 1 "#816d5f"
    print_linux 2 "#d9b154"
    print_linux 3 "#fcc440"
    print_linux 4 "#88786d"
    print_linux 5 "#d9b154"
    print_linux 6 "#967e6e"
    print_linux 7 "#b5a9a1"
    print_linux 8 "#6a5f58"
    print_linux 9 "#e6b84d"
    print_linux 10 "#3f3a37"
    print_linux 11 "#5b534d"
    print_linux 12 "#796b63"
    print_linux 13 "#dfb99f"
    print_linux 14 "#cda956"
    print_linux 15 "#fff3eb"
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
