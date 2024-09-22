{
  plugins.luasnip = {
    enable = true;
    settings = {
      enable_autosnippets = true;
      store_selection_keys = "<Tab>";
      ext_opts.__raw = let
        types = "require('luasnip.util.types')";
        #lua
      in ''
        {
        	[${types}.choiceNode] = {
        		active = {
        			virt_text = {{"●", "love"}}
        		}
        	}
        }
      '';
    };
    fromLua = [{
      paths = [ "~/.config/nixvim/snippets" ];
      lazyLoad = true;
    }];
  };

  keymaps = [{
    mode = "i";
    key = "<c-u>";
    action = "<cmd>lua require('luasnip.extras.select_choice')()<cr>";
  }];
}
