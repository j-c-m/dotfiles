# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell"

if [ -n "$PS1" -a -s "$BASE16_SHELL/profile_helper.sh" ]; then
	[ ! -e "$HOME/.base16_theme" ] && \
		ln -s "$BASE16_SHELL/scripts/base16-eighties.sh" "$HOME/.base16_theme"
    eval "$("$BASE16_SHELL/profile_helper.sh")"
fi

