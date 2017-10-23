export VISUAL='vim'
export EDITOR="$VISUAL"
export PS1="\[\033[0;34m\]$ \[\e[00m\]"
export PS2="\[\033[0;34m\]> \[\e[00m\]"
export LC_ALL='en_US.UTF-8'
export CLICOLOR=1

# dev
if [ -d "$HOME/dev" ]; then
  export DEVPATH="$HOME/dev"
  alias goto='cd $DEVPATH/src && cd $(find . -type d -maxdepth 3 | sed "s|./||" | fzf || echo -) > /dev/null'
  goclone() {
    if [ -z "$1" ];  then
      echo "No repository url supplied"
    else
      git clone "https://$1.git" $DEVPATH/src/$1
    fi
  }
fi

# dotfiles
if [ -d "$HOME/.dotfiles.git" ]; then
  alias dotfiles='git --git-dir="$HOME/.dotfiles.git" --work-tree="$HOME"'
  complete -o bashdefault -o default -o nospace -F _git dotfiles
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
  export FZF_DEFAULT_COMMAND='rg --files --follow --smart-case --glob "!.git/*"'
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
  alias gopwd='export GOPATH=`pwd`'
  alias gohome='export GOPATH=$DEVPATH'
fi
