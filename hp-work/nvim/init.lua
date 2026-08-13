-- Basics ---------------------------------------------------------------------

-- Line breaks
vim.o.number = true
vim.o.relativenumber = true

-- Wrapping
vim.o.wrap = false

-- Tab stop
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- Auto indent
vim.o.autoindent = true
vim.o.smartindent = true

-- Don't overwrite settings
vim.cmd('filetype plugin indent off')

-- Column size
--vim.o.colorcolumn = "80"

-- Highlight current line
vim.o.cursorline = true

-- Update with external changes
vim.o.autoread = true

-- Undo/Swap
vim.o.undofile = true
vim.o.swapfile = true

-- Enable 24 bit colors
vim.o.termguicolors = true

-- System clipboard
vim.o.clipboard = "unnamedplus"

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

-- Bindings -------------------------------------------------------------------

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Diagnostics
vim.keymap.set("n", "<leader>j", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>k", vim.diagnostic.goto_prev)

--Signature
vim.keymap.set("n", "<leader>i" , vim.lsp.buf.hover)

-- Plugins --------------------------------------------------------------------

-- LSP configs
vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })
vim.lsp.enable('jdtls')
vim.lsp.enable('kotlin_lsp')
vim.lsp.enable('eslint')
vim.lsp.enable('svelte')
vim.lsp.enable('ts_ls')
vim.lsp.enable('tailwindcss')
vim.lsp.enable('html')

-- Treesitter
-- external: (tree-sitter-cli)
vim.pack.add({ 
  "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
  "https://github.com/nvim-treesitter/nvim-treesitter"
})
local treesitter_filetypes = {
  'java', 
  'kotlin',
  'svelte',
  'typescript',
  'lua', 
  'html',
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
  "https://github.com/hrsh7th/cmp-buffer",
  "https://github.com/hrsh7th/cmp-path"
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
    { name = 'path' },
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
    disabled_filetypes = { "neo-tree" },
    component_separators = { left = '⬥', right = '⬥'},
    section_separators = { left = '', right = ''},
    theme = "palenight"
  }
})

-- Git Diff Signs
vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })
require('gitsigns').setup({
  current_line_blame = true
})
vim.keymap.set('n', '<leader>hs', require('gitsigns').stage_buffer)
vim.keymap.set('n', '<leader>hr', require('gitsigns').reset_buffer)
vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk_inline)

-- Ranger
-- external: (ranger, pynvim, ueberzugpp)
vim.pack.add({
  "https://github.com/kevinhwang91/rnvimr",
})
vim.keymap.set('n', '<leader>r', "<Cmd>RnvimrToggle<CR>")

-- Lazygit
-- external: (lazygit)
vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/kdheepak/lazygit.nvim",
})
vim.keymap.set('n', '<leader>g', "<Cmd>LazyGit<CR>")

-- File fuzzy finder
vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
})
require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ['<c-d>'] = require('telescope.actions').delete_buffer
      }
    }
  }
})
vim.keymap.set('n', '<leader>f', require('telescope.builtin').find_files)
vim.keymap.set('n', '<leader>s', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers)
vim.keymap.set('n', '<leader> ', "<Cmd>:Telescope resume<CR>")

-- Formatter
vim.pack.add({
  "https://github.com/stevearc/conform.nvim"
})
require("conform").setup({
  formatters_by_ft = {
    svelte = { "prettier", stop_after_first = true },
    typescript = { "prettier", stop_after_first = true },
    javascript = { "prettier", stop_after_first = true },
  },
  formatters = {
  },
})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*", 
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
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
  commands = {
     parent_or_close = function(state)
       local node = state.tree:get_node()
       if (node.type == "directory" or node:has_children()) and node:is_expanded() then
         state.commands.toggle_node(state)
       else
         require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
       end
     end,
     child_or_open = function(state)
       local node = state.tree:get_node()
       if node.type == "directory" or node:has_children() then
         if not node:is_expanded() then -- if unexpanded, expand
           state.commands.toggle_node(state)
         else -- if expanded and has children, select the next child
           require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
         end
       else -- if not a directory just open it
         state.commands.open(state)
       end
     end,
  },
  window = {
    width = 40,
    mappings = {
        ["[b"] = "prev_source",
        ["]b"] = "next_source",
        ["h"] = "parent_or_close",
        ["l"] = "child_or_open",
    }
  },
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = true,
      hide_gitignored = true,
    },
    follow_current_file = {
      enabled = true,
      leave_dirs_open = false,
    },
  }
})
vim.keymap.set('n', '<leader>n', "<Cmd>Neotree toggle<CR>")

-- Minimap
vim.pack.add({
    { src = "https://github.com/Isrothy/neominimap.nvim" },
})
vim.opt.sidescrolloff = 36
vim.g.neominimap = {
    auto_enable = true,
    click = {
      enabled = true
    }
}
