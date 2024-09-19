{
  plugins.which-key = {
    enable = true;

    settings = {
      delay = 500;
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
        {
          __unkeyed = "<leader>c";
          group = "trouble";
        }
        {
          __unkeyed = "<leader>n";
          group = "notes";
        }
      ];
    };
  };
}
