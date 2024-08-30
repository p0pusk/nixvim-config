{
  imports = [
    ./lsp/servers.nix
    ./lsp/none-ls.nix
    ./lsp/trouble.nix
    ./autopairs.nix
    ./cmp.nix
    ./git.nix
    ./lualine.nix
    ./matchup.nix
    ./navic.nix
    ./nvim-tree.nix
    ./project.nix
    ./telescope.nix
    ./treesitter.nix
    ./wilder.nix
  ];

  plugins = { tmux-navigator.enable = true; };
}
