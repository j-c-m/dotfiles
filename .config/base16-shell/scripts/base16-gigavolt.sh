#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Gigavolt
# Scheme author: Aidan Swope (http://github.com/Whillikers)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-gigavolt"

case "base16" in
  base16)
    export BASE16_THEME="gigavolt"
    ;;
  base24)
    export BASE24_THEME="gigavolt"
    ;;
  ansi8)
    export ANSI8_THEME="gigavolt"
    ;;
esac

color00="20/21/26" # Base 00 - Black
color01="ff/66/1a" # Base 08 - Red
color02="f2/e6/a9" # Base 0B - Green
color03="ff/dc/2d" # Base 0A - Yellow
color04="40/bf/ff" # Base 0D - Blue
color05="ae/94/f9" # Base 0E - Magenta
color06="fb/6a/cb" # Base 0C - Cyan
color07="e9/e7/e1" # Base 05 - White
color08="a1/d2/e6" # Base 03 - Bright Black
color09="ff/8c/53" # Base 12 - Bright Red
color10="f5/ec/be" # Base 14 - Bright Green
color11="ff/e5/62" # Base 13 - Bright Yellow
color12="70/cf/ff" # Base 16 - Bright Blue
color13="c2/af/fb" # Base 17 - Bright Magenta
color14="fc/8f/d8" # Base 15 - Bright Cyan
color15="f2/fb/ff" # Base 07 - Bright White
color16="19/f9/88" # Base 09
color17="61/87/ff" # Base 0F
color18="2d/30/3d" # Base 01
color19="5a/57/6e" # Base 02
color20="ca/d3/ff" # Base 04
color21="ef/f0/f9" # Base 06
color_foreground="e9/e7/e1" # Base 05
color_background="20/21/26" # Base 00


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
  put_template_custom Pg e9e7e1 # foreground
  put_template_custom Ph 202126 # background
  put_template_custom Pi e9e7e1 # bold color
  put_template_custom Pj 5a576e # selection color
  put_template_custom Pk e9e7e1 # selected text color
  put_template_custom Pl e9e7e1 # cursor
  put_template_custom Pm 202126 # cursor text
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
  export BASE16_00_RGB="202126"
  export BASE16_01_RGB="2d303d"
  export BASE16_02_RGB="5a576e"
  export BASE16_03_RGB="a1d2e6"
  export BASE16_04_RGB="cad3ff"
  export BASE16_05_RGB="e9e7e1"
  export BASE16_06_RGB="eff0f9"
  export BASE16_07_RGB="f2fbff"
  export BASE16_08_RGB="ff661a"
  export BASE16_09_RGB="19f988"
  export BASE16_0A_RGB="ffdc2d"
  export BASE16_0B_RGB="f2e6a9"
  export BASE16_0C_RGB="fb6acb"
  export BASE16_0D_RGB="40bfff"
  export BASE16_0E_RGB="ae94f9"
  export BASE16_0F_RGB="6187ff"
  export BASE16_B08_RGB="ff8c53"
  export BASE16_B09_RGB="53faa6"
  export BASE16_B0A_RGB="ffe562"
  export BASE16_B0B_RGB="f5ecbe"
  export BASE16_B0C_RGB="fc8fd8"
  export BASE16_B0D_RGB="70cfff"
  export BASE16_B0E_RGB="c2affb"
  export BASE16_B0F_RGB="89a5ff"
fi
