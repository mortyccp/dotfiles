export VISUAL='vim'
export EDITOR="$VISUAL"
export PS1="\[\033[0;34m\]$ \[\e[00m\]"
export PS2="\[\033[0;34m\]> \[\e[00m\]"
export LC_ALL='en_US.UTF-8'
export CLICOLOR=1

# dev
if [ -d "$HOME/dev" ]; then
  export DEVPATH="$HOME/dev"
  alias goto='cd $DEVPATH/src/$(find $DEVPATH/src -type d -depth 3 | sed "s|$DEVPATH/src/||" | fzf)'
fi

# dotfiles
if [ -d "$HOME/.dotfiles.git" ]; then
  alias dotfiles='git --git-dir="$HOME/.dotfiles.git" --work-tree="$HOME"'
fi

# brew specific
if [ -x "$(command -v brew)" ]; then
  # bash specific
  if [ "$(basename "$SHELL")" = 'bash' ]; then
    # enable bash completion
    [ -f "$(brew --prefix)/etc/bash_completion" ] && . "$(brew --prefix)/etc/bash_completion"
  fi
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
  export JAVA_HOME="$(/usr/libexec/java_home)"
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
  alias gopwd='export GOPATH=$DEVPATH:`pwd`'
  alias gohome='export GOPATH=$DEVPATH'
fi
