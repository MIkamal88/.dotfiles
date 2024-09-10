-- command to toggle cheatsheet
vim.api.nvim_create_user_command("Cheatsheet", function()
	require("neo-tree.command").execute({ action = "close" })
	require("config.microchad.cheatsheet." .. require("config.microchad.mchadconfig").ui.cheatsheet.theme)()
end, {})
