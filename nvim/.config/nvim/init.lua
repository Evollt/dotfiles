-- <leader> key
vim.g.mapleader = ' '

-- open config file
vim.cmd('nmap <leader>co :e ~/.config/nvim/init.lua<cr>')

-- save file
vim.cmd('nmap <leader>s :w<cr>')

-- redo
vim.keymap.set('n', 'U', '<C-r>')

-- paste without overwritting
vim.keymap.set("v", "p", 'P')

-- clear search highlighting
vim.keymap.set('n', '<Esc>', ':nohlsearch<cr>')

-- skip folds
vim.cmd('nmap j gj')
vim.cmd('nmap k gk')

-- unnamed clipboard
vim.opt.clipboard = 'unnamedplus'

-- search ignore case
vim.opt.ignorecase = true

-- disable ignore case option if the search contains upper case
vim.opt.smartcase = true

local opts = { noremap = true, silent = true }

local mappings = {
    -- CamelCase navigation
    {'n', 'w',  'cursorWordPartRight'},
    {'n', 'b',  'cursorWordPartLeft'},

    -- Visual mode (selection)
    {'x', 'w',  'cursorWordPartRightSelect'},
    {'x', 'b',  'cursorWordPartLeftSelect'},

    -- Files
    {'n', '<leader><leader>', 'workbench.action.quickOpen'},
    {'n', '<leader>cp', 'copyFilePath'},
    {'n', '<leader>crp', 'copyRelativeFilePath'},
    {'n', '<leader>rl', 'workbench.action.openRecent'},
    {'n', '<leader>bn', 'workbench.action.files.newUntitledFile'},
    {'n', '<leader>os', 'workbench.action.openSettingsJson'},
    {'n', '<leader>rw', 'workbench.action.reloadWindow'},

    -- Definitions
    {'n', '<leader>gd', 'editor.action.revealDefinition'},
    {'n', '<leader>gy', 'editor.action.goToTypeDefinition'},
    {'n', '<leader>gi', 'editor.action.goToImplementation'},
    {'n', '<leader>gr', 'editor.action.goToReferences'},
    {'n', '<leader>gs', 'workbench.action.gotoSymbol'},
    {'n', '<leader>gl', 'workbench.action.gotoLine'},

    -- Code actions
    {'n', '<leader>cr', 'editor.action.rename'},
    {'n', '<leader>ca', 'editor.action.codeAction'},

    -- Editor tabs
    {'n', '<S-l>', 'workbench.action.nextEditorInGroup'},
    {'n', '<S-h>', 'workbench.action.previousEditorInGroup'},
    {'n', '<leader>bd', 'workbench.action.closeActiveEditor'},
    {'n', '<leader>ba', 'workbench.action.closeAllEditors'},
    {'n', '<leader>bo', 'workbench.action.closeOtherEditors'},

    -- Search
    {'n', '<leader>sg', 'workbench.action.findInFiles'},
    {'n', '<leader>rg', 'workbench.action.replaceInFiles'},
    {'n', '<leader>ss', 'workbench.action.showAllSymbols'},
    {'n', '<leader>sa', 'workbench.action.showCommands'},

    -- Search into file
    {'n', '<leader>ff', 'actions.find'},
    {'n', '<leader>fr', 'editor.action.startFindReplaceAction'},

    -- Git
    {'n', '<leader>gg', 'workbench.view.scm'},
    {'n', '<leader>gc', 'gitlens.gitCommands.checkout'},

    -- Pull Requests
    {'n', '<leader>pr', 'pr.openPullRequestList'},
    {'n', '<leader>pn', 'pr.create'},
    {'n', '<leader>pc', 'pr.createComment'},
    {'n', '<leader>ps', 'pr.startReview'},
    {'n', '<leader>pf', 'pr.submitReview'},
    {'n', '<leader>pd', 'pr.deleteComment'},
    {'n', '<leader>pm', 'pr.merge'},
    {'n', '<leader>pR', 'pr.readyForReview'},
    {'n', '<leader>px', 'pr.close'},
    {'n', '<leader>po', 'pr.openFileInGitHub'},
    {'n', '<leader>pv', 'pr.viewChanges'},

    -- Move lines
    {'n', '<leader>mu', 'editor.action.moveLinesUpAction'},
    {'n', '<leader>md', 'editor.action.moveLinesDownAction'},
    {'n', '<leader>lu', 'editor.action.copyLinesUpAction'},
    {'n', '<leader>ld', 'editor.action.copyLinesDownAction'},
    {'n', '<leader>fm', 'editor.action.formatDocument'},
    {'n', '<leader>fi', 'editor.action.organizeImports'},
    {'n', '<leader>en', 'editor.action.marker.next'},
    {'n', '<leader>ep', 'editor.action.marker.prev'},

    -- Navigations
    {'n', '<leader>nf', 'workbench.action.navigateForward'},
    {'n', '<leader>nb', 'workbench.action.navigateBack'},
    {'n', '<leader>je', 'workbench.action.navigateToLastEditLocation'},

    -- Split
    {'n', '<leader>wv', 'workbench.action.splitEditor'},
    {'n', '<leader>wh', 'workbench.action.splitEditorDown'},
    {'n', '<leader>ww', 'workbench.action.joinTwoGroups'},
    {'n', '<leader>wa', 'workbench.action.evenEditorWidths'},
}

