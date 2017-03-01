# bootstrap
#
# alias dotfiles='git --git-dir="$HOME/.dotfiles.git" --work-tree="$HOME"
# dotfiles init
# dotfiles remote add origin https://github.com/soapsign/dotfiles.git
# dotfiles checkout -b master origin/master

export PS1="> "

if [ -d "$HOME/.dotfiles.git" ]; then
  alias dotfiles='git --git-dir="$HOME/.dotfiles.git" --work-tree="$HOME"'
fi
