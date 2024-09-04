{
  plugins.navic = { enable = true; };

  plugins.barbecue = {
    enable = true;
    settings = {
      show_basename = true;
      show_modified = true;
      show_dirname = false;
      exclude_filetypes = [
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
  };
}
