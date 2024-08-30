{
  plugins = {
    treesitter = {
      enable = true;
      folding = true;
      nixGrammars = true;

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
        highlight.enable = true;
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
  };
}
