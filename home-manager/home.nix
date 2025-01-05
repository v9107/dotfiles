{ config, pkgs, ... }:
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "venkatesh";
  home.homeDirectory = "/home/venkatesh";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [

    pkgs.nixfmt-rfc-style # formatter for .nix files
    pkgs.deno

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  #xdg.configFile = {
  #};

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
  #  /etc/profiles/per-user/venkatesh/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = rec {
    EDITOR = "vim";
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";

    # Not officially in the specification
    XDG_BIN_HOME = "$HOME/.local/bin";
    PATH = "$HOME/.cargo/bin:${pkgs.zsh}:${pkgs.coreutils}:${XDG_BIN_HOME}:$PATH";
    MYPY_CACHE_DIR = "/dev/null";
  };

  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        ll = "ls -l";
        vi = "nvim";
        ls = "ls --color=auto";
        lla = "ls -Al";
        cls = "clear";
        tmux = "tmux -u";
        lg = "lazygit";
      };
      history = {
        size = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
      };
      dotDir = ".config/zsh";
    };
    nushell.enable = true;
    starship = {
      enable = true;
      enableZshIntegration = true;
    };
    git.enable = true;
    helix.enable = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
