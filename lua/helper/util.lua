local M = {}

M.Map = function (mode, hls, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, hls, rhs, options)
end

M.WhichKeyOpts = function (desc)
    return vim.tbl_extend("force", { noremap = true, silent = true }, { desc = desc })
end

return M