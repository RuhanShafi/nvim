vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- line numbering
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
--
-- Enable line wrapping for specific file types
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "tex" }, -- Add filetypes where wrapping is needed
    callback = function()
        vim.opt_local.wrap = true         -- Enable wrapping
        vim.opt_local.linebreak = true   -- Break lines at word boundaries
    end,
})

-- Disable line wrapping for other file types
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.wrap = false       -- Disable wrapping
    end,
})


-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- Apperance Settings
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false
