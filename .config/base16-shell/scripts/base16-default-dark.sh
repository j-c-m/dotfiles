#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Default Dark
# Scheme author: Chris Kempson (http://chriskempson.com)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-default-dark"

case "base16" in
  base16)
    export BASE16_THEME="default-dark"
    ;;
  base24)
    export BASE24_THEME="default-dark"
    ;;
  ansi8)
    export ANSI8_THEME="default-dark"
    ;;
esac

color00="18/18/18" # Base 00 - Black
color01="ab/46/42" # Base 08 - Red
color02="a1/b5/6c" # Base 0B - Green
color03="f7/ca/88" # Base 0A - Yellow
color04="7c/af/c2" # Base 0D - Blue
color05="ba/8b/af" # Base 0E - Magenta
color06="86/c1/b9" # Base 0C - Cyan
color07="d8/d8/d8" # Base 05 - White
color08="58/58/58" # Base 03 - Bright Black
color09="c6/6f/6b" # Base 12 - Bright Red
color10="b9/c8/91" # Base 14 - Bright Green
color11="f9/d7/a6" # Base 13 - Bright Yellow
color12="9d/c3/d1" # Base 16 - Bright Blue
color13="cb/a8/c3" # Base 17 - Bright Magenta
color14="a4/d1/cb" # Base 15 - Bright Cyan
color15="f8/f8/f8" # Base 07 - Bright White
color16="dc/96/56" # Base 09
color17="a1/69/46" # Base 0F
color18="28/28/28" # Base 01
color19="38/38/38" # Base 02
color20="b8/b8/b8" # Base 04
color21="e8/e8/e8" # Base 06
color_foreground="d8/d8/d8" # Base 05
color_background="18/18/18" # Base 00


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
  put_template_custom Pg d8d8d8 # foreground
  put_template_custom Ph 181818 # background
  put_template_custom Pi d8d8d8 # bold color
  put_template_custom Pj 383838 # selection color
  put_template_custom Pk d8d8d8 # selected text color
  put_template_custom Pl d8d8d8 # cursor
  put_template_custom Pm 181818 # cursor text
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
  export BASE16_00_RGB="181818"
  export BASE16_01_RGB="282828"
  export BASE16_02_RGB="383838"
  export BASE16_03_RGB="585858"
  export BASE16_04_RGB="b8b8b8"
  export BASE16_05_RGB="d8d8d8"
  export BASE16_06_RGB="e8e8e8"
  export BASE16_07_RGB="f8f8f8"
  export BASE16_08_RGB="ab4642"
  export BASE16_09_RGB="dc9656"
  export BASE16_0A_RGB="f7ca88"
  export BASE16_0B_RGB="a1b56c"
  export BASE16_0C_RGB="86c1b9"
  export BASE16_0D_RGB="7cafc2"
  export BASE16_0E_RGB="ba8baf"
  export BASE16_0F_RGB="a16946"
  export BASE16_B08_RGB="c66f6b"
  export BASE16_B09_RGB="e5b080"
  export BASE16_B0A_RGB="f9d7a6"
  export BASE16_B0B_RGB="b9c891"
  export BASE16_B0C_RGB="a4d1cb"
  export BASE16_B0D_RGB="9dc3d1"
  export BASE16_B0E_RGB="cba8c3"
  export BASE16_B0F_RGB="c08d6d"
fi
