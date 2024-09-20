{
  keymaps = [{
    mode = "n";
    key = "<leader>p";
    action = "<cmd>Telescope projects<cr>";
    options.desc = "projects";
  }];

  plugins.project-nvim = {
    enable = true;
    enableTelescope = true;
    settings = {
      show_hidden = false;
      detectionMethods = [ "pattern" "lsp" ];
      patterns = [
        ".git"
        ".vscode"
        "build"
        ">polykek"
        ">sandbox"
        ">sonartem"
        ">artemson"
        ">notes"
        "_darcs"
        ".hg"
        ".bzr"
        ".svn"
        "Makefile"
        "package.json"
        ".stylua.toml"
        "requirements.txt"
        "main.py"
        "neovim.json"
        "flake.nix"
      ];
    };
  };
}
