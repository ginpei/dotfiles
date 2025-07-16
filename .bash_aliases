# Usage:
# if [ -f ~/.bash_aliases ]; then
#     . ~/.bash_aliases
# fi

# General
alias tm="tmux new-session -A -s $1"
alias beep="powershell.exe '[console]::beep(261.6,700)'"
alias beep2="powershell.exe '[console]::beep(1000,700)'"

# Development
alias npms='npm start'
alias npmd='npm run dev'
alias cmz='npx git-cz'
alias npm-update-all="npx npm-check-updates -u"
alias ai="nvm exec --lts claude"
alias aic="nvm exec --lts claude --continue"
