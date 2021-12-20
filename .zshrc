# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

# Prompt for spelling correction of commands.
setopt CORRECT

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# --------------------
# Module configuration
# --------------------

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# ------------------
# Initialize modules
# ------------------

if [[ ${ZIM_HOME}/init.zsh -ot ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  # Update static initialization script if it's outdated, before sourcing it
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# }}} End configuration added by Zim install

[ -f .zshworkio ] && source .zshworkio

# zim
 export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh
# Fixes zim prompt bug with Kitty terminal
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# vi mode
bindkey -a j backward-char
bindkey -a ö forward-char

bindkey "^P" up-line-or-search

# z-jump
. /Users/truongio/z/z.sh

# Aliases
alias gitconfig='vim  ~/.gitconfig'
alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias kittyconf='vim ~/.config/kitty/kitty.conf'
alias st='git status'
alias co='git checkout'
alias pr='git pull --rebase'
alias lg='git log'
alias rc='git rc'
alias diff='git diff'
alias uuid="python3 -c \"import uuid; print(uuid.uuid4(), end='')\" | pbcopy"
alias ssn='python3 ~/scripts/ssngenerator.py | pbcopy'
alias vimf='vim $(fzf)'
alias vim='nvim'
alias ssz='source ~/.zshrc'
alias workiorc='vim ~/.zshworkio'
alias getpods='kubectl get pods'
alias gb='gcloud --project=bynk-146312 builds list --limit=5'
alias notes='code /Users/truongio/truongdocs'

prunelocal() {
  git fetch -p && for branch in `git branch -vv | grep ': gone]' | awk '{print $1}'`; do git branch -D $branch; done
}

encryptfile() {
    openssl enc -aes-256-cbc -a -salt -in $1 -out $2.enc
}

decryptfile() {
    openssl enc -d -aes-256-cbc -a -in $1 -out $2.txt
}

redeploy() {
    kubectl scale rc $1 --replicas=0 && kubectl scale rc $1 --replicas=1
}

rescale0() {
    kubectl scale deployment $1 --replicas=0 
}

rescale1() {
    kubectl scale deployment $1 --replicas=0 && kubectl scale deployment $1 --replicas=1
}

rescale2() {
    kubectl scale deployment $1 --replicas=0 && kubectl scale deployment $1 --replicas=2
}

rescale4() {
    kubectl scale deployment $1 --replicas=0 && kubectl scale deployment $1 --replicas=4
}

depod() {
    kubectl describe pod $1 | grep Image
}

pf() {
    kubectl port-forward deployment/$1 8080
}

# fzf
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# The next line updates PATH for the Google Cloud SDK.
 if [ -f '/Users/truongio/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/truongio/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
 if [ -f '/Users/truongio/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/truongio/google-cloud-sdk/completion.zsh.inc'; fi

bindkey "^X^_" redo

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fpath+=${ZDOTDIR:-~}/.zsh_functions

# Auto suggestion
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept
bindkey '^F' autosuggest-accept


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH="/usr/local/opt/python/libexec/bin:$PATH"

source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
PROMPT='$(kube_ps1)'$PROMPT
KUBE_PS1_NS_ENABLE=false
KUBE_PS1_CTX_COLOR='cyan'
KUBE_PS1_SYMBOL_DEFAULT=''
KUBE_PS1_SEPARATOR=''

export SBT_OPTS="-XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=4G -Xmx4G -Xms2G"
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/truongio/.sdkman"
[[ -s "/Users/truongio/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/truongio/.sdkman/bin/sdkman-init.sh"
export PATH="/usr/local/sbin:$PATH"
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
