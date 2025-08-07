#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Seti UI
# Scheme author: 
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-seti"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="seti"
fi

color00="15/17/18" # Base 00 - Black
color01="cd/3f/45" # Base 08 - Red
color02="9f/ca/56" # Base 0B - Green
color03="e6/cd/69" # Base 0A - Yellow
color04="55/b5/db" # Base 0D - Blue
color05="a0/74/c4" # Base 0E - Magenta
color06="55/db/be" # Base 0C - Cyan
color07="d6/d6/d6" # Base 05 - White
color08="41/53/5b" # Base 03 - Bright Black
color09="da/6f/74" # Base 12 - Bright Red
color10="b7/d7/80" # Base 14 - Bright Green
color11="ec/da/8f" # Base 13 - Bright Yellow
color12="80/c8/e4" # Base 16 - Bright Blue
color13="b8/97/d3" # Base 17 - Bright Magenta
color14="80/e4/ce" # Base 15 - Bright Cyan
color15="ff/ff/ff" # Base 07 - Bright White
color16="db/7b/55" # Base 09
color17="8a/55/3f" # Base 0F
color18="28/2a/2b" # Base 01
color19="3b/75/8c" # Base 02
color20="43/a5/d5" # Base 04
color21="ee/ee/ee" # Base 06
color_foreground="d6/d6/d6" # Base 05
color_background="15/17/18" # Base 00


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
  put_template_custom Pg d6d6d6 # foreground
  put_template_custom Ph 151718 # background
  put_template_custom Pi d6d6d6 # bold color
  put_template_custom Pj 3b758c # selection color
  put_template_custom Pk d6d6d6 # selected text color
  put_template_custom Pl d6d6d6 # cursor
  put_template_custom Pm 151718 # cursor text
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
unset put_template
unset put_template_var
unset put_template_custom
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

export TINTED_COLOR_00_RGB="151718"
export TINTED_COLOR_01_RGB="282a2b"
export TINTED_COLOR_02_RGB="3b758c"
export TINTED_COLOR_03_RGB="41535b"
export TINTED_COLOR_04_RGB="43a5d5"
export TINTED_COLOR_05_RGB="d6d6d6"
export TINTED_COLOR_06_RGB="eeeeee"
export TINTED_COLOR_07_RGB="ffffff"
export TINTED_COLOR_08_RGB="cd3f45"
export TINTED_COLOR_09_RGB="db7b55"
export TINTED_COLOR_0A_RGB="e6cd69"
export TINTED_COLOR_0B_RGB="9fca56"
export TINTED_COLOR_0C_RGB="55dbbe"
export TINTED_COLOR_0D_RGB="55b5db"
export TINTED_COLOR_0E_RGB="a074c4"
export TINTED_COLOR_0F_RGB="8a553f"
export TINTED_COLOR_10_RGB="151718"
export TINTED_COLOR_11_RGB="151718"
export TINTED_COLOR_12_RGB="da6f74"
export TINTED_COLOR_13_RGB="ecda8f"
export TINTED_COLOR_14_RGB="b7d780"
export TINTED_COLOR_15_RGB="80e4ce"
export TINTED_COLOR_16_RGB="80c8e4"
export TINTED_COLOR_17_RGB="b897d3"

export TINTED_COLOR_BRIGHT08_RGB="da6f74"
export TINTED_COLOR_BRIGHT09_RGB="e49c80"
export TINTED_COLOR_BRIGHT0A_RGB="ecda8f"
export TINTED_COLOR_BRIGHT0B_RGB="b7d780"
export TINTED_COLOR_BRIGHT0C_RGB="80e4ce"
export TINTED_COLOR_BRIGHT0D_RGB="80c8e4"
export TINTED_COLOR_BRIGHT0E_RGB="b897d3"
export TINTED_COLOR_BRIGHT0F_RGB="b67960"
