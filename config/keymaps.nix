{
  keymaps = [
    {
      mode = "n";
      key = "Q";
      action = "<cmd>bd!<cr>";
    }

    {
      key = "H";
      action = "0";
    }

    {
      key = "L";
      action = "$";
    }

    {
      mode = "t";
      key = "<esc>";
      action = "<c-\\><c-n><cr>";
    }

    {
      mode = "n";
      key = "<esc>";
      action = "<cmd>cclose<cr><cmd>NvimTreeClose<cr>";
    }

    {
      mode = "n";
      key = "<leader>h";
      action = "<cmd>nohl<cr>";
    }
  ];
}
