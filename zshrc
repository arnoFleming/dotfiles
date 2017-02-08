ZSH=$HOME/.oh-my-zsh

# You can change the theme with another one:
#   https://github.com/robbyrussell/oh-my-zsh/wiki/themes
ZSH_THEME="robbyrussell"

# Add ruby version on prompt (float right)
if [ -x "$(command -v rbenv)" ]; then RPS1='[$(ruby_prompt_info)]$EPS1'; fi

plugins=(gitfast rbenv last-working-dir common-aliases zsh-syntax-highlighting history-substring-search tmux)

# Actually load Oh-My-Zsh
source "${ZSH}/oh-my-zsh.sh"

# Rails and Ruby uses the local `bin` folder to store binstubs.
# So instead of running `bin/rails` like the doc says, just run `rails`
export PATH="./bin:${PATH}"

# Store your own aliases in the ~/.aliases file and load the here.
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# Encoding stuff for the terminal
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PATH="$HOME/bin:${PATH}"

# initialize and load benv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f /home/arno/bin/google-cloud-sdk/path.zsh.inc ]; then
  source '/home/arno/bin/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /home/arno/bin/google-cloud-sdk/completion.zsh.inc ]; then
  source '/home/arno/bin/google-cloud-sdk/completion.zsh.inc'
fi

export GOPATH=$HOME/.go
export PATH="${PATH}:$GOROOT/bin:$GOPATH/bin"

export NVM_DIR="/home/arno/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
