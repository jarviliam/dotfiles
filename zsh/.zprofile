if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

[ "$XDG_CURRENT_DESKTOP" = "KDE" ] || [ "$XDG_CURRENT_DESKTOP" = "GNOME" ] || export QT_QPA_PLATFORMTHEME="qt5ct"
eval $(/opt/homebrew/bin/brew shellenv)
eval "$(pyenv init --path)"

# MacPorts Installer addition on 2022-01-16_at_22:35:22: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export PATH=${PATH}:`go env GOPATH`/bin

# Finished adapting your PATH environment variable for use with MacPorts.


# MacPorts Installer addition on 2022-01-16_at_22:35:22: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH="/opt/local/share/man:$MANPATH"
# Finished adapting your MANPATH environment variable for use with MacPorts.
