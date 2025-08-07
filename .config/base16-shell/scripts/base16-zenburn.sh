#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Zenburn
# Scheme author: elnawe
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-zenburn"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="zenburn"
fi

color00="38/38/38" # Base 00 - Black
color01="dc/a3/a3" # Base 08 - Red
color02="5f/7f/5f" # Base 0B - Green
color03="e0/cf/9f" # Base 0A - Yellow
color04="7c/b8/bb" # Base 0D - Blue
color05="dc/8c/c3" # Base 0E - Magenta
color06="93/e0/e3" # Base 0C - Cyan
color07="dc/dc/cc" # Base 05 - White
color08="6f/6f/6f" # Base 03 - Bright Black
color09="e5/ba/ba" # Base 12 - Bright Red
color10="83/a3/83" # Base 14 - Bright Green
color11="e8/db/b7" # Base 13 - Bright Yellow
color12="9d/ca/cc" # Base 16 - Bright Blue
color13="e5/a9/d2" # Base 17 - Bright Magenta
color14="ae/e8/ea" # Base 15 - Bright Cyan
color15="ff/ff/ff" # Base 07 - Bright White
color16="df/af/8f" # Base 09
color17="00/00/00" # Base 0F
color18="40/40/40" # Base 01
color19="60/60/60" # Base 02
color20="80/80/80" # Base 04
color21="c0/c0/c0" # Base 06
color_foreground="dc/dc/cc" # Base 05
color_background="38/38/38" # Base 00


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
  put_template_custom Pg dcdccc # foreground
  put_template_custom Ph 383838 # background
  put_template_custom Pi dcdccc # bold color
  put_template_custom Pj 606060 # selection color
  put_template_custom Pk dcdccc # selected text color
  put_template_custom Pl dcdccc # cursor
  put_template_custom Pm 383838 # cursor text
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

export TINTED_COLOR_00_RGB="383838"
export TINTED_COLOR_01_RGB="404040"
export TINTED_COLOR_02_RGB="606060"
export TINTED_COLOR_03_RGB="6f6f6f"
export TINTED_COLOR_04_RGB="808080"
export TINTED_COLOR_05_RGB="dcdccc"
export TINTED_COLOR_06_RGB="c0c0c0"
export TINTED_COLOR_07_RGB="ffffff"
export TINTED_COLOR_08_RGB="dca3a3"
export TINTED_COLOR_09_RGB="dfaf8f"
export TINTED_COLOR_0A_RGB="e0cf9f"
export TINTED_COLOR_0B_RGB="5f7f5f"
export TINTED_COLOR_0C_RGB="93e0e3"
export TINTED_COLOR_0D_RGB="7cb8bb"
export TINTED_COLOR_0E_RGB="dc8cc3"
export TINTED_COLOR_0F_RGB="000000"
export TINTED_COLOR_10_RGB="383838"
export TINTED_COLOR_11_RGB="383838"
export TINTED_COLOR_12_RGB="e5baba"
export TINTED_COLOR_13_RGB="e8dbb7"
export TINTED_COLOR_14_RGB="83a383"
export TINTED_COLOR_15_RGB="aee8ea"
export TINTED_COLOR_16_RGB="9dcacc"
export TINTED_COLOR_17_RGB="e5a9d2"

export TINTED_COLOR_BRIGHT08_RGB="e5baba"
export TINTED_COLOR_BRIGHT09_RGB="e7c3ab"
export TINTED_COLOR_BRIGHT0A_RGB="e8dbb7"
export TINTED_COLOR_BRIGHT0B_RGB="83a383"
export TINTED_COLOR_BRIGHT0C_RGB="aee8ea"
export TINTED_COLOR_BRIGHT0D_RGB="9dcacc"
export TINTED_COLOR_BRIGHT0E_RGB="e5a9d2"
export TINTED_COLOR_BRIGHT0F_RGB="404040"
