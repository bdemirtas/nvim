return
{
  -- {
  --   'SuperBo/fugit2.nvim',
  --   opts = {
  --     libgit2_path = "/usr/lib64/libgit2.so.1.7.2",
  --   },
  --   dependencies = {
  --     'MunifTanjim/nui.nvim',
  --     'nvim-tree/nvim-web-devicons',
  --     'nvim-lua/plenary.nvim',
  --     {
  --       'chrisgrieser/nvim-tinygit', -- optional: for Github PR view
  --       dependencies = { 'stevearc/dressing.nvim' }
  --     },
  --   },
  --   cmd = { 'Fugit2', 'Fugit2Graph' },
  --   keys = {
  --     { '<leader>F', mode = 'n', '<cmd>Fugit2<cr>' }
  --   }
  -- },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua",              -- optional
    },
    config = function()
      require('neogit').setup({
        vim.keymap.set("n", "<leader>gs", "<cmd>Neogit<CR>", { desc = "Status" }),
        -- vim.keymap.set("n", "<leader>gc", "<cmd>Neogit commit<CR>", { desc = "Commit" }),
      })
    end
  }
}
