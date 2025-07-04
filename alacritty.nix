# home.nix
{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      
     
      
      window.padding = {
        x = 20;
	y = 20;
      };
     
      window.opacity = 0.98;

      colors = {
        primary = {
          background = "#111111";
          foreground = "#D8DEE9";
        };

        normal = {
          black = "#3B4252";
          red = "#BF616A";
          green = "#A3BE8C";
          yellow = "#EBCB8B";
          blue = "#81A1C1";
          magenta = "#B48EAD";
          cyan = "#88C0D0";
          white = "#E5E9F0";
        };
      };
    };
  };
}
