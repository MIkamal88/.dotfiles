-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("x", "p", [["_dP]])
keymap("n", "q:", ":q<cr>")

-- Ctrl + S to save
keymap("n", "<C-s>", "<Cmd>write<CR>", opts)

-- Navigation in Insert mode
keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "<C-j>", "<Down>", opts)
keymap("i", "<C-k>", "<Up>", opts)
keymap("i", "<C-l>", "<Right>", opts)

-- Indent in Visual mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Tmux Navigation
keymap("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", opts)
keymap("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", opts)
keymap("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", opts)
keymap("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", opts)
keymap("n", "<C-\\>", "<Cmd>NvimTmuxNavigateLastActive<CR>", opts)

-- Terminal Toggle
keymap("n", "<C-/>", function()
	local count = vim.v.count1
	require("toggleterm").toggle(count, 20, LazyVim.root.get(), "horizontal")
end, { desc = "ToggleTerm (horizontal root_dir)" })

keymap("n", "<M-/>", function()
	local count = vim.v.count1
	require("toggleterm").toggle(count, 130, LazyVim.root.get(), "vertical")
end, { desc = "ToggleTerm (vertical root_dir)" })

keymap("n", "<leader>C", ":Cheatsheet<CR>")

-- -- Molten Keymaps
-- keymap("n", "<leader>mi", ":MoltenInit<CR>", { silent = true, desc = "Molten Init Kernel" })
-- keymap("n", "<leader>ml", ":MoltenEvaluateLine<CR>", { silent = true, desc = "Molten Evaluate Line" })
-- keymap("v", "<leader>mv", ":<C-u>MoltenEvaluateVisual<CR>gv<ESC>", { silent = true, desc = "Molten Evaluate Visual" })
-- keymap("n", "<leader>mh", ":MoltenHideOutput<CR>", { silent = true, desc = "Molten Hide Output" })
-- keymap("n", "<leader>mo", ":noautocmd MoltenEnterOutput<CR>", { silent = true, desc = "Molten Enter Output" })

-- Inlay hints
keymap("n", "<leader>ch", function()
	if vim.fn.has("nvim-0.10") == 1 then
		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
	end
end, { desc = "LSP | Toggle Inlay Hints", silent = true })
