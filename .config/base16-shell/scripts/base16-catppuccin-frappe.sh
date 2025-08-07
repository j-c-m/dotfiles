#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Catppuccin Frappe
# Scheme author: https://github.com/catppuccin/catppuccin
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-catppuccin-frappe"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="catppuccin-frappe"
fi

color00="30/34/46" # Base 00 - Black
color01="e7/82/84" # Base 08 - Red
color02="a6/d1/89" # Base 0B - Green
color03="e5/c8/90" # Base 0A - Yellow
color04="8c/aa/ee" # Base 0D - Blue
color05="ca/9e/e6" # Base 0E - Magenta
color06="81/c8/be" # Base 0C - Cyan
color07="c6/d0/f5" # Base 05 - White
color08="51/57/6d" # Base 03 - Bright Black
color09="ed/a1/a3" # Base 12 - Bright Red
color10="bc/dc/a7" # Base 14 - Bright Green
color11="ec/d6/ac" # Base 13 - Bright Yellow
color12="a9/bf/f2" # Base 16 - Bright Blue
color13="d7/b6/ec" # Base 17 - Bright Magenta
color14="a1/d6/ce" # Base 15 - Bright Cyan
color15="ba/bb/f1" # Base 07 - Bright White
color16="ef/9f/76" # Base 09
color17="ee/be/be" # Base 0F
color18="29/2c/3c" # Base 01
color19="41/45/59" # Base 02
color20="62/68/80" # Base 04
color21="f2/d5/cf" # Base 06
color_foreground="c6/d0/f5" # Base 05
color_background="30/34/46" # Base 00


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
  put_template_custom Pg c6d0f5 # foreground
  put_template_custom Ph 303446 # background
  put_template_custom Pi c6d0f5 # bold color
  put_template_custom Pj 414559 # selection color
  put_template_custom Pk c6d0f5 # selected text color
  put_template_custom Pl c6d0f5 # cursor
  put_template_custom Pm 303446 # cursor text
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

export TINTED_COLOR_00_RGB="303446"
export TINTED_COLOR_01_RGB="292c3c"
export TINTED_COLOR_02_RGB="414559"
export TINTED_COLOR_03_RGB="51576d"
export TINTED_COLOR_04_RGB="626880"
export TINTED_COLOR_05_RGB="c6d0f5"
export TINTED_COLOR_06_RGB="f2d5cf"
export TINTED_COLOR_07_RGB="babbf1"
export TINTED_COLOR_08_RGB="e78284"
export TINTED_COLOR_09_RGB="ef9f76"
export TINTED_COLOR_0A_RGB="e5c890"
export TINTED_COLOR_0B_RGB="a6d189"
export TINTED_COLOR_0C_RGB="81c8be"
export TINTED_COLOR_0D_RGB="8caaee"
export TINTED_COLOR_0E_RGB="ca9ee6"
export TINTED_COLOR_0F_RGB="eebebe"
export TINTED_COLOR_10_RGB="303446"
export TINTED_COLOR_11_RGB="303446"
export TINTED_COLOR_12_RGB="eda1a3"
export TINTED_COLOR_13_RGB="ecd6ac"
export TINTED_COLOR_14_RGB="bcdca7"
export TINTED_COLOR_15_RGB="a1d6ce"
export TINTED_COLOR_16_RGB="a9bff2"
export TINTED_COLOR_17_RGB="d7b6ec"

export TINTED_COLOR_BRIGHT08_RGB="eda1a3"
export TINTED_COLOR_BRIGHT09_RGB="f3b798"
export TINTED_COLOR_BRIGHT0A_RGB="ecd6ac"
export TINTED_COLOR_BRIGHT0B_RGB="bcdca7"
export TINTED_COLOR_BRIGHT0C_RGB="a1d6ce"
export TINTED_COLOR_BRIGHT0D_RGB="a9bff2"
export TINTED_COLOR_BRIGHT0E_RGB="d7b6ec"
export TINTED_COLOR_BRIGHT0F_RGB="f2cece"
