local base16_colors = require("base16-colorscheme").colors
local custom_base16 = require("lualine.themes.base16")

custom_base16={
	normal = {
		a = {
			bg = base16_colors.base00,
			fg = base16_colors.base06,
			gui = "bold",
		},
		b = {
			bg = base16_colors.base00,
			fg = base16_colors.base06,
		},
		c = {
			bg = base16_colors.base00,
			fg = base16_colors.base06,
		},
	},
	insert = {
		a = {
			bg = base16_colors.base00,
			fg = base16_colors.base06,
			gui = "bold",
		},
		b = {
			bg = base16_colors.base00,
			fg = base16_colors.base06,
		},
		c = {
			bg = base16_colors.base00,
			fg = base16_colors.base06,
		},
	},
	visual = {
		a = {
			bg = base16_colors.base00,
			fg = base16_colors.base06,
			gui = "bold",
		},
		b = {
			bg = base16_colors.base00,
			fg = base16_colors.base06,
		},
		c = {
			bg = base16_colors.base00,
			fg = base16_colors.base06,
		},
	},
	replace = {
		a = {
			bg = base16_colors.base00,
			fg = base16_colors.base06,
			gui = "bold",
		},
		b = {
			bg = base16_colors.base00,
			fg = base16_colors.base06,
		},
		c = {
			bg = base16_colors.base00,
			fg = base16_colors.base06,
		},
	},
}
      require("lualine").setup({ options = { theme = custom_base16 } })
