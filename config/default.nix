{
  imports = [ ./options.nix ./keymaps.nix ./plugins ];

  colorschemes.rose-pine.enable = true;

  performance = { byteCompileLua.enable = true; };
}
