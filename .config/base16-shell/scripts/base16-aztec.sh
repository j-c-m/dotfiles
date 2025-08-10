#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Aztec
# Scheme author: TheNeverMan (github.com/TheNeverMan)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-aztec"

case "base16" in
  base16)
    export BASE16_THEME="aztec"
    ;;
  base24)
    export BASE24_THEME="aztec"
    ;;
  ansi8)
    export ANSI8_THEME="aztec"
    ;;
esac

color00="10/16/00" # Base 00 - Black
color01="ee/2e/00" # Base 08 - Red
color02="63/d9/32" # Base 0B - Green
color03="ee/bb/00" # Base 0A - Yellow
color04="5b/4a/9f" # Base 0D - Blue
color05="88/3e/9f" # Base 0E - Magenta
color06="3d/94/a5" # Base 0C - Cyan
color07="ff/da/51" # Base 05 - White
color08="2e/2e/05" # Base 03 - Bright Black
color09="ff/5a/33" # Base 12 - Bright Red
color10="8a/e2/65" # Base 14 - Bright Green
color11="ff/d3/33" # Base 13 - Bright Yellow
color12="80/71/bd" # Base 16 - Bright Blue
color13="ac/63/c2" # Base 17 - Bright Magenta
color14="63/b5/c6" # Base 15 - Bright Cyan
color15="ff/eb/a0" # Base 07 - Bright White
color16="ee/88/00" # Base 09
color17="a9/28/b9" # Base 0F
color18="1a/1e/01" # Base 01
color19="24/26/04" # Base 02
color20="ff/d1/29" # Base 04
color21="ff/e1/78" # Base 06
color_foreground="ff/da/51" # Base 05
color_background="10/16/00" # Base 00


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
  put_template_custom Pg ffda51 # foreground
  put_template_custom Ph 101600 # background
  put_template_custom Pi ffda51 # bold color
  put_template_custom Pj 242604 # selection color
  put_template_custom Pk ffda51 # selected text color
  put_template_custom Pl ffda51 # cursor
  put_template_custom Pm 101600 # cursor text
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
  export BASE16_00_RGB="101600"
  export BASE16_01_RGB="1a1e01"
  export BASE16_02_RGB="242604"
  export BASE16_03_RGB="2e2e05"
  export BASE16_04_RGB="ffd129"
  export BASE16_05_RGB="ffda51"
  export BASE16_06_RGB="ffe178"
  export BASE16_07_RGB="ffeba0"
  export BASE16_08_RGB="ee2e00"
  export BASE16_09_RGB="ee8800"
  export BASE16_0A_RGB="eebb00"
  export BASE16_0B_RGB="63d932"
  export BASE16_0C_RGB="3d94a5"
  export BASE16_0D_RGB="5b4a9f"
  export BASE16_0E_RGB="883e9f"
  export BASE16_0F_RGB="a928b9"
  export BASE16_B08_RGB="ff5a33"
  export BASE16_B09_RGB="ffa833"
  export BASE16_B0A_RGB="ffd333"
  export BASE16_B0B_RGB="8ae265"
  export BASE16_B0C_RGB="63b5c6"
  export BASE16_B0D_RGB="8071bd"
  export BASE16_B0E_RGB="ac63c2"
  export BASE16_B0F_RGB="ca4fd9"
fi
