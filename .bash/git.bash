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

function git_echo_prompt() {
    local GP
    if (git rev-parse --is-inside-work-tree &> /dev/null); then
        GP="${GIT_PROMPT_PREFIX}$(git_echo_ref)"
        if git_is_dirty; then
            GP+="${GIT_PROMPT_DIRTY}"
        else
            GP+="${GIT_PROMT_CLEAN}"
        fi
        GP+="${GIT_PROMPT_SUFFIX}"
        echo -e $GP
    fi
}

function git_is_dirty() {
    (git diff-index --quiet HEAD 2> /dev/null)
    if [ $? = 1 ]; then
        return 0
    else
        return 1
    fi
}

