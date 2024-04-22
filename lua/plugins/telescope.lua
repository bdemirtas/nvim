return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dpendencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			local map = require("helper.util").Map
			-- find
			map("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
			map("n", "<leader>ff", builtin.find_files, { desc = "Find Files (Root Dir)" })
			map("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
			map("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
			map("n", "<leader>fr", builtin.oldfiles, { desc = "Recent" })
			-- git
			map("n", "<leader>gc", builtin.git_commits, { desc = "Commits" })
			map("n", "<leader>gs", builtin.git_status, { desc = "Status" })
			-- search
			map("n", '<leader>s"', builtin.registers, { desc = "Registers" })
			map("n", "<leader>sa", builtin.autocommands, { desc = "Auto Commands" })
			map("n", "<leader>sb", builtin.current_buffer_fuzzy_find, { desc = "Buffer" })
			map("n", "<leader>sc", builtin.command_history, { desc = "Command History" })
			map("n", "<leader>sC", builtin.commands, { desc = "Commands" })
			map("n", "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", { desc = "Document Diagnostics" })
			map("n", "<leader>sH", builtin.highlights, { desc = "Search Highlight Groups" })
			map("n", "<leader>sD", builtin.diagnostics, { desc = "Workspace Diagnostics" })
			map("n", "<leader>sh", builtin.help_tags, { desc = "Help Pages" })
			map("n", "<leader>sk", builtin.keymaps, { desc = "Key Maps" })
			map("n", "<leader>sM", builtin.man_pages, { desc = "Man Pages" })
			map("n", "<leader>sm", builtin.marks, { desc = "Jump to Mark" })
			map("n", "<leader>so", builtin.vim_options, { desc = "Options" })
			map("n", "<leader>sR", builtin.resume, { desc = "Resume" })
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<C-h>"] = "which_key",
						},
					},
				},
				pickers = {},
				extensions = {},
			})
		end,
	},
}
