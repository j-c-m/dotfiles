#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Primer Dark
# Scheme author: Jimmy Lin
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-primer-dark"

case "base16" in
  base16)
    export BASE16_THEME="primer-dark"
    ;;
  base24)
    export BASE24_THEME="primer-dark"
    ;;
  ansi8)
    export ANSI8_THEME="primer-dark"
    ;;
esac

color00="01/04/09" # Base 00 - Black
color01="ff/7b/72" # Base 08 - Red
color02="3f/b9/50" # Base 0B - Green
color03="d2/99/22" # Base 0A - Yellow
color04="58/a6/ff" # Base 0D - Blue
color05="f7/78/ba" # Base 0E - Magenta
color06="a5/d6/ff" # Base 0C - Cyan
color07="b1/ba/c4" # Base 05 - White
color08="48/4f/58" # Base 03 - Bright Black
color09="ff/9c/95" # Base 12 - Bright Red
color10="6c/cd/7a" # Base 14 - Bright Green
color11="e3/b5/53" # Base 13 - Bright Yellow
color12="82/bc/ff" # Base 16 - Bright Blue
color13="f9/9a/cb" # Base 17 - Bright Magenta
color14="bc/e0/ff" # Base 15 - Bright Cyan
color15="f0/f6/fc" # Base 07 - Bright White
color16="f0/88/3e" # Base 09
color17="bd/56/1d" # Base 0F
color18="21/26/2d" # Base 01
color19="30/36/3d" # Base 02
color20="8b/94/9e" # Base 04
color21="c9/d1/d9" # Base 06
color_foreground="b1/ba/c4" # Base 05
color_background="01/04/09" # Base 00


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
  put_template_custom Pg b1bac4 # foreground
  put_template_custom Ph 010409 # background
  put_template_custom Pi b1bac4 # bold color
  put_template_custom Pj 30363d # selection color
  put_template_custom Pk b1bac4 # selected text color
  put_template_custom Pl b1bac4 # cursor
  put_template_custom Pm 010409 # cursor text
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
  export BASE16_00_RGB="010409"
  export BASE16_01_RGB="21262d"
  export BASE16_02_RGB="30363d"
  export BASE16_03_RGB="484f58"
  export BASE16_04_RGB="8b949e"
  export BASE16_05_RGB="b1bac4"
  export BASE16_06_RGB="c9d1d9"
  export BASE16_07_RGB="f0f6fc"
  export BASE16_08_RGB="ff7b72"
  export BASE16_09_RGB="f0883e"
  export BASE16_0A_RGB="d29922"
  export BASE16_0B_RGB="3fb950"
  export BASE16_0C_RGB="a5d6ff"
  export BASE16_0D_RGB="58a6ff"
  export BASE16_0E_RGB="f778ba"
  export BASE16_0F_RGB="bd561d"
  export BASE16_B08_RGB="ff9c95"
  export BASE16_B09_RGB="f4a66e"
  export BASE16_B0A_RGB="e3b553"
  export BASE16_B0B_RGB="6ccd7a"
  export BASE16_B0C_RGB="bce0ff"
  export BASE16_B0D_RGB="82bcff"
  export BASE16_B0E_RGB="f99acb"
  export BASE16_B0F_RGB="e27a41"
fi
