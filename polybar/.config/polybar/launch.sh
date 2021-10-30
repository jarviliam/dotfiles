#!/usr/bin/env bash
dir="$HOME/.config/polybar"

export DEFAULT_NETWORK_INTERFACE=$(ip route | grep '^default' | awk '{print $5}' | head -n1)
launch_bar() {
  # Terminate already running bar instances
  killall -q polybar

  # Wait until the processes have been shut down
  while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

  # Launch the bar
  if [[ "$style" == "hack" ]]; then
    polybar -q top -c "$dir/hack/config.ini" &
    polybar -q bottom -c "$dir/hack/config.ini" &
  elif [[ "$style" == "rusty" ]]; then
    polybar -c="$dir/rusty/config.ini" -q left &
    polybar -c="$dir/rusty/config.ini" -q right &
  elif [[ "$style" == "nord" ]]; then
    polybar -c $dir/nord/config.ini -q main &
    polybar -c $dir/nord/config.ini -q right &
  else
    polybar -q main -c "$dir/$style/config.ini" &
  fi
}

if [[ "$1" == "--hack" ]]; then
  style="hack"
elif [[ "$1" == "--rusty" ]]; then
  style="rusty"
elif [[ "$1" == "--nord" ]]; then
  style="nord"
else
  style="default"
fi
  launch_bar
