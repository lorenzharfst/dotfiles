local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	})
	end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
    {'nvim-tree/nvim-tree.lua',
	version = '*',
	lazy = false,
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
	config = function()
		require('nvim-tree').setup {}
		-- MAPPINGS 
		vim.cmd('imap <C-b> :NvimTreeToggle<CR>')
		vim.cmd('nmap <C-b> :NvimTreeToggle<CR>')
	end},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{'feline-nvim/feline.nvim', config = function(plugin) vim.cmd('set termguicolors') require('feline').setup() end},
        -- Theme 1
        { "catppuccin/nvim", 
        name = "catppuccin", 
        priority = 1000,
        config = function()
            vim.cmd('colorscheme catppuccin')
        end },
        -- Theme 2
        --{
	--  "folke/tokyonight.nvim",
	--  lazy = false,
	--  priority = 1000,
	--  opts = {},
	--  config = function()
	--	  vim.cmd('colorscheme tokyonight')
	--  end
	--},
	{ "EdenEast/nightfox.nvim" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ 'neovim/nvim-lspconfig' },
	-- Automatically sync shell background colour with nvims
	{ "typicode/bg.nvim", lazy = false},
        -- Plugin for the Java LSP jdtls
        -- Commented out because I'm trying out stuff
        --{ "mfussenegger/nvim-jdtls"}
    })
-- COMMANDS ON STARTUP
vim.cmd('set number')
vim.cmd('set shiftwidth=4 smarttab')
vim.cmd('set expandtab')
-- WIP LSP: Language server for js
require("mason").setup()
require"lspconfig".jdtls.setup{}
-- Keys for Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find in filenames' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Find inside files' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find in buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find in help tags' })
-- Keys for LSPs (only when an LSP client is running)
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, { buffer = args.buf, desc = 'Show LSP hover function' })
        vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, { buffer = args.buf, desc = 'Show LSP action menu' })
    end
})
