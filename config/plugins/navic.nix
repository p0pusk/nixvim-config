{
  plugins.navic = { enable = true; };

  plugins.barbecue = {
    enable = true;
    showBasename = true;
    showModified = true;
    showDirname = false;
    excludeFiletypes = [
      "help"
      "startify"
      "dashboard"
      "packer"
      "neo-tree"
      "neogitstatus"
      "NvimTree"
      "Trouble"
      "alpha"
      "lir"
      "Outline"
      "spectre_panel"
      "toggleterm"
      "DressingSelect"
      "Jaq"
      "harpoon"
      "dap-repl"
      "dap-terminal"
      "dapui_console"
      "dapui_hover"
      "lab"
      "notify"
      "noice"
      ""
    ];
  };
}
