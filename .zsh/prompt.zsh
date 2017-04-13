setopt PROMPT_SUBST

# primary prompt (standard color)
PROMPT='[%{$fg_bold[white]%}%D{%I:%M%p}%{$reset_color%}] %w \
[%{$fg_bold[cyan]$bg[blue]%}%~%{$reset_color%}]:\
%(!.%{$fg[red]%}.%{$fg[white]%})%{$bg[blue]%}%n@%m%{$reset_color%}
%(!.#.$) '

# right
RPROMPT='$(git_prompt_info)'

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]$bg[blue]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_no_bold[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

