{
  plugins.vim-matchup = {
    enable = true;
    enableSurround = true;
    motion.enable = true;
    # delimNoSkips = 2;
    treesitterIntegration.enable = true;
  };

  extraConfigLua = "vim.g.matchup_override_vimtex = 1";
}
