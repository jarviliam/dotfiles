export _JAVA_AWT_WM_NONREPARENTING=1
export CATALINA_HOME="/usr/share/tomcat7"
export DOTDIR="$HOME/dotfiles"
export ZDOTDIR="$HOME/dotfiles/zsh"
export XDG_CONFIG_HOME="$HOME/.config"

#Private Stuff
if [[ -f "$ZDOTDIR/.zshenvprivate"]]; then
    source $ZDOTDIR/.zshenvprivate
fi

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
