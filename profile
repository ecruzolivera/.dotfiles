export TERMINAL=kitty
export QT_STYLE_OVERRIDE=kvantum
export QT_QPA_PLATFORMTHEME=qt5ct
[[ -n "$WAYLAND_DISPLAY" ]] && export QT_QPA_PLATFORM=wayland
# export QT_QPA_PLATFORMTHEME=gtk2
export SYSTEMD_EDITOR=nvim
export EDITOR=nvim
export BROWSER=brave

if [ -e /home/ernesto/.nix-profile/etc/profile.d/nix.sh ]; then  # added by Nix installer
  . /home/ernesto/.nix-profile/etc/profile.d/nix.sh 
  export XDG_DATA_DIRS="/home/ernesto/.nix-profile/share:$XDG_DATA_DIRS"
fi 


if [ -d /home/ernesto/Android/Sdk ]; then 
  export ANDROID_HOME=~/Android/Sdk
  export PATH=$PATH:$ANDROID_HOME/tools
  export PATH=$PATH:$ANDROID_HOME/tools/bin
  export PATH=$PATH:$ANDROID_HOME/platform-tools
fi


