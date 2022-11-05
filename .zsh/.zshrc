export PATH=$PATH:/Applications/Julia-1.6.app/Contents/Resources/julia/bin
export PATH=$PATH:~/dotfiles/
export PATH=/usr/local/bin:$PATH
export GOOGLE_APPLICATION_CREDENTIALS="/Users/miwanodaiki/.key/gcs.json"

export CLICOLOR=1
eval "$(pyenv init -)"
export CPATH=:/usr/local/include/eigen3

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
# fda - including hidden directories
fda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

bindkey -e
