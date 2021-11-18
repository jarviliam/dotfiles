sc() {
  screencapture -x ~/Screenshots/$1
}

cd() {
    if [[ "$#" != 0 ]]; then
        builtin cd "$@";
        return
    fi
    while true; do
        local lsd=$(echo ".." && exa --classify | grep '/$' | sed 's;/$;;')
        local dir="$(printf '%s\n' "${lsd[@]}" |
            fzf --reverse --preview '
                __cd_nxt="$(echo {})";
                __cd_path="$(echo $(pwd)/${__cd_nxt} | sed "s;//;/;")";
                echo $__cd_path;
                echo;
                ls -p --color=always "${__cd_path}";
        ')"
        [[ ${#dir} != 0 ]] || return 0
        builtin cd "$dir" &> /dev/null
    done
}

# fh - repeat history
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

csjq() {
  curl -s $1 | jq
}

ghdr() {
  local filter = $1
  git branch -r --merged | grep $1 | awk -F/ '{print $2}' | fzf -m | xargs git push origin -d
}

# find all git repos, select one and CD to its parent dir
cdg() {
  local file
  local dir
  file=$(fd -H -g .git | fzf) && dir=$(dirname "$file") && cd "$dir"
}

allgit() {
  dir=$(find ~/{Work,Documents} -type d -name .git | sed 's/\/.git//' |
    fzf --cycle --preview 'tree -C {} | head -50') && cd $dir && git status
}

td() {
  local wtdir
  wtdir=$(git worktree list | fzf | awk '{print $1}')
  if [[ -n $wtdir ]]; then
    cd "$wtdir"
  fi
}
# Git Issues
ghi() {
  local item
  item=$(gh issue list | fzf | awk '{print $1}')
  gh issue view $item --web
}

reddit() {
  local filter=${2:-new}
  local json
  local url
  json=$(curl -s -A 'Reddit CLI' "https://www.reddit.com/r/$1/$filter.json?limit=10" | jq -r '.data.children| .[] | "\(.data.title)\t\(.data.permalink)"')
  url=$(echo "$json" | fzf --delimiter='\t' --with-nth=1 | cut -f2)
  if [[ -n $url ]]; then
    xdg-open "https://www.reddit.com$url"
  fi
}

colours(){
 for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

fkill() {
  local pid
  if [ "$UID" != "0" ]; then
    pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
  else
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
  fi

  if [ "x$pid" != "x" ]; then
    echo $pid | xargs kill -${1:-9}
  fi
}

# see environment variables
envs() {
  # ps eww -o command | tr ' ' '\n'
  printenv | fzf
}

# search for a package and installed if needed
pacfind() {
  paru -Sl | awk '{print $2($4=="" ? "" : " *")}' | fzf --multi --preview 'paru -Si {1}' | xargs -ro paru -S --needed
}
