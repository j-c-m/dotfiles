#!/usr/bin/env bash

# Source:   iterm
# Theme:    kurokula
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
    print_osc4 0 "33/32/32"
    print_osc4 1 "c3/59/51"
    print_osc4 2 "78/b2/a8"
    print_osc4 3 "e1/b9/17"
    print_osc4 4 "5b/91/dc"
    print_osc4 5 "8a/79/a6"
    print_osc4 6 "86/72/67"
    print_osc4 7 "df/cf/c2"
    print_osc4 8 "51/50/50"
    print_osc4 9 "fe/c3/4c"
    print_osc4 10 "ae/fe/a4"
    print_osc4 11 "fe/f6/00"
    print_osc4 12 "90/da/fe"
    print_osc4 13 "ad/93/fe"
    print_osc4 14 "fe/cc/b5"
    print_osc4 15 "fe/fe/fe"

    print_osc_rgb 10 "df/cf/c2"
    print_osc_rgb 11 "13/15/15"
    print_osc_rgb 12 "79/1c/1b"
    print_osc_rgb 17 "51/50/50"
    print_osc_rgb 19 "fe/c3/4c"
}

do_linux() {
    print_linux 0 "#333232"
    print_linux 1 "#c35951"
    print_linux 2 "#78b2a8"
    print_linux 3 "#e1b917"
    print_linux 4 "#5b91dc"
    print_linux 5 "#8a79a6"
    print_linux 6 "#867267"
    print_linux 7 "#dfcfc2"
    print_linux 8 "#515050"
    print_linux 9 "#fec34c"
    print_linux 10 "#aefea4"
    print_linux 11 "#fef600"
    print_linux 12 "#90dafe"
    print_linux 13 "#ad93fe"
    print_linux 14 "#feccb5"
    print_linux 15 "#fefefe"
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
