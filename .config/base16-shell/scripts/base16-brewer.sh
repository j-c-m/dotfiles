#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Brewer
# Scheme author: Timothée Poisot (http://github.com/tpoisot)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-brewer"

case "base16" in
  base16)
    export BASE16_THEME="brewer"
    ;;
  base24)
    export BASE24_THEME="brewer"
    ;;
  ansi8)
    export ANSI8_THEME="brewer"
    ;;
esac

color00="0c/0d/0e" # Base 00 - Black
color01="e3/1a/1c" # Base 08 - Red
color02="31/a3/54" # Base 0B - Green
color03="dc/a0/60" # Base 0A - Yellow
color04="31/82/bd" # Base 0D - Blue
color05="75/6b/b1" # Base 0E - Magenta
color06="80/b1/d3" # Base 0C - Cyan
color07="b7/b8/b9" # Base 05 - White
color08="73/74/75" # Base 03 - Bright Black
color09="eb/52/54" # Base 12 - Bright Red
color10="53/cb/78" # Base 14 - Bright Green
color11="e5/b8/88" # Base 13 - Bright Yellow
color12="5d/a2/d5" # Base 16 - Bright Blue
color13="98/90/c5" # Base 17 - Bright Magenta
color14="a0/c5/de" # Base 15 - Bright Cyan
color15="fc/fd/fe" # Base 07 - Bright White
color16="e6/55/0d" # Base 09
color17="b1/59/28" # Base 0F
color18="2e/2f/30" # Base 01
color19="51/52/53" # Base 02
color20="95/96/97" # Base 04
color21="da/db/dc" # Base 06
color_foreground="b7/b8/b9" # Base 05
color_background="0c/0d/0e" # Base 00


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
  put_template_custom Pg b7b8b9 # foreground
  put_template_custom Ph 0c0d0e # background
  put_template_custom Pi b7b8b9 # bold color
  put_template_custom Pj 515253 # selection color
  put_template_custom Pk b7b8b9 # selected text color
  put_template_custom Pl b7b8b9 # cursor
  put_template_custom Pm 0c0d0e # cursor text
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
  export BASE16_00_RGB="0c0d0e"
  export BASE16_01_RGB="2e2f30"
  export BASE16_02_RGB="515253"
  export BASE16_03_RGB="737475"
  export BASE16_04_RGB="959697"
  export BASE16_05_RGB="b7b8b9"
  export BASE16_06_RGB="dadbdc"
  export BASE16_07_RGB="fcfdfe"
  export BASE16_08_RGB="e31a1c"
  export BASE16_09_RGB="e6550d"
  export BASE16_0A_RGB="dca060"
  export BASE16_0B_RGB="31a354"
  export BASE16_0C_RGB="80b1d3"
  export BASE16_0D_RGB="3182bd"
  export BASE16_0E_RGB="756bb1"
  export BASE16_0F_RGB="b15928"
  export BASE16_B08_RGB="eb5254"
  export BASE16_B09_RGB="f47d41"
  export BASE16_B0A_RGB="e5b888"
  export BASE16_B0B_RGB="53cb78"
  export BASE16_B0C_RGB="a0c5de"
  export BASE16_B0D_RGB="5da2d5"
  export BASE16_B0E_RGB="9890c5"
  export BASE16_B0F_RGB="d67d4c"
fi
