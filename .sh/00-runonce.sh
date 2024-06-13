
# Alacrity OS X Icons
ICON_PATH=/Applications/Alacritty.app/Contents/Resources/alacritty.icns
NEW_ICON_PATH=${HOME}/.sh/alacritty.icns
if [ -f ${ICON_PATH} -a -f ${NEW_ICON_PATH} ]; then
    if ! cmp -s ${ICON_PATH} ${NEW_ICON_PATH}; then
        cp ${ICON_PATH} ${ICON_PATH}.bak
        cp ${NEW_ICON_PATH} ${ICON_PATH}
        touch /Applications/Alacritty.app
        rm ${NEW_ICON_PATH}
    fi
fi

rm ${HOME}/.sh/00-runonce.sh
