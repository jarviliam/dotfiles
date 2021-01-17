# Use powerline
USE_POWERLINE="true"

#Alias
alias nvimconfig="nvim ~/.config/nvim"
alias nvimdir="cd ~/.config/nvim"
alias kittyconf="nvim ~/.config/kitty/kitty.conf"
alias docum="cd ~/Documents"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
  source ~/.zshconf
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi
