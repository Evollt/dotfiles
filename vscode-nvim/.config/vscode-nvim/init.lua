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
    -- Files
    {'n', '<leader><leader>', 'workbench.action.quickOpen'},
    {'n', '<leader>cp', 'copyFilePath'},
    {'n', '<leader>crp', 'copyRelativeFilePath'},
    {'n', '<leader>rl', 'workbench.action.openRecent'},
    {'n', '<leader>bn', 'workbench.action.files.newUntitledFile'},
    {'n', '<leader>os', 'workbench.action.openSettingsJson'},
    {'n', '<leader>rw', 'workbench.action.reloadWindow'},

    -- word moves
    {'n', 'w', 'cursorWordPartRight'},
    {'n', 'b', 'cursorWordPartLeft'},
    {'v', 'w', 'cursorWordPartRightSelect'},
    {'v', 'b', 'cursorWordPartLeftSelect'},

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