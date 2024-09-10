return {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"clangd",
				"clang-format",
				"codelldb",
				"pyright",
				"debugpy",
			},
		},
	},
	{
		"grapp-dev/nui-components.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"alexghergh/nvim-tmux-navigation",
		event = "VeryLazy",
		config = function()
			local nvim_tmux_nav = require("nvim-tmux-navigation")
			nvim_tmux_nav.setup({
				disable_when_zoomed = true,
				-- defaults to false
				keybindings = {
					left = "<C-h>",
					down = "<C-j>",
					up = "<C-k>",
					right = "<C-l>",
					last_active = "<C-\\>",
					next = "<C-Space>",
				},
			})
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			filter = {
				event = "notify",
				find = "No active Snippet",
			},
			cmdline = {
				enabled = true,
				view = "cmdline",
				format = {
					cmdline = { icon = "  " },
					search_down = { icon = "  󰄼" },
					search_up = { icon = "  " },
					lua = { icon = "  " },
				},
			},
			lsp = {
				progress = { enabled = true },
				hover = { enabled = false },
				signature = { enabled = false },
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						find = "%d+L, %d+B",
					},
				},
			},
		},
	},
}
