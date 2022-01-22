local tree_cb = require'nvim-tree.config'.nvim_tree_callback

vim.g.nvim_tree_quit_on_open = 1
require("nvim-tree").setup({
    hijack_cursor = true,
    update_cwd = true,
    diagnostics = {
        enable = true,
        show_on_dirs = true,
    },
    view = {
        auto_resize = true,
        mappings = {
            custom_only = true,
            list = {
                { key = {"<Cr>", "<2-LeftMouse>"},         action = "edit" },
                { key = {"O"},                          action = "edit_no_picker" },
                { key = {"<2-RightMouse>", "g."},       action = "cd" },
                { key = "o",                            action = "vsplit" },
                { key = "<C-x>",                        action = "split" },
                { key = "<C-t>",                        action = "tabnew" },
                { key = "[",                            action = "prev_sibling" },
                { key = "]",                            action = "next_sibling" },
                { key = "P",                            action = "parent_node" },
                { key = "q",                            action = "close_node" },
                { key = "<Tab>",                        action = "preview" },
                { key = "K",                            action = "first_sibling" },
                { key = "J",                            action = "last_sibling" },
                { key = "I",                            action = "toggle_ignored" },
                { key = "H",                            action = "toggle_dotfiles" },
                { key = "R",                            action = "refresh" },
                { key = "a",                            action = "create" },
                { key = "d",                            action = "remove" },
                { key = "D",                            action = "trash" },
                { key = "r",                            action = "rename" },
                { key = "<C-r>",                        action = "full_rename" },
                { key = "x",                            action = "cut" },
                { key = "c",                            action = "copy" },
                { key = "p",                            action = "paste" },
                { key = "y",                            action = "copy_name" },
                { key = "Y",                            action = "copy_path" },
                { key = "gy",                           action = "copy_absolute_path" },
                { key = "[c",                           action = "prev_git_item" },
                { key = "]c",                           action = "next_git_item" },
                { key = "..",                           action = "dir_up" },
                { key = "s",                            action = "system_open" },
                { key = "<Esc>",                        action = "close" },
                { key = "gh",                           action = "toggle_help" },
            }
        }
    },
    filters = {
        custom = { ".git", "node_modules" },
    },
    trash = {
        cmd = "delete",
        require_confirm = false,
    }
})

-- Mappings for nvimtree
vim.api.nvim_set_keymap("n", "<C-e>", ":NvimTreeFindFileToggle<CR>", {
    noremap = true,
    silent = true,
})

-- Optimize the display whih barbar.nvim
local tree ={}
tree.open = function ()
   require'bufferline.state'.set_offset(31, 'FileTree')
   require'nvim-tree'.find_file(true)
end

tree.close = function ()
   require'bufferline.state'.set_offset(0)
   require'nvim-tree'.close()
end

return tree
