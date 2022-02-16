require("indent_guides").setup({
	-- default options
	indent_levels = 30,
	indent_guide_size = 1,
	indent_start_level = 1,
	indent_enable = true,
	indent_space_guides = true,
	indent_tab_guides = true,
	indent_soft_pattern = "\\s",
	exclude_filetypes = { "help", "dashboard", "dashpreview", "NvimTree", "vista", "sagahover", "packer" },
	even_colors = { fg = "#2F334C", bg = "#2F334C" },
	odd_colors = { fg = "#1F2233", bg = "#1F2233" },
})
