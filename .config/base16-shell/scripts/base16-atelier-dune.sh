#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Atelier Dune
# Scheme author: Bram de Haan (http://atelierbramdehaan.nl)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-atelier-dune"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="atelier-dune"
fi

color00="20/20/1d" # Base 00 - Black
color01="d7/37/37" # Base 08 - Red
color02="60/ac/39" # Base 0B - Green
color03="ae/95/13" # Base 0A - Yellow
color04="66/84/e1" # Base 0D - Blue
color05="b8/54/d4" # Base 0E - Magenta
color06="1f/ad/83" # Base 0C - Cyan
color07="a6/a2/8c" # Base 05 - White
color08="7d/7a/68" # Base 03 - Bright Black
color09="$color01" # Base 12 - Bright Red
color10="$color02" # Base 14 - Bright Green
color11="$color03" # Base 13 - Bright Yellow
color12="$color04" # Base 16 - Bright Blue
color13="$color05" # Base 17 - Bright Magenta
color14="$color06" # Base 15 - Bright Cyan
color15="fe/fb/ec" # Base 07 - Bright White
color16="b6/56/11" # Base 09
color17="d4/35/52" # Base 0F
color18="29/28/24" # Base 01
color19="6e/6b/5e" # Base 02
color20="99/95/80" # Base 04
color21="e8/e4/cf" # Base 06
color_foreground="a6/a2/8c" # Base 05
color_background="20/20/1d" # Base 00


if [ -z "$TTY" ] && ! TTY=$(tty); then
  put_template() { true; }
  put_template_var() { true; }
  put_template_custom() { true; }
elif [ -n "$TMUX" ] || [ "${TERM%%[-.]*}" = "tmux" ]; then
  # Tell tmux to pass the escape sequences through
  # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
  put_template() { printf '\033Ptmux;\033\033]4;%d;rgb:%s\033\033\\\033\\' "$@" > "$TTY"; }
  put_template_var() { printf '\033Ptmux;\033\033]%d;rgb:%s\033\033\\\033\\' "$@" > "$TTY"; }
  put_template_custom() { printf '\033Ptmux;\033\033]%s%s\033\033\\\033\\' "$@" > "$TTY"; }
elif [ "${TERM%%[-.]*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  put_template() { printf '\033P\033]4;%d;rgb:%s\007\033\\' "$@" > "$TTY"; }
  put_template_var() { printf '\033P\033]%d;rgb:%s\007\033\\' "$@" > "$TTY"; }
  put_template_custom() { printf '\033P\033]%s%s\007\033\\' "$@" > "$TTY"; }
elif [ "${TERM%%-*}" = "linux" ]; then
  put_template() { [ "$1" -lt 16 ] && printf "\e]P%x%s" "$1" "$(echo "$2" | sed 's/\///g')" > "$TTY"; }
  put_template_var() { true; }
  put_template_custom() { true; }
else
  put_template() { printf '\033]4;%d;rgb:%s\033\\' "$@" > "$TTY"; }
  put_template_var() { printf '\033]%d;rgb:%s\033\\' "$@" > "$TTY"; }
  put_template_custom() { printf '\033]%s%s\033\\' "$@" > "$TTY"; }
fi

# 16 color space
put_template 0  "$color00"
put_template 1  "$color01"
put_template 2  "$color02"
put_template 3  "$color03"
put_template 4  "$color04"
put_template 5  "$color05"
put_template 6  "$color06"
put_template 7  "$color07"
put_template 8  "$color08"
put_template 9  "$color09"
put_template 10 "$color10"
put_template 11 "$color11"
put_template 12 "$color12"
put_template 13 "$color13"
put_template 14 "$color14"
put_template 15 "$color15"

# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
  # iTerm2 proprietary escape codes
  put_template_custom Pg a6a28c # foreground
  put_template_custom Ph 20201d # background
  put_template_custom Pi a6a28c # bold color
  put_template_custom Pj 6e6b5e # selection color
  put_template_custom Pk a6a28c # selected text color
  put_template_custom Pl a6a28c # cursor
  put_template_custom Pm 20201d # cursor text
else
  put_template_var 10 "$color_foreground"
  if [ "$TINTED_SHELL_SET_BACKGROUND" != false ]; then
    put_template_var 11 "$color_background"
    if [ "${TERM%%-*}" = "rxvt" ]; then
      put_template_var 708 "$color_background" # internal border (rxvt)
    fi
  fi
  put_template_custom 12 ";7" # cursor (reverse video)
fi

# clean up
unset put_template
unset put_template_var
unset put_template_custom
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
unset color16
unset color17
unset color18
unset color19
unset color20
unset color21
unset color_foreground
unset color_background

export TINTED_COLOR_00_RGB="20201d"
export TINTED_COLOR_01_RGB="292824"
export TINTED_COLOR_02_RGB="6e6b5e"
export TINTED_COLOR_03_RGB="7d7a68"
export TINTED_COLOR_04_RGB="999580"
export TINTED_COLOR_05_RGB="a6a28c"
export TINTED_COLOR_06_RGB="e8e4cf"
export TINTED_COLOR_07_RGB="fefbec"
export TINTED_COLOR_08_RGB="d73737"
export TINTED_COLOR_09_RGB="b65611"
export TINTED_COLOR_0A_RGB="ae9513"
export TINTED_COLOR_0B_RGB="60ac39"
export TINTED_COLOR_0C_RGB="1fad83"
export TINTED_COLOR_0D_RGB="6684e1"
export TINTED_COLOR_0E_RGB="b854d4"
export TINTED_COLOR_0F_RGB="d43552"
export TINTED_COLOR_10_RGB="20201d"
export TINTED_COLOR_11_RGB="20201d"
export TINTED_COLOR_12_RGB="d73737"
export TINTED_COLOR_13_RGB="ae9513"
export TINTED_COLOR_14_RGB="60ac39"
export TINTED_COLOR_15_RGB="1fad83"
export TINTED_COLOR_16_RGB="6684e1"
export TINTED_COLOR_17_RGB="b854d4"
