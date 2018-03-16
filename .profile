# shellcheck source=/dev/null

export VISUAL='vim'
export EDITOR="$VISUAL"
export PS1='$ '
export PS2='> '
export LC_ALL='en_US.UTF-8'
set -o vi

# gotfiles
if [ -d "$HOME/.gotfiles.git" ]; then
  alias gotfiles='git --git-dir="$HOME/.gotfiles.git"'
  complete -o bashdefault -o default -o nospace -F _git gotfiles
fi

# brew
if [ -x "$(command -v brew)" ]; then
  # bash specific
  if [ "$(basename "$SHELL")" = 'bash' ]; then
    # enable bash completion
    [ -f "$(brew --prefix)/etc/bash_completion" ] && . "$(brew --prefix)/etc/bash_completion"
  fi
fi

# fzf
if [ -x "$(command -v fd)" ]; then
  export FZF_DEFAULT_COMMAND='fd --type file --hidden'
elif [ -x "$(command -v rg)" ]; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden'
elif [ -x "$(command -v ag)" ]; then
  export FZF_DEFAULT_COMMAND='ag -g "" --hidden'
fi

# asdf
if [ -d "$HOME/.asdf" ]; then
  . "$HOME/.asdf/asdf.sh"
  . "$HOME/.asdf/completions/asdf.bash"
fi

# golang
if [ -d "$HOME/go" ]; then
  export GOPATH="$HOME/go"
  if [ -d "$HOME/go/bin" ]; then
    export PATH="$HOME/go/bin:$PATH"
  fi
  alias goto='cd $GOPATH/src && cd $(find . -type d -maxdepth 3 | sed "s|./||" | fzf || echo -) > /dev/null'
fi
