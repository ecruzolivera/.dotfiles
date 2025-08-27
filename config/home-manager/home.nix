{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ernesto";
  home.homeDirectory = "/home/ernesto";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  news.display = "silent";
  nixpkgs = {
      config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
      };
    };


  # The home.packages option allows you to install Nix packages into your
  # environment.
  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
     # Unix tools
    bottom
    fastfetch
    fd
    gdu
    jq
    just
    ripgrep # Better `grep`
    tmux
    tree
    tree
    watchman
    wget
    # zellij
    rclone
    zsh
    rsync
    
    # Dev
    # kitty # breaks when launching from terminal https://github.com/NixOS/nixpkgs/issues/80936
    # vagrant
    alejandra
    cmake
    cmake-format
    cmake-lint
    deadnix
    diff-so-fancy
    nerd-fonts.fira-code
    # gcc
    lazydocker
    lazygit
    mise
    neovim
    nixd
    openjdk
    plantuml
    rustup
    sqlite
    statix
    tio
    tokei

    # Media
    chafa
    imagemagick
    ffmpeg
    ffmpegthumbnailer

    xclip
    wl-clipboard

    # GUIs
    # Doesnt work in single user installs https://github.com/NixOS/nixpkgs/issues/121694
    # obsidian 
    # brave
    # google-chrome
    # megasync # Only build from source option available
    # localsend # https://github.com/NixOS/nixpkgs/issues/348345
    # vscode # seems that it doesnt work on single user installations
    # postman
    meld
    flameshot
    gimp
    inkscape
    libreoffice
    qbittorrent
    yazi
    sqlitebrowser
    vlc
    xournalpp
    zathura
  ];


  programs.fzf = {
    enable = true;
    enableBashIntegration = true;  
    enableZshIntegration = true;
  };

  # programs.lazygit = {
  #   enable = true;
  # };
  #
  # programs.kitty = {
  #   enable = true;
  # };
  #
  # programs.tmux = {
  #   enable = true;
  # };

  # programs.vim = {
  #   enable = true;
  # };
  # programs.neovim = {
  #   enable = true;
  # };


  programs.git = {
    enable = true;  # Enable Git management
    lfs.enable = true;
    userName = "Ernesto Cruz Olivera";  # Set the global Git username
    userEmail = "ecruzolivera@gmail.com";  # Set the global Git email
    diff-so-fancy.enable = true;
    # Extra Git configuration, like aliases and global settings
    extraConfig = {
      core = {
        editor = "nvim";  # Set the default Git editor
      };
      pull = {
        rebase = false;
      };
      push = {
        autoSetupRemote = true;
      };
      alias = {
        gsm = "switch master";  # Short alias for `git checkout`
      };
    };
  };


#   programs.zsh = {
#     enable = true;
#     enableCompletion = true;
#     autosuggestion.enable = true;
#     syntaxHighlighting.enable = true;
#     # ohMyZsh = {
#     #   enable = true;
#     #   theme = "agnoster";
#     #   plugins = [ 
#     #     "git" 
#     #     "zsh-vi-mode"
#     #   ]; 
#     # };
#     history = {
#         size = 10000;
#         path = "${config.xdg.dataHome}/zsh/history";
#     };
#     shellAliases = {
#       update_nix = "home-manager switch";
#       gsm="git switch master";
#       gbd="git branch | grep -v \"master\" | xargs git branch -D";
#       gbc="git -c switch";
#       ls="exa -l --group-directories-first";
#       cat="bat";
#       grep="rg -uu";
#       open="xdg-open";
#       xemulator="QT_QPA_PLATFORM=xcb emulator";
#       # upgrade_all="sudo apt upgrade -y && sudo snap refresh && flatpak update -y && brew update && rustup update && npm update -g";
#       hf="history|grep -i";
#       vim="nvim";
#       e="nvim";
#       xmerge="xrdb -merge ~/.Xresources";
#     };
#     initExtra = ''
# source ~/.profile
# HYPHEN_INSENSITIVE="true"
# HIST_STAMPS="yyyy-mm-dd"
# setopt NONOMATCH
# setopt SHARE_HISTORY
# export HISTCONTROL=ignoreboth:erasedups
# if [ -d "$HOME/.bin" ] ;
#   then PATH="$HOME/.bin:$PATH"
# fi
#
# if [ -d "$HOME/.local/bin" ] ;
#   then PATH="$HOME/.local/bin:$PATH"
# fi
#
#
# if [ -d "$HOME/.emacs.d/bin" ] ;
#   then PATH="$HOME/.emacs.d/bin:$PATH"
# fi
#
# if [ -d "$HOME/Android/Sdk/platform-tools" ] ;
#   then PATH="$HOME/Android/Sdk/platform-tools:$PATH"
# fi
#
# if [ -d "$HOME/Android/Sdk/emulator" ] ;
#   then PATH="$HOME/Android/Sdk/emulator:$PATH"
# fi
#
# if [ -d "$HOME/Android/Sdk" ] ;
#   then export ANDROID_HOME="$HOME/Android/Sdk"
# fi
#
# if [ -d "$HOME/.local/share/pnpm" ] ;
#   then PATH="$HOME/.local/share/pnpm:$PATH"
# fi
#
# # Source things
# [ -f ~/.cargo/env ] && source ~/.cargo/env
# # fzf shortcuts
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# # mise
# [ -f ~/.local/bin/mise ] && eval "$(mise activate zsh)"
# # vi mode
# set -o vi
# bindkey -s ^f "tmux-sessionizer\n"
#
# ## Functions
# function yy() {
#   local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
#   yazi "$@" --cwd-file="$tmp"
#   if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
# 	  cd -- "$cwd"
#   fi
#   rm -f -- "$tmp"
# }
#
# # >>>> Vagrant command completion (start)
# # fpath=(/opt/vagrant/embedded/gems/gems/vagrant-2.4.1/contrib/zsh $fpath)
# # compinit
# # <<<<  Vagrant command completion (end)
# '';
#   };
#
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/ernesto/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}

