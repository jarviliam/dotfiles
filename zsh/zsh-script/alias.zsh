## Archive Utilities.
alias cpic='create_cpio_archive'
alias cpid='extract_cpio_archive'
alias gzc='create_gzip_archive'
alias gzd='extract_gzip_archive'
alias gzl='gzip -l'
alias trc='create_tar_archive'
alias trd='extract_tar_archive'
alias trl='list_tar_archive'
alias zpc='create_zip_archive'
alias uzd='extract_zip_archive'
alias uzl='list_zip_archive'
alias xzc='create_xz_archive'
alias xzd='extract_zip_archive'
alias xzl='list_xz_archive'

## Disk Usage Utilities.
alias df='df -hHP'
alias du='du -aHh'

## Editor Utilities.
alias le='ed -p ">"'
alias ve='nvim'
alias he='nvim -b'

## Encoding and Decoding Utilities.
alias e32='base32'
alias d32='base32 -d'
alias e64='base64'
alias d64='base64 -d'

## File Formatting Utilities.
alias dos2unix='dos2unix -ko'
alias unix2dos='unix2dos -ko'

## File Management Utilities.
alias cp='cp -HpRv'
alias ln='ln -sv'
alias mkdir='mkdir -pv'
alias mkfifo='mkfifo -v'
alias mv='mv -v'
alias rm='rm -Rv'
alias srm='srm -drv'
alias smem='smem -v'
alias sfill='sfill -z'
alias sswap='sswap -v'

## File Searching Utilities.
alias l='exa -F --group-directories-first --colour=always --icons'
alias ls='exa -F --group-directories-first --colour=always --icons'
alias la='exa -aF --group-directories-first --colour=always --icons'
alias ll='exa -alF --extended --group-directories-first --colour=always --icons'
alias lr='exa -alTF --extended --group-directories-first --colour=always --icons'
alias lsg='exa -F --group-directories-first --colour=always --icons --git-ignore'
alias lag='exa -aF --group-directories-first --colour=always --icons --git-ignore'
alias llg='exa -alF --extended --group-directories-first --colour=always --icons --git-ignore'
alias lrg='exa -alTF --extended --group-directories-first --colour=always --icons --git-ignore'

## Text Formatting Utilities.
alias expand='expand -t 4'

#Movement
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias -s txt=nvim
alias -s vim=nvim
alias -s zsh=nvim
alias -s zshrc=nvim
alias -s {c,h}=nvim
alias -s {js,json}=nvim
alias -s {md,MD}=nvim
alias -s {rs,toml}=nvim
alias -s {yml}=nvim

alias k='kubectl'
alias ka='kubectl apply --recursive -f'
alias kex='kubectl exec -it'
alias klo='kubectl logs -f'
alias kg='kubectl get'
alias kd='kubectl describe'
