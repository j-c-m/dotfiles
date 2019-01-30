if [ -f "/etc/skel/.profile" ]; then
    . "/etc/skel/.profile"
elif [ -f "/usr/share/skel/dot.profile" ]; then
    . "/usr/share/skel/dot.profile"
fi
