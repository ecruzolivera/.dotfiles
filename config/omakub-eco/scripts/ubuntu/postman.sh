cd /tmp || exit
sudo apt-get -y install libgconf-2-4

wget https://dl.pstmn.io/download/latest/linux_64

tar -xf postman-linux-x64.tar.gz

sudo mv Postman /opt/

tee ~/.local/share/applications/Postman.desktop <<'EOF'
[Desktop Entry]
Encoding=UTF-8
Name=Postman
Exec=/opt/Postman/app/Postman %U
Icon=/opt/Postman/app/resources/app/icons/icon_128x128.png
Terminal=false
Type=Application
Categories=Development;
EOF

cd - || exit
