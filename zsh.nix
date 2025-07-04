{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;  # Включение автодополнения
    autosuggestion.enable = true;  # Включение автопредложений (как в Fish)
    syntaxHighlighting.enable = true;  # Подсветка синтаксиса

    shellAliases = {
      ll = "ls -l";
      la = "ls -A";
      l = "ls -CF";
      g = "git";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "docker" ];
      theme = "robbyrussell";  # Тема Oh My Zsh
    };
  };
}
