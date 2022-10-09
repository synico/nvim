require("basic")
require("plugins")
require("keymaps")

-- Plugins
require("plugins.nvim-treesitter")
require("plugins.nvim-tree")
require("plugins.bufferline")
require("plugins.telescope")
-- LSP
-- require("lsp.nvim-lsp-installer")
require("lsp.nvim-lspconfig")
require("lsp.mason")
require("lsp.mason-lspconfig")
require("lsp.nvim-cmp")
require('lsp.null-ls')

require("plugins.gruvbox")
require("plugins.lualine")

-- vim.lsp.set_log_level("debug")
