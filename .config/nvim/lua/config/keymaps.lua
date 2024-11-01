local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- explorer from current file
keymap.set(
  { "n" },
  "<leader>e",
  ":Neotree reveal toggle<cr>",
  { desc = "Toggle Neotree", noremap = true, silent = true }
)

-- Increment/Decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwords
keymap.set("n", "dw", "vb_d")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- New tab
keymap.set("n", "te", ":tabedit", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Перемещение строк вверх и вниз в нормальном режиме
keymap.set("n", "<C-A-j>", ":m .+1<CR>==", opts)
keymap.set("n", "<C-A-k>", ":m .-2<CR>==", opts)

-- Перемещение строк вверх и вниз в визуальном режиме
keymap.set("v", "<C-A-j>", ":m '>+1<CR>gv=gv", opts)
keymap.set("v", "<C-A-k>", ":m '<-2<CR>gv=gv", opts)

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })
