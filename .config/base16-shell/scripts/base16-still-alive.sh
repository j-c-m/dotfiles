#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Still Alive
# Scheme author: Derrick McKee (derrick.mckee@gmail.com)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-still-alive"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="still-alive"
fi

color00="f0/f0/f0" # Base 00 - Black
color01="48/78/30" # Base 08 - Red
color02="5c/5c/6a" # Base 0B - Green
color03="42/63/95" # Base 0A - Yellow
color04="00/18/78" # Base 0D - Blue
color05="90/00/00" # Base 0E - Magenta
color06="2c/3c/57" # Base 0C - Cyan
color07="d8/00/00" # Base 05 - White
color08="f0/18/18" # Base 03 - Bright Black
color09="33/63/1b" # Base 12 - Bright Red
color10="34/34/61" # Base 14 - Bright Green
color11="25/48/7c" # Base 13 - Bright Yellow
color12="00/12/5a" # Base 16 - Bright Blue
color13="6c/00/00" # Base 17 - Bright Magenta
color14="19/2b/4a" # Base 15 - Bright Cyan
color15="30/a8/60" # Base 07 - Bright White
color16="18/30/48" # Base 09
color17="14/0c/0d" # Base 0F
color18="f0/d8/48" # Base 01
color19="ff/f0/18" # Base 02
color20="f0/00/00" # Base 04
color21="48/90/00" # Base 06
color_foreground="d8/00/00" # Base 05
color_background="f0/f0/f0" # Base 00


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
  put_template_custom Pg d80000 # foreground
  put_template_custom Ph f0f0f0 # background
  put_template_custom Pi d80000 # bold color
  put_template_custom Pj fff018 # selection color
  put_template_custom Pk d80000 # selected text color
  put_template_custom Pl d80000 # cursor
  put_template_custom Pm f0f0f0 # cursor text
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

export TINTED_COLOR_00_RGB="f0f0f0"
export TINTED_COLOR_01_RGB="f0d848"
export TINTED_COLOR_02_RGB="fff018"
export TINTED_COLOR_03_RGB="f01818"
export TINTED_COLOR_04_RGB="f00000"
export TINTED_COLOR_05_RGB="d80000"
export TINTED_COLOR_06_RGB="489000"
export TINTED_COLOR_07_RGB="30a860"
export TINTED_COLOR_08_RGB="487830"
export TINTED_COLOR_09_RGB="183048"
export TINTED_COLOR_0A_RGB="426395"
export TINTED_COLOR_0B_RGB="5c5c6a"
export TINTED_COLOR_0C_RGB="2c3c57"
export TINTED_COLOR_0D_RGB="001878"
export TINTED_COLOR_0E_RGB="900000"
export TINTED_COLOR_0F_RGB="140c0d"
export TINTED_COLOR_10_RGB="f0f0f0"
export TINTED_COLOR_11_RGB="f0f0f0"
export TINTED_COLOR_12_RGB="33631b"
export TINTED_COLOR_13_RGB="25487c"
export TINTED_COLOR_14_RGB="343461"
export TINTED_COLOR_15_RGB="192b4a"
export TINTED_COLOR_16_RGB="00125a"
export TINTED_COLOR_17_RGB="6c0000"

export TINTED_COLOR_BRIGHT08_RGB="33631b"
export TINTED_COLOR_BRIGHT09_RGB="0d243b"
export TINTED_COLOR_BRIGHT0A_RGB="25487c"
export TINTED_COLOR_BRIGHT0B_RGB="343461"
export TINTED_COLOR_BRIGHT0C_RGB="192b4a"
export TINTED_COLOR_BRIGHT0D_RGB="00125a"
export TINTED_COLOR_BRIGHT0E_RGB="6c0000"
export TINTED_COLOR_BRIGHT0F_RGB="110708"
