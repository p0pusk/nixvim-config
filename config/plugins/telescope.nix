{
  keymaps = [{
    mode = "n";
    key = "<leader>f";
    action.__raw = ''
      function()
        local ok = pcall(
          require('telescope.builtin').git_files,
          { show_untracked = false }
        )
        if not ok then
          require('telescope.builtin').find_files()
        end
      end
    '';
  }];

  plugins.telescope = let
    actions = "require('telescope.actions')";
    lactions = "require('telescope.actions.layout')";
  in {
    enable = true;
    extensions.fzf-native = { enable = true; };

    settings.defaults = {
      prompt_prefix = " ❯ ";
      initial_mode = "insert";
      sorting_strategy = "ascending";
      results_title = "";
      layout_config = { prompt_position = "top"; };
      mappings = {
        i = {
          "<esc>".__raw = "${actions}.close";
          "<c-j>".__raw = "${actions}.move_selection_next";
          "<c-k>".__raw = "${actions}.move_selection_previous";
          "<tab>".__raw = ''
            ${actions}.toggle_selection +
                        ${actions}.move_selection_next'';
          "<c-s>".__raw = "${actions}.send_selected_to_qflist";
          "<c-q>".__raw = "${actions}.send_to_qflist";
          "<c-h>".__raw = "${lactions}.toggle_preview";
        };
      };
    };

    settings.pickers = {
      buffers = {
        theme = "ivy";
        layout_strategy = "bottom_pane";
        sort_mru = true;
        sort_lastused = true;
        ignore_current_buffer = true;
        previewer = true;
        prompt_title = false;
        layout_config = { height = 0.5; };
        mappings = {
          i = {
            "<c-d>".__raw = "${actions}.delete_buffer";
            "<c-j>".__raw = "${actions}.move_selection_next";
            "<c-k>".__raw = "${actions}.move_selection_previous";
          };
        };
      };
    };

    keymaps = {
      "<leader>," = "buffers";
      "<leader>sr" = "oldfiles";
      "<leader>sf" = "fd";
      "<leader>H" = "help_tags";
      "'r" = "live_grep";
      "<leader>go" = {
        action = "git_status";
        options.desc = "Open changed file";
      };
      "<leader>gb" = {
        action = "git_branches";
        options.desc = "Checkout branch";
      };
      "<leader>gc" = {
        action = "git_commits";
        options.desc = "Checkout commit";
      };
      "<leader>gC" = {
        action = "git_bcommits";
        options.desc = "Checkout commit (current file)";
      };
      "<leader>ld" = {
        action = "diagnostics bufnr=0 theme=get_ivy";
        options.desc = "Buffer diagnostics";
      };
      "<leader>ls" = {
        action = "lsp_document_symbols";
        options.desc = "Document symbols";
      };
      "<leader>lS" = {
        action = "lsp_dynamic_workspace_symbols";
        options.desc = "Workspace symbols";
      };
      "<leader>le" = {
        action = "quickfix";
        options.desc = "Telescope quickfix";
      };
      "<leader>nk" = {
        action = "keymaps";
        options.desc = "View keymappings";
      };
      "<leader>M" = {
        action = "man_pages";
        options.desc = "Man pages";
      };
      "<leader>C" = {
        action = "commands";
        options.desc = "Commands";
      };
    };
  };
}
