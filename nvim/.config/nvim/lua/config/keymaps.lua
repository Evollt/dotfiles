-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Octo.nvim keybindings under <leader>gh
map("n", "<leader>ghp", "<cmd>Octo pr list<CR>", opts) -- List PRs
map("n", "<leader>ghv", "<cmd>Octo pr list --review-requested<CR>", opts) -- List PRs where I'm a reviewer
map("n", "<leader>ghP", "<cmd>Octo pr create<CR>", opts) -- Create PR
map("n", "<leader>ghc", "<cmd>Octo pr checkout<CR>", opts) -- Checkout PR
map("n", "<leader>ghm", "<cmd>Octo pr merge<CR>", opts) -- Merge PR
map("n", "<leader>ghR", "<cmd>Octo pr ready<CR>", opts) -- Mark PR as ready for review
map("n", "<leader>ghu", "<cmd>Octo review resume<CR>", opts) -- Resume review

map("n", "<leader>ghr", "<cmd>Octo review start<CR>", opts) -- Start review
map("n", "<leader>ghs", "<cmd>Octo review submit approve<CR>", opts) -- Submit approve
map("n", "<leader>ghx", "<cmd>Octo review submit request_changes<CR>", opts) -- Request changes
map("n", "<leader>ghS", "<cmd>Octo review submit comment<CR>", opts) -- Submit comment review

map("n", "<leader>gha", "<cmd>Octo comment add<CR>", opts) -- Add comment
map("v", "<leader>gha", "<cmd>Octo comment add<CR>", opts)

map("n", "<leader>ghi", "<cmd>Octo issue list<CR>", opts) -- List issues
map("n", "<leader>ghI", "<cmd>Octo issue create<CR>", opts) -- Create issue

-- Gitsigns
map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", opts) -- Create issue
map("i", "jj", "<Esc>")
