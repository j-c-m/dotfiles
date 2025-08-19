#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base4Tone Classic T
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "20/1d/20"
    print_osc4 1 "ce/67/2c"
    print_osc4 2 "92/63/e3"
    print_osc4 3 "b7/92/f6"
    print_osc4 4 "db/75/eb"
    print_osc4 5 "e9/63/96"
    print_osc4 6 "a5/7a/f0"
    print_osc4 7 "ed/e8/ed"
    print_osc4 8 "0c/07/0d"
    print_osc4 9 "e7/8b/55"
    print_osc4 10 "c0/a1/f7"
    print_osc4 11 "d6/c2/fa"
    print_osc4 12 "f1/c3/f8"
    print_osc4 13 "f1/7e/aa"
    print_osc4 14 "ed/b1/f6"
    print_osc4 15 "f8/f6/f9"

    print_osc_rgb 10 "9d/94/9e"
    print_osc_rgb 11 "20/1d/20"
    print_osc_rgb 12 "79/74/81"
    print_osc_rgb 17 "9d/94/9e"
    print_osc_rgb 19 "20/1d/20"
}

do_linux() {
    print_linux 0 "#201d20"
    print_linux 1 "#ce672c"
    print_linux 2 "#9263e3"
    print_linux 3 "#b792f6"
    print_linux 4 "#db75eb"
    print_linux 5 "#e96396"
    print_linux 6 "#a57af0"
    print_linux 7 "#9d949e"
    print_linux 8 "#0c070d"
    print_linux 9 "#e78b55"
    print_linux 10 "#c0a1f7"
    print_linux 11 "#d6c2fa"
    print_linux 12 "#f1c3f8"
    print_linux 13 "#f17eaa"
    print_linux 14 "#edb1f6"
    print_linux 15 "#f8f6f9"
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
