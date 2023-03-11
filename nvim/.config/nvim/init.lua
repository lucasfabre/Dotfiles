vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.defer_fn(function()
	require("init-actual")
end, 0)

