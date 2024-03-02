# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set custom terminal title
DISABLE_AUTO_TITLE="true"
function precmd () {
  window_title="\033]0;${PWD##*/}\007"
  echo -ne "$window_title"
}

# Set Oh My ZSH theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Disable Right prompt indentation
ZLE_RPROMPT_INDENT=0

# NVM auto use if .nvmrc file is found
export NVM_AUTO_USE=true
# Enables NVM to lazy load
# Only do lazy loading when NOT inside vscode
if [ -z "$VSCODE_PID" ]; then
    NVM_LAZY_LOAD=true ;
fi

# Enables NVM zsh completion
NVM_COMPLETION=true

# Oh My ZSH plugins
plugins=(
  zsh-nvm
  git
  docker
  zsh-syntax-highlighting
  zsh-autosuggestions
)

# Start Oh My ZSH
source $ZSH/oh-my-zsh.sh

# Aliases
alias uuid="uuidgen | tr A-F a-f"

alias hc="history -c && clear"
alias pa="php artisan"
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias sa="sail artisan"
alias django="python manage.py "
alias dcr="docker compose run --rm --service-ports"
alias dc="docker-compose"

alias chk="npm update --location=global"

alias nvm-update="nvm install 'lts/*' --reinstall-packages-from='lts/*' && nvm install-latest-npm"

alias pi="ssh pi@10.10.10.6"
alias sprintdevs="ssh -p 6543 sprintdevs@sprintdevs.com"
alias sshaws="ssh muntasir@3.109.40.231 -p 22079"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
