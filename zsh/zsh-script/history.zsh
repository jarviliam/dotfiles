## Enable running previouos commands with '!history_number'.
setopt CSH_JUNKIE_HISTORY
setopt BANG_HIST

## After a substitution is done show the command again for verification instead of simply running it.
setopt HIST_VERIFY

## Appnd new history entries instead of overwriting the whole history file immediately after
## the entry is executed.
setopt INC_APPEND_HISTORY

## Save the time and date of a commands execution in history.
setopt EXTENDED_HISTORY

## Do not save duplicate commands in history.
setopt HIST_IGNORE_ALL_DUPS

## Allow the history mechanism to change lines as they are entered into history
## to work around clobbering.
setopt HIST_ALLOW_CLOBBER

## Remove all excess whitespace when adding entries into history.
setopt HIST_REDUCE_BLANKS

## Do not enter commands starting with a space into history.
setopt HIST_IGNORE_SPACE

## Do not store history(1) or fc(1) commands in history.
setopt HIST_NO_STORE

## Do not store function definitions in history.
setopt HIST_NO_FUNCTIONS

## Disable shell beeping.
setopt NO_HIST_BEEP

## Store up to 10,000 lines of history.
HISTSIZE=10000
SAVEHIST=10000

## Store history in 'ZHISTDIR/history'.
HISTFILE="${ZHISTDIR}"/history
