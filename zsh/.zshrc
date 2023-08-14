eval "$(starship init zsh)"
export HOMEBREW_GITHUB_API_TOKEN=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

# Brings the Git autocomplete
 . /opt/homebrew/etc/profile.d/z.sh

alias gb="git branch"
alias gl="git log"
alias gs="git status"
alias gcb="git checkout -b"
alias gc="git checkout"
alias gm="git merge"
alias gr="git rebase"
alias gri="git rebase --interactive"
alias gbd="git branch --delete"
autoload -Uz compinit && compinit


# Bring ls alias
alias lsa="ls -l -a -G" #lists all the files, including hidden with dir colors

alias lg="lazygit"
alias zl="zellij"
alias zla="zellij attach"

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
