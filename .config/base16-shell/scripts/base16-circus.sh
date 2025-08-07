#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Circus
# Scheme author: Stephan Boyer (https://github.com/stepchowfun) and Esther Wang (https://github.com/ewang12)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-circus"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="circus"
fi

color00="19/19/19" # Base 00 - Black
color01="dc/65/7d" # Base 08 - Red
color02="84/b9/7c" # Base 0B - Green
color03="c3/ba/63" # Base 0A - Yellow
color04="63/9e/e4" # Base 0D - Blue
color05="b8/88/e2" # Base 0E - Magenta
color06="4b/b1/a7" # Base 0C - Cyan
color07="a7/a7/a7" # Base 05 - White
color08="5f/5a/60" # Base 03 - Bright Black
color09="e5/8c/9e" # Base 12 - Bright Red
color10="a3/ca/9d" # Base 14 - Bright Green
color11="d2/cb/8a" # Base 13 - Bright Yellow
color12="8a/b6/eb" # Base 16 - Bright Blue
color13="ca/a6/e9" # Base 17 - Bright Magenta
color14="77/c5/be" # Base 15 - Bright Cyan
color15="ff/ff/ff" # Base 07 - Bright White
color16="4b/b1/a7" # Base 09
color17="b8/88/e2" # Base 0F
color18="20/20/20" # Base 01
color19="30/30/30" # Base 02
color20="50/50/50" # Base 04
color21="80/80/80" # Base 06
color_foreground="a7/a7/a7" # Base 05
color_background="19/19/19" # Base 00


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
  put_template_custom Pg a7a7a7 # foreground
  put_template_custom Ph 191919 # background
  put_template_custom Pi a7a7a7 # bold color
  put_template_custom Pj 303030 # selection color
  put_template_custom Pk a7a7a7 # selected text color
  put_template_custom Pl a7a7a7 # cursor
  put_template_custom Pm 191919 # cursor text
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

export TINTED_COLOR_00_RGB="191919"
export TINTED_COLOR_01_RGB="202020"
export TINTED_COLOR_02_RGB="303030"
export TINTED_COLOR_03_RGB="5f5a60"
export TINTED_COLOR_04_RGB="505050"
export TINTED_COLOR_05_RGB="a7a7a7"
export TINTED_COLOR_06_RGB="808080"
export TINTED_COLOR_07_RGB="ffffff"
export TINTED_COLOR_08_RGB="dc657d"
export TINTED_COLOR_09_RGB="4bb1a7"
export TINTED_COLOR_0A_RGB="c3ba63"
export TINTED_COLOR_0B_RGB="84b97c"
export TINTED_COLOR_0C_RGB="4bb1a7"
export TINTED_COLOR_0D_RGB="639ee4"
export TINTED_COLOR_0E_RGB="b888e2"
export TINTED_COLOR_0F_RGB="b888e2"
export TINTED_COLOR_10_RGB="191919"
export TINTED_COLOR_11_RGB="191919"
export TINTED_COLOR_12_RGB="e58c9e"
export TINTED_COLOR_13_RGB="d2cb8a"
export TINTED_COLOR_14_RGB="a3ca9d"
export TINTED_COLOR_15_RGB="77c5be"
export TINTED_COLOR_16_RGB="8ab6eb"
export TINTED_COLOR_17_RGB="caa6e9"

export TINTED_COLOR_BRIGHT08_RGB="e58c9e"
export TINTED_COLOR_BRIGHT09_RGB="77c5be"
export TINTED_COLOR_BRIGHT0A_RGB="d2cb8a"
export TINTED_COLOR_BRIGHT0B_RGB="a3ca9d"
export TINTED_COLOR_BRIGHT0C_RGB="77c5be"
export TINTED_COLOR_BRIGHT0D_RGB="8ab6eb"
export TINTED_COLOR_BRIGHT0E_RGB="caa6e9"
export TINTED_COLOR_BRIGHT0F_RGB="caa6e9"
