#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Atelier Forest Light
# Scheme author: Bram de Haan (http://atelierbramdehaan.nl)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-atelier-forest-light"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="atelier-forest-light"
fi

color00="f1/ef/ee" # Base 00 - Black
color01="f2/2c/40" # Base 08 - Red
color02="7b/97/26" # Base 0B - Green
color03="c3/84/18" # Base 0A - Yellow
color04="40/7e/e7" # Base 0D - Blue
color05="66/66/ea" # Base 0E - Magenta
color06="3d/97/b8" # Base 0C - Cyan
color07="68/61/5e" # Base 05 - White
color08="9c/94/91" # Base 03 - Bright Black
color09="cd/09/1d" # Base 12 - Bright Red
color10="60/78/15" # Base 14 - Bright Green
color11="97/64/0d" # Base 13 - Bright Yellow
color12="13/57/cb" # Base 16 - Bright Blue
color13="17/17/e5" # Base 17 - Bright Magenta
color14="22/77/95" # Base 15 - Bright Cyan
color15="1b/19/18" # Base 07 - Bright White
color16="df/53/20" # Base 09
color17="c3/3f/f3" # Base 0F
color18="e6/e2/e0" # Base 01
color19="a8/a1/9f" # Base 02
color20="76/6e/6b" # Base 04
color21="2c/24/21" # Base 06
color_foreground="68/61/5e" # Base 05
color_background="f1/ef/ee" # Base 00


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
  put_template_custom Pg 68615e # foreground
  put_template_custom Ph f1efee # background
  put_template_custom Pi 68615e # bold color
  put_template_custom Pj a8a19f # selection color
  put_template_custom Pk 68615e # selected text color
  put_template_custom Pl 68615e # cursor
  put_template_custom Pm f1efee # cursor text
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

export TINTED_COLOR_00_RGB="f1efee"
export TINTED_COLOR_01_RGB="e6e2e0"
export TINTED_COLOR_02_RGB="a8a19f"
export TINTED_COLOR_03_RGB="9c9491"
export TINTED_COLOR_04_RGB="766e6b"
export TINTED_COLOR_05_RGB="68615e"
export TINTED_COLOR_06_RGB="2c2421"
export TINTED_COLOR_07_RGB="1b1918"
export TINTED_COLOR_08_RGB="f22c40"
export TINTED_COLOR_09_RGB="df5320"
export TINTED_COLOR_0A_RGB="c38418"
export TINTED_COLOR_0B_RGB="7b9726"
export TINTED_COLOR_0C_RGB="3d97b8"
export TINTED_COLOR_0D_RGB="407ee7"
export TINTED_COLOR_0E_RGB="6666ea"
export TINTED_COLOR_0F_RGB="c33ff3"
export TINTED_COLOR_10_RGB="f1efee"
export TINTED_COLOR_11_RGB="f1efee"
export TINTED_COLOR_12_RGB="cd091d"
export TINTED_COLOR_13_RGB="97640d"
export TINTED_COLOR_14_RGB="607815"
export TINTED_COLOR_15_RGB="227795"
export TINTED_COLOR_16_RGB="1357cb"
export TINTED_COLOR_17_RGB="1717e5"

export TINTED_COLOR_BRIGHT08_RGB="cd091d"
export TINTED_COLOR_BRIGHT09_RGB="ad3b12"
export TINTED_COLOR_BRIGHT0A_RGB="97640d"
export TINTED_COLOR_BRIGHT0B_RGB="607815"
export TINTED_COLOR_BRIGHT0C_RGB="227795"
export TINTED_COLOR_BRIGHT0D_RGB="1357cb"
export TINTED_COLOR_BRIGHT0E_RGB="1717e5"
export TINTED_COLOR_BRIGHT0F_RGB="a40adb"
