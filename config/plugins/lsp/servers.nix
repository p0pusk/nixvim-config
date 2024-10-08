{
  plugins.lsp = {
    enable = true;

    servers = {
      bashls.enable = true;
      clangd = {
        extraOptions = { CompileFlags = "-std=c++20"; };
        enable = true;
      };
      nil-ls = {
        enable = true;
        settings.diagnostics.excludedFiles = [ "*" ];
      };
      texlab = {
        enable = true;
        # extraOptions = {
        #   latexindent.local = "~/.latexindent.yaml";
        #   formatterLineLength = 80;
        # };
      };
      pyright.enable = true;
      cmake.enable = true;
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
      "<leader>lr" = "rename";
      "<f2>" = "rename";
      "<leader>." = "code_action";
      "<leader>la" = "code_action";
      "Ï" = "format";
      "<m-F>" = "format";
    };

    keymaps.diagnostic = {
      "gl" = "open_float";
      "<leader>lj" = "goto_next";
      "<leader>lk" = "goto_prev";
      "<leader>lq" = "setloclist";
    };

    onAttach =
      #lua
      ''
        if client.server_capabilities["documentSymbolProvider"] then
          require("nvim-navic").attach(client, bufnr)
        end
      '';
  };

  plugins.lsp-format = {
    enable = true;
    lspServersToEnable = [ "texlab" "clangd" "hls" ];
  };
}
