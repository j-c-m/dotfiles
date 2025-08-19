#!/usr/bin/env bash

# Source:   base16
# Theme:    summercamp
# Author:   zoe firi (zoefiri.github.io)
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
    print_osc4 0 "1c/18/10"
    print_osc4 1 "e3/51/42"
    print_osc4 2 "5c/eb/5a"
    print_osc4 3 "f2/ff/27"
    print_osc4 4 "48/9b/f0"
    print_osc4 5 "ff/80/80"
    print_osc4 6 "5a/eb/bc"
    print_osc4 7 "73/6e/55"
    print_osc4 8 "50/4b/38"
    print_osc4 9 "e3/51/42"
    print_osc4 10 "5c/eb/5a"
    print_osc4 11 "f2/ff/27"
    print_osc4 12 "48/9b/f0"
    print_osc4 13 "ff/80/80"
    print_osc4 14 "5a/eb/bc"
    print_osc4 15 "f8/f5/de"

    print_osc_rgb 10 "73/6e/55"
    print_osc_rgb 11 "1c/18/10"
    print_osc_rgb 12 "73/6e/55"
    print_osc_rgb 17 "ba/b6/96"
    print_osc_rgb 19 "2a/26/1c"
}

do_linux() {
    print_linux 0 "#1c1810"
    print_linux 1 "#e35142"
    print_linux 2 "#5ceb5a"
    print_linux 3 "#f2ff27"
    print_linux 4 "#489bf0"
    print_linux 5 "#ff8080"
    print_linux 6 "#5aebbc"
    print_linux 7 "#736e55"
    print_linux 8 "#504b38"
    print_linux 9 "#e35142"
    print_linux 10 "#5ceb5a"
    print_linux 11 "#f2ff27"
    print_linux 12 "#489bf0"
    print_linux 13 "#ff8080"
    print_linux 14 "#5aebbc"
    print_linux 15 "#f8f5de"
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
