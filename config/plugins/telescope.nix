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
    options.desc = "search files";
  }];

  plugins.telescope = let
    actions = "require('telescope.actions')";
    layout = "require('telescope.actions.layout')";
  in {
    enable = true;
    # extensions.fzf-native = { enable = true; };

    settings.defaults = {
      prompt_prefix = " ❯ ";
      initial_mode = "insert";
      sorting_strategy = "ascending";
      file_ignore_patterns = [ "/nix/store/*" ];
      preview = false;
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
          "<c-h>".__raw = "${layout}.toggle_preview";
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
      "<leader>," = {
        action = "buffers";
        options.desc = "buffers";
      };
      "<leader>r" = {
        action = "oldfiles";
        options.desc = "recent files";
      };
      "<leader>sh" = {
        action = "help_tags";
        options.desc = "help";
      };
      "<leader>sf" = {
        action = "fd";
        options.desc = "find files";
      };
      "'r" = {
        action = "live_grep";
        options.desc = "grep";
      };
      "<leader>go" = {
        action = "git_status";
        options.desc = "open changed file";
      };
      "<leader>gb" = {
        action = "git_branches";
        options.desc = "checkout branch";
      };
      "<leader>gc" = {
        action = "git_commits";
        options.desc = "checkout commit";
      };
      "<leader>gC" = {
        action = "git_bcommits";
        options.desc = "checkout commit (current file)";
      };
      "<leader>ld" = {
        action = "diagnostics bufnr=0 theme=get_ivy";
        options.desc = "buffer diagnostics";
      };
      "<leader>ls" = {
        action = "lsp_document_symbols";
        options.desc = "document symbols";
      };
      "<leader>lS" = {
        action = "lsp_dynamic_workspace_symbols";
        options.desc = "workspace symbols";
      };
      "<leader>le" = {
        action = "quickfix";
        options.desc = "telescope quickfix";
      };
      "<leader>sk" = {
        action = "keymaps";
        options.desc = "view keymappings";
      };
      "<leader>sm" = {
        action = "man_pages";
        options.desc = "man pages";
      };
      "<leader>sc" = {
        action = "commands";
        options.desc = "search commands";
      };
    };
  };
}
