#!/usr/bin/env bash
dir="$HOME/.config/polybar"

launch_bar() {
  # Terminate already running bar instances
  killall -q polybar

  # Wait until the processes have been shut down
  while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

  # Launch the bar
  if [[ "$style" == "hack" ]]; then
    polybar -q top -c "$dir/hack/config.ini" &
    polybar -q bottom -c "$dir/hack/config.ini" &
  else
    polybar -q main -c "$dir/$style/config.ini" &
  fi
}

if [[ "$1" == "--hack" ]]; then
  style="hack"
  launch_bar
else
  style="default"
  launch_bar
fi
