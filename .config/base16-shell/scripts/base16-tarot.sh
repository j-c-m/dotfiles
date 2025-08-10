#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: tarot
# Scheme author: ed (https://codeberg.org/ed)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-tarot"

case "base16" in
  base16)
    export BASE16_THEME="tarot"
    ;;
  base24)
    export BASE24_THEME="tarot"
    ;;
  ansi8)
    export ANSI8_THEME="tarot"
    ;;
esac

color00="0e/09/1d" # Base 00 - Black
color01="c5/32/53" # Base 08 - Red
color02="a6/8e/5a" # Base 0B - Green
color03="ff/65/65" # Base 0A - Yellow
color04="6e/60/80" # Base 0D - Blue
color05="a4/57/82" # Base 0E - Magenta
color06="8c/97/85" # Base 0C - Cyan
color07="aa/55/6f" # Base 05 - White
color08="74/31/6b" # Base 03 - Bright Black
color09="d7/62/7c" # Base 12 - Bright Red
color10="bc/aa/83" # Base 14 - Bright Green
color11="ff/8c/8c" # Base 13 - Bright Yellow
color12="92/84/a3" # Base 16 - Bright Blue
color13="bc/80/a1" # Base 17 - Bright Magenta
color14="a9/b1/a4" # Base 15 - Bright Cyan
color15="dc/8f/7c" # Base 07 - Bright White
color16="ea/4d/60" # Base 09
color17="98/4d/51" # Base 0F
color18="2a/15/3c" # Base 01
color19="4b/20/54" # Base 02
color20="8c/40/6f" # Base 04
color21="c4/68/6d" # Base 06
color_foreground="aa/55/6f" # Base 05
color_background="0e/09/1d" # Base 00


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
  put_template_custom Pg aa556f # foreground
  put_template_custom Ph 0e091d # background
  put_template_custom Pi aa556f # bold color
  put_template_custom Pj 4b2054 # selection color
  put_template_custom Pk aa556f # selected text color
  put_template_custom Pl aa556f # cursor
  put_template_custom Pm 0e091d # cursor text
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
  export BASE16_00_RGB="0e091d"
  export BASE16_01_RGB="2a153c"
  export BASE16_02_RGB="4b2054"
  export BASE16_03_RGB="74316b"
  export BASE16_04_RGB="8c406f"
  export BASE16_05_RGB="aa556f"
  export BASE16_06_RGB="c4686d"
  export BASE16_07_RGB="dc8f7c"
  export BASE16_08_RGB="c53253"
  export BASE16_09_RGB="ea4d60"
  export BASE16_0A_RGB="ff6565"
  export BASE16_0B_RGB="a68e5a"
  export BASE16_0C_RGB="8c9785"
  export BASE16_0D_RGB="6e6080"
  export BASE16_0E_RGB="a45782"
  export BASE16_0F_RGB="984d51"
  export BASE16_B08_RGB="d7627c"
  export BASE16_B09_RGB="ef7988"
  export BASE16_B0A_RGB="ff8c8c"
  export BASE16_B0B_RGB="bcaa83"
  export BASE16_B0C_RGB="a9b1a4"
  export BASE16_B0D_RGB="9284a3"
  export BASE16_B0E_RGB="bc80a1"
  export BASE16_B0F_RGB="b87377"
fi
