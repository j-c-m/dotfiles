#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Katy
# Scheme author: George Essig (https://github.com/gessig)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-katy"

case "base16" in
  base16)
    export BASE16_THEME="katy"
    ;;
  base24)
    export BASE24_THEME="katy"
    ;;
  ansi8)
    export ANSI8_THEME="katy"
    ;;
esac

color00="29/2d/3e" # Base 00 - Black
color01="6e/98/e1" # Base 08 - Red
color02="78/c0/6e" # Base 0B - Green
color03="e0/a5/57" # Base 0A - Yellow
color04="82/aa/ff" # Base 0D - Blue
color05="c7/92/ea" # Base 0E - Magenta
color06="83/b7/e5" # Base 0C - Cyan
color07="95/9d/cb" # Base 05 - White
color08="67/6e/95" # Base 03 - Bright Black
color09="92/b2/e8" # Base 12 - Bright Red
color10="9a/d0/92" # Base 14 - Bright Green
color11="e8/bc/81" # Base 13 - Bright Yellow
color12="a1/bf/ff" # Base 16 - Bright Blue
color13="d5/ad/ef" # Base 17 - Bright Magenta
color14="a2/c9/ec" # Base 15 - Bright Cyan
color15="ff/ff/ff" # Base 07 - Bright White
color16="f7/8c/6c" # Base 09
color17="ff/53/70" # Base 0F
color18="44/42/67" # Base 01
color19="5c/59/8b" # Base 02
color20="87/96/b0" # Base 04
color21="95/9d/cb" # Base 06
color_foreground="95/9d/cb" # Base 05
color_background="29/2d/3e" # Base 00


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
  put_template_custom Pg 959dcb # foreground
  put_template_custom Ph 292d3e # background
  put_template_custom Pi 959dcb # bold color
  put_template_custom Pj 5c598b # selection color
  put_template_custom Pk 959dcb # selected text color
  put_template_custom Pl 959dcb # cursor
  put_template_custom Pm 292d3e # cursor text
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
  export BASE16_00_RGB="292d3e"
  export BASE16_01_RGB="444267"
  export BASE16_02_RGB="5c598b"
  export BASE16_03_RGB="676e95"
  export BASE16_04_RGB="8796b0"
  export BASE16_05_RGB="959dcb"
  export BASE16_06_RGB="959dcb"
  export BASE16_07_RGB="ffffff"
  export BASE16_08_RGB="6e98e1"
  export BASE16_09_RGB="f78c6c"
  export BASE16_0A_RGB="e0a557"
  export BASE16_0B_RGB="78c06e"
  export BASE16_0C_RGB="83b7e5"
  export BASE16_0D_RGB="82aaff"
  export BASE16_0E_RGB="c792ea"
  export BASE16_0F_RGB="ff5370"
  export BASE16_B08_RGB="92b2e8"
  export BASE16_B09_RGB="f9a991"
  export BASE16_B0A_RGB="e8bc81"
  export BASE16_B0B_RGB="9ad092"
  export BASE16_B0C_RGB="a2c9ec"
  export BASE16_B0D_RGB="a1bfff"
  export BASE16_B0E_RGB="d5adef"
  export BASE16_B0F_RGB="ff7e94"
fi
