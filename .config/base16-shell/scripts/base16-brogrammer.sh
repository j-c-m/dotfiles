#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Brogrammer
# Scheme author: Vik Ramanujam (http://github.com/piggyslasher)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-brogrammer"

case "base16" in
  base16)
    export BASE16_THEME="brogrammer"
    ;;
  base24)
    export BASE24_THEME="brogrammer"
    ;;
  ansi8)
    export ANSI8_THEME="brogrammer"
    ;;
esac

color00="1f/1f/1f" # Base 00 - Black
color01="d6/db/e5" # Base 08 - Red
color02="f3/bd/09" # Base 0B - Green
color03="1d/d3/61" # Base 0A - Yellow
color04="53/50/b9" # Base 0D - Blue
color05="0f/7d/db" # Base 0E - Magenta
color06="10/81/d6" # Base 0C - Cyan
color07="4e/5a/b7" # Base 05 - White
color08="ec/ba/0f" # Base 03 - Bright Black
color09="e0/e4/ec" # Base 12 - Bright Red
color10="f8/cf/44" # Base 14 - Bright Green
color11="4d/e7/86" # Base 13 - Bright Yellow
color12="7e/7c/cb" # Base 16 - Bright Blue
color13="3d/9f/f2" # Base 17 - Bright Magenta
color14="3c/a3/f0" # Base 15 - Bright Cyan
color15="d6/db/e5" # Base 07 - Bright White
color16="de/35/2e" # Base 09
color17="ff/ff/ff" # Base 0F
color18="f8/11/18" # Base 01
color19="2d/c5/5e" # Base 02
color20="2a/84/d2" # Base 04
color21="10/81/d6" # Base 06
color_foreground="4e/5a/b7" # Base 05
color_background="1f/1f/1f" # Base 00


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
  put_template_custom Pg 4e5ab7 # foreground
  put_template_custom Ph 1f1f1f # background
  put_template_custom Pi 4e5ab7 # bold color
  put_template_custom Pj 2dc55e # selection color
  put_template_custom Pk 4e5ab7 # selected text color
  put_template_custom Pl 4e5ab7 # cursor
  put_template_custom Pm 1f1f1f # cursor text
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
unset -f put_template
unset -f put_template_var
unset -f put_template_custom
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

if [ -n "$BASE16_SHELL_ENABLE_VARS" ]; then
  export BASE16_00_RGB="1f1f1f"
  export BASE16_01_RGB="f81118"
  export BASE16_02_RGB="2dc55e"
  export BASE16_03_RGB="ecba0f"
  export BASE16_04_RGB="2a84d2"
  export BASE16_05_RGB="4e5ab7"
  export BASE16_06_RGB="1081d6"
  export BASE16_07_RGB="d6dbe5"
  export BASE16_08_RGB="d6dbe5"
  export BASE16_09_RGB="de352e"
  export BASE16_0A_RGB="1dd361"
  export BASE16_0B_RGB="f3bd09"
  export BASE16_0C_RGB="1081d6"
  export BASE16_0D_RGB="5350b9"
  export BASE16_0E_RGB="0f7ddb"
  export BASE16_0F_RGB="ffffff"
  export BASE16_B08_RGB="e0e4ec"
  export BASE16_B09_RGB="e66762"
  export BASE16_B0A_RGB="4de786"
  export BASE16_B0B_RGB="f8cf44"
  export BASE16_B0C_RGB="3ca3f0"
  export BASE16_B0D_RGB="7e7ccb"
  export BASE16_B0E_RGB="3d9ff2"
  export BASE16_B0F_RGB="ffffff"
fi
