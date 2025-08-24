VERSION=0.0.25

check_and_upgrade_dotfiles() {
    if [ -z "$ZSH_VERSION" ]; then
        return 0
    fi

    local LOCAL_VERSION="$VERSION"  # Replace with your actual local version
    local LAST_CHECK_FILE="$HOME/.sh/upgrade_last_check"
    local CURRENT_TIME=$(strftime %s)
    local LAST_CHECK_TIME=0
    local CHECK_INTERVAL=86400  # 1 day in seconds

    if [ -f "$LAST_CHECK_FILE" ]; then
        read LAST_CHECK_TIME < "$LAST_CHECK_FILE"
    fi

    if [ $((CURRENT_TIME - LAST_CHECK_TIME)) -lt $CHECK_INTERVAL ]; then
        return 0
    fi

    REMOTE_VERSION=$(curl -s https://raw.githubusercontent.com/j-c-m/dotfiles/refs/heads/master/.sh/upgrade.sh | head -n 1 | grep -oE '[0-9]+\.[0-9]+\.[0-9]+')

    if [ -z "$REMOTE_VERSION" ]; then
        return 0
    fi

    # Compare versions
    if [ "$(printf '%s\n%s' "$REMOTE_VERSION" "$LOCAL_VERSION" | sort -V | tail -n 1)" = "$REMOTE_VERSION" ] && [ "$REMOTE_VERSION" != "$LOCAL_VERSION" ]; then
        echo "dotfiles new version $REMOTE_VERSION available (local version: $LOCAL_VERSION). Upgrading..."
        upgrade_dotfiles &> /dev/null
    fi

    echo "$CURRENT_TIME" > "$LAST_CHECK_FILE"
}

function upgrade_dotfiles() {
    local OPWD
    OPWD=$PWD

    local TAR
    TAR=tar
    if type -p gtar &> /dev/null; then
        TAR=gtar
    fi

    echo removing theme-stache build...
    rm -r $HOME/.config/theme-stache/build
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

check_and_upgrade_dotfiles
