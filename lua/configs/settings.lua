vim.cmd([[ set encoding=utf8 ]])
vim.cmd([[ set nu! ]])
vim.cmd([[ set mouse=a ]])
vim.cmd([[ set wildmenu ]])
vim.cmd([[ set confirm ]])
vim.cmd([[ set incsearch ]])
vim.cmd([[ set title ]])
vim.cmd([[ set t_Co=256 ]])
vim.cmd([[ set shiftwidth=2 ]])
vim.cmd([[ set softtabstop=2 ]])
vim.cmd([[ set tabstop=2 ]])
vim.cmd([[ set relativenumber ]])
vim.cmd([[ set expandtab ]])
vim.cmd([[ set shiftwidth=2 ]])
vim.cmd([[ set softtabstop=2 ]])
vim.cmd([[ set guicursor= ]])
vim.cmd([[ set cursorline ]])
vim.cmd([[ syntax on ]])

-- Color scheme
vim.cmd([[ set bg=dark ]])
vim.cmd([[ set termguicolors ]])
-- vim.o.background = "dark" -- or "light" for light mode
-- vim.o.background = "light"

-- vim.o.background = "light" -- or "light" for light mode
 -- vim.cmd[[colorscheme solarized]]
 -- vim.cmd[[colorscheme tokyonight-night]]
vim.cmd[[colorscheme tokyonight-moon]]
-- vim.cmd[[colorscheme tokyonight-day]]
-- vim.cmd[[colorscheme dayfox]]
-- vim.cmd[[colorscheme nightfox]]

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.cmd([[ let extension = expand('%:e') ]])
 vim.cmd([[let g:copilot_proxy = 'http://localhost:11435' ]])
vim.cmd([[ let g:copilot_proxy_strict_ssl = v:false ]])
--




