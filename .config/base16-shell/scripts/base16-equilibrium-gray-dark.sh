#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Equilibrium Gray Dark
# Scheme author: Carlo Abelli
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-equilibrium-gray-dark"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="equilibrium-gray-dark"
fi

color00="11/11/11" # Base 00 - Black
color01="f0/43/39" # Base 08 - Red
color02="7f/8b/00" # Base 0B - Green
color03="bb/88/01" # Base 0A - Yellow
color04="00/8d/d1" # Base 0D - Blue
color05="6a/7f/d2" # Base 0E - Magenta
color06="00/94/8b" # Base 0C - Cyan
color07="ab/ab/ab" # Base 05 - White
color08="77/77/77" # Base 03 - Bright Black
color09="f4/72/6b" # Base 12 - Bright Red
color10="d4/e8/00" # Base 14 - Bright Green
color11="fe/bc/0f" # Base 13 - Bright Yellow
color12="1d/b6/ff" # Base 16 - Bright Blue
color13="8f/9f/dd" # Base 17 - Bright Magenta
color14="00/ef/e0" # Base 15 - Bright Cyan
color15="e2/e2/e2" # Base 07 - Bright White
color16="df/59/23" # Base 09
color17="e3/48/8e" # Base 0F
color18="1b/1b/1b" # Base 01
color19="26/26/26" # Base 02
color20="91/91/91" # Base 04
color21="c6/c6/c6" # Base 06
color_foreground="ab/ab/ab" # Base 05
color_background="11/11/11" # Base 00


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
  put_template_custom Pg ababab # foreground
  put_template_custom Ph 111111 # background
  put_template_custom Pi ababab # bold color
  put_template_custom Pj 262626 # selection color
  put_template_custom Pk ababab # selected text color
  put_template_custom Pl ababab # cursor
  put_template_custom Pm 111111 # cursor text
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

export TINTED_COLOR_00_RGB="111111"
export TINTED_COLOR_01_RGB="1b1b1b"
export TINTED_COLOR_02_RGB="262626"
export TINTED_COLOR_03_RGB="777777"
export TINTED_COLOR_04_RGB="919191"
export TINTED_COLOR_05_RGB="ababab"
export TINTED_COLOR_06_RGB="c6c6c6"
export TINTED_COLOR_07_RGB="e2e2e2"
export TINTED_COLOR_08_RGB="f04339"
export TINTED_COLOR_09_RGB="df5923"
export TINTED_COLOR_0A_RGB="bb8801"
export TINTED_COLOR_0B_RGB="7f8b00"
export TINTED_COLOR_0C_RGB="00948b"
export TINTED_COLOR_0D_RGB="008dd1"
export TINTED_COLOR_0E_RGB="6a7fd2"
export TINTED_COLOR_0F_RGB="e3488e"
export TINTED_COLOR_10_RGB="111111"
export TINTED_COLOR_11_RGB="111111"
export TINTED_COLOR_12_RGB="f4726b"
export TINTED_COLOR_13_RGB="febc0f"
export TINTED_COLOR_14_RGB="d4e800"
export TINTED_COLOR_15_RGB="00efe0"
export TINTED_COLOR_16_RGB="1db6ff"
export TINTED_COLOR_17_RGB="8f9fdd"

export TINTED_COLOR_BRIGHT08_RGB="f4726b"
export TINTED_COLOR_BRIGHT09_RGB="e7835a"
export TINTED_COLOR_BRIGHT0A_RGB="febc0f"
export TINTED_COLOR_BRIGHT0B_RGB="d4e800"
export TINTED_COLOR_BRIGHT0C_RGB="00efe0"
export TINTED_COLOR_BRIGHT0D_RGB="1db6ff"
export TINTED_COLOR_BRIGHT0E_RGB="8f9fdd"
export TINTED_COLOR_BRIGHT0F_RGB="ea76aa"
