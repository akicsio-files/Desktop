let
  pkgs = import <nixpkgs> {
    config.allowUnfree = true;  # Разрешаем несвободные пакеты (unrar, 7z)
  };
in pkgs.mkShell {
  packages = [
    pkgs.unrar       # Для распаковки RAR-архивов
    pkgs.p7zip       # Для работы с 7z-архивами
    pkgs.git         # Для обновления лаунчера
    (pkgs.python3.withPackages (python-pkgs: [
      python-pkgs.pandas
      python-pkgs.pip
      python-pkgs.pycairo
      python-pkgs.pygobject3
      python-pkgs.loguru
      python-pkgs.requests
    ]))
  ];

  shellHook = ''
    export TMPDIR="/run/media/akicsio/tmpArtefactOberkill12GB"  
    mkdir -p "$TMPDIR"
    
    # Путь к unrar (если нужно)
    export UNRAR_LIB_PATH="${pkgs.unrar}/lib/libunrar.so"
    
    echo "TMPDIR установлен в: $TMPDIR"
    df -h "$TMPDIR" | grep -v "Filesystem"
  '';
}
