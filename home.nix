{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "hix";
  home.homeDirectory = "/home/hix";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = [
      pkgs.bash
      # pkgs.zsh
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      nixpkgs = "cd ~/.config/nixpkgs";
    };
    initExtra = ''
      # https://unix.stackexchange.com/questions/596887/how-to-scale-the-resolution-display-of-the-desktop-and-or-applications
    '';
  };

  # programs.zsh = {
  #   enable = true;
  #   shellAliases = {
  #     ll = "ls -l";
  #     update = "sudo nixos-rebuild switch";
  #   };
  #   history = {
  #     size = 10000;
  #     path = "${config.xdg.dataHome}/zsh/history";
  #   };

  #   zplug = {
  #     enable = true;
  #     plugins = [
  #       { name = "zsh-users/zsh-autosuggestions"; }
  #       { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
  #     ];
  #   };
  # };
}
