#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Tomorrow Night
# Scheme author: Chris Kempson (http://chriskempson.com)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-tomorrow-night"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="tomorrow-night"
fi

color00="1d/1f/21" # Base 00 - Black
color01="cc/66/66" # Base 08 - Red
color02="b5/bd/68" # Base 0B - Green
color03="f0/c6/74" # Base 0A - Yellow
color04="81/a2/be" # Base 0D - Blue
color05="b2/94/bb" # Base 0E - Magenta
color06="8a/be/b7" # Base 0C - Cyan
color07="c5/c8/c6" # Base 05 - White
color08="96/98/96" # Base 03 - Bright Black
color09="d9/8c/8c" # Base 12 - Bright Red
color10="c8/ce/8e" # Base 14 - Bright Green
color11="f4/d4/97" # Base 13 - Bright Yellow
color12="a1/b9/ce" # Base 16 - Bright Blue
color13="c5/af/cc" # Base 17 - Bright Magenta
color14="a7/ce/c9" # Base 15 - Bright Cyan
color15="ff/ff/ff" # Base 07 - Bright White
color16="de/93/5f" # Base 09
color17="a3/68/5a" # Base 0F
color18="28/2a/2e" # Base 01
color19="37/3b/41" # Base 02
color20="b4/b7/b4" # Base 04
color21="e0/e0/e0" # Base 06
color_foreground="c5/c8/c6" # Base 05
color_background="1d/1f/21" # Base 00


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
  put_template_custom Pg c5c8c6 # foreground
  put_template_custom Ph 1d1f21 # background
  put_template_custom Pi c5c8c6 # bold color
  put_template_custom Pj 373b41 # selection color
  put_template_custom Pk c5c8c6 # selected text color
  put_template_custom Pl c5c8c6 # cursor
  put_template_custom Pm 1d1f21 # cursor text
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

export TINTED_COLOR_00_RGB="1d1f21"
export TINTED_COLOR_01_RGB="282a2e"
export TINTED_COLOR_02_RGB="373b41"
export TINTED_COLOR_03_RGB="969896"
export TINTED_COLOR_04_RGB="b4b7b4"
export TINTED_COLOR_05_RGB="c5c8c6"
export TINTED_COLOR_06_RGB="e0e0e0"
export TINTED_COLOR_07_RGB="ffffff"
export TINTED_COLOR_08_RGB="cc6666"
export TINTED_COLOR_09_RGB="de935f"
export TINTED_COLOR_0A_RGB="f0c674"
export TINTED_COLOR_0B_RGB="b5bd68"
export TINTED_COLOR_0C_RGB="8abeb7"
export TINTED_COLOR_0D_RGB="81a2be"
export TINTED_COLOR_0E_RGB="b294bb"
export TINTED_COLOR_0F_RGB="a3685a"
export TINTED_COLOR_10_RGB="1d1f21"
export TINTED_COLOR_11_RGB="1d1f21"
export TINTED_COLOR_12_RGB="d98c8c"
export TINTED_COLOR_13_RGB="f4d497"
export TINTED_COLOR_14_RGB="c8ce8e"
export TINTED_COLOR_15_RGB="a7cec9"
export TINTED_COLOR_16_RGB="a1b9ce"
export TINTED_COLOR_17_RGB="c5afcc"

export TINTED_COLOR_BRIGHT08_RGB="d98c8c"
export TINTED_COLOR_BRIGHT09_RGB="e6ae87"
export TINTED_COLOR_BRIGHT0A_RGB="f4d497"
export TINTED_COLOR_BRIGHT0B_RGB="c8ce8e"
export TINTED_COLOR_BRIGHT0C_RGB="a7cec9"
export TINTED_COLOR_BRIGHT0D_RGB="a1b9ce"
export TINTED_COLOR_BRIGHT0E_RGB="c5afcc"
export TINTED_COLOR_BRIGHT0F_RGB="ba8d83"
