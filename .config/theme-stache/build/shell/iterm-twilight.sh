#!/usr/bin/env bash

# Source:   iterm
# Theme:    Twilight
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
    print_osc4 0 "14/14/14"
    print_osc4 1 "c0/6c/43"
    print_osc4 2 "af/b9/79"
    print_osc4 3 "c2/a8/6c"
    print_osc4 4 "44/46/49"
    print_osc4 5 "b4/be/7b"
    print_osc4 6 "77/82/84"
    print_osc4 7 "fe/ff/d3"
    print_osc4 8 "26/26/26"
    print_osc4 9 "dd/7c/4c"
    print_osc4 10 "cb/d8/8c"
    print_osc4 11 "e1/c4/7d"
    print_osc4 12 "5a/5d/61"
    print_osc4 13 "d0/db/8e"
    print_osc4 14 "8a/98/9a"
    print_osc4 15 "fe/ff/d3"

    print_osc_rgb 10 "fe/ff/d3"
    print_osc_rgb 11 "14/14/14"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "30/30/30"
    print_osc_rgb 19 "fe/ff/d3"
}

do_linux() {
    print_linux 0 "#141414"
    print_linux 1 "#c06c43"
    print_linux 2 "#afb979"
    print_linux 3 "#c2a86c"
    print_linux 4 "#444649"
    print_linux 5 "#b4be7b"
    print_linux 6 "#778284"
    print_linux 7 "#feffd3"
    print_linux 8 "#262626"
    print_linux 9 "#dd7c4c"
    print_linux 10 "#cbd88c"
    print_linux 11 "#e1c47d"
    print_linux 12 "#5a5d61"
    print_linux 13 "#d0db8e"
    print_linux 14 "#8a989a"
    print_linux 15 "#feffd3"
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
