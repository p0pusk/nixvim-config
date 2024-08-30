{
  imports = [
    ./autopairs.nix
    ./cmp.nix
    ./git.nix
    ./lualine.nix
    ./matchup.nix
    ./nvim-tree.nix
    ./project.nix
    ./telescope.nix
    ./treesitter.nix
    ./wilder.nix
  ];

  plugins = {
    lazy.enable = true;
    tmux-navigator.enable = true;
  };
}
