

curl -L https://releases.nixos.org/nix/nix-2.24.5/install | sh

source /home/ernesto/.nix-profile/etc/profile.d/nix.sh

nix run home-manager/release-24.05 -- init --switch
