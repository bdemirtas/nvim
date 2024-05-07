return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      enabled = vim.fn.executable "make" == 1,
      build = "make",
    },
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-media-files.nvim",
  },
  config = function()
    local builtin = require("telescope.builtin")
    local actions = require("telescope.actions")
    local map = require("helper.util").Map
    -- find
    map("n", "<leader>fB", ":Telescope file_browser<CR>", { desc = "File Browswer" })
    map("n", "<leader>ff", builtin.find_files, { desc = "Find Files (Root Dir)" })
    map("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
    map("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
    map("n", "<leader>fr", builtin.oldfiles, { desc = "Recent" })
    map("n", "<leader>fm", "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", { desc = "Media" })
    -- git
    -- map("n", "<leader>gc", builtin.git_commits, { desc = "Commits" })
    -- map("n", "<leader>gs", builtin.git_status, { desc = "Status" })
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
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-h>"] = "which_key",
            ["<C-N>"] = actions.cycle_history_next,
            ["<C-P>"] = actions.cycle_history_prev,
            ["<C-J>"] = actions.move_selection_next,
            ["<C-K>"] = actions.move_selection_previous,
          },
          n = { q = actions.close },
        },
      },
      pickers = {},
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        }
      },
    })
    telescope.load_extension('fzf')
    telescope.load_extension('file_browser')
    telescope.load_extension('media_files')
  end,
}
