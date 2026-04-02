Flamaster Color Scheme
===

A color scheme with minimal highlighting for Neovim, using a palette inspired by [Tokyo Night](https://github.com/folke/tokyonight.nvim).

## Motivation
(from the original [Sublime Text theme](https://github.com/tonsky/sublime-scheme-flamaster))

Most color schemes highlight everything they can, ending up looking like a fireworks show.

Instead, Flamaster uses minimal highlighting. The **light mode** follows the original four-class design:

1. **Strings** (green)
2. **All statically known constants** — numbers, symbols, boolean values (purple)
3. **Comments** (red — bright, prominent)
4. **Global definitions** (blue)

The **dark mode** (Tokyo Night palette) extends this with two additional classes for better visual distinction:

5. **Keywords** — `if`, `else`, `function`, `return`, etc. (purple `#9d7cd8`)
6. **Literals** — booleans, numbers, `nil`/`null` (orange `#ff9e64`), separated from other constants like decorators and symbols which stay magenta (`#bb9af7`)

Additionally, dark mode comments default to a muted grey (`#565f89`, matching Tokyo Night) rather than bright amber. Set `g:flamaster_bright_comments` to restore the prominent amber style.

Other design principles:

- **Light mode** does not highlight standard language keywords (`if`, `else`, `function`, etc). They are usually the least important and most obvious part of any program. **Dark mode** gives keywords a subtle purple to better match Tokyo Night's visual language.

- **Light mode** highlights comments prominently (red). If code was complex enough to deserve an explanation, that explanation should be the first thing you see. **Dark mode** uses muted grey by default (configurable).

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
| `g:flamaster_bright_comments` | `false` | **Dark mode only.** When `true`, comments use bright amber (`#e0af68`) instead of the default muted grey (`#565f89`) |
| `g:flamaster_dim_comments` | `false` | **Light mode only.** When `true`, comments are dimmed to grey instead of highlighted red |
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
| Tiltfile / Starlark | Function definitions; Tiltfile built-ins (`k8s_resource`, `docker_build`, etc.) as definitions; `True`/`False`/`None` as constants; decorators |
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

## Try it yourself

The best way to experience Flamaster is to install it and open your own code. Static screenshots can't capture how the minimal highlighting philosophy feels in practice — give it a try and see how quickly your eyes adjust to finding what matters.

## See also

- [dchinmay2/alabaster.nvim](https://github.com/dchinmay2/alabaster.nvim) — the original Alabaster theme ported to Neovim

## Thanks
- [tonsky](https://github.com/tonsky) for the original Flamaster theme and its philosophy
- [folke](https://github.com/folke) for Tokyo Night, whose palette the dark mode is based on
- [projekt0n/github-nvim-theme](https://github.com/projekt0n/github-nvim-theme) for diff colours
