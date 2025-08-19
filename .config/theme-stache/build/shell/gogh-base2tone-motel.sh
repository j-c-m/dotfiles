#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base2Tone Motel
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
    print_osc4 0 "24/23/23"
    print_osc4 1 "95/6f/76"
    print_osc4 2 "f8/91/7c"
    print_osc4 3 "ff/c8/bd"
    print_osc4 4 "a7/86/8b"
    print_osc4 5 "f8/91/7c"
    print_osc4 6 "b8/9d/a2"
    print_osc4 7 "a5/97/9a"
    print_osc4 8 "76/6b/6c"
    print_osc4 9 "ff/a2/8f"
    print_osc4 10 "37/34/34"
    print_osc4 11 "5a/53/54"
    print_osc4 12 "86/79/7b"
    print_osc4 13 "de/c9/cc"
    print_osc4 14 "f7/7c/64"
    print_osc4 15 "f0/db/df"

    print_osc_rgb 10 "a5/97/9a"
    print_osc_rgb 11 "24/23/23"
    print_osc_rgb 12 "e2/4f/32"
    print_osc_rgb 17 "a5/97/9a"
    print_osc_rgb 19 "24/23/23"
}

do_linux() {
    print_linux 0 "#242323"
    print_linux 1 "#956f76"
    print_linux 2 "#f8917c"
    print_linux 3 "#ffc8bd"
    print_linux 4 "#a7868b"
    print_linux 5 "#f8917c"
    print_linux 6 "#b89da2"
    print_linux 7 "#a5979a"
    print_linux 8 "#766b6c"
    print_linux 9 "#ffa28f"
    print_linux 10 "#373434"
    print_linux 11 "#5a5354"
    print_linux 12 "#86797b"
    print_linux 13 "#dec9cc"
    print_linux 14 "#f77c64"
    print_linux 15 "#f0dbdf"
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
