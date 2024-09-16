{ pkgs, ... }:

{
  imports = [
    ./lsp/options.nix
    ./lsp/servers.nix
    ./lsp/none-ls.nix
    ./lsp/trouble.nix
    ./autopairs.nix
    ./cmp.nix
    ./code_runner.nix
    ./dashboard.nix
    ./git.nix
    ./lualine.nix
    ./matchup.nix
    ./navic.nix
    ./neogit.nix
    ./noice.nix
    ./nvim-tree.nix
    ./project.nix
    ./tabout.nix
    ./telescope.nix
    ./treesitter.nix
    ./vimtex.nix
    ./which-key.nix
  ];

  plugins = {
    tmux-navigator.enable = true;
    surround.enable = true;
    neoscroll = {
      enable = true;
      settings.hide_cursor = false;
    };
    notify.enable = true;
    nvim-colorizer.enable = true;
    neoclip.enable = true;
    comment = {
      enable = true;
      settings.pre_hook =
        "require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()";
    };
  };
}
