{ config, pkgs, ... }:


let
  mac-app-util-src = builtins.fetchTarball "https://github.com/hraban/mac-app-util/archive/master.tar.gz";
  mac-app-util = import mac-app-util-src {};
in

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ernesto";
  home.homeDirectory = "/Users/ernesto";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  news.display = "silent";

  imports = [
    mac-app-util.homeManagerModules.default
  ];
  nixpkgs = {
      config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
      };
    };


  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
     # Unix tools
    bottom
    fastfetch
    fd
    bat
    eza
    gdu
    jq
    just
    ripgrep # Better `grep`
    tmux
    tree
    tree
    watchman
    wget
    zellij
    zsh
    zsh-autosuggestions
    zsh-syntax-highlighting
    rsync

    # Dev
    # vagrant
    watchman
    alejandra
    cmake
    cmake-format
    cmake-lint
    deadnix
    diff-so-fancy
    nerd-fonts.fira-code
    gcc
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
    # ghostty

    # Media
    mpv
    chafa
    imagemagick
    ffmpeg
    ffmpegthumbnailer


    # GUIs
    # Doesnt work in single user installs https://github.com/NixOS/nixpkgs/issues/121694
    localsend # https://github.com/NixOS/nixpkgs/issues/348345
    postman
    meld
    flameshot
    gimp
    qbittorrent
    yazi
    sqlitebrowser
    xournalpp
    xz
  ]++ (pkgs.lib.optionals pkgs.stdenv.isDarwin [
  # macOS-only packages
  skhd
]) ++ (pkgs.lib.optionals pkgs.stdenv.isLinux [
  # Linux-only packages
  xclip
  wl-clipboard
  zathura
]);

  # The home.packages option allows you to install Nix packages into your
  # environment.
  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;
  };


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
}

