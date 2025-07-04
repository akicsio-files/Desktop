
 { config, pkgs, ... }: 

 {

  imports = [
    ./nvim.nix
    ./hyprland.nix
    ./zsh.nix
    ./alacritty.nix
  ]; 

  nixpkgs.config.allowUnfree = true;

  home = {
    username = "akicsio";
    homeDirectory = "/home/akicsio";
    stateVersion = "24.11";

    packages = with pkgs; [
      firefox
      pavucontrol
      gedit
      telegram-desktop
      hydralauncher
      krita
      mpv
      eww
      grim
      prismlauncher
      viewnior
      heroic
      xfce.thunar
      qbittorrent
      file-roller
      discord
      slurp
      blueman
      gnome-tweaks
      waypaper
    ];
  };

 }

