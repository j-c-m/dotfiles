#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Outrun Dark
# Scheme author: Hugo Delahousse (http://github.com/hugodelahousse/)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-outrun-dark"

case "base16" in
  base16)
    export BASE16_THEME="outrun-dark"
    ;;
  base24)
    export BASE24_THEME="outrun-dark"
    ;;
  ansi8)
    export ANSI8_THEME="outrun-dark"
    ;;
esac

color00="00/00/2a" # Base 00 - Black
color01="ff/42/42" # Base 08 - Red
color02="59/f1/76" # Base 0B - Green
color03="f3/e8/77" # Base 0A - Yellow
color04="66/b0/ff" # Base 0D - Blue
color05="f1/05/96" # Base 0E - Magenta
color06="0e/f0/f0" # Base 0C - Cyan
color07="d0/d0/fa" # Base 05 - White
color08="50/50/7a" # Base 03 - Bright Black
color09="ff/71/71" # Base 12 - Bright Red
color10="82/f5/98" # Base 14 - Bright Green
color11="f6/ee/99" # Base 13 - Bright Yellow
color12="8c/c4/ff" # Base 16 - Bright Blue
color13="fb/3d/b2" # Base 17 - Bright Magenta
color14="4a/f4/f4" # Base 15 - Bright Cyan
color15="f5/f5/ff" # Base 07 - Bright White
color16="fc/8d/28" # Base 09
color17="f0/03/ef" # Base 0F
color18="20/20/4a" # Base 01
color19="30/30/5a" # Base 02
color20="b0/b0/da" # Base 04
color21="e0/e0/ff" # Base 06
color_foreground="d0/d0/fa" # Base 05
color_background="00/00/2a" # Base 00


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
  put_template_custom Pg d0d0fa # foreground
  put_template_custom Ph 00002a # background
  put_template_custom Pi d0d0fa # bold color
  put_template_custom Pj 30305a # selection color
  put_template_custom Pk d0d0fa # selected text color
  put_template_custom Pl d0d0fa # cursor
  put_template_custom Pm 00002a # cursor text
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
  export BASE16_00_RGB="00002a"
  export BASE16_01_RGB="20204a"
  export BASE16_02_RGB="30305a"
  export BASE16_03_RGB="50507a"
  export BASE16_04_RGB="b0b0da"
  export BASE16_05_RGB="d0d0fa"
  export BASE16_06_RGB="e0e0ff"
  export BASE16_07_RGB="f5f5ff"
  export BASE16_08_RGB="ff4242"
  export BASE16_09_RGB="fc8d28"
  export BASE16_0A_RGB="f3e877"
  export BASE16_0B_RGB="59f176"
  export BASE16_0C_RGB="0ef0f0"
  export BASE16_0D_RGB="66b0ff"
  export BASE16_0E_RGB="f10596"
  export BASE16_0F_RGB="f003ef"
  export BASE16_B08_RGB="ff7171"
  export BASE16_B09_RGB="fdaa5e"
  export BASE16_B0A_RGB="f6ee99"
  export BASE16_B0B_RGB="82f598"
  export BASE16_B0C_RGB="4af4f4"
  export BASE16_B0D_RGB="8cc4ff"
  export BASE16_B0E_RGB="fb3db2"
  export BASE16_B0F_RGB="fd39fc"
fi
