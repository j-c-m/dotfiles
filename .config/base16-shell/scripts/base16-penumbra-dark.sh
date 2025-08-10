#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Penumbra Dark
# Scheme author: Zachary Weiss (https://github.com/zacharyweiss)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-penumbra-dark"

case "base16" in
  base16)
    export BASE16_THEME="penumbra-dark"
    ;;
  base24)
    export BASE24_THEME="penumbra-dark"
    ;;
  ansi8)
    export ANSI8_THEME="penumbra-dark"
    ;;
esac

color00="24/27/2b" # Base 00 - Black
color01="ca/73/6c" # Base 08 - Red
color02="47/a4/77" # Base 0B - Green
color03="8d/97/41" # Base 0A - Yellow
color04="57/94/d0" # Base 0D - Blue
color05="94/81/cc" # Base 0E - Magenta
color06="00/a2/af" # Base 0C - Cyan
color07="be/be/be" # Base 05 - White
color08="63/63/63" # Base 03 - Bright Black
color09="d7/96/91" # Base 12 - Bright Red
color10="6f/c1/99" # Base 14 - Bright Green
color11="b2/bd/65" # Base 13 - Bright Yellow
color12="81/af/dc" # Base 16 - Bright Blue
color13="af/a1/d9" # Base 17 - Bright Magenta
color14="04/ec/ff" # Base 15 - Bright Cyan
color15="ff/fd/fb" # Base 07 - Bright White
color16="ba/82/3a" # Base 09
color17="bc/73/a4" # Base 0F
color18="30/33/38" # Base 01
color19="3e/40/44" # Base 02
color20="8f/8f/8f" # Base 04
color21="ff/f7/ed" # Base 06
color_foreground="be/be/be" # Base 05
color_background="24/27/2b" # Base 00


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
  put_template_custom Pg bebebe # foreground
  put_template_custom Ph 24272b # background
  put_template_custom Pi bebebe # bold color
  put_template_custom Pj 3e4044 # selection color
  put_template_custom Pk bebebe # selected text color
  put_template_custom Pl bebebe # cursor
  put_template_custom Pm 24272b # cursor text
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
  export BASE16_00_RGB="24272b"
  export BASE16_01_RGB="303338"
  export BASE16_02_RGB="3e4044"
  export BASE16_03_RGB="636363"
  export BASE16_04_RGB="8f8f8f"
  export BASE16_05_RGB="bebebe"
  export BASE16_06_RGB="fff7ed"
  export BASE16_07_RGB="fffdfb"
  export BASE16_08_RGB="ca736c"
  export BASE16_09_RGB="ba823a"
  export BASE16_0A_RGB="8d9741"
  export BASE16_0B_RGB="47a477"
  export BASE16_0C_RGB="00a2af"
  export BASE16_0D_RGB="5794d0"
  export BASE16_0E_RGB="9481cc"
  export BASE16_0F_RGB="bc73a4"
  export BASE16_B08_RGB="d79691"
  export BASE16_B09_RGB="d0a267"
  export BASE16_B0A_RGB="b2bd65"
  export BASE16_B0B_RGB="6fc199"
  export BASE16_B0C_RGB="04ecff"
  export BASE16_B0D_RGB="81afdc"
  export BASE16_B0E_RGB="afa1d9"
  export BASE16_B0F_RGB="cd96bb"
fi
