{ pkgs, ... }:

{
  plugins.vimtex = {
    enable = true;
    texlivePackage = pkgs.texlive.combined.scheme-full;
    settings = {
      view_method = "zathura";
      compiler_latexmk.out_dir = "./build";
      compiler_latexrun.out_dir = "./build";
    };
  };
}
