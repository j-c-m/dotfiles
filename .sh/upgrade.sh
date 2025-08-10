VERSION=0.0.1

check_and_upgrade_dotfiles() {
    # Define local version (you should set this to your current version)
    local LOCAL_VERSION="$VERSION"  # Replace with your actual local version

    # Fetch the remote upgrade.sh file and extract the VERSION line
    REMOTE_VERSION=$(curl -s https://raw.githubusercontent.com/j-c-m/dotfiles/refs/heads/master/.sh/upgrade.sh | head -n 1 | grep -oE '[0-9]+\.[0-9]+\.[0-9]+')

    if [ -z "$REMOTE_VERSION" ]; then
        echo "Error: Could not retrieve or parse remote version."
        return 1
    fi

    # Compare versions
    if [ "$(printf '%s\n%s' "$REMOTE_VERSION" "$LOCAL_VERSION" | sort -V | tail -n 1)" = "$REMOTE_VERSION" ] && [ "$REMOTE_VERSION" != "$LOCAL_VERSION" ]; then
        echo "New version $REMOTE_VERSION available (local version: $LOCAL_VERSION). Upgrading..."
        upgrade_dotfiles
    else
        echo "No upgrade needed. Local version $LOCAL_VERSION is up to date."
    fi
}

function upgrade_dotfiles() {
    local OPWD
    OPWD=$PWD

    local TAR
    TAR=tar
    if type -p gtar &> /dev/null; then
        TAR=gtar
    fi

    echo removing base16-shell themes...
    rm -r $HOME/.config/base16-shell/scripts
    echo removing vim themes...
    rm -r $HOME/.vim/colors

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
