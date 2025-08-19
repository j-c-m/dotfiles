#!/usr/bin/env bash

# Source:   gogh
# Theme:    Neutron
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
    print_osc4 0 "23/25/2b"
    print_osc4 1 "b5/40/36"
    print_osc4 2 "5a/b9/77"
    print_osc4 3 "de/b5/66"
    print_osc4 4 "6a/7c/93"
    print_osc4 5 "a4/79/9d"
    print_osc4 6 "3f/94/a8"
    print_osc4 7 "e6/e8/ef"
    print_osc4 8 "23/25/2b"
    print_osc4 9 "b5/40/36"
    print_osc4 10 "5a/b9/77"
    print_osc4 11 "de/b5/66"
    print_osc4 12 "6a/7c/93"
    print_osc4 13 "a4/79/9d"
    print_osc4 14 "3f/94/a8"
    print_osc4 15 "eb/ed/f2"

    print_osc_rgb 10 "e6/e8/ef"
    print_osc_rgb 11 "1c/1e/22"
    print_osc_rgb 12 "e6/e8/ef"
    print_osc_rgb 17 "e6/e8/ef"
    print_osc_rgb 19 "1c/1e/22"
}

do_linux() {
    print_linux 0 "#23252b"
    print_linux 1 "#b54036"
    print_linux 2 "#5ab977"
    print_linux 3 "#deb566"
    print_linux 4 "#6a7c93"
    print_linux 5 "#a4799d"
    print_linux 6 "#3f94a8"
    print_linux 7 "#e6e8ef"
    print_linux 8 "#23252b"
    print_linux 9 "#b54036"
    print_linux 10 "#5ab977"
    print_linux 11 "#deb566"
    print_linux 12 "#6a7c93"
    print_linux 13 "#a4799d"
    print_linux 14 "#3f94a8"
    print_linux 15 "#ebedf2"
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
