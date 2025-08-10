#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Apathy
# Scheme author: Jannik Siebert (https://github.com/janniks)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-apathy"

case "base16" in
  base16)
    export BASE16_THEME="apathy"
    ;;
  base24)
    export BASE24_THEME="apathy"
    ;;
  ansi8)
    export ANSI8_THEME="apathy"
    ;;
esac

color00="03/1a/16" # Base 00 - Black
color01="3e/96/88" # Base 08 - Red
color02="88/3e/96" # Base 0B - Green
color03="3e/4c/96" # Base 0A - Yellow
color04="96/88/3e" # Base 0D - Blue
color05="4c/96/3e" # Base 0E - Magenta
color06="96/3e/4c" # Base 0C - Cyan
color07="81/b5/ac" # Base 05 - White
color08="2b/68/5e" # Base 03 - Bright Black
color09="61/be/af" # Base 12 - Bright Red
color10="af/61/be" # Base 14 - Bright Green
color11="61/70/be" # Base 13 - Bright Yellow
color12="be/af/61" # Base 16 - Bright Blue
color13="70/be/61" # Base 17 - Bright Magenta
color14="be/61/70" # Base 15 - Bright Cyan
color15="d2/e7/e4" # Base 07 - Bright White
color16="3e/79/96" # Base 09
color17="3e/96/5b" # Base 0F
color18="0b/34/2d" # Base 01
color19="18/4e/45" # Base 02
color20="5f/9c/92" # Base 04
color21="a7/ce/c8" # Base 06
color_foreground="81/b5/ac" # Base 05
color_background="03/1a/16" # Base 00


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
  put_template_custom Pg 81b5ac # foreground
  put_template_custom Ph 031a16 # background
  put_template_custom Pi 81b5ac # bold color
  put_template_custom Pj 184e45 # selection color
  put_template_custom Pk 81b5ac # selected text color
  put_template_custom Pl 81b5ac # cursor
  put_template_custom Pm 031a16 # cursor text
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
  export BASE16_00_RGB="031a16"
  export BASE16_01_RGB="0b342d"
  export BASE16_02_RGB="184e45"
  export BASE16_03_RGB="2b685e"
  export BASE16_04_RGB="5f9c92"
  export BASE16_05_RGB="81b5ac"
  export BASE16_06_RGB="a7cec8"
  export BASE16_07_RGB="d2e7e4"
  export BASE16_08_RGB="3e9688"
  export BASE16_09_RGB="3e7996"
  export BASE16_0A_RGB="3e4c96"
  export BASE16_0B_RGB="883e96"
  export BASE16_0C_RGB="963e4c"
  export BASE16_0D_RGB="96883e"
  export BASE16_0E_RGB="4c963e"
  export BASE16_0F_RGB="3e965b"
  export BASE16_B08_RGB="61beaf"
  export BASE16_B09_RGB="619fbe"
  export BASE16_B0A_RGB="6170be"
  export BASE16_B0B_RGB="af61be"
  export BASE16_B0C_RGB="be6170"
  export BASE16_B0D_RGB="beaf61"
  export BASE16_B0E_RGB="70be61"
  export BASE16_B0F_RGB="61be7f"
fi
