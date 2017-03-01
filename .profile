export PS1="> "

if [ -d "$HOME/.dotfiles.git" ]; then
  alias dotfiles='git --git-dir="$HOME/.dotfiles.git" --work-tree="$HOME"'
fi
