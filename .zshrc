[ -f .zshworkio ] && source .zshworkio

# zim
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh
# Fixes zim prompt bug with Kitty terminal
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# vi mode
export KEYTIMEOUT=1
bindkey -a j backward-char
bindkey -a ö forward-char

# z-jump
. /Users/truong/z/z.sh

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
alias code="code-insiders"
alias uuid="python3 -c \"import uuid; print(uuid.uuid4(), end='')\" | pbcopy"
alias ssn='python3 ~/scripts/ssngenerator.py | pbcopy'
alias vimf='vim $(fzf)'
alias ssz='source ~/.zshrc'

encryptfile() {
    openssl enc -aes-256-cbc -a -salt -in $1 -out $2.enc
}

decryptfile() {
    openssl enc -d -aes-256-cbc -a -in $1 -out $2.txt
}

redeploy() {
    kubectl scale rc $1 --replicas=0 && kubectl scale rc $1 --replicas=1
}

depod() {
    kubectl describe pod $1 | grep Image
}

# fzf
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/truong/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/truong/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/truong/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/truong/google-cloud-sdk/completion.zsh.inc'; fi

bindkey "^X^_" redo
source /Users/truong/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fpath+=${ZDOTDIR:-~}/.zsh_functions

# Auto suggestion
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept
bindkey '^F' autosuggest-accept

