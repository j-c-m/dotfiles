#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Rebecca
# Scheme author: Victor Borja (http://github.com/vic) based on Rebecca Theme (http://github.com/vic/rebecca-theme)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-rebecca"

case "base16" in
  base16)
    export BASE16_THEME="rebecca"
    ;;
  base24)
    export BASE24_THEME="rebecca"
    ;;
  ansi8)
    export ANSI8_THEME="rebecca"
    ;;
esac

color00="29/2a/44" # Base 00 - Black
color01="a0/a0/c5" # Base 08 - Red
color02="6d/fe/df" # Base 0B - Green
color03="ae/81/ff" # Base 0A - Yellow
color04="2d/e0/a7" # Base 0D - Blue
color05="7a/a5/ff" # Base 0E - Magenta
color06="8e/ae/e0" # Base 0C - Cyan
color07="f1/ef/f8" # Base 05 - White
color08="66/66/99" # Base 03 - Bright Black
color09="b8/b8/d4" # Base 12 - Bright Red
color10="91/fe/e7" # Base 14 - Bright Green
color11="c2/a1/ff" # Base 13 - Bright Yellow
color12="62/e8/bd" # Base 16 - Bright Blue
color13="9b/bc/ff" # Base 17 - Bright Magenta
color14="aa/c2/e8" # Base 15 - Bright Cyan
color15="53/49/5d" # Base 07 - Bright White
color16="ef/e4/a1" # Base 09
color17="ff/79/c6" # Base 0F
color18="66/33/99" # Base 01
color19="38/3a/62" # Base 02
color20="a0/a0/c5" # Base 04
color21="cc/cc/ff" # Base 06
color_foreground="f1/ef/f8" # Base 05
color_background="29/2a/44" # Base 00


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
  put_template_custom Pg f1eff8 # foreground
  put_template_custom Ph 292a44 # background
  put_template_custom Pi f1eff8 # bold color
  put_template_custom Pj 383a62 # selection color
  put_template_custom Pk f1eff8 # selected text color
  put_template_custom Pl f1eff8 # cursor
  put_template_custom Pm 292a44 # cursor text
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
  export BASE16_00_RGB="292a44"
  export BASE16_01_RGB="663399"
  export BASE16_02_RGB="383a62"
  export BASE16_03_RGB="666699"
  export BASE16_04_RGB="a0a0c5"
  export BASE16_05_RGB="f1eff8"
  export BASE16_06_RGB="ccccff"
  export BASE16_07_RGB="53495d"
  export BASE16_08_RGB="a0a0c5"
  export BASE16_09_RGB="efe4a1"
  export BASE16_0A_RGB="ae81ff"
  export BASE16_0B_RGB="6dfedf"
  export BASE16_0C_RGB="8eaee0"
  export BASE16_0D_RGB="2de0a7"
  export BASE16_0E_RGB="7aa5ff"
  export BASE16_0F_RGB="ff79c6"
  export BASE16_B08_RGB="b8b8d4"
  export BASE16_B09_RGB="f3ebb9"
  export BASE16_B0A_RGB="c2a1ff"
  export BASE16_B0B_RGB="91fee7"
  export BASE16_B0C_RGB="aac2e8"
  export BASE16_B0D_RGB="62e8bd"
  export BASE16_B0E_RGB="9bbcff"
  export BASE16_B0F_RGB="ff9bd4"
fi
