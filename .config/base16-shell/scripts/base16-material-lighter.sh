#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Material Lighter
# Scheme author: Nate Peterson
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-material-lighter"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="material-lighter"
fi

color00="fa/fa/fa" # Base 00 - Black
color01="ff/53/70" # Base 08 - Red
color02="91/b8/59" # Base 0B - Green
color03="ff/b6/2c" # Base 0A - Yellow
color04="61/82/b8" # Base 0D - Blue
color05="7c/4d/ff" # Base 0E - Magenta
color06="39/ad/b5" # Base 0C - Cyan
color07="80/cb/c4" # Base 05 - White
color08="cc/d7/da" # Base 03 - Bright Black
color09="$color01" # Base 12 - Bright Red
color10="$color02" # Base 14 - Bright Green
color11="$color03" # Base 13 - Bright Yellow
color12="$color04" # Base 16 - Bright Blue
color13="$color05" # Base 17 - Bright Magenta
color14="$color06" # Base 15 - Bright Cyan
color15="ff/ff/ff" # Base 07 - Bright White
color16="f7/6d/47" # Base 09
color17="e5/39/35" # Base 0F
color18="e7/ea/ec" # Base 01
color19="cc/ea/e7" # Base 02
color20="87/96/b0" # Base 04
color21="80/cb/c4" # Base 06
color_foreground="80/cb/c4" # Base 05
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
  put_template_custom Pg 80cbc4 # foreground
  put_template_custom Ph fafafa # background
  put_template_custom Pi 80cbc4 # bold color
  put_template_custom Pj cceae7 # selection color
  put_template_custom Pk 80cbc4 # selected text color
  put_template_custom Pl 80cbc4 # cursor
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
export TINTED_COLOR_01_RGB="e7eaec"
export TINTED_COLOR_02_RGB="cceae7"
export TINTED_COLOR_03_RGB="ccd7da"
export TINTED_COLOR_04_RGB="8796b0"
export TINTED_COLOR_05_RGB="80cbc4"
export TINTED_COLOR_06_RGB="80cbc4"
export TINTED_COLOR_07_RGB="ffffff"
export TINTED_COLOR_08_RGB="ff5370"
export TINTED_COLOR_09_RGB="f76d47"
export TINTED_COLOR_0A_RGB="ffb62c"
export TINTED_COLOR_0B_RGB="91b859"
export TINTED_COLOR_0C_RGB="39adb5"
export TINTED_COLOR_0D_RGB="6182b8"
export TINTED_COLOR_0E_RGB="7c4dff"
export TINTED_COLOR_0F_RGB="e53935"
export TINTED_COLOR_10_RGB="fafafa"
export TINTED_COLOR_11_RGB="fafafa"
export TINTED_COLOR_12_RGB="ff5370"
export TINTED_COLOR_13_RGB="ffb62c"
export TINTED_COLOR_14_RGB="91b859"
export TINTED_COLOR_15_RGB="39adb5"
export TINTED_COLOR_16_RGB="6182b8"
export TINTED_COLOR_17_RGB="7c4dff"
