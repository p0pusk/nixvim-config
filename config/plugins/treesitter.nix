{
  plugins = {
    treesitter = {
      enable = true;
      folding = true;
      nixGrammars = false;
      nixvimInjections = false;

      settings = {
        auto_install = true;
        ensure_installed = [
          "c"
          "cpp"
          "css"
          "dockerfile"
          "fish"
          "gitignore"
          "html"
          "java"
          "javascript"
          "json"
          "latex"
          "lua"
          "make"
          "markdown"
          "tsx"
          "vim"
          "python"
          "typescript"
          "hlsl"
        ];
        highlight = {
          enable = false;
          disable = [ "latex" ];
        };
        indent.enable = true;
      };
    };

    treesitter-context = {
      enable = true;
      settings = { max_lines = 2; };
    };

    treesitter-refactor = {
      highlightDefinitions = {
        enable = true;
        clearOnCursorMove = true;
      };
    };

    ts-context-commentstring.enable = true;
  };
}
