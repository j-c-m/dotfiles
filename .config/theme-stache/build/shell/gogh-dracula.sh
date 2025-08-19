#!/usr/bin/env bash

# Source:   gogh
# Theme:    Dracula
# Author:   Dracula (https://draculatheme.com)
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
    print_osc4 0 "26/26/26"
    print_osc4 1 "e6/47/47"
    print_osc4 2 "42/e6/6c"
    print_osc4 3 "e4/f3/4a"
    print_osc4 4 "9b/6b/df"
    print_osc4 5 "e3/56/a7"
    print_osc4 6 "75/d7/ec"
    print_osc4 7 "f8/f8/f2"
    print_osc4 8 "7a/7a/7a"
    print_osc4 9 "ff/55/55"
    print_osc4 10 "50/fa/7b"
    print_osc4 11 "f1/fa/8c"
    print_osc4 12 "bd/93/f9"
    print_osc4 13 "ff/79/c6"
    print_osc4 14 "8b/e9/fd"
    print_osc4 15 "f9/f9/fb"

    print_osc_rgb 10 "f8/f8/f2"
    print_osc_rgb 11 "28/2a/36"
    print_osc_rgb 12 "f8/f8/f2"
    print_osc_rgb 17 "f8/f8/f2"
    print_osc_rgb 19 "28/2a/36"
}

do_linux() {
    print_linux 0 "#262626"
    print_linux 1 "#e64747"
    print_linux 2 "#42e66c"
    print_linux 3 "#e4f34a"
    print_linux 4 "#9b6bdf"
    print_linux 5 "#e356a7"
    print_linux 6 "#75d7ec"
    print_linux 7 "#f8f8f2"
    print_linux 8 "#7a7a7a"
    print_linux 9 "#ff5555"
    print_linux 10 "#50fa7b"
    print_linux 11 "#f1fa8c"
    print_linux 12 "#bd93f9"
    print_linux 13 "#ff79c6"
    print_linux 14 "#8be9fd"
    print_linux 15 "#f9f9fb"
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
