#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Da One Ocean
# Scheme author: NNB (https://github.com/NNBnh)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-da-one-ocean"

case "base16" in
  base16)
    export BASE16_THEME="da-one-ocean"
    ;;
  base24)
    export BASE24_THEME="da-one-ocean"
    ;;
  ansi8)
    export ANSI8_THEME="da-one-ocean"
    ;;
esac

color00="17/17/26" # Base 00 - Black
color01="fa/78/83" # Base 08 - Red
color02="98/c3/79" # Base 0B - Green
color03="ff/94/70" # Base 0A - Yellow
color04="6b/b8/ff" # Base 0D - Blue
color05="e7/99/ff" # Base 0E - Magenta
color06="8a/f5/ff" # Base 0C - Cyan
color07="ff/ff/ff" # Base 05 - White
color08="87/8d/96" # Base 03 - Bright Black
color09="fb/9a/a2" # Base 12 - Bright Red
color10="b2/d2/9b" # Base 14 - Bright Green
color11="ff/af/94" # Base 13 - Bright Yellow
color12="90/ca/ff" # Base 16 - Bright Blue
color13="ed/b3/ff" # Base 17 - Bright Magenta
color14="a7/f8/ff" # Base 15 - Bright Cyan
color15="ff/ff/ff" # Base 07 - Bright White
color16="ff/c3/87" # Base 09
color17="b3/68/4f" # Base 0F
color18="22/27/3d" # Base 01
color19="52/58/66" # Base 02
color20="c8/c8/c8" # Base 04
color21="ff/ff/ff" # Base 06
color_foreground="ff/ff/ff" # Base 05
color_background="17/17/26" # Base 00


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
  put_template_custom Pg ffffff # foreground
  put_template_custom Ph 171726 # background
  put_template_custom Pi ffffff # bold color
  put_template_custom Pj 525866 # selection color
  put_template_custom Pk ffffff # selected text color
  put_template_custom Pl ffffff # cursor
  put_template_custom Pm 171726 # cursor text
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
  export BASE16_00_RGB="171726"
  export BASE16_01_RGB="22273d"
  export BASE16_02_RGB="525866"
  export BASE16_03_RGB="878d96"
  export BASE16_04_RGB="c8c8c8"
  export BASE16_05_RGB="ffffff"
  export BASE16_06_RGB="ffffff"
  export BASE16_07_RGB="ffffff"
  export BASE16_08_RGB="fa7883"
  export BASE16_09_RGB="ffc387"
  export BASE16_0A_RGB="ff9470"
  export BASE16_0B_RGB="98c379"
  export BASE16_0C_RGB="8af5ff"
  export BASE16_0D_RGB="6bb8ff"
  export BASE16_0E_RGB="e799ff"
  export BASE16_0F_RGB="b3684f"
  export BASE16_B08_RGB="fb9aa2"
  export BASE16_B09_RGB="ffd2a5"
  export BASE16_B0A_RGB="ffaf94"
  export BASE16_B0B_RGB="b2d29b"
  export BASE16_B0C_RGB="a7f8ff"
  export BASE16_B0D_RGB="90caff"
  export BASE16_B0E_RGB="edb3ff"
  export BASE16_B0F_RGB="c68e7b"
fi
