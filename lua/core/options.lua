local global = require("core.global")

local function bind_o(options)
	for name, value in pairs(options) do
		vim.o[name] = value
	end
end

local function load_options()
	local global_options = {
		termguicolors = true,
		mouse = "a",
		errorbells = true,
		visualbell = true,
		hidden = true,
		fileformats = "unix,mac,dos",
		magic = true,
		virtualedit = "block",
		encoding = "utf-8",
		fileencodings = "utf-8,gb2312,gb18030,ucs-bom,latin1,cp936,big5",
		viewoptions = "folds,cursor,curdir",
		sessionoptions = "curdir,help,tabpages,winsize",
		clipboard = "unnamed,unnamedplus",
		wildignorecase = true,
		wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",
		backup = false,
		writebackup = true,
		swapfile = true,
		directory = global.cache_dir .. "swag/",
		undodir = global.cache_dir .. "undo/",
		backupdir = global.cache_dir .. "backup/",
		viewdir = global.cache_dir .. "view/",
		spellfile = global.cache_dir .. "spell/en.uft-8.add",
		history = 2000,
		backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim",
		smarttab = true,
		timeout = true,
		ttimeout = true,
		timeoutlen = 500,
		ttimeoutlen = 10,
		updatetime = 2000,
		redrawtime = 1500,
		ignorecase = true,
		smartcase = true,
		incsearch = true,
		wrapscan = true,
		complete = ".,w,b,k",
		completeopt = "menu,menuone,noinsert,noselect,preview",
		showmatch = true,
		matchtime = 2,
		inccommand = "nosplit",
		grepprg = "rg --hidden --vimgrep --smart-case --",
		whichwrap = "h,l,<,>,[,],~",
		splitbelow = true,
		splitright = true,
		switchbuf = "useopen",
		backspace = "indent,eol,start",
		diffopt = "filler,iwhite,internal,algorithm:patience",
		jumpoptions = "stack",
		scrolloff = 2,
		sidescrolloff = 5, -- Need to set 'nowrap'
		list = true,
		listchars = "tab:»·,nbsp:+,trail:▫,extends:→,precedes:←",
		showtabline = 2,
		winwidth = 30,
		winminwidth = 10,
		pumheight = 15,
		helpheight = 12,
		previewheight = 12,
		showcmd = false,
		cmdheight = 2,
		cmdwinheight = 5,
		equalalways = false,
		laststatus = 2,
		display = "lastline",
		pumblend = 10,
		winblend = 10,
		hlsearch = false,
	}

	local bw_options = {
		undofile = true,
		synmaxcol = 2500,
		formatoptions = "1jcroql",
		textwidth = 0,
		expandtab = true,
		autoindent = true,
		tabstop = 2,
		shiftwidth = 2,
		smartindent = true,
		wrap = false,
		linebreak = true,
		number = true,
		relativenumber = true,
		cursorline = true,
		foldenable = true,
		foldlevel = 99,
		foldlevelstart = 99,
		signcolumn = "auto",
	}

	if global.is_mac then
		vim.g.clipboard = {
			name = "macOS-clipboard",
			copy = {
				["+"] = "pbcopy",
				["*"] = "pbcopy",
			},
			paste = {
				["+"] = "pbpaste",
				["*"] = "pbpaste",
			},
			cache_enabled = 0,
		}
		vim.g.python_host_prog = "/usr/bin/python"
		vim.g.python3_host_prog = "/usr/local/bin/python3"
	end
	bind_o(global_options)
	bind_o(bw_options)
end

load_options()
