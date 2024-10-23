require "nvchad.mappings"

local map = vim.keymap.set

vim.keymap.del("n", "<C-c>")

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Buffers
map("n", "<S-h>", require("nvchad.tabufline").prev, { desc = "Prev Buffer" })
map("n", "<S-l>", require("nvchad.tabufline").next, { desc = "Next Buffer" })
map("n", "<leader>x", require("nvchad.tabufline").close_buffer, { desc = "Close Buffer" })
map("n", "<leader>ba", function()
  require("nvchad.tabufline").closeAllBufs(true)
end, { desc = "Close All Buffers Exclude Current" })
map("n", "<leader>ba", function()
  require("nvchad.tabufline").closeAllBufs(false)
end, { desc = "Close All Buffers" })

-- indent
map("v", "<", "<gv", { noremap = true, silent = true })
map("v", ">", ">gv", { noremap = true, silent = true })
-- Normal mode
map("n", "<", "<<", { noremap = true, silent = true })
map("n", ">", ">>", { noremap = true, silent = true })

vim.api.nvim_set_keymap(
  "n",
  "<leader>m",
  [[:lua PreserveAndRunMacro('q')<CR>]],
  { noremap = true, desc = "PreserveAndRunMacro" }
)

function PreserveAndRunMacro(register)
  local saved_register = vim.fn.getreg '"'
  vim.cmd("normal! @" .. register)
  vim.fn.setreg('"', saved_register)
end

local groups = {
  c = { name = "🧔 [c]had" },
  f = { name = "🔍 [f]ind" },
  m = { name = "🔖 [m]arks"},
  g = { name = "󰊢, [g]it"},
}

require("which-key").register(groups, {prefix = "<leader>"})
