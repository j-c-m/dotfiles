#!/usr/bin/env bash

# Source:   iterm
# Theme:    IC_Orange_PPL
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
    print_osc4 1 "c0/39/00"
    print_osc4 2 "a3/a9/00"
    print_osc4 3 "ca/ae/00"
    print_osc4 4 "bd/6c/00"
    print_osc4 5 "fb/5d/00"
    print_osc4 6 "f7/94/00"
    print_osc4 7 "ff/c8/8a"
    print_osc4 8 "6a/4e/29"
    print_osc4 9 "ff/8b/67"
    print_osc4 10 "f6/ff/3f"
    print_osc4 11 "ff/e3/6e"
    print_osc4 12 "ff/bd/54"
    print_osc4 13 "fc/87/4f"
    print_osc4 14 "c5/97/52"
    print_osc4 15 "f9/f9/fe"

    print_osc_rgb 10 "ff/cb/83"
    print_osc_rgb 11 "26/26/26"
    print_osc_rgb 12 "fb/52/1c"
    print_osc_rgb 17 "c0/3f/1f"
    print_osc_rgb 19 "ff/c8/8a"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#c03900"
    print_linux 2 "#a3a900"
    print_linux 3 "#caae00"
    print_linux 4 "#bd6c00"
    print_linux 5 "#fb5d00"
    print_linux 6 "#f79400"
    print_linux 7 "#ffcb83"
    print_linux 8 "#6a4e29"
    print_linux 9 "#ff8b67"
    print_linux 10 "#f6ff3f"
    print_linux 11 "#ffe36e"
    print_linux 12 "#ffbd54"
    print_linux 13 "#fc874f"
    print_linux 14 "#c59752"
    print_linux 15 "#f9f9fe"
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
