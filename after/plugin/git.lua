-- Git signs
require('gitsigns').setup()

-- Lazygit
vim.g.lazygit_floating_window_winblend = 1 -- transparency of floating window
vim.g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
vim.g.lazygit_floating_window_corner_chars = {'╭', '╮', '╰', '╯'} -- customize lazygit popup window corner characters
vim.g.lazygit_floating_window_use_plenary = 1 -- use plenary.nvim to manage floating window if available
vim.g.lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed
vim.g.lazygit_use_custom_config_file_path = 1 -- config file path is evaluated if this value is 1
vim.g.lazygit_config_file_path = vim.fn.stdpath("config") .. "/lazygit/config.yaml" -- custom config file path

Map("n", "<leader>gg", vim.cmd.LazyGit)
