#!/usr/bin/env bash

# Source:   iterm
# Theme:    Neutron
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "22/25/2b"
    print_osc4 1 "b5/3f/36"
    print_osc4 2 "5a/b9/77"
    print_osc4 3 "dd/b5/66"
    print_osc4 4 "6a/7b/92"
    print_osc4 5 "a3/79/9d"
    print_osc4 6 "3f/93/a8"
    print_osc4 7 "e6/e8/ee"
    print_osc4 8 "22/25/2b"
    print_osc4 9 "b5/3f/36"
    print_osc4 10 "5a/b9/77"
    print_osc4 11 "dd/b5/66"
    print_osc4 12 "6a/7b/92"
    print_osc4 13 "a3/79/9d"
    print_osc4 14 "3f/93/a8"
    print_osc4 15 "eb/ed/f2"

    print_osc_rgb 10 "e6/e8/ee"
    print_osc_rgb 11 "1b/1d/22"
    print_osc_rgb 12 "f6/f6/ec"
    print_osc_rgb 17 "2e/35/3d"
    print_osc_rgb 19 "7c/8f/a3"
}

do_linux() {
    print_linux 0 "#22252b"
    print_linux 1 "#b53f36"
    print_linux 2 "#5ab977"
    print_linux 3 "#ddb566"
    print_linux 4 "#6a7b92"
    print_linux 5 "#a3799d"
    print_linux 6 "#3f93a8"
    print_linux 7 "#e6e8ee"
    print_linux 8 "#22252b"
    print_linux 9 "#b53f36"
    print_linux 10 "#5ab977"
    print_linux 11 "#ddb566"
    print_linux 12 "#6a7b92"
    print_linux 13 "#a3799d"
    print_linux 14 "#3f93a8"
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
