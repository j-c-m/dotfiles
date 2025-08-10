#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Catppuccin Macchiato
# Scheme author: https://github.com/catppuccin/catppuccin
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-catppuccin-macchiato"

case "base16" in
  base16)
    export BASE16_THEME="catppuccin-macchiato"
    ;;
  base24)
    export BASE24_THEME="catppuccin-macchiato"
    ;;
  ansi8)
    export ANSI8_THEME="catppuccin-macchiato"
    ;;
esac

color00="24/27/3a" # Base 00 - Black
color01="ed/87/96" # Base 08 - Red
color02="a6/da/95" # Base 0B - Green
color03="ee/d4/9f" # Base 0A - Yellow
color04="8a/ad/f4" # Base 0D - Blue
color05="c6/a0/f6" # Base 0E - Magenta
color06="8b/d5/ca" # Base 0C - Cyan
color07="ca/d3/f5" # Base 05 - White
color08="49/4d/64" # Base 03 - Bright Black
color09="f2/a5/b0" # Base 12 - Bright Red
color10="bc/e3/af" # Base 14 - Bright Green
color11="f2/df/b7" # Base 13 - Bright Yellow
color12="a7/c2/f7" # Base 16 - Bright Blue
color13="d4/b8/f8" # Base 17 - Bright Magenta
color14="a8/e0/d7" # Base 15 - Bright Cyan
color15="b7/bd/f8" # Base 07 - Bright White
color16="f5/a9/7f" # Base 09
color17="f0/c6/c6" # Base 0F
color18="1e/20/30" # Base 01
color19="36/3a/4f" # Base 02
color20="5b/60/78" # Base 04
color21="f4/db/d6" # Base 06
color_foreground="ca/d3/f5" # Base 05
color_background="24/27/3a" # Base 00


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
  put_template_custom Pg cad3f5 # foreground
  put_template_custom Ph 24273a # background
  put_template_custom Pi cad3f5 # bold color
  put_template_custom Pj 363a4f # selection color
  put_template_custom Pk cad3f5 # selected text color
  put_template_custom Pl cad3f5 # cursor
  put_template_custom Pm 24273a # cursor text
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
  export BASE16_00_RGB="24273a"
  export BASE16_01_RGB="1e2030"
  export BASE16_02_RGB="363a4f"
  export BASE16_03_RGB="494d64"
  export BASE16_04_RGB="5b6078"
  export BASE16_05_RGB="cad3f5"
  export BASE16_06_RGB="f4dbd6"
  export BASE16_07_RGB="b7bdf8"
  export BASE16_08_RGB="ed8796"
  export BASE16_09_RGB="f5a97f"
  export BASE16_0A_RGB="eed49f"
  export BASE16_0B_RGB="a6da95"
  export BASE16_0C_RGB="8bd5ca"
  export BASE16_0D_RGB="8aadf4"
  export BASE16_0E_RGB="c6a0f6"
  export BASE16_0F_RGB="f0c6c6"
  export BASE16_B08_RGB="f2a5b0"
  export BASE16_B09_RGB="f8bf9f"
  export BASE16_B0A_RGB="f2dfb7"
  export BASE16_B0B_RGB="bce3af"
  export BASE16_B0C_RGB="a8e0d7"
  export BASE16_B0D_RGB="a7c2f7"
  export BASE16_B0E_RGB="d4b8f8"
  export BASE16_B0F_RGB="f4d4d4"
fi
