local M = {}

function M.setup() 
    local dap = require('dap')
    dap.listeners.after['event_process']['my_ide'] = function(session, body)
        require('sidebar').show_debugger()
    end

    require"dapui".setup() 
end

return M

