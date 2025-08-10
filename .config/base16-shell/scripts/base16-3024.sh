#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: 3024
# Scheme author: Jan T. Sott (http://github.com/idleberg)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-3024"

case "base16" in
  base16)
    export BASE16_THEME="3024"
    ;;
  base24)
    export BASE24_THEME="3024"
    ;;
  ansi8)
    export ANSI8_THEME="3024"
    ;;
esac

color00="09/03/00" # Base 00 - Black
color01="db/2d/20" # Base 08 - Red
color02="01/a2/52" # Base 0B - Green
color03="fd/ed/02" # Base 0A - Yellow
color04="01/a0/e4" # Base 0D - Blue
color05="a1/6a/94" # Base 0E - Magenta
color06="b5/e4/f4" # Base 0C - Cyan
color07="a5/a2/a2" # Base 05 - White
color08="5c/58/55" # Base 03 - Bright Black
color09="e6/60/56" # Base 12 - Bright Red
color10="02/f8/7e" # Base 14 - Bright Green
color11="fe/f2/41" # Base 13 - Bright Yellow
color12="2d/bf/fe" # Base 16 - Bright Blue
color13="b8/8f/af" # Base 17 - Bright Magenta
color14="c8/eb/f7" # Base 15 - Bright Cyan
color15="f7/f7/f7" # Base 07 - Bright White
color16="e8/bb/d0" # Base 09
color17="cd/ab/53" # Base 0F
color18="3a/34/32" # Base 01
color19="4a/45/43" # Base 02
color20="80/7d/7c" # Base 04
color21="d6/d5/d4" # Base 06
color_foreground="a5/a2/a2" # Base 05
color_background="09/03/00" # Base 00


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
  put_template_custom Pg a5a2a2 # foreground
  put_template_custom Ph 090300 # background
  put_template_custom Pi a5a2a2 # bold color
  put_template_custom Pj 4a4543 # selection color
  put_template_custom Pk a5a2a2 # selected text color
  put_template_custom Pl a5a2a2 # cursor
  put_template_custom Pm 090300 # cursor text
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
  export BASE16_00_RGB="090300"
  export BASE16_01_RGB="3a3432"
  export BASE16_02_RGB="4a4543"
  export BASE16_03_RGB="5c5855"
  export BASE16_04_RGB="807d7c"
  export BASE16_05_RGB="a5a2a2"
  export BASE16_06_RGB="d6d5d4"
  export BASE16_07_RGB="f7f7f7"
  export BASE16_08_RGB="db2d20"
  export BASE16_09_RGB="e8bbd0"
  export BASE16_0A_RGB="fded02"
  export BASE16_0B_RGB="01a252"
  export BASE16_0C_RGB="b5e4f4"
  export BASE16_0D_RGB="01a0e4"
  export BASE16_0E_RGB="a16a94"
  export BASE16_0F_RGB="cdab53"
  export BASE16_B08_RGB="e66056"
  export BASE16_B09_RGB="eeccdc"
  export BASE16_B0A_RGB="fef241"
  export BASE16_B0B_RGB="02f87e"
  export BASE16_B0C_RGB="c8ebf7"
  export BASE16_B0D_RGB="2dbffe"
  export BASE16_B0E_RGB="b88faf"
  export BASE16_B0F_RGB="dac07e"
fi
