# 🎨 pick-colorscheme.nvim

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A lightweight Neovim plugin that randomly selects a colorscheme from your collection - like drawing lots!

## ✨ Features

- 🎲 Randomly pick from all available colorschemes
- 🎯 Limit selection to specific colorschemes
- ⚡ Fast and lightweight (< 100 lines of Lua)
- 🔧 Simple API for Lua configuration

## 📋 Requirements

- Neovim >= 0.5.0

## 📦 Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "qq3g7bad/pick-colorscheme.nvim",
  config = function()
    require("pick-colorscheme").setup()
  end
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "qq3g7bad/pick-colorscheme.nvim",
  config = function()
    require("pick-colorscheme").setup()
  end
}
```

### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'qq3g7bad/pick-colorscheme.nvim'

" Add to your init.vim
lua require('pick-colorscheme').setup()
```

### Manual Installation

Clone the repository to your Neovim configuration directory:

```bash
git clone https://github.com/qq3g7bad/pick-colorscheme.nvim ~/.config/nvim/pack/plugins/start/pick-colorscheme.nvim
```

## 🎲 Usage

### Pick from all available colorschemes

Run this command to randomly select from all installed colorschemes:

```vim
:PickColorscheme
```

### Pick from specific colorschemes

Limit the selection to specific colorschemes:

```vim
:PickColorscheme blue default gruvbox
```

Or use the Lua API:

```lua
:lua require("pick-colorscheme").pick_colorscheme({"blue", "default", "gruvbox"})
```

### Use in your configuration

You can add this to your `init.lua` to set a random colorscheme on startup:

```lua
require("pick-colorscheme").setup()
require("pick-colorscheme").pick_colorscheme()
```

Or pick from your favorite colorschemes:

```lua
require("pick-colorscheme").setup()
require("pick-colorscheme").pick_colorscheme({"tokyonight", "gruvbox", "catppuccin"})
```

## 🔍 How It Works

The plugin scans all runtime paths for colorscheme files (both `.vim` and `.lua` formats) in the `colors/` directory. When you run `:PickColorscheme`, it uses Lua's `math.random()` with high-resolution timing to select a colorscheme, ensuring truly random selection even when called multiple times per second.

## 📝 License

MIT License - see [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Issues and pull requests are welcome!

## 👤 Author

[qq3g7bad](https://github.com/qq3g7bad)
