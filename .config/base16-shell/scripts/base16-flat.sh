#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Flat
# Scheme author: Chris Kempson (http://chriskempson.com)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-flat"

case "base16" in
  base16)
    export BASE16_THEME="flat"
    ;;
  base24)
    export BASE24_THEME="flat"
    ;;
  ansi8)
    export ANSI8_THEME="flat"
    ;;
esac

color00="2c/3e/50" # Base 00 - Black
color01="e7/4c/3c" # Base 08 - Red
color02="2e/cc/71" # Base 0B - Green
color03="f1/c4/0f" # Base 0A - Yellow
color04="34/98/db" # Base 0D - Blue
color05="9b/59/b6" # Base 0E - Magenta
color06="1a/bc/9c" # Base 0C - Cyan
color07="e0/e0/e0" # Base 05 - White
color08="95/a5/a6" # Base 03 - Bright Black
color09="ed/79/6d" # Base 12 - Bright Red
color10="60/db/94" # Base 14 - Bright Green
color11="f5/d3/4b" # Base 13 - Bright Yellow
color12="67/b2/e4" # Base 16 - Bright Blue
color13="b4/82/c8" # Base 17 - Bright Magenta
color14="3c/e4/c3" # Base 15 - Bright Cyan
color15="ec/f0/f1" # Base 07 - Bright White
color16="e6/7e/22" # Base 09
color17="be/64/3c" # Base 0F
color18="34/49/5e" # Base 01
color19="7f/8c/8d" # Base 02
color20="bd/c3/c7" # Base 04
color21="f5/f5/f5" # Base 06
color_foreground="e0/e0/e0" # Base 05
color_background="2c/3e/50" # Base 00


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
  put_template_custom Pg e0e0e0 # foreground
  put_template_custom Ph 2c3e50 # background
  put_template_custom Pi e0e0e0 # bold color
  put_template_custom Pj 7f8c8d # selection color
  put_template_custom Pk e0e0e0 # selected text color
  put_template_custom Pl e0e0e0 # cursor
  put_template_custom Pm 2c3e50 # cursor text
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
  export BASE16_00_RGB="2c3e50"
  export BASE16_01_RGB="34495e"
  export BASE16_02_RGB="7f8c8d"
  export BASE16_03_RGB="95a5a6"
  export BASE16_04_RGB="bdc3c7"
  export BASE16_05_RGB="e0e0e0"
  export BASE16_06_RGB="f5f5f5"
  export BASE16_07_RGB="ecf0f1"
  export BASE16_08_RGB="e74c3c"
  export BASE16_09_RGB="e67e22"
  export BASE16_0A_RGB="f1c40f"
  export BASE16_0B_RGB="2ecc71"
  export BASE16_0C_RGB="1abc9c"
  export BASE16_0D_RGB="3498db"
  export BASE16_0E_RGB="9b59b6"
  export BASE16_0F_RGB="be643c"
  export BASE16_B08_RGB="ed796d"
  export BASE16_B09_RGB="ec9e59"
  export BASE16_B0A_RGB="f5d34b"
  export BASE16_B0B_RGB="60db94"
  export BASE16_B0C_RGB="3ce4c3"
  export BASE16_B0D_RGB="67b2e4"
  export BASE16_B0E_RGB="b482c8"
  export BASE16_B0F_RGB="d08a6b"
fi
