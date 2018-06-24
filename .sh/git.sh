function git_echo_ref() {
    local ref
    ref=$(command git symbolic-ref --short HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo $ref
}

function git_echo_repo() {
    local repo
    repo=$(command git remote -v | head -1 | cut -d':' -f 2 | sed 's/\.git.*$//' 2> /dev/null)
    echo $repo
}

function git_echo_dirty() {
    local STATUS
    if git_is_dirty; then
        echo "*"
    fi
}

function git_in_tree() {
    if [[ $(command git rev-parse --is-inside-work-tree 2> /dev/null) = "true" ]]; then
        return 0
    else
        return 1
    fi
}

function git_echo_prompt() {
    local GP
    if git_in_tree; then
        GP="${GIT_PROMPT_PREFIX}$(git_echo_ref)"
        if [[ $1 != "no_dirty_check" ]]; then
            if git_is_dirty; then
                GP+="${GIT_PROMPT_DIRTY}"
            else
                GP+="${GIT_PROMPT_CLEAN}"
            fi
        fi
        GP+="${GIT_PROMPT_SUFFIX}"
        echo -e $GP
    fi
}

function git_is_dirty() {
    local STATUS

    if [[ "$(command git config --get oh-my-zsh.hide-dirty)" -eq 1 ]]; then
        return 1
    fi

    STATUS=$(command git status --porcelain)

    if [[ -n $STATUS ]]; then
        return 0
    else
        return 1
    fi
}

