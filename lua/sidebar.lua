-------------------------------------------------------------
-- These functions manage the state of the sidebar and allow
-- one of three modes (so far). Then one mode is active, the
-- others are hidden.
--
-- So far the options are:
--   - Navigation tree
--   - Test summary
--   - None
-----------------------------------------------------------

local M = {}

function M.show_test_summary()
  vim.cmd ':NvimTreeClose'
  require("dapui").close("sidebar")
  vim.cmd ':UltestSummaryOpen'
end

function M.show_nav_tree()
  vim.cmd ':UltestSummaryClose'  
  require("dapui").close("sidebar")
  vim.cmd ':NvimTreeOpen'
end

function M.show_debugger()
  vim.cmd ':UltestSummaryClose'
  vim.cmd ':NvimTreeClose'
  require("dapui").open("sidebar")
end

function M.show_none()
  vim.cmd ':NvimTreeClose'
  vim.cmd ':UltestSummaryClose'
  require("dapui").close("sidebar")
end

return M
