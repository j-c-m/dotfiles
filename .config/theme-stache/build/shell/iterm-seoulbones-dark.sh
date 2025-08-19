#!/usr/bin/env bash

# Source:   iterm
# Theme:    seoulbones_dark
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
    print_osc4 0 "4a/4a/4a"
    print_osc4 1 "e3/88/a3"
    print_osc4 2 "98/bd/99"
    print_osc4 3 "ff/df/9b"
    print_osc4 4 "97/bd/de"
    print_osc4 5 "a5/a6/c5"
    print_osc4 6 "6e/bd/be"
    print_osc4 7 "dd/dd/dd"
    print_osc4 8 "6c/63/65"
    print_osc4 9 "eb/99/b1"
    print_osc4 10 "8f/cd/92"
    print_osc4 11 "ff/e5/b3"
    print_osc4 12 "a2/c8/e9"
    print_osc4 13 "b2/b3/da"
    print_osc4 14 "6b/ca/cb"
    print_osc4 15 "a8/a8/a8"

    print_osc_rgb 10 "dd/dd/dd"
    print_osc_rgb 11 "4a/4a/4a"
    print_osc_rgb 12 "e2/e2/e2"
    print_osc_rgb 17 "77/77/77"
    print_osc_rgb 19 "dd/dd/dd"
}

do_linux() {
    print_linux 0 "#4a4a4a"
    print_linux 1 "#e388a3"
    print_linux 2 "#98bd99"
    print_linux 3 "#ffdf9b"
    print_linux 4 "#97bdde"
    print_linux 5 "#a5a6c5"
    print_linux 6 "#6ebdbe"
    print_linux 7 "#dddddd"
    print_linux 8 "#6c6365"
    print_linux 9 "#eb99b1"
    print_linux 10 "#8fcd92"
    print_linux 11 "#ffe5b3"
    print_linux 12 "#a2c8e9"
    print_linux 13 "#b2b3da"
    print_linux 14 "#6bcacb"
    print_linux 15 "#a8a8a8"
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
