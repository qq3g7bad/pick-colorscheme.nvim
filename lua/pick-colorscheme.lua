local RandomColorscheme = {}

RandomColorscheme.get_colorschemes = function()
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

RandomColorscheme.random_colorscheme = function(colorschemes)
    if (type(colorschemes) ~= "table") or (colorschemes[1] == nil) then
        colorschemes = RandomColorscheme.get_colorschemes()
    end
    local cs = colorschemes[(os.time() % #colorschemes) + 1]
    vim.api.nvim_command('colorscheme ' .. cs)
end

RandomColorscheme.setup = function()
    vim.api.nvim_create_user_command("RandomColorscheme",
        RandomColorscheme.random_colorscheme,
        {nargs = 0})
end

return RandomColorscheme
