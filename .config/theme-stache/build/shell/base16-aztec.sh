#!/usr/bin/env bash

# Source:   base16
# Theme:    Aztec
# Author:   TheNeverMan (github.com/TheNeverMan)
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
    print_osc4 0 "10/16/00"
    print_osc4 1 "ee/2e/00"
    print_osc4 2 "63/d9/32"
    print_osc4 3 "ee/bb/00"
    print_osc4 4 "5b/4a/9f"
    print_osc4 5 "88/3e/9f"
    print_osc4 6 "3d/94/a5"
    print_osc4 7 "ff/da/51"
    print_osc4 8 "2e/2e/05"
    print_osc4 9 "ee/2e/00"
    print_osc4 10 "63/d9/32"
    print_osc4 11 "ee/bb/00"
    print_osc4 12 "5b/4a/9f"
    print_osc4 13 "88/3e/9f"
    print_osc4 14 "3d/94/a5"
    print_osc4 15 "ff/eb/a0"

    print_osc_rgb 10 "ff/da/51"
    print_osc_rgb 11 "10/16/00"
    print_osc_rgb 12 "ff/da/51"
    print_osc_rgb 17 "ff/e1/78"
    print_osc_rgb 19 "1a/1e/01"
}

do_linux() {
    print_linux 0 "#101600"
    print_linux 1 "#ee2e00"
    print_linux 2 "#63d932"
    print_linux 3 "#eebb00"
    print_linux 4 "#5b4a9f"
    print_linux 5 "#883e9f"
    print_linux 6 "#3d94a5"
    print_linux 7 "#ffda51"
    print_linux 8 "#2e2e05"
    print_linux 9 "#ee2e00"
    print_linux 10 "#63d932"
    print_linux 11 "#eebb00"
    print_linux 12 "#5b4a9f"
    print_linux 13 "#883e9f"
    print_linux 14 "#3d94a5"
    print_linux 15 "#ffeba0"
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
