local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-------------------------------------------------------------
-- Sidebar Bindings
-----------------------------------------------------------
vim.g.ultest_summary_open='topleft vsplit | vertical resize 30'
map('n', '<leader>s1', '<cmd>lua require"sidebar".show_nav_tree()<cr>', default_opts)
map('n', '<leader>s2', '<cmd>lua require"sidebar".show_test_summary()<cr>', default_opts)
map('n', '<leader>s3', '<cmd>lua require"sidebar".show_debugger()<cr>', default_opts)
map('n', '<leader>s4', '<cmd>lua require"sidebar".show_none()<cr>', default_opts)

-------------------------------------------------------------
-- Telescope Key Bindings
-----------------------------------------------------------
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', default_opts)
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', default_opts)
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', default_opts)
map('n', '<leader>fh', '<cmd>Telescope find_files<cr>', default_opts)
map('n', '<leader>fs', '<cmd>Telescope session-lens search_session<cr>', default_opts)

map('n', '<leader>gt', '<cmd>lua require"telescope".extensions.dap.commands{}<cr>', default_opts)
map('n', '<leader>gb', '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<cr>', default_opts)
map('n', '<leader>gf', '<cmd>lua require"telescope".extensions.dap.frames{}<cr>', default_opts)

-------------------------------------------------------------
-- Split/Buffer Navigation Bindings
-----------------------------------------------------------
map('n', '<S-Up>', ':wincmd k<cr>', default_opts)
map('n', '<S-Down>', ':wincmd j<cr>', default_opts)
map('n', '<S-Right>', ':wincmd l<cr>', default_opts)
map('n', '<S-Left>', ':wincmd h<cr>', default_opts)

-------------------------------------------------------------
-- Code Navigation Bindings
-----------------------------------------------------------
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', default_opts)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', default_opts)
map('n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<cr>', default_opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', default_opts)
map('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>', default_opts)
map('n', 'gD', '<cmd>lua vim.lsp.buf.document_symbol()<cr>', default_opts)
map('n', 'gw', '<cmd>lua vim.lsp.buf.workspace_symbol()<cr>', default_opts)
map('n', 'g[', '<cmd>lua vim.lsp.buf.goto_prev()<cr>', default_opts)
map('n', 'g]', '<cmd>lua vim.lsp.buf.goto_next()<cr>', default_opts)

-------------------------------------------------------------
-- Unit Tesitng Bindings
-----------------------------------------------------------
map('n', 'gt', '<cmd>:Ultest<cr>', default_opts)
map('n', 'gt[', '<Plug>(ultest-prev-fail)', default_opts)
map('n', 'gt]', '<Plug>(ultest-next-fail)', default_opts)
map('n', 'gtn', '<cmd>:UltestNearest<cr>', default_opts)
map('n', 'gts', '<cmd>:UltestSummary<cr>', default_opts)
map('n', 'gtc', '<cmd>:UltestClear<cr>', default_opts)

-------------------------------------------------------------
-- Debugger Bindings 
-----------------------------------------------------------
map('n', '<F5>', '<cmd>lua require"dap".continue()<cr>', default_opts)
map('n', '<F10>', '<cmd>lua require"dap".step_over()<cr>', default_opts)
map('n', '<F11>', '<cmd>lua require"dap".step_into()<cr>', default_opts)
map('n', '<S-F11>', '<cmd>lua require"dap".step_out()<cr>', default_opts)
map('n', '<F9>', '<cmd>lua require"dap".toggle_breakpoint()<cr>', default_opts)
map('n', '<S-F9>', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<cr>', default_opts)
