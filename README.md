dotfiles
========

Just my dotfiles

```
function _install_dotfiles() {
    local TAR
    local FETCH
    local OPWD=$PWD

    if type -p gtar &> /dev/null; then
        TAR="gtar"
    elif type -p tar &> /dev/null; then
        TAR="tar"
    else
        echo "error: tar required."
        return 1
    fi

    TAR="${TAR} -xvzf - --no-same-owner  --no-same-permissions --strip-components 1 --exclude={README.md,LICENSE}"

    if type -p curl &> /dev/null; then
        FETCH="curl -k -L https://github.com/j-c-m/dotfiles/tarball/master"
    elif type -p wget &> /dev/null; then
        FETCH="wget https://github.com/j-c-m/dotfiles/tarball/master -O -"
    else
        echo "error: curl or wget required."
    fi

    cd $HOME
    eval "command $FETCH | command $TAR"
    cd $OPWD
    return 0
}
_install_dotfiles
```
