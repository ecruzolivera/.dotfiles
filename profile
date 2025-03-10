export TERMINAL=kitty
export QT_STYLE_OVERRIDE=kvantum
export QT_QPA_PLATFORMTHEME=qt5ct
[[ -n "$WAYLAND_DISPLAY" ]] && export QT_QPA_PLATFORM=wayland
# export QT_QPA_PLATFORMTHEME=gtk2
export SYSTEMD_EDITOR=nvim
export EDITOR=nvim
export BROWSER=brave


# Nix
if [[ "$OSTYPE" =~ ^darwin ]]; then
  if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
  fi
elif [[ "$OSTYPE" =~ ^linux ]]; then
  if [ -e /home/ernesto/.nix-profile/etc/profile.d/nix.sh ]; then . /home/ernesto/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
  export XDG_DATA_DIRS="/home/ernesto/.nix-profile/share:$XDG_DATA_DIRS"
else
  echo "Unknown OS: $OSTYPE"
fi

# Android
if [[ "$OSTYPE" =~ ^darwin ]]; then
  if [ -d "$HOME/Library/Android/Sdk" ] ;
    then export ANDROID_HOME="$HOME/Library/Android/Sdk"
  fi

  if [ -d "$HOME/Library/Android/Sdk/platform-tools" ] ;
    then PATH="$HOME/Library/Android/Sdk/platform-tools:$PATH"
  fi

  if [ -d "$HOME/Library/Android/Sdk/emulator" ] ;
    then PATH="$HOME/Library/Android/Sdk/emulator:$PATH"
  fi
elif [[ "$OSTYPE" =~ ^linux ]]; then
  if [ -d "$HOME/Android/Sdk" ] ;
    then export ANDROID_HOME="$HOME/Android/Sdk"
  fi

  if [ -d "$HOME/Android/Sdk/platform-tools" ] ;
    then PATH="$HOME/Android/Sdk/platform-tools:$PATH"
  fi

  if [ -d "$HOME/Android/Sdk/emulator" ] ;
    then PATH="$HOME/Android/Sdk/emulator:$PATH"
  fi
fi


# Source things
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.emacs.d/bin" ] ;
  then PATH="$HOME/.emacs.d/bin:$PATH"
fi

if [ -d "$HOME/.local/share/pnpm" ] ;
  then PATH="$HOME/.local/share/pnpm:$PATH"
fi

[ -f ~/.cargo/env ] && source ~/.cargo/env
# mise
if command -v "mise" > /dev/null 2>&1; then
    eval "$(mise activate zsh)"
fi

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
  export VISUAL='nvim'
fi

alias gsm="git switch master"
alias gbd="git branch | grep -v "master" | xargs git branch -D"
alias gbc="git -c switch"

if command -v "exa" > /dev/null 2>&1; then
  alias ls="exa -l --group-directories-first"
fi

if command -v "bat" > /dev/null 2>&1; then
  alias cat=bat
fi

if command -v "rg" > /dev/null 2>&1; then
  alias grep="rg -uu"
fi
if [[ "$OSTYPE" =~ ^linux ]]; then
  alias open=xdg-open
  alias xemulator="QT_QPA_PLATFORM=xcb emulator"
  alias xmerge="xrdb -merge ~/.Xresources"
fi

DEFAULT_USER=ernesto

alias hf="history|grep -i"
alias e="nvim"


# Snapcraft configuration
# export SNAPCRAFT_BUILD_ENVIRONMENT_CPU=$(($(nproc) - 1))
# export SNAPCRAFT_BUILD_ENVIRONMENT_MEMORY=24G
#
# other 
export XDG_CONFIG_HOME="$HOME/.config"
