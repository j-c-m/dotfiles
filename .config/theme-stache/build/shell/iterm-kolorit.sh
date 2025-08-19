#!/usr/bin/env bash

# Source:   iterm
# Theme:    Kolorit
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
    print_osc4 0 "1d/1a/1e"
    print_osc4 1 "ff/5b/82"
    print_osc4 2 "47/d7/a0"
    print_osc4 3 "e7/e5/62"
    print_osc4 4 "5d/b3/ee"
    print_osc4 5 "da/6c/da"
    print_osc4 6 "56/e8/ea"
    print_osc4 7 "ec/ec/ec"
    print_osc4 8 "1d/1a/1e"
    print_osc4 9 "ff/5b/82"
    print_osc4 10 "47/d7/a1"
    print_osc4 11 "e8/e5/62"
    print_osc4 12 "5d/b4/ee"
    print_osc4 13 "da/6c/da"
    print_osc4 14 "57/e9/eb"
    print_osc4 15 "ed/ed/ed"

    print_osc_rgb 10 "ef/ec/ec"
    print_osc_rgb 11 "1d/1a/1e"
    print_osc_rgb 12 "c7/c7/c7"
    print_osc_rgb 17 "e0/92/5c"
    print_osc_rgb 19 "1d/1a/1e"
}

do_linux() {
    print_linux 0 "#1d1a1e"
    print_linux 1 "#ff5b82"
    print_linux 2 "#47d7a0"
    print_linux 3 "#e7e562"
    print_linux 4 "#5db3ee"
    print_linux 5 "#da6cda"
    print_linux 6 "#56e8ea"
    print_linux 7 "#efecec"
    print_linux 8 "#1d1a1e"
    print_linux 9 "#ff5b82"
    print_linux 10 "#47d7a1"
    print_linux 11 "#e8e562"
    print_linux 12 "#5db4ee"
    print_linux 13 "#da6cda"
    print_linux 14 "#57e9eb"
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
