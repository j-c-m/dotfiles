function upgrade_dotfiles() {
    local OPWD
    OPWD=$PWD

    cd $HOME
    if type -p curl &> /dev/null; then
        curl -L https://github.com/j-c-m/dotfiles/tarball/master | \
            tar -xvzf - --no-same-owner  --no-same-permissions \
            --strip-components 1 --exclude={README.md,LICENSE}
    elif type -p wget &> /dev/null; then
        wget https://github.com/j-c-m/dotfiles/tarball/master -O - | \
            tar -xvzf - --no-same-owner  --no-same-permissions \
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
