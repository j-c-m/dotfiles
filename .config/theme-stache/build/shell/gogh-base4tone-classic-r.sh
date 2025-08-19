#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base4Tone Classic R
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
    print_osc4 0 "1e/1d/20"
    print_osc4 1 "d5/39/75"
    print_osc4 2 "65/77/ec"
    print_osc4 3 "a0/ac/f8"
    print_osc4 4 "af/88/f2"
    print_osc4 5 "d7/63/e9"
    print_osc4 6 "84/93/f6"
    print_osc4 7 "ea/e8/ed"
    print_osc4 8 "09/07/0d"
    print_osc4 9 "eb/75/a2"
    print_osc4 10 "ae/b8/f9"
    print_osc4 11 "c6/cd/fb"
    print_osc4 12 "dd/cb/fb"
    print_osc4 13 "e1/7e/f1"
    print_osc4 14 "d6/c2/fa"
    print_osc4 15 "f7/f6/f9"

    print_osc_rgb 10 "98/94/9e"
    print_osc_rgb 11 "1e/1d/20"
    print_osc_rgb 12 "6f/72/85"
    print_osc_rgb 17 "98/94/9e"
    print_osc_rgb 19 "1e/1d/20"
}

do_linux() {
    print_linux 0 "#1e1d20"
    print_linux 1 "#d53975"
    print_linux 2 "#6577ec"
    print_linux 3 "#a0acf8"
    print_linux 4 "#af88f2"
    print_linux 5 "#d763e9"
    print_linux 6 "#8493f6"
    print_linux 7 "#98949e"
    print_linux 8 "#09070d"
    print_linux 9 "#eb75a2"
    print_linux 10 "#aeb8f9"
    print_linux 11 "#c6cdfb"
    print_linux 12 "#ddcbfb"
    print_linux 13 "#e17ef1"
    print_linux 14 "#d6c2fa"
    print_linux 15 "#f7f6f9"
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
