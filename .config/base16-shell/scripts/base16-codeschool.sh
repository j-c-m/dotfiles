#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Codeschool
# Scheme author: blockloop
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-codeschool"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="codeschool"
fi

color00="23/2c/31" # Base 00 - Black
color01="2a/54/91" # Base 08 - Red
color02="23/79/86" # Base 0B - Green
color03="a0/3b/1e" # Base 0A - Yellow
color04="48/4d/79" # Base 0D - Blue
color05="c5/98/20" # Base 0E - Magenta
color06="b0/2f/30" # Base 0C - Cyan
color07="9e/a7/a6" # Base 05 - White
color08="3f/49/44" # Base 03 - Bright Black
color09="43/7a/c9" # Base 12 - Bright Red
color10="35/b6/ca" # Base 14 - Bright Green
color11="d9/5a/35" # Base 13 - Bright Yellow
color12="6a/70/a6" # Base 16 - Bright Blue
color13="e2/b8/4a" # Base 17 - Bright Magenta
color14="d2/55/56" # Base 15 - Bright Cyan
color15="b5/d8/f6" # Base 07 - Bright White
color16="43/82/0d" # Base 09
color17="c9/83/44" # Base 0F
color18="1c/36/57" # Base 01
color19="2a/34/3a" # Base 02
color20="84/89/8c" # Base 04
color21="a7/cf/a3" # Base 06
color_foreground="9e/a7/a6" # Base 05
color_background="23/2c/31" # Base 00


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
  put_template_custom Pg 9ea7a6 # foreground
  put_template_custom Ph 232c31 # background
  put_template_custom Pi 9ea7a6 # bold color
  put_template_custom Pj 2a343a # selection color
  put_template_custom Pk 9ea7a6 # selected text color
  put_template_custom Pl 9ea7a6 # cursor
  put_template_custom Pm 232c31 # cursor text
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

export TINTED_COLOR_00_RGB="232c31"
export TINTED_COLOR_01_RGB="1c3657"
export TINTED_COLOR_02_RGB="2a343a"
export TINTED_COLOR_03_RGB="3f4944"
export TINTED_COLOR_04_RGB="84898c"
export TINTED_COLOR_05_RGB="9ea7a6"
export TINTED_COLOR_06_RGB="a7cfa3"
export TINTED_COLOR_07_RGB="b5d8f6"
export TINTED_COLOR_08_RGB="2a5491"
export TINTED_COLOR_09_RGB="43820d"
export TINTED_COLOR_0A_RGB="a03b1e"
export TINTED_COLOR_0B_RGB="237986"
export TINTED_COLOR_0C_RGB="b02f30"
export TINTED_COLOR_0D_RGB="484d79"
export TINTED_COLOR_0E_RGB="c59820"
export TINTED_COLOR_0F_RGB="c98344"
export TINTED_COLOR_10_RGB="232c31"
export TINTED_COLOR_11_RGB="232c31"
export TINTED_COLOR_12_RGB="437ac9"
export TINTED_COLOR_13_RGB="d95a35"
export TINTED_COLOR_14_RGB="35b6ca"
export TINTED_COLOR_15_RGB="d25556"
export TINTED_COLOR_16_RGB="6a70a6"
export TINTED_COLOR_17_RGB="e2b84a"

export TINTED_COLOR_BRIGHT08_RGB="437ac9"
export TINTED_COLOR_BRIGHT09_RGB="6ed515"
export TINTED_COLOR_BRIGHT0A_RGB="d95a35"
export TINTED_COLOR_BRIGHT0B_RGB="35b6ca"
export TINTED_COLOR_BRIGHT0C_RGB="d25556"
export TINTED_COLOR_BRIGHT0D_RGB="6a70a6"
export TINTED_COLOR_BRIGHT0E_RGB="e2b84a"
export TINTED_COLOR_BRIGHT0F_RGB="d6a273"
