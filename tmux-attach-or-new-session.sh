#!/bin/bash

# Original:
# https://github.com/otoyo/dotfiles/blob/master/.zsh/tmux-attach-or-new-session.sh

# Usage
#
# Prepare:
# $ source path/to/tmux-attach-or-new-session.sh
# $ alias tm=tmux-attach-or-new-session
#
# Auto name:
# $ cd path/to/project
# $ tm
#
# Specify name:
# $ tm my-session-name

function tmux-attach-or-new-session() (
  function __tmux_session_name() {
    local name=$(basename $(pwd))
    echo ${name//\./\_}
  }

  if [ "$1" = "" ]
  then
    local session=$(__tmux_session_name)
  else
    local session=$1
  fi

  if tmux list-sessions -F "#{session_name}" 2>/dev/null | grep -q "^${session}$"; then
    tmux attach -t $session
  else
    tmux new -s $session
  fi
)
