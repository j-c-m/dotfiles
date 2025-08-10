#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: UwUnicorn
# Scheme author: Fernando Marques (https://github.com/RakkiUwU) and Gabriel Fontes (https://github.com/Misterio77)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-uwunicorn"

case "base16" in
  base16)
    export BASE16_THEME="uwunicorn"
    ;;
  base24)
    export BASE24_THEME="uwunicorn"
    ;;
  ansi8)
    export ANSI8_THEME="uwunicorn"
    ;;
esac

color00="24/1b/26" # Base 00 - Black
color01="87/7b/b6" # Base 08 - Red
color02="c9/65/bf" # Base 0B - Green
color03="a8/4a/73" # Base 0A - Yellow
color04="6a/9e/b5" # Base 0D - Blue
color05="78/a3/8f" # Base 0E - Magenta
color06="9c/5f/ce" # Base 0C - Cyan
color07="ee/d5/d9" # Base 05 - White
color08="6c/3c/b2" # Base 03 - Bright Black
color09="a5/9c/c8" # Base 12 - Bright Red
color10="d7/8c/cf" # Base 14 - Bright Green
color11="c2/73/96" # Base 13 - Bright Yellow
color12="8f/b6/c8" # Base 16 - Bright Blue
color13="9a/ba/ab" # Base 17 - Bright Magenta
color14="b5/87/da" # Base 15 - Bright Cyan
color15="e4/cc/d0" # Base 07 - Bright White
color16="de/5b/44" # Base 09
color17="a3/a0/79" # Base 0F
color18="2f/2a/3f" # Base 01
color19="46/35/4a" # Base 02
color20="7e/5f/83" # Base 04
color21="d9/c2/c6" # Base 06
color_foreground="ee/d5/d9" # Base 05
color_background="24/1b/26" # Base 00


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
  put_template_custom Pg eed5d9 # foreground
  put_template_custom Ph 241b26 # background
  put_template_custom Pi eed5d9 # bold color
  put_template_custom Pj 46354a # selection color
  put_template_custom Pk eed5d9 # selected text color
  put_template_custom Pl eed5d9 # cursor
  put_template_custom Pm 241b26 # cursor text
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
  export BASE16_00_RGB="241b26"
  export BASE16_01_RGB="2f2a3f"
  export BASE16_02_RGB="46354a"
  export BASE16_03_RGB="6c3cb2"
  export BASE16_04_RGB="7e5f83"
  export BASE16_05_RGB="eed5d9"
  export BASE16_06_RGB="d9c2c6"
  export BASE16_07_RGB="e4ccd0"
  export BASE16_08_RGB="877bb6"
  export BASE16_09_RGB="de5b44"
  export BASE16_0A_RGB="a84a73"
  export BASE16_0B_RGB="c965bf"
  export BASE16_0C_RGB="9c5fce"
  export BASE16_0D_RGB="6a9eb5"
  export BASE16_0E_RGB="78a38f"
  export BASE16_0F_RGB="a3a079"
  export BASE16_B08_RGB="a59cc8"
  export BASE16_B09_RGB="e68473"
  export BASE16_B0A_RGB="c27396"
  export BASE16_B0B_RGB="d78ccf"
  export BASE16_B0C_RGB="b587da"
  export BASE16_B0D_RGB="8fb6c8"
  export BASE16_B0E_RGB="9abaab"
  export BASE16_B0F_RGB="bab89b"
fi
