
{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./disko.nix
      "${builtins.fetchTarball "https://github.com/nix-community/disko/archive/master.tar.gz"}/module.nix"
      ./hardware-configuration.nix
    ];

  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      mesa
      libva
      libva-utils
    ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  hardware.bluetooth.enable = true;	
  services.resolved.enable = true;

  services.greetd = {
  enable = true;
  settings = {
    default_session = {
      command = "Hyprland";
      user = "akicsio";
    };
  };
 };


  services.minecraft-server.enable = true;
  services.minecraft-server.eula = true; 



  services.sunshine = {
    enable = true;
    autoStart = true;
    capSysAdmin = true;
    openFirewall = true;
  };



  hardware.opentabletdriver.enable = true;
  nixpkgs.config.allowBroken = true;
  nix.gc = {
  automatic = true;
  dates = "weekly";         
  options = "--delete-older-than 30d";
  };

  networking.firewall.allowedTCPPorts = [ 5900 47984 47989 47990 48010 ];
  networking.firewall.enable = true;
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  boot.initrd.kernelModules = [ "amdgpu" ];
  services.gvfs.enable = true;
  services.devmon.enable = true;
  services.udisks2.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
    services.flatpak.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

   time.timeZone = "Europe/Moscow";

   services.pipewire = {
     enable = true;
     pulse.enable = true;
     jack.enable = true;
   };

   users.users.akicsio = {
     isNormalUser = true;
     extraGroups = [ "wheel" "adbusers" ]; 
   };

       
   fileSystems. "/run/media/akicsio" = {
     device = "/dev/disk/by-uuid/c0454bf5-781a-44d9-b912-568b489b5cd7";
     fsType = "ext4";
     options = ["defaults" "noatime"];
   };


   environment.systemPackages = with pkgs; [
     neovim
     wineWowPackages.stable
     wineWowPackages.waylandFull
     winetricks  
     wine
     wine64
     dxvk
     ags
     git
     libadwaita 
     zenity
     unrar
     home-manager
     android-tools
     wireguard-tools
     pamixer
     rofi-wayland
     swww
   ];

 
   fonts.packages = with pkgs; [
     noto-fonts
     nerd-fonts.ubuntu
     noto-fonts-cjk-sans
     noto-fonts-emoji
     font-awesome
     fira-code
     fira-code-symbols
   ];
 
  system.stateVersion = "25.05";

}
