--------------
-- Options
--------------

-- Security options
vim.o.exrc = true
vim.o.secure = true

-- Displau the number of a line
vim.o.number = true
vim.o.relativenumber = true

-- Hight the screen line of the cursor
vim.o.cursorline = true
--
vim.o.backspace = "indent,eol,start"
vim.o.whichwrap = "<,>,h,l"
vim.o.textwidth = 0

--
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

--
vim.o.smartindent = true
vim.o.list = true
vim.o.listchars = "trail:▫,tab:»·,nbsp:+,extends:→,precedes:←"

vim.o.scrolloff = 13

vim.o.ttimeoutlen = 50
vim.o.timeoutlen = 500

vim.o.updatetime = 2000

vim.o.linebreak = true
vim.o.textwidth = 0

vim.o.foldmethod = "expr"
vim.o.foldlevel = 99

vim.o.formatoptions = "tc1roq"

vim.o.splitright = true

vim.o.cmdheight = 2

vim.o.foldcolumn = "auto"

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false

vim.o.complete = ".,w,b,k"
vim.o.completeopt = "menu,menuone,noselect,preview"

vim.o.showmatch = true
vim.o.matchtime = 2

vim.o.fileformats = "unix,dos,mac"
vim.opt.fileencodings = { "utf-8", "gb2312", "gb18030", "ucs-bom", "latin1", "cp936", "big5" }
vim.o.fileencoding = "utf-8"
vim.o.encoding = "utf-8"

vim.o.undofile = true

vim.opt.sessionoptions = { "blank", "curdir", "folds", "help", "tabpages", "winpos" }

vim.o.mouse = "a"
vim.o.syntax = "on"

vim.cmd("set guioptions-=egmrLT")
vim.o.background = "dark"
vim.o.termguicolors = true
vim.o.guifont = "Hack_NF:h15"
