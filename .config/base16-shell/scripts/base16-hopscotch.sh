#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Hopscotch
# Scheme author: Jan T. Sott
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-hopscotch"

case "base16" in
  base16)
    export BASE16_THEME="hopscotch"
    ;;
  base24)
    export BASE24_THEME="hopscotch"
    ;;
  ansi8)
    export ANSI8_THEME="hopscotch"
    ;;
esac

color00="32/29/31" # Base 00 - Black
color01="dd/46/4c" # Base 08 - Red
color02="8f/c1/3e" # Base 0B - Green
color03="fd/cc/59" # Base 0A - Yellow
color04="12/90/bf" # Base 0D - Blue
color05="c8/5e/7c" # Base 0E - Magenta
color06="14/9b/93" # Base 0C - Cyan
color07="b9/b5/b8" # Base 05 - White
color08="79/73/79" # Base 03 - Bright Black
color09="e6/74/79" # Base 12 - Bright Red
color10="ab/d1/6e" # Base 14 - Bright Green
color11="fe/d9/83" # Base 13 - Bright Yellow
color12="31/b9/ec" # Base 16 - Bright Blue
color13="d6/86/9d" # Base 17 - Bright Magenta
color14="20/e2/d7" # Base 15 - Bright Cyan
color15="ff/ff/ff" # Base 07 - Bright White
color16="fd/8b/19" # Base 09
color17="b3/35/08" # Base 0F
color18="43/3b/42" # Base 01
color19="5c/54/5b" # Base 02
color20="98/94/98" # Base 04
color21="d5/d3/d5" # Base 06
color_foreground="b9/b5/b8" # Base 05
color_background="32/29/31" # Base 00


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
  put_template_custom Pg b9b5b8 # foreground
  put_template_custom Ph 322931 # background
  put_template_custom Pi b9b5b8 # bold color
  put_template_custom Pj 5c545b # selection color
  put_template_custom Pk b9b5b8 # selected text color
  put_template_custom Pl b9b5b8 # cursor
  put_template_custom Pm 322931 # cursor text
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
  export BASE16_00_RGB="322931"
  export BASE16_01_RGB="433b42"
  export BASE16_02_RGB="5c545b"
  export BASE16_03_RGB="797379"
  export BASE16_04_RGB="989498"
  export BASE16_05_RGB="b9b5b8"
  export BASE16_06_RGB="d5d3d5"
  export BASE16_07_RGB="ffffff"
  export BASE16_08_RGB="dd464c"
  export BASE16_09_RGB="fd8b19"
  export BASE16_0A_RGB="fdcc59"
  export BASE16_0B_RGB="8fc13e"
  export BASE16_0C_RGB="149b93"
  export BASE16_0D_RGB="1290bf"
  export BASE16_0E_RGB="c85e7c"
  export BASE16_0F_RGB="b33508"
  export BASE16_B08_RGB="e67479"
  export BASE16_B09_RGB="fea852"
  export BASE16_B0A_RGB="fed983"
  export BASE16_B0B_RGB="abd16e"
  export BASE16_B0C_RGB="20e2d7"
  export BASE16_B0D_RGB="31b9ec"
  export BASE16_B0E_RGB="d6869d"
  export BASE16_B0F_RGB="f55117"
fi
