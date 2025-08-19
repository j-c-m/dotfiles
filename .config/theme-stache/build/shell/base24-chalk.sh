#!/usr/bin/env bash

# Source:   base24
# Theme:    Chalk
# Author:   FredHappyface (https://github.com/fredHappyface)
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
    print_osc4 0 "15/15/15"
    print_osc4 1 "fa/85/9c"
    print_osc4 2 "a1/bb/54"
    print_osc4 3 "dd/b2/6f"
    print_osc4 4 "5a/b9/ed"
    print_osc4 5 "db/8f/ea"
    print_osc4 6 "10/bc/ad"
    print_osc4 7 "d0/d0/d0"
    print_osc4 8 "50/50/50"
    print_osc4 9 "fb/9f/b1"
    print_osc4 10 "ac/c2/67"
    print_osc4 11 "ed/a9/87"
    print_osc4 12 "6f/c2/ef"
    print_osc4 13 "e1/a3/ee"
    print_osc4 14 "12/cf/c0"
    print_osc4 15 "f5/f5/f5"

    print_osc_rgb 10 "d0/d0/d0"
    print_osc_rgb 11 "15/15/15"
    print_osc_rgb 12 "d0/d0/d0"
    print_osc_rgb 17 "e0/e0/e0"
    print_osc_rgb 19 "20/20/20"
}

do_linux() {
    print_linux 0 "#151515"
    print_linux 1 "#fa859c"
    print_linux 2 "#a1bb54"
    print_linux 3 "#ddb26f"
    print_linux 4 "#5ab9ed"
    print_linux 5 "#db8fea"
    print_linux 6 "#10bcad"
    print_linux 7 "#d0d0d0"
    print_linux 8 "#505050"
    print_linux 9 "#fb9fb1"
    print_linux 10 "#acc267"
    print_linux 11 "#eda987"
    print_linux 12 "#6fc2ef"
    print_linux 13 "#e1a3ee"
    print_linux 14 "#12cfc0"
    print_linux 15 "#f5f5f5"
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
