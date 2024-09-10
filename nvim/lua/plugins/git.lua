local Util = require("utils.util")
return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "VeryLazy" },
		opts = {
			current_line_blame = true,
			current_line_blame_opts = {
				delay = 300,
			},
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
			preview_config = {
				border = Util.generate_borderchars("thick", "tl-t-tr-r-br-b-bl-l"), -- [ top top top - right - bottom bottom bottom - left ]
			},
		},
	},
}
