{
  imports = [ ./none-ls.nix ./trouble.nix ./navic.nix ];

  plugins = {
    lsp = {
      enable = true;
      servers = {
        bashls.enable = true;
        clangd.enable = true;
        nixd.enable = true;
        lua-ls = {
          enable = true;
          settings.telemetry.enable = false;
        };
      };

      keymaps.lspBuf = {
        "gD" = "declaration";
        "gd" = "definition";
        "gr" = "references";
        "gi" = "implementation";
        "K" = "hover";
        "<leader>r" = "rename";
        "<f2>" = "rename";
        "<leader>." = "code_action";
        "Ï" = "format";
        "<m-F>" = "format";
      };

      keymaps.diagnostic = {
        "gl" = "open_float";
        "]g" = "goto_next";
        "[g" = "goto_prev";
      };

      onAttach =
        #lua
        ''
          local symbols_supported =
            client.supports_method('textDocument/documentSymbol')
          if symbols_supported then
            require('nvim-navic').attach(client, bufnr)
            vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
          end
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = true
        '';
    };

    lsp-format = { enable = false; };
  };
}
