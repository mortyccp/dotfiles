export VISUAL='vim'
export EDITOR="$VISUAL"
export PS1="\[\033[0;34m\]$ \[\e[00m\]"
export PS2="\[\033[0;34m\]> \[\e[00m\]"
export LC_ALL='en_US.UTF-8'
export CLICOLOR=1

# dev
if [ -d "$HOME/dev" ]; then
  DEVPATH="$HOME/dev"
  GITUSER="$(git config --global user.name)"
  DEVLOCAL="$DEVPATH/src/github.com/$GITUSER"
  alias dev='cd $DEVLOCAL'
fi

# dotfiles
if [ -d "$HOME/.dotfiles.git" ]; then
  alias dotfiles='git --git-dir="$HOME/.dotfiles.git" --work-tree="$HOME"'
fi

# exa
if [ -x "$(command -v exa)" ]; then
  alias ls=exa
  alias tree='exa --tree'
fi

# fzf
if [ -x "$(command -v rg)" ]; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --smart-case --glob "!.git/*"'
fi

# nvm
if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi

# rbenv
if [ -d "$HOME/.rbenv" ]; then
  eval "$(rbenv init -)"
fi

# rust
if [ -d "$HOME/.cargo/bin" ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

# java
if [ -x "/usr/libexec/java_home" ]; then
  JAVA_HOME="$(/usr/libexec/java_home)"
  export JAVA_HOME
fi

# android
if [ -d "$HOME/android-sdk-macosx" ]; then
  export ANDROID_HOME="$HOME/android-sdk-macosx"
  export ANDROID_SDK="$ANDROID_HOME"
  export PATH="$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools:$PATH"
fi

# golang
if [ -x "$(command -v go)" ]; then
  export GOPATH="$DEVPATH"
  export PATH="$GOPATH/bin:$PATH"
  alias gopwd='export GOPATH=$DEVPATH:${PWD%src/*}; echo "set GOPATH to $GOPATH"'
  alias gohome='export GOPATH=$DEVPATH'
fi
