#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Ayu Light
# Scheme author: Khue Nguyen &lt;Z5483Y@gmail.com&gt;
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-ayu-light"

case "base16" in
  base16)
    export BASE16_THEME="ayu-light"
    ;;
  base24)
    export BASE24_THEME="ayu-light"
    ;;
  ansi8)
    export ANSI8_THEME="ayu-light"
    ;;
esac

color00="fa/fa/fa" # Base 00 - Black
color01="f0/71/78" # Base 08 - Red
color02="86/b3/00" # Base 0B - Green
color03="f2/ae/49" # Base 0A - Yellow
color04="36/a3/d9" # Base 0D - Blue
color05="a3/7a/cc" # Base 0E - Magenta
color06="4c/bf/99" # Base 0C - Cyan
color07="5c/67/73" # Base 05 - White
color08="ab/b0/b6" # Base 03 - Bright Black
color09="ed/1b/27" # Base 12 - Bright Red
color10="65/86/00" # Base 14 - Bright Green
color11="e0/8b/0c" # Base 13 - Bright Yellow
color12="18/80/b3" # Base 16 - Bright Blue
color13="7a/33/c2" # Base 17 - Bright Magenta
color14="28/a1/79" # Base 15 - Bright Cyan
color15="1a/1f/29" # Base 07 - Bright White
color16="fa/8d/3e" # Base 09
color17="e6/ba/7e" # Base 0F
color18="f3/f4/f5" # Base 01
color19="f8/f9/fa" # Base 02
color20="82/8c/99" # Base 04
color21="24/29/36" # Base 06
color_foreground="5c/67/73" # Base 05
color_background="fa/fa/fa" # Base 00


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
  put_template_custom Pg 5c6773 # foreground
  put_template_custom Ph fafafa # background
  put_template_custom Pi 5c6773 # bold color
  put_template_custom Pj f8f9fa # selection color
  put_template_custom Pk 5c6773 # selected text color
  put_template_custom Pl 5c6773 # cursor
  put_template_custom Pm fafafa # cursor text
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
  export BASE16_00_RGB="fafafa"
  export BASE16_01_RGB="f3f4f5"
  export BASE16_02_RGB="f8f9fa"
  export BASE16_03_RGB="abb0b6"
  export BASE16_04_RGB="828c99"
  export BASE16_05_RGB="5c6773"
  export BASE16_06_RGB="242936"
  export BASE16_07_RGB="1a1f29"
  export BASE16_08_RGB="f07178"
  export BASE16_09_RGB="fa8d3e"
  export BASE16_0A_RGB="f2ae49"
  export BASE16_0B_RGB="86b300"
  export BASE16_0C_RGB="4cbf99"
  export BASE16_0D_RGB="36a3d9"
  export BASE16_0E_RGB="a37acc"
  export BASE16_0F_RGB="e6ba7e"
  export BASE16_B08_RGB="ed1b27"
  export BASE16_B09_RGB="e66304"
  export BASE16_B0A_RGB="e08b0c"
  export BASE16_B0B_RGB="658600"
  export BASE16_B0C_RGB="28a179"
  export BASE16_B0D_RGB="1880b3"
  export BASE16_B0E_RGB="7a33c2"
  export BASE16_B0F_RGB="e1942a"
fi
