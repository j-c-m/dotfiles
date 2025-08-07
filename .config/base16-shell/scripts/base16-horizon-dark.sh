#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Horizon Dark
# Scheme author: Michaël Ball (http://github.com/michael-ball/)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-horizon-dark"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="horizon-dark"
fi

color00="1c/1e/26" # Base 00 - Black
color01="e9/3c/58" # Base 08 - Red
color02="ef/af/8e" # Base 0B - Green
color03="ef/b9/93" # Base 0A - Yellow
color04="df/52/73" # Base 0D - Blue
color05="b0/72/d1" # Base 0E - Magenta
color06="24/a8/b4" # Base 0C - Cyan
color07="cb/ce/d0" # Base 05 - White
color08="6f/6f/70" # Base 03 - Bright Black
color09="ef/6d/82" # Base 12 - Bright Red
color10="f3/c3/aa" # Base 14 - Bright Green
color11="f3/cb/ae" # Base 13 - Bright Yellow
color12="e7/7d/96" # Base 16 - Bright Blue
color13="c4/95/dd" # Base 17 - Bright Magenta
color14="47/ce/da" # Base 15 - Bright Cyan
color15="e3/e6/ee" # Base 07 - Bright White
color16="e5/8d/7d" # Base 09
color17="e4/a3/82" # Base 0F
color18="23/25/30" # Base 01
color19="2e/30/3e" # Base 02
color20="9d/a0/a2" # Base 04
color21="dc/df/e4" # Base 06
color_foreground="cb/ce/d0" # Base 05
color_background="1c/1e/26" # Base 00


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
  put_template_custom Pg cbced0 # foreground
  put_template_custom Ph 1c1e26 # background
  put_template_custom Pi cbced0 # bold color
  put_template_custom Pj 2e303e # selection color
  put_template_custom Pk cbced0 # selected text color
  put_template_custom Pl cbced0 # cursor
  put_template_custom Pm 1c1e26 # cursor text
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

export TINTED_COLOR_00_RGB="1c1e26"
export TINTED_COLOR_01_RGB="232530"
export TINTED_COLOR_02_RGB="2e303e"
export TINTED_COLOR_03_RGB="6f6f70"
export TINTED_COLOR_04_RGB="9da0a2"
export TINTED_COLOR_05_RGB="cbced0"
export TINTED_COLOR_06_RGB="dcdfe4"
export TINTED_COLOR_07_RGB="e3e6ee"
export TINTED_COLOR_08_RGB="e93c58"
export TINTED_COLOR_09_RGB="e58d7d"
export TINTED_COLOR_0A_RGB="efb993"
export TINTED_COLOR_0B_RGB="efaf8e"
export TINTED_COLOR_0C_RGB="24a8b4"
export TINTED_COLOR_0D_RGB="df5273"
export TINTED_COLOR_0E_RGB="b072d1"
export TINTED_COLOR_0F_RGB="e4a382"
export TINTED_COLOR_10_RGB="1c1e26"
export TINTED_COLOR_11_RGB="1c1e26"
export TINTED_COLOR_12_RGB="ef6d82"
export TINTED_COLOR_13_RGB="f3cbae"
export TINTED_COLOR_14_RGB="f3c3aa"
export TINTED_COLOR_15_RGB="47ceda"
export TINTED_COLOR_16_RGB="e77d96"
export TINTED_COLOR_17_RGB="c495dd"

export TINTED_COLOR_BRIGHT08_RGB="ef6d82"
export TINTED_COLOR_BRIGHT09_RGB="ecaa9e"
export TINTED_COLOR_BRIGHT0A_RGB="f3cbae"
export TINTED_COLOR_BRIGHT0B_RGB="f3c3aa"
export TINTED_COLOR_BRIGHT0C_RGB="47ceda"
export TINTED_COLOR_BRIGHT0D_RGB="e77d96"
export TINTED_COLOR_BRIGHT0E_RGB="c495dd"
export TINTED_COLOR_BRIGHT0F_RGB="ebbaa1"
