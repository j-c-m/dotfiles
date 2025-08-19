#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base4Tone Classic C
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
    print_osc4 0 "22/1f/1c"
    print_osc4 1 "04/9a/61"
    print_osc4 2 "de/57/45"
    print_osc4 3 "f1/8c/7e"
    print_osc4 4 "e6/97/1a"
    print_osc4 5 "ad/c1/15"
    print_osc4 6 "e9/72/63"
    print_osc4 7 "ee/eb/e8"
    print_osc4 8 "0d/0b/07"
    print_osc4 9 "16/ca/85"
    print_osc4 10 "f3/9c/91"
    print_osc4 11 "fb/ba/b1"
    print_osc4 12 "f5/d8/a8"
    print_osc4 13 "c5/dc/18"
    print_osc4 14 "f3/cd/91"
    print_osc4 15 "f9/f8/f6"

    print_osc_rgb 10 "a3/9b/8f"
    print_osc_rgb 11 "22/1f/1c"
    print_osc_rgb 12 "84/73/71"
    print_osc_rgb 17 "a3/9b/8f"
    print_osc_rgb 19 "22/1f/1c"
}

do_linux() {
    print_linux 0 "#221f1c"
    print_linux 1 "#049a61"
    print_linux 2 "#de5745"
    print_linux 3 "#f18c7e"
    print_linux 4 "#e6971a"
    print_linux 5 "#adc115"
    print_linux 6 "#e97263"
    print_linux 7 "#a39b8f"
    print_linux 8 "#0d0b07"
    print_linux 9 "#16ca85"
    print_linux 10 "#f39c91"
    print_linux 11 "#fbbab1"
    print_linux 12 "#f5d8a8"
    print_linux 13 "#c5dc18"
    print_linux 14 "#f3cd91"
    print_linux 15 "#f9f8f6"
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
