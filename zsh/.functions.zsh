sc() {
  screencapture -x ~/Screenshots/$1
}

csjq() {
  curl -s $1 | jq
}

# find all git repos, select one and CD to its parent dir
cdg() {
  local file
  local dir
  file=$(fd -H -g .git | fzf) && dir=$(dirname "$file") && cd "$dir"
}

agit() {
    dir=$(find ~/{Work,Documents} -type d -name .git | sed 's/\/.git//' |
        fzf --cycle --preview 'tree -C {} | head -50') && cd $dir && git status
}

# look up Git worktrees and CD to selected! This was the best idea ever - 
td() {
  local wtdir
  wtdir=$(git worktree list | fzf | awk '{print $1}')
  if [[ -n $wtdir ]]; then
    cd "$wtdir"
  fi
}

# get 12 newest or hottest posts from @subreddit & open selection in browser
# ex: > reddit neovim new
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
