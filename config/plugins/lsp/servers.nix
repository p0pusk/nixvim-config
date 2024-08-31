{
  plugins.lsp = {
    enable = true;
    capabilities = "require('cmp_nvim_lsp').default_capabilities()";

    servers = {
      bashls.enable = true;
      clangd.enable = true;
      nil-ls.enable = true;
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
        if client.server_capabilities["documentSymbolProvider"] then
          require("nvim-navic").attach(client, bufnr)
        end
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = true
      '';
  };

  plugins.lsp-format = {
    enable = true;
    lspServersToEnable = [ ];
  };
}
