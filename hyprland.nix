{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    
    settings = {
      exec-once = [
        "swww init"
        "waypaper --restore"
        # "ags run .config/ags/app.ts"
      ];

      monitor = ",preferred,auto,auto";

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        #col.active_border = "0xff111111";
        #col.inactive_border = "rgb(11,11,11)";
      };

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 5;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;
        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];
        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      input = {
        kb_layout = "us,ru";
        kb_options = "grp:alt_shift_toggle";
        follow_mouse = 1;
        sensitivity = 0.0;
        accel_profile = "flat";
        force_no_accel = true;
      };

      misc = {
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
      };

      env = [
        "XCURSOR_THEME,WinSur-dark-cursors"
        "XCURSOR_SIZE,24"
      ];

      "$mainMod" = "SUPER";

      bind = [
        "$mainMod alt, c, exec, ags run .config/ags/app.ts"
        "$mainMod, return, exec, alacritty"
        "$mainMod, C, killactive"
        "$mainMod, g, exec, grim -g \"$(slurp)\" ~/Media/screen-\"$(date +%s)\".png"
        "$mainMod, q, exit"
        "$mainMod, s, togglefloating"
        "$mainMod, F, fullscreen"
        "$mainMod, d, exec, rofi -show drun"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod ctrl, 1, movetoworkspace, 1"
        "$mainMod ctrl, 2, movetoworkspace, 2"
        "$mainMod ctrl, 3, movetoworkspace, 3"
        "$mainMod ctrl, 4, movetoworkspace, 4"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      windowrulev2 = [
        "float, title:^(Dunst)$"
        "stayfocused, title:^(Dunst)$"
        "pin, title:^(Dunst)$"
        "nofocus, class:^steam_app\\d+$"
        "workspace 4,class:^steam_app_\\d+$"
      ];
    };
  };
}
