#!/usr/bin/env bash

# Source:   base24
# Theme:    Space Gray Eighties Dull
# Author:   FredHappyface (https://github.com/fredHappyface)
# Variant:  dark

# Exit if not on a tty

if [[ ! -t 0 ]]; then
    exit 0
fi

color00="#212121"    # Black (Host)
color01="#b14956"    # Red (Syntax string)
color02="#91b377"    # Green (Command)
color03="#5485c0"    # Yellow (Command second)
color04="#7b8fa4"    # Blue (Path)
color05="#a5779e"    # Magenta (Syntax var)
color06="#7fcccb"    # Cyan (Prompt)
color07="#9a9fa6"    # White
color08="#6c6d70"    # Bright Black
color09="#ec5f67"    # Bright Red (Command error)
color10="#88e985"   # Bright Green (Exec)
color11="#fdc253"   # Bright Yellow
color12="#5485c0"   # Bright Blue (Folder)
color13="#bf83c0"   # Bright Magenta
color14="#58c2c0"   # Bright Cyan
color15="#ffffff"   # Bright White

foreground="#9a9fa6"         # Foreground (Text)
background="#212121"         # Background
cursor="#9a9fa6"                 # Cursor
selection="#b2b8c2"           # Selection Background
selection_text="#4d473d" # Selection Text

function tolower()
{
    local input="$1"

    typeset -l lower
    lower="$input"
    echo "$lower"
}

# Function to convert hex color (#RRGGBB) to rr/gg/bb format
hex_to_hexs() {
    local hex_color="$1"

    # Validate input (must start with # and have 6 hex digits)
    if [[ ! $hex_color =~ ^#[0-9a-fA-F]{6}$ ]]; then
        echo "Error: Invalid hex color format. Use #RRGGBB (e.g., #c0c0c0)." >&2
        exit 1
    fi

    # Remove the leading '#' and convert to lowercase
    local hex_clean=${hex_color#\#}
    hex_clean=$(tolower "$hex_clean")

    # Extract red, green, and blue components
    local red=${hex_clean:0:2}
    local green=${hex_clean:2:2}
    local blue=${hex_clean:4:2}

    # Format as rr/gg/bb and output
    echo "$red/$green/$blue"
}

print_osc4() {
    local color="$1"
    local hex="$2"

    printf "\033]4;%d;rgb:%s\033\\" "$color" $(hex_to_hexs "$hex")
}

print_osc_rgb() {
    local osc="$1"
    local hex="$2"

    printf "\033]%d;rgb:%s\033\\" "$osc" $(hex_to_hexs "$hex")
}

print_linux() {
    local color="$1"
    local hex="$2"

    printf "\033]P%x%s" "$color" ${hex_color#\#}
}

do_osc() {
    print_osc4 0 "$color00"
    print_osc4 1 "$color01"
    print_osc4 2 "$color02"
    print_osc4 3 "$color03"
    print_osc4 4 "$color04"
    print_osc4 5 "$color05"
    print_osc4 6 "$color06"
    print_osc4 7 "$color07"
    print_osc4 8 "$color08"
    print_osc4 9 "$color09"
    print_osc4 10 "$color10"
    print_osc4 11 "$color11"
    print_osc4 12 "$color12"
    print_osc4 13 "$color13"
    print_osc4 14 "$color14"
    print_osc4 15 "$color15"

    print_osc_rgb 10 "$foreground"
    print_osc_rgb 11 "$background"
    print_osc_rgb 12 "$cursor"
    print_osc_rgb 17 "$selection"
    print_osc_rgb 19 "$selection_text"
}

do_linux() {
    print_linux 0 "$color00"
    print_linux 1 "$color01"
    print_linux 2 "$color02"
    print_linux 3 "$color03"
    print_linux 4 "$color04"
    print_linux 5 "$color05"
    print_linux 6 "$color06"
    print_linux 7 "$color07"
    print_linux 8 "$color08"
    print_linux 9 "$color09"
    print_linux 10 "$color10"
    print_linux 11 "$color11"
    print_linux 12 "$color12"
    print_linux 13 "$color13"
    print_linux 14 "$color14"
    print_linux 15 "$color15"
}

case "$TERM" in
    linux*)
        do_linux
        ;;
    *)
        do_osc
        ;;
esac

unset -f tolower
unset -f hex_to_hexs
unset -f print_osc4
unset -f print_osc_rgb
unset -f print_linux
unset -f do_osc
unset -f do_linux

unset color00
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color10
unset color11
unset color12
unset color13
unset color14
unset color15
unset foreground
unset background
unset cursor
unset selection
unset selection_text
