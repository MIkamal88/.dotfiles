local Icon = require("config.icons")
local Util = require("utils.util")

return {
	{
		"rcarriga/nvim-notify",
		keys = {
			{
				"<leader>n",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "Delete all Notifications",
			},
		},
		opts = {
			icons = {
				ERROR = Icon.diagnostics.error .. " ",
				INFO = Icon.diagnostics.info .. " ",
				WARN = Icon.diagnostics.warn .. " ",
			},
			timeout = 3000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
		},
		init = function()
			if not Util.has("noice.nvim") then
				Util.on_very_lazy(function()
					vim.notify = require("notify")
				end)
			end
		end,
	},
	{
		"echasnovski/mini.icons",
		lazy = true,
		opts = {},
		init = function()
			package.preload["nvim-web-devicons"] = function()
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
	},
	{
		"notken12/base46-colors",
		config = function()
			vim.cmd("colorscheme kanagawa")
			local c = require("rxyhn.palette")
			c.base08 = "#f26e74"
			local hl = vim.api.nvim_set_hl
			hl(0, "NeoTreeDirectoryIcon", { fg = c.yellow, bg = "NONE" })
			hl(0, "NeoTreeDirectoryName", { fg = c.yellow, bg = "NONE" })
			hl(0, "NeoTreeGitModified", { fg = c.yellow, bg = "NONE" })
			hl(0, "Identifier", { fg = "#f2cdcd", bg = "NONE", sp = "NONE" })
			hl(0, "DiagnosticError", { fg = c.base08, bg = "NONE" })
			hl(0, "LspDiagnosticsDefaultError", { fg = c.base08, bg = "NONE" })
			hl(0, "LspDiagnosticsVirtualTextError", { fg = c.base08, bg = "NONE" })
			hl(0, "LspDiagnosticsFloatingError", { fg = c.base08, bg = "NONE" })
			hl(0, "DiagnosticSignError", { fg = c.base08, bg = "NONE" })
			hl(0, "LspDiagnosticsSignError", { fg = c.base08, bg = "NONE" })
			hl(0, "LspDiagnosticsError", { fg = c.base08, bg = "NONE" })
			hl(0, "CursorLine", { fg = "NONE", bg = c.one_bg2 })
			hl(0, "GitSignsCurrentLineBlame", { fg = "#061115" })
			hl(0, "String", { fg = "#82c29c", bg = "NONE" })
			hl(0, "IblScope", { fg = c.base0E, bg = "NONE" })
			hl(0, "guibg", { fg = "NONE", bg = "NONE" })
			hl(0, "Normal", { fg = "NONE", bg = "NONE" })
			hl(0, "NormalNC", { fg = "NONE", bg = "NONE" })
		end,
	},
}
