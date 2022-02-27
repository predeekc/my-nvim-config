local M = {}

function M.setup()
  require('lualine').setup {
    options = { 
      disabled_filetypes = { 
        'UltestSummary', 
        'NvimTree', 
        'dapui_watches',  
        'dapui_stacks',
        'dapui_breakpoints',
        'dapui_scopes',
      } 
    }
  }
end

return M
