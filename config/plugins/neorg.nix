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
          use_popup = true;
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>ni";
      action = "<cmd>Neorg index<cr>";
      options.desc = "neorg index";
    }
    {
      mode = "n";
      key = "<leader>nw";
      action = "<plug>(neorg.telescope.switch_workspace)";
      options.desc = "telescope workspaces";
    }
    {
      mode = "n";
      key = "<leader>nh";
      action = "<cmd>Neorg workspace home<cr>";
      options.desc = "MSE workspace";
    }
    {
      mode = "n";
      key = "<leader>nm";
      action = "<cmd>Neorg workspace mse<cr>";
      options.desc = "home workspace";
    }
  ];

  autoCmd = [{
    event = [ "FileType" ];
    pattern = [ "norg" ];
    callback.__raw = ''
      function()
        vim.keymap.set("n", "<tab>", "za", { buffer = true })
        vim.keymap.set("n", "<leader>nc", "<cmd>Neorg toggle-concealer<cr>", { buffer = true})
        vim.opt_local.concealcursor = "nc"
        vim.opt_local.wrap = false
        vim.opt_local.cc = "0"
      end
    '';
  }];
}
