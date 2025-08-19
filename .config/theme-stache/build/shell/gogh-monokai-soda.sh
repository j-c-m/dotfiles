#!/usr/bin/env bash

# Source:   gogh
# Theme:    Monokai Soda
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
    print_osc4 0 "1a/1a/1a"
    print_osc4 1 "f4/00/5f"
    print_osc4 2 "98/e0/24"
    print_osc4 3 "fa/84/19"
    print_osc4 4 "9d/65/ff"
    print_osc4 5 "f4/00/5f"
    print_osc4 6 "58/d1/eb"
    print_osc4 7 "c4/c5/b5"
    print_osc4 8 "62/5e/4c"
    print_osc4 9 "f4/00/5f"
    print_osc4 10 "98/e0/24"
    print_osc4 11 "e0/d5/61"
    print_osc4 12 "9d/65/ff"
    print_osc4 13 "f4/00/5f"
    print_osc4 14 "58/d1/eb"
    print_osc4 15 "f6/f6/ef"

    print_osc_rgb 10 "c4/c5/b5"
    print_osc_rgb 11 "1a/1a/1a"
    print_osc_rgb 12 "c4/c5/b5"
    print_osc_rgb 17 "c4/c5/b5"
    print_osc_rgb 19 "1a/1a/1a"
}

do_linux() {
    print_linux 0 "#1a1a1a"
    print_linux 1 "#f4005f"
    print_linux 2 "#98e024"
    print_linux 3 "#fa8419"
    print_linux 4 "#9d65ff"
    print_linux 5 "#f4005f"
    print_linux 6 "#58d1eb"
    print_linux 7 "#c4c5b5"
    print_linux 8 "#625e4c"
    print_linux 9 "#f4005f"
    print_linux 10 "#98e024"
    print_linux 11 "#e0d561"
    print_linux 12 "#9d65ff"
    print_linux 13 "#f4005f"
    print_linux 14 "#58d1eb"
    print_linux 15 "#f6f6ef"
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
