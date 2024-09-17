{
  plugins = {
    treesitter = {
      enable = true;
      folding = true;
      nixGrammars = true;
      nixvimInjections = true;

      settings = {
        auto_install = true;
        ensure_installed = [
          "bash"
          "c"
          "cpp"
          "css"
          "dockerfile"
          "fish"
          "gitignore"
          "hlsl"
          "html"
          "java"
          "javascript"
          "json"
          "latex"
          "lua"
          "make"
          "markdown"
          "markdown_inline"
          "nix"
          "python"
          "regex"
          "typescript"
          "tsx"
          "vim"
        ];
        folding.enable = true;
        highlight = {
          enable = false;
          disable = [ "latex" ];
        };
        indent.enable = true;
      };
    };

    treesitter-textobjects = {
      enable = true;
      select = {
        enable = true;
        lookahead = true;
        keymaps = {
          "af" = { query = "@function.outer"; };
          "if" = { query = "@function.inner"; };
          "ac" = { query = "@class.outer"; };
          "ic" = { query = "@class.inner"; };
          "al" = { query = "@loop.outer"; };
          "il" = { query = "@loop.inner"; };
          "aa" = { query = "@parameter.outer"; };
          "ia" = { query = "@parameter.inner"; };
          "uc" = { query = "@comment.outer"; };
        };
      };
      swap = {
        enable = true;
        swapNext = {
          "'a" = { query = "@parameter.inner"; };
          "'f" = { query = "@function.outer"; };
          "'e" = { query = "@element"; };
        };
        swapPrevious = {
          "'A" = { query = "@parameter.inner"; };
          "'F" = { query = "@function.outer"; };
          "'E" = { query = "@element"; };
        };
      };
      move = {
        enable = true;
        setJumps = true;
        gotoNextStart = {
          "]a" = { query = "@parameter.outer"; };
          "]f" = { query = "@function.outer"; };
          "]c" = { query = "@class.outer"; };
        };
        gotoNextEnd = {
          "]A" = { query = "@parameter.outer"; };
          "]F" = { query = "@function.outer"; };
          "]C" = { query = "@class.outer"; };
        };
        gotoPreviousStart = {
          "[a" = { query = "@parameter.outer"; };
          "[f" = { query = "@function.outer"; };
          "[c" = { query = "@class.outer"; };
        };
        gotoPreviousEnd = {
          "[A" = { query = "@parameter.outer"; };
          "[F" = { query = "@function.outer"; };
          "[C" = { query = "@class.outer"; };
        };
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
