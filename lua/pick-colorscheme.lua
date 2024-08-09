-- =============================================================================
-- URL: https://github.com/qq3g7bad/pick-colorscheme.nvim
-- Filename: lua/pick-colorscheme.lua
-- Author: qq3g7bad
-- License: MIT License
-- =============================================================================

local PickColorscheme = {}

---
--- @brief Get a colorscheme table
---
PickColorscheme.get_colorschemes = function()
    local colorschemes = {}
    for _, path in ipairs(vim.api.nvim_list_runtime_paths()) do
        local colorscheme_path = path .. "/colors"
        local colorscheme_files = vim.fn.glob(colorscheme_path .. "/*.vim", false, true)
        for _, file in ipairs(colorscheme_files) do
            local colorscheme = vim.fn.fnamemodify(file, ":t:r")
            table.insert(colorschemes, colorscheme)
        end
    end
    return colorschemes
end

---
--- @brief Pick colorscheme from vim command line
--- @args  Colorschemes seperated by a whitespace
---
PickColorscheme.pick_colorscheme_from_command = function(colorscheme_args)
    if (colorscheme_args ~= "") then
        local color_table = {}
        for arg in (colorscheme_args):gmatch("%S+") do
            table.insert(color_table, arg)
        end
        PickColorscheme.pick_colorscheme(color_table)
    else
        PickColorscheme.pick_colorscheme()
    end
end

---
--- @brief  Pick colorscheme like drawing lots
--- @args   colorschemes [table](option) : A table includin colorscheme candidates
---
PickColorscheme.pick_colorscheme = function(colorschemes)
    if (type(colorschemes) ~= "table") or (colorschemes[1] == nil) then
        colorschemes = PickColorscheme.get_colorschemes()
    end
    local cs = colorschemes[(os.time() % #colorschemes) + 1]


    local is_cs_exist = false
    for _, value in ipairs(PickColorscheme.get_colorschemes()) do
        if value == cs then
            is_cs_exist = true
            break
        end
    end

    if (is_cs_exist == true) then
        vim.api.nvim_command('colorscheme ' .. cs)
    else
        vim.api.nvim_err_writeln('ERROR: "' .. cs .. '" does not exist.')
    end
    vim.api.nvim_command('color')
end

---
--- @brief Setup function for initializing
---
PickColorscheme.setup = function()
    vim.api.nvim_create_user_command("PickColorscheme",
        function(args)
            PickColorscheme.pick_colorscheme_from_command(args.args)
        end,
        {
            nargs = "?",
            complete="color"
        }
    )
end

return PickColorscheme
