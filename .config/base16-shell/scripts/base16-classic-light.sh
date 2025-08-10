#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Classic Light
# Scheme author: Jason Heeris (http://heeris.id.au)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-classic-light"

case "base16" in
  base16)
    export BASE16_THEME="classic-light"
    ;;
  base24)
    export BASE24_THEME="classic-light"
    ;;
  ansi8)
    export ANSI8_THEME="classic-light"
    ;;
esac

color00="f5/f5/f5" # Base 00 - Black
color01="ac/41/42" # Base 08 - Red
color02="90/a9/59" # Base 0B - Green
color03="f4/bf/75" # Base 0A - Yellow
color04="6a/9f/b5" # Base 0D - Blue
color05="aa/75/9f" # Base 0E - Magenta
color06="75/b5/aa" # Base 0C - Cyan
color07="30/30/30" # Base 05 - White
color08="b0/b0/b0" # Base 03 - Bright Black
color09="8d/25/26" # Base 12 - Bright Red
color10="72/90/32" # Base 14 - Bright Green
color11="f2/99/1d" # Base 13 - Bright Yellow
color12="36/82/a2" # Base 16 - Bright Blue
color13="9a/3e/87" # Base 17 - Bright Magenta
color14="3b/a5/93" # Base 15 - Bright Cyan
color15="15/15/15" # Base 07 - Bright White
color16="d2/84/45" # Base 09
color17="8f/55/36" # Base 0F
color18="e0/e0/e0" # Base 01
color19="d0/d0/d0" # Base 02
color20="50/50/50" # Base 04
color21="20/20/20" # Base 06
color_foreground="30/30/30" # Base 05
color_background="f5/f5/f5" # Base 00


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
  put_template_custom Pg 303030 # foreground
  put_template_custom Ph f5f5f5 # background
  put_template_custom Pi 303030 # bold color
  put_template_custom Pj d0d0d0 # selection color
  put_template_custom Pk 303030 # selected text color
  put_template_custom Pl 303030 # cursor
  put_template_custom Pm f5f5f5 # cursor text
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
  export BASE16_00_RGB="f5f5f5"
  export BASE16_01_RGB="e0e0e0"
  export BASE16_02_RGB="d0d0d0"
  export BASE16_03_RGB="b0b0b0"
  export BASE16_04_RGB="505050"
  export BASE16_05_RGB="303030"
  export BASE16_06_RGB="202020"
  export BASE16_07_RGB="151515"
  export BASE16_08_RGB="ac4142"
  export BASE16_09_RGB="d28445"
  export BASE16_0A_RGB="f4bf75"
  export BASE16_0B_RGB="90a959"
  export BASE16_0C_RGB="75b5aa"
  export BASE16_0D_RGB="6a9fb5"
  export BASE16_0E_RGB="aa759f"
  export BASE16_0F_RGB="8f5536"
  export BASE16_B08_RGB="8d2526"
  export BASE16_B09_RGB="b3611f"
  export BASE16_B0A_RGB="f2991d"
  export BASE16_B0B_RGB="729032"
  export BASE16_B0C_RGB="3ba593"
  export BASE16_B0D_RGB="3682a2"
  export BASE16_B0E_RGB="9a3e87"
  export BASE16_B0F_RGB="753d1e"
fi
