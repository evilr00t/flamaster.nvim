Flamaster Color Scheme
===

A color scheme with minimal highlighting for Neovim, using a palette inspired by [Tokyo Night](https://github.com/folke/tokyonight.nvim).

## Motivation
(from the original [Sublime Text theme](https://github.com/tonsky/sublime-scheme-flamaster))

Most color schemes highlight everything they can, ending up looking like a fireworks show.

Instead, Flamaster uses minimal highlighting; it defines just four classes:

1. Strings
2. All statically known constants (numbers, symbols, keywords, boolean values)
3. Comments
4. Global definitions

Additionally:

- Flamaster does not highlight standard language keywords (`if`, `else`, `function`, etc). They are usually the least important and most obvious part of any program.

- Flamaster highlights comments. Most schemes try to dim comments using low-contrast greys. If code was complex enough to deserve an explanation, that explanation should be the first thing you see.

- Flamaster doesn't use font variations. It's hard to scan code when it jumps between normal, **bold** and *italics*. Also, not all fonts provide bold/italic variants.

- Having a minimal set of rules means you can consciously use them to find exactly what you need. You can remember all the rules: if you're looking for a string, you know to look for a green token, and all strings pop out because very little else is highlighted.

- Flamaster only highlights things that the parser can identify reliably. Partial or unreliable highlighting trains your brain to second-guess itself.

## NOTE
This is designed with Neovim's built-in treesitter highlighting in mind (`nvim-treesitter` is optional but recommended for parser management). There is some fallback highlighting for the built-in highlight groups, but the intended use is with treesitter. **Queries for many languages are bundled.** Please contribute queries if you can, following [these rules](https://github.com/tonsky/sublime-scheme-flamaster#motivation).

## Usage

> **Requires Neovim 0.10+** (uses modern `@` capture groups; legacy `TS*` highlight groups have been removed).

```vim
set termguicolors
colorscheme flamaster
```

The TUI will likely detect your terminal background and set `background` accordingly. To force a mode:
```vim
set background=dark   " Tokyo Night palette
set background=light  " original Flamaster palette
```

## Configuration

| Option | Default | Description |
|--------|---------|-------------|
| `g:flamaster_dim_comments` | `false` | When `true`, comments are dimmed instead of highlighted bright |
| `g:flamaster_floatborder` | `false` | When `true`, floating window borders have a visible foreground color and the background matches `Normal`. When `false`, borders are invisible (background matches popup menus) |

## Treesitter language support

Bundled query overrides for:

| Language | Notes |
|----------|-------|
| Bash | Function definitions, shebangs |
| C / C++ | Function declarators, type definitions, structs, enums |
| C# | Types, constructors, methods, properties, namespaces |
| Clojure | `defn`/`defmacro`/`defprotocol`/`defrecord`/`def`/`defmethod` names, `ns` declarations, keywords; `extend-type`/`extend-protocol`, `letfn`, `reify`/`proxy` |
| Common Lisp | Function definitions |
| Dockerfile | `FROM` image/alias, `ENV`/`ARG`/`LABEL` as definitions, `EXPOSE` as constants |
| Elm | Type and function annotations |
| Fennel | Macro definitions |
| Fish | Function definitions, global variable assignments, shebangs |
| Go | Package, function, method, type (`struct`/`interface`/alias), const/var declarations; `iota`/`nil` as constants; interface method specs, struct field tags, short variable declarations |
| HCL | Block labels, attribute keys, function calls |
| Hare | Function and type declarations |
| Helm | Extends YAML; `Values`/`Chart`/`Release`/`Capabilities` as constants; template action names, pipeline functions |
| Java | Classes, constructors, methods, packages |
| JavaScript | Function declarations, arrow functions |
| JSON | Object keys |
| Kotlin | Functions, classes, literals; annotations as punctuation |
| Lua | Function declarations and assignments, table field names |
| Make | Target names, variable assignment names, automatic variables |
| Python | Functions, classes, decorators; `None`/`True`/`False` as constants; shebangs; type aliases (PEP 695), `__all__` exports, exception handler variables |
| Ruby | Methods, classes, modules, symbols, instance variables |
| Rust | Functions, structs, enums, traits, impls, macros; generic angle brackets as punctuation |
| Scala | Functions, classes, objects, traits, packages |
| Terraform | Extends HCL; `var`/`local`/`module`/`data` namespaces and type keywords as constants; `moved`/`import`/`check` blocks, `lifecycle` inner block keywords |
| TOML | Table/array table headers as definitions, dotted keys, top-level pair keys |
| TypeScript | Interfaces, methods, functions, type aliases |
| Vim script | Function definitions |
| YAML | Mapping keys as definitions; anchors, aliases, tags as constants |
| Zig | Function declarations |

## Themed plugins
- [folke/noice.nvim](https://github.com/folke/noice.nvim)
- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [ibhagwan/fzf-lua](https://github.com/ibhagwan/fzf-lua)
- [echasnovski/mini.nvim](https://github.com/echasnovski/mini.nvim) (`mini.pick`)
- [NeogitOrg/neogit](https://github.com/NeogitOrg/neogit)
- [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
- [mhinz/vim-startify](https://github.com/mhinz/vim-startify)
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [andymass/vim-matchup](https://github.com/andymass/vim-matchup)
- [phaazon/hop.nvim](https://github.com/phaazon/hop.nvim)
- [ggandor/lightspeed.nvim](https://github.com/ggandor/lightspeed.nvim)
- [p00f/nvim-ts-rainbow](https://github.com/p00f/nvim-ts-rainbow)
- [mizlan/iswap.nvim](https://github.com/mizlan/iswap.nvim) — use `ISwapSnipe` for `hl_snipe` and `ISwapGrey` for `hl_grey`
- [kristijanhusak/vim-dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui)
- [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap) (via nvim-dap-virtual-text)
- [folke/snacks.nvim](https://github.com/folke/snacks.nvim) (dashboard, notifier, indent)
- [saghen/blink.cmp](https://github.com/saghen/blink.cmp)
- [MeanderingProgrammer/render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)

## Screenshots

Rust
![rust-dark](https://user-images.githubusercontent.com/36493671/151688511-c5d31f0d-80e7-4bee-a148-0171a608e5f2.png)
![rust-light](https://user-images.githubusercontent.com/36493671/196017694-35155cb4-aabf-4a21-a6ec-83bab6b620a8.png)

Telescope
![telescope-dark](https://user-images.githubusercontent.com/36493671/151688522-c2d3a5d9-f97f-4eba-9b28-f562eebd2491.png)
![telescope-light](https://user-images.githubusercontent.com/36493671/196017714-75c15a62-c918-4199-89b1-3f092fb3b483.png)

Neogit (also shows `DiffAdd` and `DiffDelete`)
![swappy-20220130-112712](https://user-images.githubusercontent.com/36493671/151688542-657660cc-5478-4341-9ee1-553977e45408.png)

diffview.nvim (also shows `DiffChange` and `DiffText`)
![swappy-20220130-112534](https://user-images.githubusercontent.com/36493671/151688555-cdfd45c6-4e9e-48fe-bb0c-3c5191de9906.png)

C++
![cpp-dark](https://user-images.githubusercontent.com/36493671/151689029-32c664ac-5514-46cf-9326-70b208849e5c.png)
![cpp-light](https://user-images.githubusercontent.com/36493671/196017922-e6c5546b-5fc1-43e0-9d60-8cb07f07bfc6.png)

Fennel
![fennel-dark](https://user-images.githubusercontent.com/36493671/151689036-56eb672d-f3ec-4784-aa62-582be472310d.png)
![fennel-light](https://user-images.githubusercontent.com/36493671/196017739-1dafb70d-1474-48fb-a019-b64a25e8b946.png)

Clojure
![image](https://user-images.githubusercontent.com/36493671/159711835-cf18d1c4-6940-414a-830b-a7096268b014.png)

Help
![help-dark](https://user-images.githubusercontent.com/36493671/151689040-8eeeabdd-2aaa-418c-a3ab-8a7e09596abc.png)
![help-light](https://user-images.githubusercontent.com/36493671/196017663-966f361e-1548-4ab0-b8b7-6801d7dc3e30.png)

## Flamaster for other tools
- [wezterm](https://gist.github.com/p00f/ed538cf8a811184b23e065c0a5d3fc36)
- [kitty](https://gist.github.com/p00f/ff17b05ff918559852ca7cb9d89432c1)
- [alacritty](https://gist.github.com/p00f/37173508c85e33a4efa7aa394c0b763f)
- [zathura](https://gist.github.com/p00f/aad0abbd3a9cef67562a8ea1aadd2a2e)
- [wofi](https://gist.github.com/p00f/46f41a8c2d85e5edf13fcd38ed130faa)
- [fzf/skim](https://gist.github.com/p00f/9d159123c78cbcf8e716c362cfd4eb2b) (uses fish shell)

## Thanks
- [tonsky](https://github.com/tonsky) for the original Flamaster theme and its philosophy
- [folke](https://github.com/folke) for Tokyo Night, whose palette the dark mode is based on
- [projekt0n/github-nvim-theme](https://github.com/projekt0n/github-nvim-theme) for diff colours
