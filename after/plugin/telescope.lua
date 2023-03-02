require("telescope").setup {
    defaults = {
        disable_devicons = true,
        multi_icon = " ",
        color_devicons = false,
    },
    extensions = {
        file_browser = {
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
        }
    }
}

local action_state = require('telescope.actions.state')
local actions = require('telescope.actions')

-- Handle builtins
local builtin = require('telescope.builtin')
Map("n", "<leader>f.", builtin.find_files)
Map("n", "<leader>f,", builtin.git_files)
Map("n", "<leader>fr", builtin.oldfiles)
Map("n", "<leader>fg", function() builtin.live_grep() end)
Map("n", "<leader>/", function() builtin.live_grep({ search_dirs = { vim.fn.expand("%:p")}}) end)
Map("n", "<leader>h", builtin.help_tags)
Map("n", "<C-P>", builtin.commands)

-- Buffers
local del_buf = function(prompt_bufnr)
    local selection = action_state.get_selected_entry()
    actions.close(prompt_bufnr)
    vim.api.nvim_buf_delete(selection.bufnr, { force = true })
end

Map("n", "<leader><leader>", function() builtin.buffers{
    attach_mappings = function(prompt_bufnr , map)
        Map('n', 'dd', function()
            del_buf(prompt_bufnr)
            builtin.buffers()
        end)
        return true
    end
} end)

