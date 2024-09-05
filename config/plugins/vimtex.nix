{ pkgs, ... }:

{
  plugins.vimtex = {
    enable = true;
    settings = {
      view_method = "zathura";
      compiler_latexmk.out_dir = "./build";
      texlivePackage = (pkgs.texlive.combine {
        inherit (pkgs.texlive) scheme-full babel-russian;
      });
    };
  };
}
