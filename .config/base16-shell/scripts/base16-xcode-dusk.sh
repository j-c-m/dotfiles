#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: XCode Dusk
# Scheme author: Elsa Gonsiorowski (https://github.com/gonsie)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-xcode-dusk"

case "base16" in
  base16)
    export BASE16_THEME="xcode-dusk"
    ;;
  base24)
    export BASE24_THEME="xcode-dusk"
    ;;
  ansi8)
    export ANSI8_THEME="xcode-dusk"
    ;;
esac

color00="28/2b/35" # Base 00 - Black
color01="b2/18/89" # Base 08 - Red
color02="df/00/02" # Base 0B - Green
color03="43/82/88" # Base 0A - Yellow
color04="79/0e/ad" # Base 0D - Blue
color05="b2/18/89" # Base 0E - Magenta
color06="00/a0/be" # Base 0C - Cyan
color07="93/95/99" # Base 05 - White
color08="68/6a/71" # Base 03 - Bright Black
color09="e4/33/b5" # Base 12 - Bright Red
color10="ff/28/2a" # Base 14 - Bright Green
color11="65/ac/b3" # Base 13 - Bright Yellow
color12="aa/1f/ed" # Base 16 - Bright Blue
color13="e4/33/b5" # Base 17 - Bright Magenta
color14="0f/d9/ff" # Base 15 - Bright Cyan
color15="be/bf/c2" # Base 07 - Bright White
color16="78/6d/c5" # Base 09
color17="c7/7c/48" # Base 0F
color18="3d/40/48" # Base 01
color19="53/55/5d" # Base 02
color20="7e/80/86" # Base 04
color21="a9/aa/ae" # Base 06
color_foreground="93/95/99" # Base 05
color_background="28/2b/35" # Base 00


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
  put_template_custom Pg 939599 # foreground
  put_template_custom Ph 282b35 # background
  put_template_custom Pi 939599 # bold color
  put_template_custom Pj 53555d # selection color
  put_template_custom Pk 939599 # selected text color
  put_template_custom Pl 939599 # cursor
  put_template_custom Pm 282b35 # cursor text
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
  export BASE16_00_RGB="282b35"
  export BASE16_01_RGB="3d4048"
  export BASE16_02_RGB="53555d"
  export BASE16_03_RGB="686a71"
  export BASE16_04_RGB="7e8086"
  export BASE16_05_RGB="939599"
  export BASE16_06_RGB="a9aaae"
  export BASE16_07_RGB="bebfc2"
  export BASE16_08_RGB="b21889"
  export BASE16_09_RGB="786dc5"
  export BASE16_0A_RGB="438288"
  export BASE16_0B_RGB="df0002"
  export BASE16_0C_RGB="00a0be"
  export BASE16_0D_RGB="790ead"
  export BASE16_0E_RGB="b21889"
  export BASE16_0F_RGB="c77c48"
  export BASE16_B08_RGB="e433b5"
  export BASE16_B09_RGB="9a92d4"
  export BASE16_B0A_RGB="65acb3"
  export BASE16_B0B_RGB="ff282a"
  export BASE16_B0C_RGB="0fd9ff"
  export BASE16_B0D_RGB="aa1fed"
  export BASE16_B0E_RGB="e433b5"
  export BASE16_B0F_RGB="d59d76"
fi
