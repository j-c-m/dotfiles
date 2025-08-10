#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Gruvbox Material Dark, Soft
# Scheme author: Mayush Kumar (https://github.com/MayushKumar), sainnhe (https://github.com/sainnhe/gruvbox-material-vscode)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-gruvbox-material-dark-soft"

case "base16" in
  base16)
    export BASE16_THEME="gruvbox-material-dark-soft"
    ;;
  base24)
    export BASE24_THEME="gruvbox-material-dark-soft"
    ;;
  ansi8)
    export ANSI8_THEME="gruvbox-material-dark-soft"
    ;;
esac

color00="32/30/2f" # Base 00 - Black
color01="ea/69/62" # Base 08 - Red
color02="a9/b6/65" # Base 0B - Green
color03="d8/a6/57" # Base 0A - Yellow
color04="7d/ae/a3" # Base 0D - Blue
color05="d3/86/9b" # Base 0E - Magenta
color06="89/b4/82" # Base 0C - Cyan
color07="dd/c7/a1" # Base 05 - White
color08="7c/6f/64" # Base 03 - Bright Black
color09="ef/8f/89" # Base 12 - Bright Red
color10="be/c8/8c" # Base 14 - Bright Green
color11="e2/bc/81" # Base 13 - Bright Yellow
color12="9d/c2/ba" # Base 16 - Bright Blue
color13="de/a4/b4" # Base 17 - Bright Magenta
color14="a7/c7/a1" # Base 15 - Bright Cyan
color15="fb/f1/c7" # Base 07 - Bright White
color16="e7/8a/4e" # Base 09
color17="bd/6f/3e" # Base 0F
color18="3c/38/36" # Base 01
color19="5a/52/4c" # Base 02
color20="bd/ae/93" # Base 04
color21="eb/db/b2" # Base 06
color_foreground="dd/c7/a1" # Base 05
color_background="32/30/2f" # Base 00


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
  put_template_custom Pg ddc7a1 # foreground
  put_template_custom Ph 32302f # background
  put_template_custom Pi ddc7a1 # bold color
  put_template_custom Pj 5a524c # selection color
  put_template_custom Pk ddc7a1 # selected text color
  put_template_custom Pl ddc7a1 # cursor
  put_template_custom Pm 32302f # cursor text
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
  export BASE16_00_RGB="32302f"
  export BASE16_01_RGB="3c3836"
  export BASE16_02_RGB="5a524c"
  export BASE16_03_RGB="7c6f64"
  export BASE16_04_RGB="bdae93"
  export BASE16_05_RGB="ddc7a1"
  export BASE16_06_RGB="ebdbb2"
  export BASE16_07_RGB="fbf1c7"
  export BASE16_08_RGB="ea6962"
  export BASE16_09_RGB="e78a4e"
  export BASE16_0A_RGB="d8a657"
  export BASE16_0B_RGB="a9b665"
  export BASE16_0C_RGB="89b482"
  export BASE16_0D_RGB="7daea3"
  export BASE16_0E_RGB="d3869b"
  export BASE16_0F_RGB="bd6f3e"
  export BASE16_B08_RGB="ef8f89"
  export BASE16_B09_RGB="eda77a"
  export BASE16_B0A_RGB="e2bc81"
  export BASE16_B0B_RGB="bec88c"
  export BASE16_B0C_RGB="a7c7a1"
  export BASE16_B0D_RGB="9dc2ba"
  export BASE16_B0E_RGB="dea4b4"
  export BASE16_B0F_RGB="cf936d"
fi
