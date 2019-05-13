# https://superuser.com/questions/544989/does-tmux-sort-the-path-variable
if [ -f /etc/profile ]; then
  PATH=""
  source /etc/profile
fi

export VISUAL=vim
export EDITOR="$VISUAL"
export PS1="\[$(tput bold)\]$\[$(tput sgr0)\] \[$(tput sgr0)\]"
export PS2="\[$(tput bold)\]>\[$(tput sgr0)\] \[$(tput sgr0)\]"
export LC_ALL=en_US.UTF-8

# gotfiles
if [ -d "$HOME/.gotfiles.git" ]; then
  function gotfiles() {
    git --git-dir="$HOME/.gotfiles.git" "$@"
  }
  function __gotfiles() {
    ((COMP_CWORD += 1))
    COMP_WORDS=(git --git-dir=$HOME/.gotfiles.git ${COMP_WORDS[@]:1})
    __git_wrap__git_main
  }
  complete -o bashdefault -o default -o nospace -F __gotfiles gotfiles
fi

# brew
if [ -x "$(command -v brew)" ]; then
  # bash specific
  if [ "$(basename "$SHELL")" = 'bash' ]; then
    # Enable bash completion
    # If bash-completion is >= 2, then we need to define BASH_COMPLETION_COMPAT_DIR
    # in order to use existing completions.
    # bash-completion@2 requires bash >= 4, use chsh to change login shell.export
    BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
    [ -r "/usr/local/etc/profile.d/bash_completion.sh" ] && . "/usr/local/etc/profile.d/bash_completion.sh"
  fi
fi

# asdf
if [ -r "$HOME"/.asdf/asdf.sh ]; then
  . "$HOME"/.asdf/asdf.sh
fi
if [ -r "$HOME"/.asdf/completions/asdf.bash ]; then
  . "$HOME"/.asdf/completions/asdf.bash
fi

# flutter
if [ -d "$HOME/flutter" ]; then
  export PATH="$HOME/flutter/bin:$PATH"
fi

# fzf
if [ -x "$(command -v fd)" ]; then
  export FZF_DEFAULT_COMMAND='fd --type file'
elif [ -x "$(command -v rg)" ]; then
  export FZF_DEFAULT_COMMAND='rg --files'
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
