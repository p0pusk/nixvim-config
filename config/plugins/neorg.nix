{
  plugins.neorg = {
    enable = true;
    modules = {
      "core.defaults" = { __empty = null; };
      "core.concealer" = { __empty = null; };
      "core.integrations.image" = { __empty = null; };
      "core.latex.renderer" = { __empty = null; };
      "core.completion" = { config.engine = "nvim-cmp"; };
      "core.dirman" = {
        config = {
          workspaces = {
            home = "~/notes/home";
            work = "~/notes/work";
          };
          default_workspace = "home";
        };
      };
    };
  };
}
