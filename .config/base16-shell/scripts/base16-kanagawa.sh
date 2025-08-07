#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Kanagawa
# Scheme author: Tommaso Laurenzi (https://github.com/rebelot)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-kanagawa"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="kanagawa"
fi

color00="1f/1f/28" # Base 00 - Black
color01="c3/40/43" # Base 08 - Red
color02="76/94/6a" # Base 0B - Green
color03="c0/a3/6e" # Base 0A - Yellow
color04="7e/9c/d8" # Base 0D - Blue
color05="95/7f/b8" # Base 0E - Magenta
color06="6a/95/89" # Base 0C - Cyan
color07="dc/d7/ba" # Base 05 - White
color08="54/54/6d" # Base 03 - Bright Black
color09="d2/70/72" # Base 12 - Bright Red
color10="98/af/8f" # Base 14 - Bright Green
color11="d0/ba/92" # Base 13 - Bright Yellow
color12="9e/b5/e2" # Base 16 - Bright Blue
color13="b0/9f/ca" # Base 17 - Bright Magenta
color14="8f/b0/a7" # Base 15 - Bright Cyan
color15="71/7c/7c" # Base 07 - Bright White
color16="ff/a0/66" # Base 09
color17="d2/7e/99" # Base 0F
color18="16/16/1d" # Base 01
color19="22/32/49" # Base 02
color20="72/71/69" # Base 04
color21="c8/c0/93" # Base 06
color_foreground="dc/d7/ba" # Base 05
color_background="1f/1f/28" # Base 00


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
  put_template_custom Pg dcd7ba # foreground
  put_template_custom Ph 1f1f28 # background
  put_template_custom Pi dcd7ba # bold color
  put_template_custom Pj 223249 # selection color
  put_template_custom Pk dcd7ba # selected text color
  put_template_custom Pl dcd7ba # cursor
  put_template_custom Pm 1f1f28 # cursor text
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

export TINTED_COLOR_00_RGB="1f1f28"
export TINTED_COLOR_01_RGB="16161d"
export TINTED_COLOR_02_RGB="223249"
export TINTED_COLOR_03_RGB="54546d"
export TINTED_COLOR_04_RGB="727169"
export TINTED_COLOR_05_RGB="dcd7ba"
export TINTED_COLOR_06_RGB="c8c093"
export TINTED_COLOR_07_RGB="717c7c"
export TINTED_COLOR_08_RGB="c34043"
export TINTED_COLOR_09_RGB="ffa066"
export TINTED_COLOR_0A_RGB="c0a36e"
export TINTED_COLOR_0B_RGB="76946a"
export TINTED_COLOR_0C_RGB="6a9589"
export TINTED_COLOR_0D_RGB="7e9cd8"
export TINTED_COLOR_0E_RGB="957fb8"
export TINTED_COLOR_0F_RGB="d27e99"
export TINTED_COLOR_10_RGB="1f1f28"
export TINTED_COLOR_11_RGB="1f1f28"
export TINTED_COLOR_12_RGB="d27072"
export TINTED_COLOR_13_RGB="d0ba92"
export TINTED_COLOR_14_RGB="98af8f"
export TINTED_COLOR_15_RGB="8fb0a7"
export TINTED_COLOR_16_RGB="9eb5e2"
export TINTED_COLOR_17_RGB="b09fca"

export TINTED_COLOR_BRIGHT08_RGB="d27072"
export TINTED_COLOR_BRIGHT09_RGB="ffb88c"
export TINTED_COLOR_BRIGHT0A_RGB="d0ba92"
export TINTED_COLOR_BRIGHT0B_RGB="98af8f"
export TINTED_COLOR_BRIGHT0C_RGB="8fb0a7"
export TINTED_COLOR_BRIGHT0D_RGB="9eb5e2"
export TINTED_COLOR_BRIGHT0E_RGB="b09fca"
export TINTED_COLOR_BRIGHT0F_RGB="dd9eb3"
