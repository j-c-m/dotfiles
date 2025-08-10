#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: SAGA
# Scheme author: https://github.com/SAGAtheme/SAGA
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-saga"

case "base16" in
  base16)
    export BASE16_THEME="saga"
    ;;
  base24)
    export BASE24_THEME="saga"
    ;;
  ansi8)
    export ANSI8_THEME="saga"
    ;;
esac

color00="05/08/0a" # Base 00 - Black
color01="ff/d4/e9" # Base 08 - Red
color02="f7/dd/ff" # Base 0B - Green
color03="fb/eb/c8" # Base 0A - Yellow
color04="c9/ff/f7" # Base 0D - Blue
color05="dc/c3/f9" # Base 0E - Magenta
color06="c5/ed/c1" # Base 0C - Cyan
color07="dc/e2/f7" # Base 05 - White
color08="14/1f/27" # Base 03 - Bright Black
color09="ff/df/ef" # Base 12 - Bright Red
color10="f9/e6/ff" # Base 14 - Bright Green
color11="fc/f0/d6" # Base 13 - Bright Yellow
color12="d7/ff/f9" # Base 16 - Bright Blue
color13="e5/d2/fb" # Base 17 - Bright Magenta
color14="d4/f2/d0" # Base 15 - Bright Cyan
color15="cc/d3/fe" # Base 07 - Bright White
color16="fb/cb/ae" # Base 09
color17="f6/dd/dd" # Base 0F
color18="0a/10/14" # Base 01
color19="0f/18/1e" # Base 02
color20="19/26/30" # Base 04
color21="f8/ea/e7" # Base 06
color_foreground="dc/e2/f7" # Base 05
color_background="05/08/0a" # Base 00


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
  put_template_custom Pg dce2f7 # foreground
  put_template_custom Ph 05080a # background
  put_template_custom Pi dce2f7 # bold color
  put_template_custom Pj 0f181e # selection color
  put_template_custom Pk dce2f7 # selected text color
  put_template_custom Pl dce2f7 # cursor
  put_template_custom Pm 05080a # cursor text
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
  export BASE16_00_RGB="05080a"
  export BASE16_01_RGB="0a1014"
  export BASE16_02_RGB="0f181e"
  export BASE16_03_RGB="141f27"
  export BASE16_04_RGB="192630"
  export BASE16_05_RGB="dce2f7"
  export BASE16_06_RGB="f8eae7"
  export BASE16_07_RGB="ccd3fe"
  export BASE16_08_RGB="ffd4e9"
  export BASE16_09_RGB="fbcbae"
  export BASE16_0A_RGB="fbebc8"
  export BASE16_0B_RGB="f7ddff"
  export BASE16_0C_RGB="c5edc1"
  export BASE16_0D_RGB="c9fff7"
  export BASE16_0E_RGB="dcc3f9"
  export BASE16_0F_RGB="f6dddd"
  export BASE16_B08_RGB="ffdfef"
  export BASE16_B09_RGB="fcd8c2"
  export BASE16_B0A_RGB="fcf0d6"
  export BASE16_B0B_RGB="f9e6ff"
  export BASE16_B0C_RGB="d4f2d0"
  export BASE16_B0D_RGB="d7fff9"
  export BASE16_B0E_RGB="e5d2fb"
  export BASE16_B0F_RGB="f8e5e5"
fi
