cd /tmp || exit

wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.8_all.deb

sudo dpkg -i ./protonvpn-stable-release_1.0.8_all.deb && sudo apt update

sudo apt install -y proton-vpn-gnome-desktop

cd - || exit
