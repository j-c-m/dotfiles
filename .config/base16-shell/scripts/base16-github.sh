#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Github
# Scheme author: Tinted Theming (https://github.com/tinted-theming)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-github"

case "base16" in
  base16)
    export BASE16_THEME="github"
    ;;
  base24)
    export BASE24_THEME="github"
    ;;
  ansi8)
    export ANSI8_THEME="github"
    ;;
esac

color00="ea/ee/f2" # Base 00 - Black
color01="fa/45/49" # Base 08 - Red
color02="2d/a4/4e" # Base 0B - Green
color03="bf/87/00" # Base 0A - Yellow
color04="21/8b/ff" # Base 0D - Blue
color05="a4/75/f9" # Base 0E - Magenta
color06="33/9d/9b" # Base 0C - Cyan
color07="42/4a/53" # Base 05 - White
color08="8c/95/9f" # Base 03 - Bright Black
color09="eb/05/0a" # Base 12 - Bright Red
color10="19/83/37" # Base 14 - Bright Green
color11="8f/65/00" # Base 13 - Bright Yellow
color12="00/67/d8" # Base 16 - Bright Blue
color13="69/1b/f8" # Base 17 - Bright Magenta
color14="1d/7f/7d" # Base 15 - Bright Cyan
color15="1f/23/28" # Base 07 - Bright White
color16="e1/6f/24" # Base 09
color17="4d/2d/00" # Base 0F
color18="d0/d7/de" # Base 01
color19="af/b8/c1" # Base 02
color20="6e/77/81" # Base 04
color21="32/38/3f" # Base 06
color_foreground="42/4a/53" # Base 05
color_background="ea/ee/f2" # Base 00


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
  put_template_custom Pg 424a53 # foreground
  put_template_custom Ph eaeef2 # background
  put_template_custom Pi 424a53 # bold color
  put_template_custom Pj afb8c1 # selection color
  put_template_custom Pk 424a53 # selected text color
  put_template_custom Pl 424a53 # cursor
  put_template_custom Pm eaeef2 # cursor text
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
  export BASE16_00_RGB="eaeef2"
  export BASE16_01_RGB="d0d7de"
  export BASE16_02_RGB="afb8c1"
  export BASE16_03_RGB="8c959f"
  export BASE16_04_RGB="6e7781"
  export BASE16_05_RGB="424a53"
  export BASE16_06_RGB="32383f"
  export BASE16_07_RGB="1f2328"
  export BASE16_08_RGB="fa4549"
  export BASE16_09_RGB="e16f24"
  export BASE16_0A_RGB="bf8700"
  export BASE16_0B_RGB="2da44e"
  export BASE16_0C_RGB="339d9b"
  export BASE16_0D_RGB="218bff"
  export BASE16_0E_RGB="a475f9"
  export BASE16_0F_RGB="4d2d00"
  export BASE16_B08_RGB="eb050a"
  export BASE16_B09_RGB="b25112"
  export BASE16_B0A_RGB="8f6500"
  export BASE16_B0B_RGB="198337"
  export BASE16_B0C_RGB="1d7f7d"
  export BASE16_B0D_RGB="0067d8"
  export BASE16_B0E_RGB="691bf8"
  export BASE16_B0F_RGB="3a2200"
fi
