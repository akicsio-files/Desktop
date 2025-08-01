{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "c-dev-env";
  
  buildInputs = with pkgs; [
    gcc         # Компилятор GNU C
    glibc       # Стандартная библиотека C
    gnumake     # Утилита make
    valgrind    # Инструмент для отладки и профилирования
    gdb         # Отладчик GNU
    clang       # Альтернативный компилятор (опционально)
    bear        # Генератор compile_commands.json (для LSP)
  ];

  # Переменные окружения (опционально)
  shellHook = ''
    echo "Среда разработки на C готова!"
    echo "Используемые инструменты:"
    echo "  - GCC: $(gcc --version | head -n1)"
    echo "  - Make: $(make --version | head -n1)"
  '';
}
