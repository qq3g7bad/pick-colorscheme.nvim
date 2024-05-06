local PickColorscheme = {}

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

PickColorscheme.pick_colorscheme = function(colorschemes)
    if (type(colorschemes) ~= "table") or (colorschemes[1] == nil) then
        colorschemes = PickColorscheme.get_colorschemes()
    end
    local cs = colorschemes[(os.time() % #colorschemes) + 1]
    vim.api.nvim_command('colorscheme ' .. cs)
end

PickColorscheme.setup = function()
    vim.api.nvim_create_user_command("PickColorscheme",
        function(args)
            PickColorscheme.pick_colorscheme_from_command(args.args)
        end,
        {nargs = "?"})
end

return PickColorscheme
