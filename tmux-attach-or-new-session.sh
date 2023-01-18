#!/bin/bash

# Original:
# https://github.com/otoyo/dotfiles/blob/master/.zsh/tmux-attach-or-new-session.sh

# Usage
#
# Prepare:
# $ source path/to/tmux-attach-or-new-session.sh
# $ alias tm=tmux-attach-or-new-session.sh
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

  tmux attach -t $session # > /dev/null 2>&1
  if [ $? -ne 0 ]; then
    tmux new -s $session
  fi
)

