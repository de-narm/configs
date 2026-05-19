-- Basics ---------------------------------------------------------------------

-- Line breaks
vim.o.number = true
vim.o.relativenumber = true

-- Tab stop
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- Auto indent
vim.o.autoindent = true
vim.o.smartindent = true

-- Column size
vim.o.colorcolumn = "80"

-- Highlight current line
vim.o.cursorline = true

-- Update with external changes
vim.o.autoread = true

-- Undo/Swap
vim.o.undofile = true
vim.o.swapfile = false

-- Enable 24 bit colors
vim.o.termguicolors = true

-- Syntax
vim.cmd('filetype plugin indent on')

-- Diagnostics
vim.diagnostic.config({
  virtual_text = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '●',
      [vim.diagnostic.severity.WARN] = '●',
      [vim.diagnostic.severity.INFO] = '●',
      [vim.diagnostic.severity.HINT] = '●',
    },
  },
  underline = true,
  update_in_insert = true,
  severity_sort = true,
})
vim.o.updatetime = 250
vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
  pattern = { '*' },
  callback = function()
		vim.diagnostic.open_float(nil, { focus = false })
	end,
})

vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Bindings -------------------------------------------------------------------

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Plugins --------------------------------------------------------------------

-- LSP configs
vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })
vim.lsp.enable('gdscript')
vim.lsp.enable('gdshader_lsp')

-- Treesitter
vim.pack.add({ 
  "nvim-treesitter/nvim-treesitter-textobjects",
  "https://github.com/nvim-treesitter/nvim-treesitter"
})
local treesitter_filetypes = {
  'gdscript', 
  'gdshader',
  'lua', 
}
require('nvim-treesitter').install(treesitter_filetypes)
vim.api.nvim_create_autocmd('FileType', {
  pattern = treesitter_filetypes,
  callback = function()
    local filetype = vim.bo.filetype
		if filetype and filetype ~= "" then
			vim.treesitter.start()
		end
	end,
})

-- Completion
vim.pack.add({ 
  "https://github.com/hrsh7th/nvim-cmp",
  "https://github.com/hrsh7th/cmp-nvim-lsp",
  "https://github.com/hrsh7th/cmp-buffer"
})
local cmp = require("cmp")
require("cmp").setup({
  window = {
    completion = cmp.config.window.bordered({ border = 'rounded' }),
    documentation = cmp.config.window.bordered({ border = 'rounded' }),
  },
  mapping = {
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.confirm({ select = true })
      else
        fallback()
      end
    end
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  }
})

-- Indent guide lines
vim.pack.add({ "https://github.com/lukas-reineke/indent-blankline.nvim" })
require("ibl").setup({
  scope = { enabled = false }
})

-- Rainbow delimiter (requires treesitter parser for each language)
vim.pack.add({ "https://github.com/HiPhish/rainbow-delimiters.nvim" })

-- Godot
vim.pack.add({ "https://github.com/habamax/vim-godot" })

-- Colorsheme
vim.pack.add({ "https://github.com/catppuccin/nvim" })
require("catppuccin").setup({
  transparent_background = true,
  lsp_styles = {
     underlines = {
        errors = { "undercurl" },
        hints = { "undercurl" },
        warnings = { "undercurl" },
        information = { "undercurl" },
        ok = { "undercurl" },
     },
  },
})
vim.cmd("colorscheme catppuccin-nvim")

-- Statusbar
vim.pack.add({
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-lualine/lualine.nvim'
})
require('lualine').setup({
  options = {
    disabled_filetypes = { "neo-tree" }
  }
})

-- Git Diff Signs
vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })
require('gitsigns').setup({
  current_line_blame = true
})

-- File tree
vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-neo-tree/neo-tree.nvim"
})
require("neo-tree").setup({
  close_if_last_window = true,
  window = {
    width = 40
  }
})

-- File fuzzy finder
vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
})
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files)
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep)

-- Buffer tabs
vim.pack.add({ "https://github.com/akinsho/bufferline.nvim" })
require("bufferline").setup({
  options = {
    indicator = {
      style = "none"
    },
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "("..count..")"
    end,
    offsets = {
      {
        filetype = "neo-tree",
        text = "Neotree",
        highlight = "Directory",
        text_align = "left"
      }
    }
  }
})

