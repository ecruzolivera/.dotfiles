sudo apt install -y ufw gufw
sudo ufw enable

sudo ufw default deny incoming
sudo ufw default allow outgoing

sudo ufw allow in on lxdbr0
sudo ufw route allow in on lxdbr0
sudo ufw route allow out on lxdbr0

# React Native expo
sudo ufw allow 8081
# Foundry VTT
sudo ufw allow 30000
# localsend
sudo ufw allow 53317
