# 🎨pick-colorscheme.nvim

Select a colorscheme as if drawing lots.

## 🎲Usage

You can select a colorscheme randomly. Run this command in vim.

```vim
:PickColorscheme
```

### 💡Select colorschemes

If you want to limit colorschemes to pick, run this command in vim. In
this case, the colorscheme will be selected from either "blue" or "default".

```vim
:PickColorscheme blue default
```

Or

```lua
:lua require("pick-colorscheme").pick_colorscheme({"blue", "default"})
```
