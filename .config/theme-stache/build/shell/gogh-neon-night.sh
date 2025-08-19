#!/usr/bin/env bash

# Source:   gogh
# Theme:    Neon Night
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
    print_osc4 0 "20/24/2d"
    print_osc4 1 "ff/8e/8e"
    print_osc4 2 "7e/fd/d0"
    print_osc4 3 "fc/ad/3f"
    print_osc4 4 "69/b4/f9"
    print_osc4 5 "dd/92/f6"
    print_osc4 6 "8c/e8/ff"
    print_osc4 7 "c9/cc/cd"
    print_osc4 8 "20/24/2d"
    print_osc4 9 "ff/8e/8e"
    print_osc4 10 "7e/fd/d0"
    print_osc4 11 "fc/ad/3f"
    print_osc4 12 "69/b4/f9"
    print_osc4 13 "dd/92/f6"
    print_osc4 14 "8c/e8/ff"
    print_osc4 15 "c9/cc/cd"

    print_osc_rgb 10 "c7/c8/ff"
    print_osc_rgb 11 "20/24/2d"
    print_osc_rgb 12 "c7/c8/ff"
    print_osc_rgb 17 "c7/c8/ff"
    print_osc_rgb 19 "20/24/2d"
}

do_linux() {
    print_linux 0 "#20242d"
    print_linux 1 "#ff8e8e"
    print_linux 2 "#7efdd0"
    print_linux 3 "#fcad3f"
    print_linux 4 "#69b4f9"
    print_linux 5 "#dd92f6"
    print_linux 6 "#8ce8ff"
    print_linux 7 "#c7c8ff"
    print_linux 8 "#20242d"
    print_linux 9 "#ff8e8e"
    print_linux 10 "#7efdd0"
    print_linux 11 "#fcad3f"
    print_linux 12 "#69b4f9"
    print_linux 13 "#dd92f6"
    print_linux 14 "#8ce8ff"
    print_linux 15 "#c9cccd"
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
