function upgrade_dotfiles() {
    local OPWD
    OPWD=$PWD

    local TAR
    TAR=tar
    if type -p gtar &> /dev/null; then
        TAR=gtar
    fi

    cd $HOME
    if type -p curl &> /dev/null; then
        curl -k -L https://github.com/j-c-m/dotfiles/tarball/master | \
            $TAR -xvzf - --no-same-owner  --no-same-permissions \
            --strip-components 1 --exclude={README.md,LICENSE}
    elif type -p wget &> /dev/null; then
        wget https://github.com/j-c-m/dotfiles/tarball/master -O - | \
            $TAR -xvzf - --no-same-owner  --no-same-permissions \
            --strip-components 1 --exclude={README.md,LICENSE}
    else
        echo "curl or wget not found."
    fi
    cd $OPWD

    if [ -f $HOME/.sh/post_upgrade.sh ]; then
        source $HOME/.sh/post_upgrade.sh
        rm $HOME/.sh/post_upgrade.sh
    fi
}