for _, mapping in ipairs(mappings) do
    local mode, key, command = mapping[1], mapping[2], mapping[3]
    vim.keymap.set(mode, key, function() vim.fn.VSCodeNotify(command) end, opts)
end

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {
      "nvim-treesitter/nvim-treesitter",
      dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
      },
      build = ":TSUpdate",
      config = function()
        require("nvim-treesitter.configs").setup({
          auto_install = true,

          textobjects = {
            select = {
              enable = true,
              lookahead = true,
              keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["ai"] = "@conditional.outer",
                ["ii"] = "@conditional.inner",
                ["al"] = "@loop.outer",
                ["il"] = "@loop.inner",
                ["am"] = "@call.outer",
                ["im"] = "@call.inner",
                ["ab"] = "@block.outer",
                ["ib"] = "@block.inner",
                ["aa"] = "@parameter.outer",
                ["ia"] = "@parameter.inner",
                ["a/"] = "@comment.outer",
                ["i/"] = "@comment.inner",
                ["as"] = "@statement.outer",
                ["ga="] = "@assignment.outer",
                ["gi="] = "@assignment.inner",
                ["gl="] = "@assignment.lhs",
                ["gr="] = "@assignment.rhs",
                ["ar"] = "@return.outer",
                ["ir"] = "@return.inner",
                ["az"] = "@regex.outer",
                ["iz"] = "@regex.inner",
              },
            },

            move = {
              enable = true,
              goto_next_start = {
                ["]f"] = "@function.outer",
                ["]c"] = "@class.outer",
                ["]i"] = "@conditional.outer",
                ["]l"] = "@loop.outer",
                ["]m"] = "@call.outer",
                ["]b"] = "@block.outer",
                ["]a"] = "@parameter.inner",
                ["]/"] = "@comment.outer",
                ["]s"] = "@statement.outer",
                ["]="] = "@assignment.outer",
                ["]r"] = "@return.outer",
              },
              goto_next_end = {
                ["]F"] = "@function.outer",
                ["]C"] = "@class.outer",
                ["]I"] = "@conditional.outer",
                ["]L"] = "@loop.outer",
                ["]M"] = "@call.outer",
                ["]B"] = "@block.outer",
                ["]A"] = "@parameter.inner",
              },
              goto_previous_start = {
                ["[f"] = "@function.outer",
                ["[c"] = "@class.outer",
                ["[i"] = "@conditional.outer",
                ["[l"] = "@loop.outer",
                ["[m"] = "@call.outer",
                ["[b"] = "@block.outer",
                ["[a"] = "@parameter.inner",
                ["[/"] = "@comment.outer",
                ["[s"] = "@statement.outer",
                ["[="] = "@assignment.outer",
                ["[r"] = "@return.outer",
              },
              goto_previous_end = {
                ["[F"] = "@function.outer",
                ["[C"] = "@class.outer",
                ["[I"] = "@conditional.outer",
                ["[L"] = "@loop.outer",
                ["[M"] = "@call.outer",
                ["[B"] = "@block.outer",
                ["[A"] = "@parameter.inner",
              },
            },

            swap = {
              enable = true,
              swap_next = {
                ["<leader>na"] = "@parameter.inner",
                ["<leader>nf"] = "@function.outer",
                ["<leader>nb"] = "@block.outer",
              },
              swap_previous = {
                ["<leader>pa"] = "@parameter.inner",
                ["<leader>pf"] = "@function.outer",
                ["<leader>pb"] = "@block.outer",
              },
            },
          },
        })

        -- Make movements repeatable with ' and ,
        local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
        vim.keymap.set({ "n", "x", "o" }, "'", ts_repeat_move.repeat_last_move_next)
        vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
      end
    },
  },
})