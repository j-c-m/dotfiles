#! /bin/zsh
# A script to make using 256 colors in zsh less painful.
# P.C. Shyamshankar <sykora@lucentbeing.com>
# Copied from http://github.com/sykora/etc/blob/master/zsh/functions/spectrum/

if [[ $(echotc Co 2> /dev/null) != 256 ]] return

typeset -Ag FX FG BG

FX=(
    reset     "%{[00m%}"
    bold      "%{[01m%}" no-bold      "%{[22m%}"
    italic    "%{[03m%}" no-italic    "%{[23m%}"
    underline "%{[04m%}" no-underline "%{[24m%}"
    blink     "%{[05m%}" no-blink     "%{[25m%}"
    reverse   "%{[07m%}" no-reverse   "%{[27m%}"
)

for color in {000..255}; do
    FG[$color]="%{[38;5;${color}m%}"
    BG[$color]="%{[48;5;${color}m%}"
done

ZSH_SPECTRUM_TEXT=${ZSH_SPECTRUM_TEXT:-Arma virumque cano Troiae qui primus ab oris}

# Show all 256 colors with color number
function spectrum_ls() {
  for code in {000..255}; do
    print -P -- "$code: %F{$code}$ZSH_SPECTRUM_TEXT%f"
  done
}

# Show all 256 colors where the background is set to specific color
function spectrum_bls() {
  for code in {000..255}; do
    print -P -- "%K{$code}$code: $ZSH_SPECTRUM_TEXT %{%k%}"
  done
}

function spectrum()
{
    local b=0
    local m=0
    typeset -A grid

    for color in {000..255}; do
        # Current line in a block
        m=$((($color)%8))

        # Appending the displayed color to the line
        grid[$m]=$grid[$m]"%F{$color}#${color}%f %K{$color}        %k  "

        # Counting how many blocks are filled
        [[ $m = 7 ]] && b=$(($b+1))

        # Enough blocks for this line, display them
        if [[ $b = 4 ]]; then
            # Reset block counter
            b=0;
            # Display each line
            for j in {0..8}; do
                print -P $grid[$j]
                grid[$j]=""
            done
            echo ""
        fi
    done
}
