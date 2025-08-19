#!/usr/bin/env bash

# Source:   iterm
# Theme:    Aardvark Blue
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
    print_osc4 0 "19/19/19"
    print_osc4 1 "aa/33/2d"
    print_osc4 2 "4a/8c/0f"
    print_osc4 3 "db/b9/00"
    print_osc4 4 "12/6f/d3"
    print_osc4 5 "c3/3a/c2"
    print_osc4 6 "00/8d/b0"
    print_osc4 7 "be/be/be"
    print_osc4 8 "44/44/44"
    print_osc4 9 "f0/5a/50"
    print_osc4 10 "94/dc/54"
    print_osc4 11 "ff/e7/62"
    print_osc4 12 "60/a3/ec"
    print_osc4 13 "e1/6a/e1"
    print_osc4 14 "60/b6/cb"
    print_osc4 15 "f7/f7/f7"

    print_osc_rgb 10 "dc/dc/dc"
    print_osc_rgb 11 "10/20/40"
    print_osc_rgb 12 "00/7a/cc"
    print_osc_rgb 17 "bf/db/fe"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#191919"
    print_linux 1 "#aa332d"
    print_linux 2 "#4a8c0f"
    print_linux 3 "#dbb900"
    print_linux 4 "#126fd3"
    print_linux 5 "#c33ac2"
    print_linux 6 "#008db0"
    print_linux 7 "#dcdcdc"
    print_linux 8 "#444444"
    print_linux 9 "#f05a50"
    print_linux 10 "#94dc54"
    print_linux 11 "#ffe762"
    print_linux 12 "#60a3ec"
    print_linux 13 "#e16ae1"
    print_linux 14 "#60b6cb"
    print_linux 15 "#f7f7f7"
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
