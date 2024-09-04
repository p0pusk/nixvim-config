{
  plugins.which-key = {
    enable = true;

    settings = {
      spec = [
        {
          __unkeyed = "<leader>g";
          group = "git";
        }
        {
          __unkeyed = "<leader>l";
          group = "lsp";
        }
        {
          __unkeyed = "<leader>s";
          group = "search";
        }
      ];
    };
  };
}
