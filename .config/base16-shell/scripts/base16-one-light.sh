#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: One Light
# Scheme author: Daniel Pfeifer (http://github.com/purpleKarrot)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-one-light"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="one-light"
fi

color00="fa/fa/fa" # Base 00 - Black
color01="ca/12/43" # Base 08 - Red
color02="50/a1/4f" # Base 0B - Green
color03="c1/84/01" # Base 0A - Yellow
color04="40/78/f2" # Base 0D - Blue
color05="a6/26/a4" # Base 0E - Magenta
color06="01/84/bc" # Base 0C - Cyan
color07="38/3a/42" # Base 05 - White
color08="a0/a1/a7" # Base 03 - Bright Black
color09="9b/0a/31" # Base 12 - Bright Red
color10="2e/88/2c" # Base 14 - Bright Green
color11="91/63/01" # Base 13 - Bright Yellow
color12="0b/4c/db" # Base 16 - Bright Blue
color13="84/15/82" # Base 17 - Bright Magenta
color14="01/63/8d" # Base 15 - Bright Cyan
color15="09/0a/0b" # Base 07 - Bright White
color16="d7/5f/00" # Base 09
color17="98/68/01" # Base 0F
color18="f0/f0/f1" # Base 01
color19="e5/e5/e6" # Base 02
color20="69/6c/77" # Base 04
color21="20/22/27" # Base 06
color_foreground="38/3a/42" # Base 05
color_background="fa/fa/fa" # Base 00


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
  put_template_custom Pg 383a42 # foreground
  put_template_custom Ph fafafa # background
  put_template_custom Pi 383a42 # bold color
  put_template_custom Pj e5e5e6 # selection color
  put_template_custom Pk 383a42 # selected text color
  put_template_custom Pl 383a42 # cursor
  put_template_custom Pm fafafa # cursor text
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

export TINTED_COLOR_00_RGB="fafafa"
export TINTED_COLOR_01_RGB="f0f0f1"
export TINTED_COLOR_02_RGB="e5e5e6"
export TINTED_COLOR_03_RGB="a0a1a7"
export TINTED_COLOR_04_RGB="696c77"
export TINTED_COLOR_05_RGB="383a42"
export TINTED_COLOR_06_RGB="202227"
export TINTED_COLOR_07_RGB="090a0b"
export TINTED_COLOR_08_RGB="ca1243"
export TINTED_COLOR_09_RGB="d75f00"
export TINTED_COLOR_0A_RGB="c18401"
export TINTED_COLOR_0B_RGB="50a14f"
export TINTED_COLOR_0C_RGB="0184bc"
export TINTED_COLOR_0D_RGB="4078f2"
export TINTED_COLOR_0E_RGB="a626a4"
export TINTED_COLOR_0F_RGB="986801"
export TINTED_COLOR_10_RGB="fafafa"
export TINTED_COLOR_11_RGB="fafafa"
export TINTED_COLOR_12_RGB="9b0a31"
export TINTED_COLOR_13_RGB="916301"
export TINTED_COLOR_14_RGB="2e882c"
export TINTED_COLOR_15_RGB="01638d"
export TINTED_COLOR_16_RGB="0b4cdb"
export TINTED_COLOR_17_RGB="841582"

export TINTED_COLOR_BRIGHT08_RGB="9b0a31"
export TINTED_COLOR_BRIGHT09_RGB="a14700"
export TINTED_COLOR_BRIGHT0A_RGB="916301"
export TINTED_COLOR_BRIGHT0B_RGB="2e882c"
export TINTED_COLOR_BRIGHT0C_RGB="01638d"
export TINTED_COLOR_BRIGHT0D_RGB="0b4cdb"
export TINTED_COLOR_BRIGHT0E_RGB="841582"
export TINTED_COLOR_BRIGHT0F_RGB="724e01"
