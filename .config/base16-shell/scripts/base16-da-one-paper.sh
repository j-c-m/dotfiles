#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Da One Paper
# Scheme author: NNB (https://github.com/NNBnh)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-da-one-paper"

case "base16" in
  base16)
    export BASE16_THEME="da-one-paper"
    ;;
  base24)
    export BASE24_THEME="da-one-paper"
    ;;
  ansi8)
    export ANSI8_THEME="da-one-paper"
    ;;
esac

color00="fa/f0/dc" # Base 00 - Black
color01="de/5d/6e" # Base 08 - Red
color02="76/a8/5d" # Base 0B - Green
color03="b3/68/4f" # Base 0A - Yellow
color04="58/90/f8" # Base 0D - Blue
color05="c1/73/d1" # Base 0E - Magenta
color06="64/b5/a7" # Base 0C - Cyan
color07="18/18/18" # Base 05 - White
color08="58/58/58" # Base 03 - Bright Black
color09="ce/1e/35" # Base 12 - Bright Red
color10="52/90/33" # Base 14 - Bright Green
color11="96/46/2c" # Base 13 - Bright Yellow
color12="08/5a/f4" # Base 16 - Bright Blue
color13="ac/2d/c6" # Base 17 - Bright Magenta
color14="33/a0/8d" # Base 15 - Bright Cyan
color15="00/00/00" # Base 07 - Bright White
color16="ff/94/70" # Base 09
color17="b3/68/4f" # Base 0F
color18="c8/c8/c8" # Base 01
color19="88/88/88" # Base 02
color20="28/28/28" # Base 04
color21="00/00/00" # Base 06
color_foreground="18/18/18" # Base 05
color_background="fa/f0/dc" # Base 00


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
  put_template_custom Pg 181818 # foreground
  put_template_custom Ph faf0dc # background
  put_template_custom Pi 181818 # bold color
  put_template_custom Pj 888888 # selection color
  put_template_custom Pk 181818 # selected text color
  put_template_custom Pl 181818 # cursor
  put_template_custom Pm faf0dc # cursor text
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
  export BASE16_00_RGB="faf0dc"
  export BASE16_01_RGB="c8c8c8"
  export BASE16_02_RGB="888888"
  export BASE16_03_RGB="585858"
  export BASE16_04_RGB="282828"
  export BASE16_05_RGB="181818"
  export BASE16_06_RGB="000000"
  export BASE16_07_RGB="000000"
  export BASE16_08_RGB="de5d6e"
  export BASE16_09_RGB="ff9470"
  export BASE16_0A_RGB="b3684f"
  export BASE16_0B_RGB="76a85d"
  export BASE16_0C_RGB="64b5a7"
  export BASE16_0D_RGB="5890f8"
  export BASE16_0E_RGB="c173d1"
  export BASE16_0F_RGB="b3684f"
  export BASE16_B08_RGB="ce1e35"
  export BASE16_B09_RGB="ff4f14"
  export BASE16_B0A_RGB="96462c"
  export BASE16_B0B_RGB="529033"
  export BASE16_B0C_RGB="33a08d"
  export BASE16_B0D_RGB="085af4"
  export BASE16_B0E_RGB="ac2dc6"
  export BASE16_B0F_RGB="96462c"
fi
