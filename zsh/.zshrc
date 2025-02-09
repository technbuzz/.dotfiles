export STARSHIP_CONFIG=~/.dotfiles/starship/.config/starship/starship.toml

eval "$(starship init zsh)"
export HOMEBREW_GITHUB_API_TOKEN=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

# Brings the Git autocomplete
 # . /opt/homebrew/etc/profile.d/z.sh

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

# Zsh-z jump quickly to directory
source ~/.zsh/zsh-z/zsh-z.plugin.zsh
# for zsh-z tab to work
autoload -U compinit; compinit

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# we need to fix for windows
# source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh


# # pnpm
export PNPM_HOME="/Users/sami.ullah/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "/Users/sami.ullah/.bun/_bun" ] && source "/Users/sami.ullah/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
