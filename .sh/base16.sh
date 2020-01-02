# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell"
BASE16_DEFAULT_THEME="eighties"

if [ -n "$PS1" -a -s "$BASE16_SHELL/profile_helper.sh" ]; then
    source "$BASE16_SHELL/profile_helper.sh"
fi
