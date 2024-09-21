{
  plugins.luasnip = {
    enable = true;
    settings = {
      enable_autosnippets = true;
      store_selection_keys = "<Tab>";
    };
    fromLua = [{
      paths = [ "~/.config/nixvim/snippets" ];
      lazyLoad = true;
    }];
  };

  keymaps = [
    {
      mode = "i";
      key = "<c-u>";
      action = "<cmd>lua require('luasnip.extras.select_choice')()<cr>";
    }
    {
      mode = "i";
      key = "<c-j>";
      action = "<cmd>lua require('luasnip').change_choice(1)<cr>";
    }
    {
      mode = "i";
      key = "<c-k>";
      action = "<cmd>lua require('luasnip').change_choice(-1)<cr>";
    }
  ];

  extraConfigLua = ''
    local types = require("luasnip.util.types")

    require'luasnip'.config.setup({
    	ext_opts = {
    		[types.choiceNode] = {
    			active = {
    				virt_text = {{"●", "love"}}
    			}
    		}
    	},
    })
  '';
}
