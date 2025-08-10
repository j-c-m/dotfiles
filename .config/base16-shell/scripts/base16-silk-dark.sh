#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Silk Dark
# Scheme author: Gabriel Fontes (https://github.com/Misterio77)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-silk-dark"

case "base16" in
  base16)
    export BASE16_THEME="silk-dark"
    ;;
  base24)
    export BASE24_THEME="silk-dark"
    ;;
  ansi8)
    export ANSI8_THEME="silk-dark"
    ;;
esac

color00="0e/3c/46" # Base 00 - Black
color01="fb/69/53" # Base 08 - Red
color02="73/d8/ad" # Base 0B - Green
color03="fc/e3/80" # Base 0A - Yellow
color04="46/bd/dd" # Base 0D - Blue
color05="75/6b/8a" # Base 0E - Magenta
color06="3f/b2/b9" # Base 0C - Cyan
color07="c7/db/dd" # Base 05 - White
color08="58/70/73" # Base 03 - Bright Black
color09="fc/8f/7e" # Base 12 - Bright Red
color10="96/e2/c2" # Base 14 - Bright Green
color11="fd/ea/a0" # Base 13 - Bright Yellow
color12="74/ce/e6" # Base 16 - Bright Blue
color13="97/8f/a8" # Base 17 - Bright Magenta
color14="6c/c8/cd" # Base 15 - Bright Cyan
color15="d2/fa/ff" # Base 07 - Bright White
color16="fc/ab/74" # Base 09
color17="9b/64/7b" # Base 0F
color18="1d/49/4e" # Base 01
color19="2a/50/54" # Base 02
color20="9d/c8/cd" # Base 04
color21="cb/f2/f7" # Base 06
color_foreground="c7/db/dd" # Base 05
color_background="0e/3c/46" # Base 00


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
  put_template_custom Pg c7dbdd # foreground
  put_template_custom Ph 0e3c46 # background
  put_template_custom Pi c7dbdd # bold color
  put_template_custom Pj 2a5054 # selection color
  put_template_custom Pk c7dbdd # selected text color
  put_template_custom Pl c7dbdd # cursor
  put_template_custom Pm 0e3c46 # cursor text
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
  export BASE16_00_RGB="0e3c46"
  export BASE16_01_RGB="1d494e"
  export BASE16_02_RGB="2a5054"
  export BASE16_03_RGB="587073"
  export BASE16_04_RGB="9dc8cd"
  export BASE16_05_RGB="c7dbdd"
  export BASE16_06_RGB="cbf2f7"
  export BASE16_07_RGB="d2faff"
  export BASE16_08_RGB="fb6953"
  export BASE16_09_RGB="fcab74"
  export BASE16_0A_RGB="fce380"
  export BASE16_0B_RGB="73d8ad"
  export BASE16_0C_RGB="3fb2b9"
  export BASE16_0D_RGB="46bddd"
  export BASE16_0E_RGB="756b8a"
  export BASE16_0F_RGB="9b647b"
  export BASE16_B08_RGB="fc8f7e"
  export BASE16_B09_RGB="fdc097"
  export BASE16_B0A_RGB="fdeaa0"
  export BASE16_B0B_RGB="96e2c2"
  export BASE16_B0C_RGB="6cc8cd"
  export BASE16_B0D_RGB="74cee6"
  export BASE16_B0E_RGB="978fa8"
  export BASE16_B0F_RGB="b48b9c"
fi
