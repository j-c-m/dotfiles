#!/usr/bin/env bash

# Source:   iterm
# Theme:    Terminal Basic Dark
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "c6/53/39"
    print_osc4 2 "6a/c4/4b"
    print_osc4 3 "b8/b7/4a"
    print_osc4 4 "64/44/ed"
    print_osc4 5 "d3/57/db"
    print_osc4 6 "69/c1/cf"
    print_osc4 7 "d1/d1/d1"
    print_osc4 8 "90/90/90"
    print_osc4 9 "eb/5a/3a"
    print_osc4 10 "77/ea/51"
    print_osc4 11 "ef/ef/53"
    print_osc4 12 "d0/9a/f9"
    print_osc4 13 "eb/5a/f7"
    print_osc4 14 "78/f1/f2"
    print_osc4 15 "ed/ed/ed"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "1d/1e/1d"
    print_osc_rgb 12 "9d/9d/9d"
    print_osc_rgb 17 "3f/63/8a"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#c65339"
    print_linux 2 "#6ac44b"
    print_linux 3 "#b8b74a"
    print_linux 4 "#6444ed"
    print_linux 5 "#d357db"
    print_linux 6 "#69c1cf"
    print_linux 7 "#ffffff"
    print_linux 8 "#909090"
    print_linux 9 "#eb5a3a"
    print_linux 10 "#77ea51"
    print_linux 11 "#efef53"
    print_linux 12 "#d09af9"
    print_linux 13 "#eb5af7"
    print_linux 14 "#78f1f2"
    print_linux 15 "#ededed"
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
