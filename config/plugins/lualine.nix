{
  plugins.lualine = {
    enable = true;
    settings = {
      globalstatus = true;
      iconsEnabled = true;
      componentSeparators = {
        left = "";
        right = "";
      };
      sectionSeparators = {
        left = "";
        right = "";
      };
      disabledFiletypes.statusline = [ "alpha" ];
      sections = {
        lualine_x = [
          {
            __unkeyed-1.__raw = "require('noice').api.statusline.mode.get";
            color = { fg = "#ff9e64"; };
            cond.__raw = "require('noice').api.statusline.mode.has";
          }

          {
            __unkeyed-1.__raw = ''
              function(msg)
                local function list_registered_names(filetype)
                  local s = require('null-ls.sources')
                  local available_sources = s.get_available(filetype)
                  local registered = {}
                  for _, source in ipairs(available_sources) do
                    for method in pairs(source.methods) do
                      registered[method] = registered[method] or {}
                      table.insert(registered[method], source.name)
                    end
                  end
                  return registered
                end

                local function list_registered_formaters(filetype)
                  local method = require('null-ls').methods.FORMATTING
                  local registered_providers = list_registered_names(filetype)
                  return registered_providers[method] or {}
                end

                local function list_registered_linters(filetype)
                  local null_ls = require('null-ls')
                  local alternative_methods = {
                    null_ls.methods.DIAGNOSTICS,
                    null_ls.methods.DIAGNOSTICS_ON_OPEN,
                    null_ls.methods.DIAGNOSTICS_ON_SAVE,
                  }
                  local registered_providers = list_registered_names(filetype)
                  local providers_for_methods = vim.tbl_flatten(vim.tbl_map(function(m)
                    return registered_providers[m] or {}
                  end, alternative_methods))

                  return providers_for_methods
                end
                msg = msg or 'LS Inactive'
                local buf_clients = vim.lsp.buf_get_clients()
                if next(buf_clients) == nil then
                  -- TODO: clean up this if statement
                  if type(msg) == 'boolean' or #msg == 0 then
                    return 'LS Inactive'
                  end
                  return msg
                end
                local buf_ft = vim.bo.filetype
                local buf_client_names = {}
                local copilot_active = false

                -- add client
                for _, client in pairs(buf_clients) do
                  if client.name ~= 'null-ls' and client.name ~= 'copilot' then
                    table.insert(buf_client_names, client.name)
                  end

                  if client.name == 'copilot' then
                    copilot_active = true
                  end
                end

                -- add formatter
                local supported_formatters = list_registered_formaters(buf_ft)
                vim.list_extend(buf_client_names, supported_formatters)

                -- add linter
                local supported_linters = list_registered_linters(buf_ft)
                vim.list_extend(buf_client_names, supported_linters)

                local unique_client_names = vim.fn.uniq(buf_client_names)

                local language_servers = '['
                  .. table.concat(unique_client_names, ', ')
                  .. ']'

                return language_servers
              end
            '';
            color = { gui = "bold"; };
            cond.__raw = ''
              function()
                window_width_limit = 100
                return vim.o.columns > window_width_limit
              end
            '';
          }
        ];
        lualine_y = [{
          __unkeyed-1 = "filetype";
          padding = {
            left = 1;
            right = 1;
          };
        }];
      };
    };
  };
}
