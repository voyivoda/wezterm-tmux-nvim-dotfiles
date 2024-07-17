-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

vim.g.root_spec = { "lsp", "cwd", { ".git", "lua", "zig", "c", "cpp", "py" } }

vim.opt.guicursor = ""
vim.opt.cursorline = true

-- enable mouse mode
vim.opt.mouse = "a"

-- relative numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- tabs
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

--indentation
vim.opt.smartindent = true

-- enable smartindent (see https://stackoverflow.com/questions/1204149/smart-wrap-in-vim)
vim.opt.breakindent = true

-- wrapping
vim.opt.wrap = false

--swap and such
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- search and highlighting
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- scrolling
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- better search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- better splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- set for better completion
--vim.opt.completeopt = { "menunone", "noselect" }

-- 24bit color
vim.opt.termguicolors = true

-- enable a sign column to keep screen from jumping
vim.opt.signcolumn = "yes"

vim.opt.clipboard = { "unnamed", "unnamedplus" }

vim.opt.updatetime = 50

-- columns
vim.opt.colorcolumn = "81"
vim.opt.pumblend = 0
