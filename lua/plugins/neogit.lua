return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",  -- required
    "sindrets/diffview.nvim", -- optional - Diff integration

    -- Only one of these is needed, not both.
    "nvim-telescope/telescope.nvim", -- optional
    "ibhagwan/fzf-lua",              -- optional
  },
  config = function()
    require('neogit').setup({
      vim.keymap.set("n", "<leader>gs", "<cmd>Neogit<CR>", { desc = "Status" }),
      vim.keymap.set("n", "<leader>gc", "<cmd>Neogit commit<CR>", { desc = "Commit" }),
    })
  end
}
