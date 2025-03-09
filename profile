export TERMINAL=kitty
export QT_STYLE_OVERRIDE=kvantum
export QT_QPA_PLATFORMTHEME=qt5ct
[[ -n "$WAYLAND_DISPLAY" ]] && export QT_QPA_PLATFORM=wayland
# export QT_QPA_PLATFORMTHEME=gtk2
export SYSTEMD_EDITOR=nvim
export EDITOR=nvim
export BROWSER=brave

# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

if [ -e /home/ernesto/.nix-profile/etc/profile.d/nix.sh ]; then . /home/ernesto/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
export XDG_DATA_DIRS="/home/ernesto/.nix-profile/share:$XDG_DATA_DIRS"

