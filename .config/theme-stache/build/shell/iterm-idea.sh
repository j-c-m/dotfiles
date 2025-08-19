#!/usr/bin/env bash

# Source:   iterm
# Theme:    idea
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
    print_osc4 0 "ac/ac/ac"
    print_osc4 1 "fb/52/55"
    print_osc4 2 "98/b6/1b"
    print_osc4 3 "cc/b3/43"
    print_osc4 4 "43/7e/e6"
    print_osc4 5 "9d/73/b0"
    print_osc4 6 "24/88/86"
    print_osc4 7 "17/17/17"
    print_osc4 8 "ff/fe/fe"
    print_osc4 9 "fc/6f/72"
    print_osc4 10 "98/b6/1b"
    print_osc4 11 "ff/ff/0a"
    print_osc4 12 "6c/9b/ed"
    print_osc4 13 "fc/7e/fe"
    print_osc4 14 "24/88/86"
    print_osc4 15 "17/17/17"

    print_osc_rgb 10 "ac/ac/ac"
    print_osc_rgb 11 "20/20/20"
    print_osc_rgb 12 "bb/bb/bb"
    print_osc_rgb 17 "44/47/5a"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#acacac"
    print_linux 1 "#fb5255"
    print_linux 2 "#98b61b"
    print_linux 3 "#ccb343"
    print_linux 4 "#437ee6"
    print_linux 5 "#9d73b0"
    print_linux 6 "#248886"
    print_linux 7 "#acacac"
    print_linux 8 "#fffefe"
    print_linux 9 "#fc6f72"
    print_linux 10 "#98b61b"
    print_linux 11 "#ffff0a"
    print_linux 12 "#6c9bed"
    print_linux 13 "#fc7efe"
    print_linux 14 "#248886"
    print_linux 15 "#171717"
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
