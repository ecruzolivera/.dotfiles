sudo apt install -y gnome-tweak-tool gnome-shell-extension-manager pipx gir1.2-gtop-2.0 lm-sensors gnome-sushi

#install pop shell
sudo apt install -y git node-typescript make gnome-shell-extension-prefs
cd /tmp || exit
git clone --depth 1 https://github.com/pop-os/shell.git
cd shell || exit
make local-install

cd /tmp || exit
git clone --depth 1 https://github.com/pop-os/launcher.git
cd launcher || exit
just build-release # Build
just install       # Install locally
