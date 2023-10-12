-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- This file is automatically loaded by lazyvim.plugins.config

local map = vim.keymap.set

-- Place the two screens up and down
map("n", "<leader>wh", "<C-w>t<C-w>K", { desc = "Arrange windows updown" })
-- Place the two screens side by side
map("n", "<leader>wv", "<C-w>t<C-w>H", { desc = "Arrange windows leftright" })
-- Rotate screens
map("n", "<leader>wH", "<C-w>b<C-w>K", { desc = "Rotate windows anticlockwise" })
map("n", "<leader>wV", "<C-w>b<C-w>H", { desc = "Rotate windows clockwise" })

-- change tab directory
map({ "n", "v" }, "<leader><tab>c", ":<cmd>tcd %:p:h<cr><cr>", { desc = "Change tab directory" })
