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

# Oh My ZSH plugins
plugins=(
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
alias dc="docker-compose"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
