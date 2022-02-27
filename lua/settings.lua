local opt = vim.opt
local cmd = vim.cmd
local g = vim.g

------------------------------------------------------------
-- Colors, Fonts, and Themes Settings
-----------------------------------------------------------
opt.termguicolors = true                   -- enable colors
opt.guifont = 'Inconsolata_Nerd_Font:h10'  -- set the font to use in neovide

------------------------------------------------------------
-- Misc Settings
-----------------------------------------------------------
opt.mouse = "a"                            -- enable the mouse
g.neovide_hide_mouse_when_typing = 1       -- name is pretty clear
opt.clipboard = "unnamedplus"              -- use the system clipboard
opt.number = true                          -- display line number
opt.showmatch = true                       -- show matching parens
opt.signcolumn = "yes"                     -- reserve space by the link numbers to
                                           -- avoid flicker when warnings are shown
opt.shortmess:append 'I'                   -- Skip the nvim intro message
opt.shortmess:append 'c'                   -- Hide completion usage messages
opt.completeopt = {                        -- Configure completion options
  'menuone',                               -- Show the menu if there's one option
  'noinsert',                              -- Don't insert the text until selected
  'noselect'                               -- Don't select a match for the user
}

-----------------------------------------------------------
-- Hover Settings
-----------------------------------------------------------
opt.updatetime = 300                       -- Milliseconds to wait before hover

  -- Show diagnostic popup on cursor hold
cmd 'autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })'

-----------------------------------------------------------
-- Tabs settings
-----------------------------------------------------------
opt.expandtab = true                       -- Use spaces instead of tabs
opt.shiftwidth = 4                         -- Shift 4 spaces when tab
opt.tabstop = 4                            -- 1 tab == 4 spaces
opt.smartindent = true                     -- Autoindent new lines

