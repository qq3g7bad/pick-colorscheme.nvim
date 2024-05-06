# 🎨pick-colorscheme.nvim

Select a colorscheme as if drawing lots.

## Usage

### Initial settings

Put something like this in your configuration lua file:

```lua
require("pick-colorscheme").setup()
```

If you use .vimrc, write like this

```vim
lua require("pick-colorscheme").setup()
```

You can apply pick-colorscheme. Run this command in vim.

```vim
:PickColorscheme
```

### Select colorschemes

If you want to limit colorschemes to pick, run this command in vim. In
this case, the colorscheme will be selected from either "blue" or "default".

```vim
:lua require("pick-colorscheme").pick_colorscheme({"blue", "default"})
```
