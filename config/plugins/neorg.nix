{
  plugins.neorg = {
    enable = true;
    modules = {
      "core.defaults" = { __empty = null; };
      "core.concealer" = { config = { icons.code_block.conceal = false; }; };
      "core.summary" = { __empty = null; };
      "core.completion" = { config.engine = "nvim-cmp"; };
      "core.integrations.telescope" = {
        config = { insert_file_link = { show_title_preview = true; }; };
      };
      "core.dirman" = {
        config = {
          workspaces = {
            home = "~/notes/home";
            mse = "~/notes/mse";
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
      options.desc = "neorg inspect";
    }
    {
      mode = "n";
      key = "<leader>nw";
      action = "<plug>(neorg.telescope.switch_workspace)";
      options.desc = "neorg workspaces";
    }
  ];

  autoCmd = [{
    event = [ "FileType" ];
    pattern = [ "norg" ];
    callback.__raw = ''
      function()
         vim.keymap.set("n", "<tab>", "za", { buffer = true })
        vim.keymap.set("n", "<leader>nc", "<cmd>Neorg toggle-concealer<cr>", { buffer = true})
      end
    '';
  }];
}
