sc() {
  screencapture -x ~/Screenshots/$1
}

csjq() {
  curl -s $1 | jq
}

reddit() {
  local json
  local url
  json=$(curl -s -A 'Reddit CLI' "https://www.reddit.com/r/$1/new.json?limit=10" | jq -r '.data.children| .[] | "\(.data.title)\t\(.data.permalink)"')
  url=$(echo "$json" | fzf --delimiter='\t' --with-nth=1 | cut -f2)
  if [[ -n $url ]]; then
    xdg-open "https://www.reddit.com$url"
  fi
}
