{
  plugins.neorg = {
    enable = true;
    modules = {
      "core.defaults" = { __empty = null; };
      "core.concealer" = { __empty = null; };
      "core.completion" = { config.engine = "nvim-cmp"; };
      "core.integrations.telescope" = {
        config = { insert_file_link = { show_title_preview = true; }; };
      };
      "core.dirman" = {
        config = {
          workspaces = {
            home = "~/notes/home";
            work = "~/notes/mse";
          };
          default_workspace = "home";
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>ni";
      action = "<plug>Neorg index<cr>";
    }
    {
      mode = "n";
      key = "<leader>nw";
      action = "<plug>(neorg.telescope.switch_workspace)";
    }
  ];
}
