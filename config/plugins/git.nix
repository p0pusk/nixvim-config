{
  plugins.gitsigns = {
    enable = true;
    settings = { trouble = true; };
  };

  keymaps = map (set: set // { mode = "n"; }) [
    {
      key = "<leader>gj";
      action =
        "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>";
      options.desc = "next hunk";
    }

    {
      key = "<leader>gk";
      action =
        "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>";
      options.desc = "prev hunk";
    }

    {
      key = "<leader>gl";
      action = "<cmd>lua require 'gitsigns'.blame_line()<cr>";
      options.desc = "blame_line";
    }

    {
      key = "<leader>gp";
      action = "<cmd>lua require 'gitsigns'.preview_hunk()<cr>";
      options.desc = "preview hunk";
    }

    {
      key = "<leader>gr";
      action = "<cmd>lua require 'gitsigns'.reset_hunk()<cr>";
      options.desc = "reset hunk";
    }

    {
      key = "<leader>gR";
      action = "<cmd>lua require 'gitsigns'.reset_buffer()<cr>";
      options.desc = "reset buffer";
    }

    {
      key = "<leader>gs";
      action = "<cmd>lua require 'gitsigns'.stage_hunk()<cr>";
      options.desc = "stage hunk";
    }

    {
      key = "<leader>gu";
      action = "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>";
      options.desc = "unstage hunk";
    }
  ];
}
