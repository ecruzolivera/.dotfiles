mkdir -p ~/.local/share/fonts

set_font() {
  local font_name=$1
  local url=$2
  local file_type=$3
  local file_name="${font_name/ Nerd Font/}"

  if ! $(fc-list | grep -i "$font_name" >/dev/null); then
    cd /tmp
    wget -O "$file_name.zip" "$url"
    unzip "$file_name.zip" -d "$file_name"
    cp "$file_name"/*."$file_type" ~/.local/share/fonts
    rm -rf "$file_name.zip" "$file_name"
    fc-cache
    cd -
    clear
  fi

  gsettings set org.gnome.desktop.interface monospace-font-name "$font_name 12"
}

set_font "FiraMono Nerd Font" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraMono.zip" "otf"
