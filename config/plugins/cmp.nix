{
  plugins = {
    luasnip = {
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

    cmp-buffer = { enable = true; };

    cmp-emoji = { enable = true; };

    cmp-nvim-lsp = { enable = true; };

    cmp-nvim-lsp-signature-help = { enable = true; };

    cmp-path = { enable = true; };

    cmp_luasnip = { enable = true; };

    cmp = {
      enable = true;

      settings = {
        experimental = { ghost_text = true; };
        snippet.expand = ''
          function(args)
            require('luasnip').lsp_expand(args.body)
          end
        '';
        sources = [
          {
            name = "nvim_lsp";
            max_item_count = 5;
          }
          {
            name = "luasnip";
            max_item_count = 5;
          }
          {
            name = "buffer";
            max_item_count = 5;
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";

          }
          {
            name = "nvim_lua";
            max_item_count = 5;
          }
          {
            name = "path";
            max_item_count = 5;
          }
        ];

        formatting = {
          fields = [ "abbr" "kind" "menu" ];
          format =
            # lua
            ''
              function(entry, item)
                local icons = {
                  Namespace = "󰌗",
                  Text = "󰉿",
                  Method = "󰆧",
                  Function = "󰆧",
                  Constructor = "",
                  Field = "󰜢",
                  Variable = "󰀫",
                  Class = "󰠱",
                  Interface = "",
                  Module = "",
                  Property = "󰜢",
                  Unit = "󰑭",
                  Value = "󰎠",
                  Enum = "",
                  Keyword = "󰌋",
                  Snippet = "",
                  Color = "󰏘",
                  File = "󰈚",
                  Reference = "󰈇",
                  Folder = "󰉋",
                  EnumMember = "",
                  Constant = "󰏿",
                  Struct = "󰙅",
                  Event = "",
                  Operator = "󰆕",
                  TypeParameter = "󰊄",
                  Table = "",
                  Object = "󰅩",
                  Tag = "",
                  Array = "[]",
                  Boolean = "",
                  Number = "",
                  Null = "󰟢",
                  String = "󰉿",
                  Calendar = "",
                  Watch = "󰥔",
                  Package = "",
                  Copilot = "",
                  Codeium = "",
                  TabNine = "",
                }

                local aliases = {
                  nvim_lsp = 'lsp',
                }

                local icon = icons[item.kind] or ""
                item.kind = string.format("%s %s", icon, item.kind or "")
                -- item.dup = { buffer = 1, path = 1, nvim_lsp = 0, luasnip = 0 }
                item.menu =
                  string.format('[%s]', aliases[entry.source.name] or entry.source.name)
                return item
              end
            '';
        };

        window = {
          completion = {
            scrollbar = false;
            sidePadding = 0;
            border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ];
          };

          settings.documentation = {
            border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ];
          };
        };

        mapping = {
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<S-Tab>" =
            #lua
            ''
              cmp.mapping(function(fallback)
                local luasnip = require('luasnip')
                if cmp.visible() then
                  cmp.close()
                elseif luasnip.jumpable(-1) then
                  luasnip.jump(-1)
                else
                  fallback()
                end
              end, {"i", "s"})
            '';
          "<Tab>" =
            # lua 
            ''
              cmp.mapping(function(fallback)
                local luasnip = require('luasnip')
                local line = vim.api.nvim_get_current_line()
                if line:match("^%s*$") then
                  fallback()
                elseif cmp.visible() then
                  cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
                elseif luasnip.expand_or_jumpable() then
                  luasnip.expand_or_jump()
                else
                  fallback()
                end
              end, { "i", "s" })
            '';
        };
      };
    };
  };
}
