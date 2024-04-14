--  Show whitespaces
vim.opt.listchars = 'tab:>·,trail:~,extends:>,precedes:<,space:·'
vim.opt.list = true
vim.opt.hidden = true
vim.opt.wrap = false
vim.opt.wildmenu = true
vim.opt.showcmd = true
vim.opt.hlsearch = true
vim.opt.smartcase = true
vim.opt.backspace = 'indent,eol,start'
vim.opt.autoindent = true
-- vim.opt.ruler = true
-- vim.opt.laststatus = 1
vim.opt.confirm = true
vim.opt.visualbell = true
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.timeout = true
vim.opt.ttimeout = true
vim.opt.ttimeoutlen= 200
vim.opt.pastetoggle = '<F11>'
vim.opt.termguicolors = true

-- clipboard provider
vim.opt.clipboard:append("unnamedplus")

--
-- Language specific config
--

-- Markdown
vim.g.markdown_fenced_languages = { 'html', 'python', 'ruby', 'vim', 'bash=sh' }

