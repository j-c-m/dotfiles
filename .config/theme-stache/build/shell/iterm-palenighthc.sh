#!/usr/bin/env bash

# Source:   iterm
# Theme:    PaleNightHC
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "f0/71/78"
    print_osc4 2 "c3/e8/8d"
    print_osc4 3 "ff/cb/6b"
    print_osc4 4 "82/aa/ff"
    print_osc4 5 "c7/92/ea"
    print_osc4 6 "89/dd/ff"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "66/66/66"
    print_osc4 9 "f6/a9/ae"
    print_osc4 10 "db/f1/ba"
    print_osc4 11 "ff/df/a6"
    print_osc4 12 "b4/cc/ff"
    print_osc4 13 "dd/bd/f2"
    print_osc4 14 "b8/ea/ff"
    print_osc4 15 "99/99/99"

    print_osc_rgb 10 "cc/cc/cc"
    print_osc_rgb 11 "3e/42/51"
    print_osc_rgb 12 "ff/cb/6b"
    print_osc_rgb 17 "71/7c/b4"
    print_osc_rgb 19 "80/cb/c4"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#f07178"
    print_linux 2 "#c3e88d"
    print_linux 3 "#ffcb6b"
    print_linux 4 "#82aaff"
    print_linux 5 "#c792ea"
    print_linux 6 "#89ddff"
    print_linux 7 "#cccccc"
    print_linux 8 "#666666"
    print_linux 9 "#f6a9ae"
    print_linux 10 "#dbf1ba"
    print_linux 11 "#ffdfa6"
    print_linux 12 "#b4ccff"
    print_linux 13 "#ddbdf2"
    print_linux 14 "#b8eaff"
    print_linux 15 "#999999"
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
