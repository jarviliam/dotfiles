# Use powerline
USE_POWERLINE="true"

#Alias
alias nvc="nvim ~/.config/nvim"
alias nvd="cd ~/.config/nvim"
alias kittyconf="nvim ~/.config/kitty/kitty.conf"
alias doc="cd ~/Documents"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias pgstart="systemctl start postgresql.service"
alias pgend="systemctl stop postgresql.service"

#Docker - Work -
alias llogin='sed -i -e ''/localhost/d'' ~/.ssh/known_hosts; ssh root@localhost'

#Unix Alias
alias p="sudo pacman"
alias ss="sudo systemctl"
alias sss="sudo systemctl status"
alias ssu="systemctl --user"
alias ssuu="systemctl --user status"
alias pacman="sudo pacman"

#Unix
alias vim="nvim"
alias vi="nvim"
alias v="nvim"

#Try out exa

alias l="exa -l"
alias ls="exa"
alias sl="exa"
alias la="exa -la --git"
alias lt="exa -Tla --git"

#Movement
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."


# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi
