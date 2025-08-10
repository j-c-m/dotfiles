#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Zenbones
# Scheme author: mcchrish
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-zenbones"

case "base16" in
  base16)
    export BASE16_THEME="zenbones"
    ;;
  base24)
    export BASE24_THEME="zenbones"
    ;;
  ansi8)
    export ANSI8_THEME="zenbones"
    ;;
esac

color00="19/19/19" # Base 00 - Black
color01="3d/38/39" # Base 08 - Red
color02="d6/8c/67" # Base 0B - Green
color03="8b/ae/68" # Base 0A - Yellow
color04="cf/86/c1" # Base 0D - Blue
color05="65/b8/c1" # Base 0E - Magenta
color06="61/ab/da" # Base 0C - Cyan
color07="b2/79/a7" # Base 05 - White
color08="b7/7e/64" # Base 03 - Bright Black
color09="70/67/69" # Base 12 - Bright Red
color10="e0/a9/8d" # Base 14 - Bright Green
color11="a8/c2/8e" # Base 13 - Bright Yellow
color12="db/a4/d1" # Base 16 - Bright Blue
color13="8c/ca/d1" # Base 17 - Bright Magenta
color14="88/c0/e3" # Base 15 - Bright Cyan
color15="bb/bb/bb" # Base 07 - Bright White
color16="e8/83/8f" # Base 09
color17="8e/8e/8e" # Base 0F
color18="de/6e/7c" # Base 01
color19="81/9b/69" # Base 02
color20="60/99/c0" # Base 04
color21="66/a5/ad" # Base 06
color_foreground="b2/79/a7" # Base 05
color_background="19/19/19" # Base 00


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
  put_template_custom Pg b279a7 # foreground
  put_template_custom Ph 191919 # background
  put_template_custom Pi b279a7 # bold color
  put_template_custom Pj 819b69 # selection color
  put_template_custom Pk b279a7 # selected text color
  put_template_custom Pl b279a7 # cursor
  put_template_custom Pm 191919 # cursor text
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
  export BASE16_00_RGB="191919"
  export BASE16_01_RGB="de6e7c"
  export BASE16_02_RGB="819b69"
  export BASE16_03_RGB="b77e64"
  export BASE16_04_RGB="6099c0"
  export BASE16_05_RGB="b279a7"
  export BASE16_06_RGB="66a5ad"
  export BASE16_07_RGB="bbbbbb"
  export BASE16_08_RGB="3d3839"
  export BASE16_09_RGB="e8838f"
  export BASE16_0A_RGB="8bae68"
  export BASE16_0B_RGB="d68c67"
  export BASE16_0C_RGB="61abda"
  export BASE16_0D_RGB="cf86c1"
  export BASE16_0E_RGB="65b8c1"
  export BASE16_0F_RGB="8e8e8e"
  export BASE16_B08_RGB="706769"
  export BASE16_B09_RGB="eea2ab"
  export BASE16_B0A_RGB="a8c28e"
  export BASE16_B0B_RGB="e0a98d"
  export BASE16_B0C_RGB="88c0e3"
  export BASE16_B0D_RGB="dba4d1"
  export BASE16_B0E_RGB="8ccad1"
  export BASE16_B0F_RGB="aaaaaa"
fi
