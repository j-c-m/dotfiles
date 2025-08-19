#!/usr/bin/env bash

# Source:   iterm
# Theme:    Firewatch
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
    print_osc4 0 "58/5f/6d"
    print_osc4 1 "d9/53/60"
    print_osc4 2 "5a/b9/77"
    print_osc4 3 "df/b5/63"
    print_osc4 4 "4d/89/c4"
    print_osc4 5 "d5/51/19"
    print_osc4 6 "44/a8/b6"
    print_osc4 7 "e6/e5/ff"
    print_osc4 8 "58/5f/6d"
    print_osc4 9 "d9/53/60"
    print_osc4 10 "5a/b9/77"
    print_osc4 11 "df/b5/63"
    print_osc4 12 "4c/89/c4"
    print_osc4 13 "d5/51/19"
    print_osc4 14 "44/a8/b6"
    print_osc4 15 "e6/e5/ff"

    print_osc_rgb 10 "9b/a2/b2"
    print_osc_rgb 11 "1e/20/27"
    print_osc_rgb 12 "f6/f6/ec"
    print_osc_rgb 17 "2e/35/3d"
    print_osc_rgb 19 "7c/8f/a3"
}

do_linux() {
    print_linux 0 "#585f6d"
    print_linux 1 "#d95360"
    print_linux 2 "#5ab977"
    print_linux 3 "#dfb563"
    print_linux 4 "#4d89c4"
    print_linux 5 "#d55119"
    print_linux 6 "#44a8b6"
    print_linux 7 "#9ba2b2"
    print_linux 8 "#585f6d"
    print_linux 9 "#d95360"
    print_linux 10 "#5ab977"
    print_linux 11 "#dfb563"
    print_linux 12 "#4c89c4"
    print_linux 13 "#d55119"
    print_linux 14 "#44a8b6"
    print_linux 15 "#e6e5ff"
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
