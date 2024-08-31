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
    }

    {
      key = "<leader>gk";
      action =
        "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>";
    }

    {
      key = "<leader>gl";
      action = "<cmd>lua require 'gitsigns'.blame_line()<cr>";
    }

    {
      key = "<leader>gp";
      action = "<cmd>lua require 'gitsigns'.preview_hunk()<cr>";
    }

    {
      key = "<leader>gr";
      action = "<cmd>lua require 'gitsigns'.reset_hunk()<cr>";
    }

    {
      key = "<leader>gR";
      action = "<cmd>lua require 'gitsigns'.reset_buffer()<cr>";
    }

    {
      key = "<leader>gs";
      action = "<cmd>lua require 'gitsigns'.stage_hunk()<cr>";
    }

    {
      key = "<leader>gu";
      action = "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>";
    }
  ];
}
