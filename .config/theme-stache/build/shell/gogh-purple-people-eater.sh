#!/usr/bin/env bash

# Source:   gogh
# Theme:    Purple People Eater
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
    print_osc4 0 "0d/11/17"
    print_osc4 1 "e3/4c/26"
    print_osc4 2 "23/86/36"
    print_osc4 3 "ed/9a/51"
    print_osc4 4 "a5/d6/ff"
    print_osc4 5 "6e/b0/e8"
    print_osc4 6 "c0/9a/eb"
    print_osc4 7 "c9/d1/d9"
    print_osc4 8 "0d/11/17"
    print_osc4 9 "ff/7b/72"
    print_osc4 10 "3b/ab/4a"
    print_osc4 11 "ff/a6/57"
    print_osc4 12 "a5/d6/ff"
    print_osc4 13 "79/c0/ff"
    print_osc4 14 "b6/94/df"
    print_osc4 15 "c9/d1/d9"

    print_osc_rgb 10 "c9/d1/d9"
    print_osc_rgb 11 "16/1b/22"
    print_osc_rgb 12 "c9/d1/d9"
    print_osc_rgb 17 "c9/d1/d9"
    print_osc_rgb 19 "16/1b/22"
}

do_linux() {
    print_linux 0 "#0d1117"
    print_linux 1 "#e34c26"
    print_linux 2 "#238636"
    print_linux 3 "#ed9a51"
    print_linux 4 "#a5d6ff"
    print_linux 5 "#6eb0e8"
    print_linux 6 "#c09aeb"
    print_linux 7 "#c9d1d9"
    print_linux 8 "#0d1117"
    print_linux 9 "#ff7b72"
    print_linux 10 "#3bab4a"
    print_linux 11 "#ffa657"
    print_linux 12 "#a5d6ff"
    print_linux 13 "#79c0ff"
    print_linux 14 "#b694df"
    print_linux 15 "#c9d1d9"
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
