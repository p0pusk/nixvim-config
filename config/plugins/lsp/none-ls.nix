{
  plugins.none-ls = {
    enable = true;
    settings = { diagnostics_format = "[#{c}] #{m} (#{s})"; };
    sources = {
      formatting = {
        stylua.enable = true;
        prettierd.enable = true;
        nixfmt.enable = true;
        black = {
          enable = true;
          settings.extra_args = [ "--preview" ];
        };
        markdownlint.enable = true;
        shellharden.enable = true;
        shfmt = {
          enable = true;
          settings.extra_args = [ "-i" "4" "-ci" "-sr" ];
        };
      };
      diagnostics = { };
      code_actions = { refactoring.enable = true; };
    };
  };
}
