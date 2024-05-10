-- =============================================================================
-- URL: https://github.com/qq3g7bad/pick-colorscheme.nvim
-- Filename: plugin/pick-colorscheme.lua
-- Author: qq3g7bad
-- License: MIT License
-- =============================================================================

if vim.g.loaded_pick_colorscheme then
    return
end
vim.g.loaded_pick_colorscheme = true

-- setup modules
require("pick-colorscheme").setup()

