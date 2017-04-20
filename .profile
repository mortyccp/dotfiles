export PS1="> "
export PS2="$ "

if [ -d "$HOME/.dotfiles.git" ]; then
  alias dotfiles='git --git-dir="$HOME/.dotfiles.git" --work-tree="$HOME"'
fi

if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi

if [ -d "$HOME/.rbenv" ]; then
  eval "$(rbenv init -)"
fi

if [ -x "/usr/libexec/java_home" ]; then
  JAVA_HOME="$(/usr/libexec/java_home)"
  export JAVA_HOME
fi

if [ -d "$HOME/android-sdk-macosx" ]; then
  export ANDROID_HOME="$HOME/android-sdk-macosx"
  export ANDROID_SDK="$ANDROID_HOME"
  export PATH="$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools:$PATH"
fi
