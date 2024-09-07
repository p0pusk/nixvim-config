{
  plugins.none-ls = {
    enable = true;
    sources = {
      formatting = {
        stylua.enable = true;
        clang_format.enable = true;
        prettierd.enable = true;
        nixfmt.enable = true;
        blackd = {
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
      diagnostics = { statix.enable = true; };
      code_actions = { refactoring.enable = true; };
    };
  };
}
