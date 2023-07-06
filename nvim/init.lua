require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.cmp")
require("user.lsp")
require("user.telescope")
require("user.treesitter")
require("user.autopairs")
require("user.gitsigns")

vim.cmd("set termguicolors")
vim.cmd("let g:gruvbox_contrast_dark = 'hard'")
vim.cmd("let g:gruvbox_contrast_light = 'hard'")
vim.cmd("colorscheme gruvbox")
vim.cmd("hi LspCxxHlGroupMemberVariable guifg=#83a598")

-- disable netrw at the very start of your init.lua 
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- setup with some options
require("nvim-tree").setup({
    on_attach = on_attach,
    sort_by = "case_sensitive",
    view = {
	width = 30,
    },
    renderer = {
	group_empty = true,
    },
    filters = {
	dotfiles = true,
    },
})