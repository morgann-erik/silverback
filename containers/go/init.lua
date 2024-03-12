local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
    "neovim/nvim-lspconfig",
	{"ellisonleao/gruvbox.nvim", priority = 1000},
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' }
    }
})

--
-- Sets
--

local v = vim.opt

v.updatetime = 50

v.nu = true
v.relativenumber = true

v.tabstop = 4
v.softtabstop = 4
v.shiftwidth = 4
v.expandtab = true
v.smartindent = true

v.swapfile = false
v.backup = false

v.hlsearch = false;
v.incsearch = true;

v.signcolumn = "yes"
v.scrolloff = 8
v.colorcolumn = "80"

--
-- Remaps
--

local k = vim.keymap

vim.g.mapleader = " "
k.set("n", "<leader>pv", vim.cmd.Ex)
k.set("n", "<leader>ff", vim.lsp.buf.format)

--
-- Telescope
--
require('telescope').setup {
    defaults = {
        sorting_strategy = "ascending"
    }
}

local t = require('telescope.builtin')
local k = vim.keymap

k.set('n', '<leader>pf', t.find_files, {})
k.set('n', '<leader>pg', t.git_files, {})
k.set('n', '<leader>ps', function()
    t.grep_string({ search = vim.fn.input("Grep > ") })
end)

k.set('n', '<leader>vh', t.help_tags, {})

--
-- Golang
--

require 'lspconfig'.gopls.setup {}

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
