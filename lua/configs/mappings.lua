vim.cmd([[ set noswapfile ]])
vim.cmd([[ noremap <C-J> <C-W><C-J> ]])
vim.cmd([[ noremap <C-K> <C-W><C-K> ]])
vim.cmd([[ noremap <C-L> <C-W><C-L> ]])
vim.cmd([[ noremap <C-H> <C-W><C-H> ]])
-- vim.cmd([[ map <silent> <C-n> :NvimTreeToggle<CR> ]])
vim.cmd([[ map <silent> <C-n> :Explore<CR> ]])
vim.g.mapleader = ';'

vim.cmd([[ noremap <leader>ev :vsplit ~/.config/nvim/init.lua<cr> ]])
vim.cmd([[ noremap <leader>sv :source ~/.config/nvim/init.lua<cr> ]])
vim.cmd([[ noremap <leader>ot :tabnew<cr> ]])
vim.cmd([[ noremap <leader>g :LazyGit<cr> ]])
-- vim.cmd([[ nnoremap <leader>ff :Telescope git_files<cr>]])
vim.cmd([[ nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>]])
vim.cmd([[ :au BufWritePost * :Prettier ]])

-- Harpoon
vim.cmd([[ noremap <leader>h :lua require("harpoon.ui").toggle_quick_menu()<cr> ]])
vim.cmd([[ noremap <leader>m :lua require("harpoon.mark").add_file()<cr> ]])
vim.cmd([[ noremap <silent> <C-f> :Telescope live_grep<CR>]])
-- vim.cmd([[ noremap <C-e> :NvimTreeFindFile<cr> ]])
vim.cmd([[ vnoremap <C-c> "+y ]])

-- LspSaga
vim.cmd([[ nnoremap <silent> <leader>f :Lspsaga finder<CR> ]])
vim.cmd([[ nnoremap <silent> <leader>d :FlutterDevices<CR> ]])
vim.cmd([[ nnoremap <silent> <leader>o :FlutterOpenDevTools<CR> ]])
vim.cmd([[ nnoremap <silent> <space>ca :Lspsaga code_action<CR> ]])
vim.cmd([[ nnoremap <silent> K :Lspsaga hover_doc<CR> ]])
vim.cmd([[ nnoremap <silent> <space>rn :Lspsaga rename<CR> ]])
vim.cmd([[ nnoremap <silent> <space>pd :Lspsaga peek_definition<CR> ]])
vim.cmd([[nnoremap <leader>nb :Git switch -c <C-r>=input('Branch name: ')<CR><CR>]])




-- vim.cmd([[ nnoremap <silent> <leader>r :FlutterHotRestart<CR> ]])
vim.cmd([[ nnoremap <silent> <leader>R :FlutterHotReload<CR> ]])
  vim.g.copilot_assume_mapped = true

vim.keymap.set('n', '<F5>', require 'dap'.continue)
vim.keymap.set('n', '<F10>', require 'dap'.step_over)
vim.keymap.set('n', '<F11>', require 'dap'.step_into)
vim.keymap.set('n', '<F12>', require 'dap'.step_out)
vim.keymap.set('n', '<leader>b', require 'dap'.toggle_breakpoint)
vim.keymap.set('n', '<leader>B', function()
  require 'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end)
vim.g.user_emmet_leader_key = ','


vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

