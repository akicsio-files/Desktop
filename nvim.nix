
 { pkgs, config, ... }:

 {
   programs.neovim = {
     enable = true;
   

   extraConfig = ''
     syntax on
     set number
     set clipboard+=unnamedplus

       function! MyCustomColors()
        highlight Normal guibg=#111111 ctermbg=NONE
	highlight NormalNC guibg=#111111 ctermbg=NONE
        highlight Comment guifg=#5f875f
        highlight Constant guifg=#af5f5f
        highlight Identifier guifg=#5f87af
        highlight Statement guifg=#8787af
        highlight PreProc guifg=#af5faf
        highlight Type guifg=#5fafaf
        highlight Special guifg=#5faf5f
        " ... добавьте другие элементы синтаксиса по желанию
      endfunction

      autocmd VimEnter * call MyCustomColors()
   '';
   };
 }
