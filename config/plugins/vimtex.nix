{ pkgs, ... }:

{
  plugins.vimtex = {
    enable = true;
    texlivePackage = pkgs.texlive.combined.scheme-full;
    settings = {
      view_method = "zathura";
      quickfix_mode = 0;
      quickfix_method = "pplatex";
      compiler_latexmk.out_dir = "./build";
      compiler_latexrun.out_dir = "./build";
      log_ignore = [ "Viewer cannot find Zathura window ID!" ];
    };
  };
}
