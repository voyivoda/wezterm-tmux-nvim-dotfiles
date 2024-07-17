-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.cmd.colorscheme("catppuccin")

vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#6e738d", bold = false })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#b4befe", bold = true })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#6e738d", bold = false })

vim.opt.grepprg = "rg --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
