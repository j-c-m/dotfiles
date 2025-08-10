#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Terracotta Dark
# Scheme author: Alexander Rossell Hayes (https://github.com/rossellhayes)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-terracotta-dark"

case "base16" in
  base16)
    export BASE16_THEME="terracotta-dark"
    ;;
  base24)
    export BASE24_THEME="terracotta-dark"
    ;;
  ansi8)
    export ANSI8_THEME="terracotta-dark"
    ;;
esac

color00="24/1d/1a" # Base 00 - Black
color01="f6/99/8f" # Base 08 - Red
color02="b6/c6/8a" # Base 0B - Green
color03="ff/c3/7a" # Base 0A - Yellow
color04="b0/a4/c3" # Base 0D - Blue
color05="d8/a2/b0" # Base 0E - Magenta
color06="c0/bc/db" # Base 0C - Cyan
color07="b8/a5/9d" # Base 05 - White
color08="59/47/40" # Base 03 - Bright Black
color09="f8/b3/ab" # Base 12 - Bright Red
color10="c8/d4/a7" # Base 14 - Bright Green
color11="ff/d2/9b" # Base 13 - Bright Yellow
color12="c4/bb/d2" # Base 16 - Bright Blue
color13="e2/b9/c4" # Base 17 - Bright Magenta
color14="d0/cd/e4" # Base 15 - Bright Cyan
color15="dc/d2/ce" # Base 07 - Bright White
color16="ff/a8/88" # Base 09
color17="f1/ae/97" # Base 0F
color18="36/2b/27" # Base 01
color19="47/39/33" # Base 02
color20="a7/8e/84" # Base 04
color21="ca/bb/b5" # Base 06
color_foreground="b8/a5/9d" # Base 05
color_background="24/1d/1a" # Base 00


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
  put_template_custom Pg b8a59d # foreground
  put_template_custom Ph 241d1a # background
  put_template_custom Pi b8a59d # bold color
  put_template_custom Pj 473933 # selection color
  put_template_custom Pk b8a59d # selected text color
  put_template_custom Pl b8a59d # cursor
  put_template_custom Pm 241d1a # cursor text
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
  export BASE16_00_RGB="241d1a"
  export BASE16_01_RGB="362b27"
  export BASE16_02_RGB="473933"
  export BASE16_03_RGB="594740"
  export BASE16_04_RGB="a78e84"
  export BASE16_05_RGB="b8a59d"
  export BASE16_06_RGB="cabbb5"
  export BASE16_07_RGB="dcd2ce"
  export BASE16_08_RGB="f6998f"
  export BASE16_09_RGB="ffa888"
  export BASE16_0A_RGB="ffc37a"
  export BASE16_0B_RGB="b6c68a"
  export BASE16_0C_RGB="c0bcdb"
  export BASE16_0D_RGB="b0a4c3"
  export BASE16_0E_RGB="d8a2b0"
  export BASE16_0F_RGB="f1ae97"
  export BASE16_B08_RGB="f8b3ab"
  export BASE16_B09_RGB="ffbea6"
  export BASE16_B0A_RGB="ffd29b"
  export BASE16_B0B_RGB="c8d4a7"
  export BASE16_B0C_RGB="d0cde4"
  export BASE16_B0D_RGB="c4bbd2"
  export BASE16_B0E_RGB="e2b9c4"
  export BASE16_B0F_RGB="f5c2b1"
fi
