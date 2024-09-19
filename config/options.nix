{
  config = {
    globals = {
      mapleader = " ";
      maplocalleader = "\\";
    };
    opts = {
      number = true; # Show line numbers
      relativenumber = true; # Show relative line numbers
      cursorline = true;
      shiftwidth = 2; # Tab width should be 2
      timeoutlen = 500;
      updatetime = 200;
      expandtab = true;
      smarttab = true;
      cindent = true;
      wrap = true;
      textwidth = 80;
      colorcolumn = "80";
      tabstop = 2;
      softtabstop = 2;
      list = true;
      listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂";
      ignorecase = true;
      smartcase = true;
      showmode = false;
      conceallevel = 2;

      backup = false;
      writebackup = false;
      undofile = true;
      swapfile = false;

      history = 50;

      splitright = true;
      splitbelow = true;

      foldmethod = "indent";
      foldlevelstart = 99;
      foldnestmax = 3;
      foldminlines = 1;
    };
  };
}
