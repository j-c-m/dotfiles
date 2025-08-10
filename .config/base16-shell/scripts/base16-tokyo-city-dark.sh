#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Tokyo City Dark
# Scheme author: Michaël Ball
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-tokyo-city-dark"

case "base16" in
  base16)
    export BASE16_THEME="tokyo-city-dark"
    ;;
  base24)
    export BASE24_THEME="tokyo-city-dark"
    ;;
  ansi8)
    export ANSI8_THEME="tokyo-city-dark"
    ;;
esac

color00="17/1d/23" # Base 00 - Black
color01="f7/76/8e" # Base 08 - Red
color02="9e/ce/6a" # Base 0B - Green
color03="b7/c5/d3" # Base 0A - Yellow
color04="7a/a2/f7" # Base 0D - Blue
color05="bb/9a/f7" # Base 0E - Magenta
color06="89/dd/ff" # Base 0C - Cyan
color07="d8/e2/ec" # Base 05 - White
color08="52/62/70" # Base 03 - Bright Black
color09="f9/98/aa" # Base 12 - Bright Red
color10="b6/da/8f" # Base 14 - Bright Green
color11="c9/d4/de" # Base 13 - Bright Yellow
color12="9b/b9/f9" # Base 16 - Bright Blue
color13="cc/b3/f9" # Base 17 - Bright Magenta
color14="a7/e6/ff" # Base 15 - Bright Cyan
color15="fb/fb/fd" # Base 07 - Bright White
color16="ff/9e/64" # Base 09
color17="bb/9a/f7" # Base 0F
color18="1d/25/2c" # Base 01
color19="28/32/3a" # Base 02
color20="b7/c5/d3" # Base 04
color21="f6/f6/f8" # Base 06
color_foreground="d8/e2/ec" # Base 05
color_background="17/1d/23" # Base 00


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
  put_template_custom Pg d8e2ec # foreground
  put_template_custom Ph 171d23 # background
  put_template_custom Pi d8e2ec # bold color
  put_template_custom Pj 28323a # selection color
  put_template_custom Pk d8e2ec # selected text color
  put_template_custom Pl d8e2ec # cursor
  put_template_custom Pm 171d23 # cursor text
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
  export BASE16_00_RGB="171d23"
  export BASE16_01_RGB="1d252c"
  export BASE16_02_RGB="28323a"
  export BASE16_03_RGB="526270"
  export BASE16_04_RGB="b7c5d3"
  export BASE16_05_RGB="d8e2ec"
  export BASE16_06_RGB="f6f6f8"
  export BASE16_07_RGB="fbfbfd"
  export BASE16_08_RGB="f7768e"
  export BASE16_09_RGB="ff9e64"
  export BASE16_0A_RGB="b7c5d3"
  export BASE16_0B_RGB="9ece6a"
  export BASE16_0C_RGB="89ddff"
  export BASE16_0D_RGB="7aa2f7"
  export BASE16_0E_RGB="bb9af7"
  export BASE16_0F_RGB="bb9af7"
  export BASE16_B08_RGB="f998aa"
  export BASE16_B09_RGB="ffb68b"
  export BASE16_B0A_RGB="c9d4de"
  export BASE16_B0B_RGB="b6da8f"
  export BASE16_B0C_RGB="a7e6ff"
  export BASE16_B0D_RGB="9bb9f9"
  export BASE16_B0E_RGB="ccb3f9"
  export BASE16_B0F_RGB="ccb3f9"
fi
