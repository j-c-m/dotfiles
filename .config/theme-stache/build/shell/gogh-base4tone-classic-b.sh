#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base4Tone Classic B
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
    print_osc4 0 "21/1e/1c"
    print_osc4 1 "66/9f/04"
    print_osc4 2 "de/57/45"
    print_osc4 3 "f1/8c/7e"
    print_osc4 4 "e7/8b/55"
    print_osc4 5 "c1/aa/15"
    print_osc4 6 "e9/72/63"
    print_osc4 7 "ee/ea/e8"
    print_osc4 8 "0d/09/07"
    print_osc4 9 "8b/cf/17"
    print_osc4 10 "f3/9c/91"
    print_osc4 11 "fb/ba/b1"
    print_osc4 12 "f7/cd/b6"
    print_osc4 13 "dc/c2/18"
    print_osc4 14 "f5/c1/a3"
    print_osc4 15 "f9/f7/f6"

    print_osc_rgb 10 "a2/97/90"
    print_osc_rgb 11 "21/1e/1c"
    print_osc_rgb 12 "84/73/71"
    print_osc_rgb 17 "a2/97/90"
    print_osc_rgb 19 "21/1e/1c"
}

do_linux() {
    print_linux 0 "#211e1c"
    print_linux 1 "#669f04"
    print_linux 2 "#de5745"
    print_linux 3 "#f18c7e"
    print_linux 4 "#e78b55"
    print_linux 5 "#c1aa15"
    print_linux 6 "#e97263"
    print_linux 7 "#a29790"
    print_linux 8 "#0d0907"
    print_linux 9 "#8bcf17"
    print_linux 10 "#f39c91"
    print_linux 11 "#fbbab1"
    print_linux 12 "#f7cdb6"
    print_linux 13 "#dcc218"
    print_linux 14 "#f5c1a3"
    print_linux 15 "#f9f7f6"
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
