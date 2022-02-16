local cmd = vim.cmd
vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_custom_shortcut = {
	last_session = "SPC s l",
	find_history = "SPC f h",
	find_file = "SPC f f",
	new_file = "SPC c n",
	change_colorscheme = "SPC t c",
	find_word = "SPC f a",
	book_marks = "SPC f b",
}
vim.g.dashboard_custom_shortcut_icon = {
	last_session = " ",
	find_history = "ﭯ ",
	find_file = " ",
	new_file = " ",
	change_colorscheme = " ",
	find_word = " ",
	book_marks = " ",
}
cmd([[
  nmap <Leader>ss :<C-u>SessionSave<CR>
  nmap <Leader>sl :<C-u>SessionLoad<CR>
  nnoremap <silent> <Leader>fo :DashboardFindHistory<CR>
  nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
  nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
  nnoremap <silent> <Leader>fw :DashboardFindWord<CR>
  nnoremap <silent> <Leader>fm :DashboardJumpMark<CR>
  nnoremap <silent> <Leader>n :DashboardNewFile<CR>
]])
