sudo snap install ghostty --classic
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /snap/bin/ghostty 100
sudo update-alternatives --set x-terminal-emulator /snap/bin/ghostty
