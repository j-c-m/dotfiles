setopt PROMPT_SUBST

if [[ $(echotc Co) == 256 ]]; then
# primary prompt (256 color)
PROMPT='[%{$FG[015]%}%D{%I:%M%p}%{$reset_color%}] %w \
[%{$FG[117]$BG[004]%}%~%{$reset_color%}]:\
%(!.%{$FG[001]%}.%{$FG[252]%})%{$BG[004]%}%n@%m%{$reset_color%}
%(!.#.$) '
else
# primary prompt (standard color)
PROMPT='[%{$fg_bold[white]%}%D{%I:%M%p}%{$reset_color%}] %w \
[%{$fg_bold[cyan]$bg[blue]%}%~%{$reset_color%}]:\
%(!.%{$fg[red]%}.%{$fg[white]%})%{$bg[blue]%}%n@%m%{$reset_color%}
%(!.#.$) '
fi

# right
RPROMPT='$(git_prompt_info)'

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[white]$bg[blue]%}branch:"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_no_bold[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"