local g = vim.g

local M = {}

function M.setup()
  g.nvim_tree_indent_markers = 1      
  g.nvim_tree_git_hl = 1
  g.nvim_tree_highlight_opened_files = 1
  g.nvim_tree_root_folder_modifier = '~'
  g.nvim_tree_add_trailing = 1
  g.nvim_tree_group_empty = 1
  g.nvim_tree_disable_window_picker = 1
  g.nvim_tree_icon_padding = ' '

  g.nvim_tree_symlink_arrow = ' >> '
  g.nvim_tree_respect_buf_cwm = 1
  g.nvim_tree_create_in_closed_folder = 0

  g.nvim_tree_window_picker_exclude = {
    filetype = {
      'notify',
      'packer',
      'qf',
    },
    buftype = {
      'terminal'
    }
  }

  g.nvim_tree_special_files = { }

  g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1
  }

  g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
      unstaged = "✗",
      staged = "✓",
      unmerged = "",
      renamed = "➜",
      untracked = "★",
      deleted = "",
      ignored = "◌"
    },
    folder = {
      arrow_open = "",
      arrow_closed = "",
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = "",
      symlink_open = ""
    }
  }
  
  require('nvim-tree').setup {} 
end

return M
