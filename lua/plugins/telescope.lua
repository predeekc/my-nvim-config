local M = {}

function M.setup()
  local telescope = require("telescope")
  telescope.setup {
    defaults = {
      mappings = {
        i = {
          ["<Esc>"] = "close"
        }
      }
    },
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {}
      }
    }
  }

  telescope.load_extension("ui-select")
  telescope.load_extension("session-lens")
--  telescope.load_extension("dap")
end

return M
