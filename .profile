# https://superuser.com/questions/544989/does-tmux-sort-the-path-variable
if [ -f /etc/profile ]; then
    PATH=""
    source /etc/profile
fi

export VISUAL='vim'
export EDITOR="$VISUAL"
export PS1="\[$(tput bold)\]$\[$(tput sgr0)\] \[$(tput sgr0)\]"
export PS2="\[$(tput bold)\]>\[$(tput sgr0)\] \[$(tput sgr0)\]"
export LC_ALL='en_US.UTF-8'

set_git_dir_and_git_work_tree() {
  if [ "$PWD" = "$HOME" ]; then
    GIT_DIR="$HOME/.gotfiles.git"
    export GIT_DIR
    GIT_WORK_TREE="$HOME"
    export GIT_WORK_TREE
  else
    unset GIT_DIR
    unset GIT_WORK_TREE
  fi
}

cd() {
  builtin cd "$@"
  set_git_dir_and_git_work_tree
}

# brew
if [ -x "$(command -v brew)" ]; then
  # bash specific
  if [ "$(basename "$SHELL")" = 'bash' ]; then
    # enable bash completion
    [ -f "$(brew --prefix)/etc/bash_completion" ] && . "$(brew --prefix)/etc/bash_completion"
  fi
fi

# flutter
if [ -d "$HOME/flutter" ]; then
  export PATH="$HOME/flutter/bin:$PATH"
fi

# fzf
if [ -x "$(command -v fd)" ]; then
  export FZF_DEFAULT_COMMAND='fd --type file --hidden'
elif [ -x "$(command -v rg)" ]; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden'
elif [ -x "$(command -v ag)" ]; then
  export FZF_DEFAULT_COMMAND='ag -g "" --hidden'
fi

# gem
if [ -x "$(command -v gem)" ]; then
  export PATH="$(gem env gemdir)/bin:$PATH"
fi

# golang
if [ -d "$HOME/go" ]; then
  export GOPATH="$HOME/go"
  export PATH="$HOME/go/bin:$PATH"
  alias goto='cd $GOPATH/src && cd $(find . -type d -maxdepth 3 | sed "s|./||" | fzf || echo -) > /dev/null'
fi

# rust
if [ -d "$HOME/.cargo" ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

set_git_dir_and_git_work_tree
