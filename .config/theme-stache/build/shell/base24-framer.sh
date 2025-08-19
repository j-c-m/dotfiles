#!/usr/bin/env bash

# Source:   base24
# Theme:    Framer
# Author:   FredHappyface (https://github.com/fredHappyface)
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
    print_osc4 0 "11/11/11"
    print_osc4 1 "ff/55/55"
    print_osc4 2 "98/ec/65"
    print_osc4 3 "33/bb/ff"
    print_osc4 4 "00/aa/ff"
    print_osc4 5 "aa/88/ff"
    print_osc4 6 "88/dd/ff"
    print_osc4 7 "a9/a9/a9"
    print_osc4 8 "63/63/63"
    print_osc4 9 "ff/88/88"
    print_osc4 10 "b6/f2/92"
    print_osc4 11 "ff/d9/66"
    print_osc4 12 "33/bb/ff"
    print_osc4 13 "ce/bb/ff"
    print_osc4 14 "bb/ec/ff"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "a9/a9/a9"
    print_osc_rgb 11 "11/11/11"
    print_osc_rgb 12 "a9/a9/a9"
    print_osc_rgb 17 "cc/cc/cc"
    print_osc_rgb 19 "14/14/14"
}

do_linux() {
    print_linux 0 "#111111"
    print_linux 1 "#ff5555"
    print_linux 2 "#98ec65"
    print_linux 3 "#33bbff"
    print_linux 4 "#00aaff"
    print_linux 5 "#aa88ff"
    print_linux 6 "#88ddff"
    print_linux 7 "#a9a9a9"
    print_linux 8 "#636363"
    print_linux 9 "#ff8888"
    print_linux 10 "#b6f292"
    print_linux 11 "#ffd966"
    print_linux 12 "#33bbff"
    print_linux 13 "#cebbff"
    print_linux 14 "#bbecff"
    print_linux 15 "#ffffff"
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
