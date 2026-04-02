# Tokyo Night Convergence Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Bring flamaster.nvim dark mode closer to Tokyo Night's spirit with 3 targeted changes: muted comments, purple keywords, and orange literals.

**Architecture:** All changes are in `colors/flamaster.lua` (the single theme file) and 22 treesitter query files under `after/queries/`. Dark mode only for comments/keywords; light mode unchanged except literal colors. No new files created.

**Tech Stack:** Lua (Neovim colorscheme), Scheme (treesitter queries)

---

### Task 1: Comments — bright amber to muted grey (dark mode only)

**Files:**
- Modify: `colors/flamaster.lua:42-64` (dark mode color vars and comment toggle)

- [ ] **Step 1: Change dark mode default comment color**

In `colors/flamaster.lua`, change the dark mode `comment` variable and replace the `dim_comments` toggle with `bright_comments`:

```lua
-- BEFORE (lines 42-43, 64):
    local comment = "#e0af68"
    local dim_comment = "#414868"
    ...
    local comment_fg = vim.g.flamaster_dim_comments and dim_comment or comment

-- AFTER:
    local comment = "#565f89"
    local dim_comment = "#414868"
    ...
    local comment_fg = vim.g.flamaster_bright_comments and "#e0af68" or comment
```

This changes:
- Default comment color from `#e0af68` (amber) to `#565f89` (TN muted grey)
- Toggle from `g:flamaster_dim_comments` to `g:flamaster_bright_comments` (opt-in for old amber)
- `dim_comment` (`#414868`) stays untouched — used for NonText, hashbang, UI elements

- [ ] **Step 2: Verify light mode is unchanged**

Confirm that `colors/flamaster.lua:496-517` (light mode) still uses:
```lua
    local comment = "#aa3731"        -- unchanged bright red
    local dim_comment = "#696969"    -- unchanged dim grey
    local comment_fg = vim.g.flamaster_dim_comments and dim_comment or comment  -- unchanged toggle name
```

Light mode keeps `g:flamaster_dim_comments` — only dark mode changes to `g:flamaster_bright_comments`.

- [ ] **Step 3: Commit**

```bash
git add colors/flamaster.lua
git commit -m "feat(dark): change default comments to muted grey (#565f89)

Replace bright amber comments with Tokyo Night's muted grey.
New opt-in: g:flamaster_bright_comments to restore amber.
Light mode unchanged."
```

---

### Task 2: Keywords — plain foreground to purple (dark mode only)

**Files:**
- Modify: `colors/flamaster.lua:30-68` (add keyword_fg variable)
- Modify: `colors/flamaster.lua:149-166` (SYNTAX II groups)
- Modify: `colors/flamaster.lua:210-231` (treesitter @keyword groups)
- Modify: `colors/flamaster.lua:423-461` (LSP semantic token groups)

- [ ] **Step 1: Add keyword_fg variable in dark mode**

After `const_fg` (line 34), add the new keyword color variable:

```lua
-- BEFORE (lines 33-34):
    local def_fg = "#7aa2f7"
    local const_fg = "#bb9af7"

-- AFTER:
    local def_fg = "#7aa2f7"
    local const_fg = "#bb9af7"
    local keyword_fg = "#9d7cd8"
```

- [ ] **Step 2: Update SYNTAX II groups in dark mode**

Change keyword-related vim syntax groups from `ansi.white` to `keyword_fg`:

```lua
-- BEFORE (lines 152-159):
        Statement = { fg = ansi.white },
        Conditional = { fg = ansi.white },
        Repeat = { fg = ansi.white },
        ...
        Keyword = { fg = ansi.white },
        Exception = { fg = ansi.white },
        ...
        Include = { fg = ansi.white },

-- AFTER:
        Statement = { fg = keyword_fg },
        Conditional = { fg = keyword_fg },
        Repeat = { fg = keyword_fg },
        ...
        Keyword = { fg = keyword_fg },
        Exception = { fg = keyword_fg },
        ...
        Include = { fg = keyword_fg },
```

Groups to change (6 total): `Statement`, `Conditional`, `Repeat`, `Keyword`, `Exception`, `Include`.

Groups that stay `ansi.white`: `Identifier`, `PreProc`, `Define`, `Macro`, `PreCondit`, `Type`, `StorageClass`.
Groups that stay `def_fg`: `Function`, `Label`, `Structure`, `Typedef`.

- [ ] **Step 3: Update treesitter @keyword groups in dark mode**

Change all keyword-related treesitter groups from `ansi.white` to `keyword_fg`:

```lua
-- BEFORE (lines 212, 215, 220-222, 231):
        ["@keyword.conditional"] = { fg = ansi.white },
        ["@keyword.exception"] = { fg = ansi.white },
        ["@keyword"] = { fg = ansi.white },
        ["@keyword.function"] = { fg = ansi.white },
        ["@keyword.operator"] = { fg = ansi.white },
        ["@keyword.repeat"] = { fg = ansi.white },

-- AFTER:
        ["@keyword.conditional"] = { fg = keyword_fg },
        ["@keyword.exception"] = { fg = keyword_fg },
        ["@keyword"] = { fg = keyword_fg },
        ["@keyword.function"] = { fg = keyword_fg },
        ["@keyword.operator"] = { fg = keyword_fg },
        ["@keyword.repeat"] = { fg = keyword_fg },
```

Also change `@module` and `@constructor` (these map to keyword-adjacent concepts in TN):

```lua
        ["@module"] = { fg = ansi.white },       -- stays: modules aren't keywords
        ["@constructor"] = { fg = ansi.white },   -- stays: constructors aren't keywords
```

Only the 6 `@keyword*` groups change. Everything else stays `ansi.white`.

- [ ] **Step 4: Update LSP semantic keyword token in dark mode**

```lua
-- BEFORE (line 448):
        ["@lsp.type.keyword"] = { fg = fg },

-- AFTER:
        ["@lsp.type.keyword"] = { fg = keyword_fg },
```

- [ ] **Step 5: Verify light mode is unchanged**

Confirm `colors/flamaster.lua:604-621` (SYNTAX II) and `665-687` (treesitter) and `876-914` (LSP) still use `ansi.black` for all keyword groups. No changes to light mode.

- [ ] **Step 6: Commit**

```bash
git add colors/flamaster.lua
git commit -m "feat(dark): add purple keyword highlighting (#9d7cd8)

Keywords (if/else/for/return/function/etc.) now use Tokyo Night's
purple instead of plain foreground. Applies to vim syntax groups,
treesitter @keyword.*, and LSP semantic tokens. Light mode unchanged."
```

---

### Task 3: Literals — add @FlamasterLiteral group and orange color (both modes)

**Files:**
- Modify: `colors/flamaster.lua:30-68` (add literal_fg in dark mode)
- Modify: `colors/flamaster.lua:140-147` (SYNTAX I: Number, Boolean, Float, Character)
- Modify: `colors/flamaster.lua:266-272` (add @FlamasterLiteral custom capture)
- Modify: `colors/flamaster.lua:482-529` (add literal_fg in light mode)
- Modify: `colors/flamaster.lua:595-601` (SYNTAX I light mode)
- Modify: `colors/flamaster.lua:722-728` (add @FlamasterLiteral light mode)

- [ ] **Step 1: Add literal_fg variable in dark mode**

After the new `keyword_fg` line (from Task 2), add:

```lua
    local keyword_fg = "#9d7cd8"
    local literal_fg = "#ff9e64"
```

- [ ] **Step 2: Update SYNTAX I groups in dark mode**

```lua
-- BEFORE (lines 143-146):
        Character = { fg = const_fg },
        Number = { fg = const_fg },
        Boolean = { fg = const_fg },
        Float = { fg = const_fg },

-- AFTER:
        Character = { fg = literal_fg },
        Number = { fg = literal_fg },
        Boolean = { fg = literal_fg },
        Float = { fg = literal_fg },
```

`Constant` stays `const_fg` (purple) — it's the parent group for non-literal constants.

- [ ] **Step 3: Add @FlamasterLiteral custom capture in dark mode**

After `@FlamasterConstant` (line 268):

```lua
-- BEFORE (lines 267-272):
        ["@FlamasterBase"] = { fg = ansi.white },
        ["@FlamasterConstant"] = { fg = const_fg },
        ["@FlamasterDefinition"] = { fg = def_fg },

-- AFTER:
        ["@FlamasterBase"] = { fg = ansi.white },
        ["@FlamasterConstant"] = { fg = const_fg },
        ["@FlamasterLiteral"] = { fg = literal_fg },
        ["@FlamasterDefinition"] = { fg = def_fg },
```

- [ ] **Step 4: Add literal_fg variable in light mode**

In light mode color vars (after `const_fg` around line 487):

```lua
    local const_fg = "#7a3e9d"
    local literal_fg = "#b5600e"
```

Using `#b5600e` — a warm burnt orange that has good contrast against `#f7f7f7` background. This is a darkened version of `#ff9e64` suitable for light backgrounds.

- [ ] **Step 5: Update SYNTAX I groups in light mode**

```lua
-- BEFORE (lines 598-601):
        Character = { fg = const_fg },
        Number = { fg = const_fg },
        Boolean = { fg = const_fg },
        Float = { fg = const_fg },

-- AFTER:
        Character = { fg = literal_fg },
        Number = { fg = literal_fg },
        Boolean = { fg = literal_fg },
        Float = { fg = literal_fg },
```

- [ ] **Step 6: Add @FlamasterLiteral custom capture in light mode**

After `@FlamasterConstant` (line 724):

```lua
-- BEFORE (lines 723-725):
        ["@FlamasterBase"] = { fg = ansi.black },
        ["@FlamasterConstant"] = { fg = const_fg },
        ["@FlamasterDefinition"] = { fg = def_fg },

-- AFTER:
        ["@FlamasterBase"] = { fg = ansi.black },
        ["@FlamasterConstant"] = { fg = const_fg },
        ["@FlamasterLiteral"] = { fg = literal_fg },
        ["@FlamasterDefinition"] = { fg = def_fg },
```

- [ ] **Step 7: Commit**

```bash
git add colors/flamaster.lua
git commit -m "feat: add @FlamasterLiteral group with orange color

Number, Boolean, Float, Character now use orange (#ff9e64 dark,
#b5600e light) instead of purple. New @FlamasterLiteral treesitter
capture group for query files to use. @FlamasterConstant stays purple
for decorators, symbols, and other non-literal constants."
```

---

### Task 4: Update 8 full-replacement query files (@FlamasterConstant -> @FlamasterLiteral)

These files ONLY use `@FlamasterConstant` for boolean/nil/nullptr literals, so every occurrence changes.

**Files:**
- Modify: `after/queries/lua/highlights.scm`
- Modify: `after/queries/zig/highlights.scm`
- Modify: `after/queries/hare/highlights.scm`
- Modify: `after/queries/c/highlights.scm`
- Modify: `after/queries/fennel/highlights.scm`
- Modify: `after/queries/json/highlights.scm`
- Modify: `after/queries/rust/highlights.scm`
- Modify: `after/queries/cpp/highlights.scm`

- [ ] **Step 1: lua/highlights.scm — replace all @FlamasterConstant with @FlamasterLiteral**

```scheme
;; Boolean and nil constants
(true) @FlamasterLiteral
(false) @FlamasterLiteral
(nil) @FlamasterLiteral
```

- [ ] **Step 2: zig/highlights.scm — replace all**

```scheme
; Builtin constants
(true) @FlamasterLiteral
(false) @FlamasterLiteral
(null) @FlamasterLiteral
(undefined) @FlamasterLiteral
```

- [ ] **Step 3: hare/highlights.scm — replace all**

```scheme
; Builtin constants
(true) @FlamasterLiteral
(false) @FlamasterLiteral
(null) @FlamasterLiteral
```

- [ ] **Step 4: c/highlights.scm — replace all (3 occurrences)**

```scheme
(true) @FlamasterLiteral
(false) @FlamasterLiteral
(null) @FlamasterLiteral
```

- [ ] **Step 5: fennel/highlights.scm — replace all**

```scheme
; Builtin constants
(boolean) @FlamasterLiteral
(nil) @FlamasterLiteral
```

- [ ] **Step 6: json/highlights.scm — replace all**

```scheme
;; Boolean constants
(true) @FlamasterLiteral
(false) @FlamasterLiteral

;; Null constant
(null) @FlamasterLiteral
```

- [ ] **Step 7: rust/highlights.scm — replace the single occurrence**

```scheme
(boolean_literal) @FlamasterLiteral
```

- [ ] **Step 8: cpp/highlights.scm — replace all (3 occurrences)**

```scheme
(true) @FlamasterLiteral
(false) @FlamasterLiteral
(nullptr) @FlamasterLiteral
```

- [ ] **Step 9: Commit**

```bash
git add after/queries/lua/highlights.scm after/queries/zig/highlights.scm \
  after/queries/hare/highlights.scm after/queries/c/highlights.scm \
  after/queries/fennel/highlights.scm after/queries/json/highlights.scm \
  after/queries/rust/highlights.scm after/queries/cpp/highlights.scm
git commit -m "feat: update 8 query files to use @FlamasterLiteral

Languages: lua, zig, hare, c, fennel, json, rust, cpp.
These files only had boolean/nil/nullptr captures, so all
@FlamasterConstant usages become @FlamasterLiteral."
```

---

### Task 5: Update 6 split query files — batch 1 (go, kotlin, typescript, javascript)

These files have BOTH literal captures (change to @FlamasterLiteral) AND other constant captures (stay @FlamasterConstant).

**Files:**
- Modify: `after/queries/go/highlights.scm`
- Modify: `after/queries/kotlin/highlights.scm`
- Modify: `after/queries/typescript/highlights.scm`
- Modify: `after/queries/javascript/highlights.scm`

- [ ] **Step 1: go/highlights.scm — split literals from struct tags**

Change lines 44-56 (boolean/nil/number literals) to `@FlamasterLiteral`. Keep lines 72-75 (struct tags) as `@FlamasterConstant`.

```scheme
; Builtin constants
[
  (iota)
  (nil)
  (true)
  (false)
] @FlamasterLiteral

; Numeric and rune literals
(int_literal) @FlamasterLiteral
(float_literal) @FlamasterLiteral
(imaginary_literal) @FlamasterLiteral
(rune_literal) @FlamasterLiteral

; ... (struct field tags stay @FlamasterConstant) ...
; Struct field tags (backtick or quoted strings like `json:"name"`)
(field_declaration
  tag: (raw_string_literal) @FlamasterConstant)
(field_declaration
  tag: (interpreted_string_literal) @FlamasterConstant)
```

- [ ] **Step 2: kotlin/highlights.scm — split literals from annotation types**

Change lines 19-24 (boolean/null/number literals) to `@FlamasterLiteral`. Keep line 31 (annotation type) as `@FlamasterConstant`.

```scheme
;; Constants
(boolean_literal) @FlamasterLiteral
(null_literal) @FlamasterLiteral
(integer_literal) @FlamasterLiteral
(long_literal) @FlamasterLiteral
(unsigned_literal) @FlamasterLiteral
(real_literal) @FlamasterLiteral

;; Annotations (stays @FlamasterConstant)
(modifiers (annotation
  "@" @FlamasterPunct
  (user_type (type_identifier) @FlamasterConstant)))
```

- [ ] **Step 3: typescript/highlights.scm — split literals from decorators**

Change lines 20-25 (undefined/true/false/null) to `@FlamasterLiteral`. Keep lines 54-55 (decorator names) as `@FlamasterConstant`.

```scheme
(undefined) @FlamasterLiteral

;; Boolean and null constants
(true) @FlamasterLiteral
(false) @FlamasterLiteral
(null) @FlamasterLiteral

;; ... (decorator captures stay @FlamasterConstant) ...
;; Decorator syntax
(decorator "@" @FlamasterPunct)
(decorator (identifier) @FlamasterConstant)
(decorator (call_expression function: (identifier) @FlamasterConstant))
```

- [ ] **Step 4: javascript/highlights.scm — all become @FlamasterLiteral**

JS has no decorator captures (unlike TS), so all `@FlamasterConstant` usages change:

```scheme
(undefined) @FlamasterLiteral

;; Boolean and null constants
(true) @FlamasterLiteral
(false) @FlamasterLiteral
(null) @FlamasterLiteral
```

- [ ] **Step 5: Commit**

```bash
git add after/queries/go/highlights.scm after/queries/kotlin/highlights.scm \
  after/queries/typescript/highlights.scm after/queries/javascript/highlights.scm
git commit -m "feat: split @FlamasterLiteral in go, kotlin, ts, js queries

Boolean/null/number literals use @FlamasterLiteral (orange).
Struct tags, annotation types, decorator names stay @FlamasterConstant."
```

---

### Task 6: Update 5 split query files — batch 2 (python, starlark, ruby, java, scala)

**Files:**
- Modify: `after/queries/python/highlights.scm`
- Modify: `after/queries/starlark/highlights.scm`
- Modify: `after/queries/ruby/highlights.scm`
- Modify: `after/queries/java/highlights.scm`
- Modify: `after/queries/scala/highlights.scm`

- [ ] **Step 1: python/highlights.scm — split literals from decorators**

Change lines 33-35 (None/True/False) to `@FlamasterLiteral`. Keep lines 16-29 (decorator names) as `@FlamasterConstant`.

```scheme
; None/True/False as literals
(none) @FlamasterLiteral
(true) @FlamasterLiteral
(false) @FlamasterLiteral

; ... decorator captures stay @FlamasterConstant ...
```

- [ ] **Step 2: starlark/highlights.scm — split literals from decorators**

Change lines 7-9 (none/true/false) to `@FlamasterLiteral`. Keep decorator captures (lines 12-23) as `@FlamasterConstant`.

```scheme
; None/True/False as constants
(none) @FlamasterLiteral
(true) @FlamasterLiteral
(false) @FlamasterLiteral

; Decorators stay @FlamasterConstant
```

- [ ] **Step 3: ruby/highlights.scm — split literals from symbols**

Change lines 24-26 (true/false/nil) to `@FlamasterLiteral`. Keep lines 19-20 (symbols) as `@FlamasterConstant`.

```scheme
; Symbols stay @FlamasterConstant
((simple_symbol) @FlamasterConstant)
((hash_key_symbol) @FlamasterConstant)

;; Boolean and nil constants
(true) @FlamasterLiteral
(false) @FlamasterLiteral
(nil) @FlamasterLiteral
```

- [ ] **Step 4: java/highlights.scm — split literals from annotations**

Change lines 16-18 (true/false/null_literal) to `@FlamasterLiteral`. Keep lines 21-25 (annotation names) as `@FlamasterConstant`.

```scheme
;; Boolean/null constants
(true) @FlamasterLiteral
(false) @FlamasterLiteral
(null_literal) @FlamasterLiteral

;; Annotations stay @FlamasterConstant
```

- [ ] **Step 5: scala/highlights.scm — split literals from annotations**

Change lines 33-34 (boolean_literal/null_literal) to `@FlamasterLiteral`. Keep line 38 (annotation type) as `@FlamasterConstant`.

```scheme
;; Boolean/null constants
(boolean_literal) @FlamasterLiteral
(null_literal) @FlamasterLiteral

;; Annotations stay @FlamasterConstant
```

- [ ] **Step 6: Commit**

```bash
git add after/queries/python/highlights.scm after/queries/starlark/highlights.scm \
  after/queries/ruby/highlights.scm after/queries/java/highlights.scm \
  after/queries/scala/highlights.scm
git commit -m "feat: split @FlamasterLiteral in python, starlark, ruby, java, scala

Boolean/null/nil literals use @FlamasterLiteral (orange).
Decorator names, symbols, annotation types stay @FlamasterConstant."
```

---

### Task 7: Update 5 split query files — batch 3 (c_sharp, helm, clojure, terraform, hcl)

**Files:**
- Modify: `after/queries/c_sharp/highlights.scm`
- Modify: `after/queries/helm/highlights.scm`
- Modify: `after/queries/clojure/highlights.scm`
- Modify: `after/queries/terraform/highlights.scm`
- Modify: `after/queries/hcl/highlights.scm`

- [ ] **Step 1: c_sharp/highlights.scm — split literals from attributes**

Change lines 14-15 (boolean_literal/null_literal) to `@FlamasterLiteral`. Keep line 18 (attribute name) as `@FlamasterConstant`.

```scheme
;; Boolean/null constants
(boolean_literal) @FlamasterLiteral
(null_literal) @FlamasterLiteral

;; Attributes stay @FlamasterConstant
(attribute
  name: (identifier) @FlamasterConstant)
```

- [ ] **Step 2: helm/highlights.scm — split literals from built-in objects/functions**

Change lines 21-23 (true/false/nil) to `@FlamasterLiteral`. Keep lines 1-8 (built-in objects) and line 17 (function names) as `@FlamasterConstant`.

```scheme
; Boolean and nil literals
(true) @FlamasterLiteral
(false) @FlamasterLiteral
(nil) @FlamasterLiteral

; Built-in objects and function names stay @FlamasterConstant
```

- [ ] **Step 3: clojure/highlights.scm — split literals from keywords/symbols**

Change the final 2 lines (nil_lit/bool_lit) to `@FlamasterLiteral`. Keep all `kwd_lit` and `sym_lit` captures as `@FlamasterConstant`.

```scheme
; Keywords and symbols stay @FlamasterConstant
(list_lit
  value: (kwd_lit) @FlamasterConstant)
...
; reify/proxy interface names stay @FlamasterConstant
(list_lit
  value: (sym_lit) @_kw
  (#any-of? @_kw "reify" "proxy")
  value: (sym_lit) @FlamasterConstant)

; Builtin constants become @FlamasterLiteral
(nil_lit) @FlamasterLiteral
(bool_lit) @FlamasterLiteral
```

- [ ] **Step 4: terraform/highlights.scm — split literals from namespaces/types**

Change lines 12-13 (bool_lit/null_lit) to `@FlamasterLiteral`. Keep all other `@FlamasterConstant` captures (magic namespaces, type keywords, resource type labels, moved/import expressions, lifecycle keywords).

```scheme
; Boolean and null literals
(bool_lit) @FlamasterLiteral
(null_lit) @FlamasterLiteral

; Everything else stays @FlamasterConstant
```

- [ ] **Step 5: hcl/highlights.scm — split literals from resource type labels**

Change lines 21-22 (bool_lit/null_lit) to `@FlamasterLiteral`. Keep line 9 (template_literal for resource types) as `@FlamasterConstant`.

```scheme
; Boolean and null literals
(bool_lit) @FlamasterLiteral
(null_lit) @FlamasterLiteral

; Resource type labels stay @FlamasterConstant
```

- [ ] **Step 6: Commit**

```bash
git add after/queries/c_sharp/highlights.scm after/queries/helm/highlights.scm \
  after/queries/clojure/highlights.scm after/queries/terraform/highlights.scm \
  after/queries/hcl/highlights.scm
git commit -m "feat: split @FlamasterLiteral in c_sharp, helm, clojure, terraform, hcl

Boolean/null literals use @FlamasterLiteral (orange).
Keywords, symbols, namespaces, resource types stay @FlamasterConstant."
```

---

### Task 8: Validate all query files

**Files:** All `after/queries/*/highlights.scm`

- [ ] **Step 1: Run treesitter query validation on all files**

For each language with an installed parser, validate the query file:

```bash
for dir in after/queries/*/; do
  lang=$(basename "$dir")
  file="$dir/highlights.scm"
  if [ -f "$file" ]; then
    result=$(nvim --headless -c "lua local ok, err = pcall(vim.treesitter.query.parse, '$lang', io.open('$file'):read('*a')); if not ok then print('FAIL: $lang: ' .. err) else print('OK: $lang') end" -c "qa!" 2>&1)
    echo "$result"
  fi
done
```

Expected: All files with installed parsers print `OK`. Languages without parsers will error with "no parser" (acceptable).

- [ ] **Step 2: Spot-check the new capture group exists**

```bash
nvim --headless -c "lua print(vim.inspect(vim.api.nvim_get_hl(0, {name='@FlamasterLiteral'})))" -c "colorscheme flamaster" -c "lua print(vim.inspect(vim.api.nvim_get_hl(0, {name='@FlamasterLiteral'})))" -c "qa!" 2>&1
```

Expected: After loading flamaster, `@FlamasterLiteral` should show `fg` = the orange color value.

- [ ] **Step 3: Commit validation fix if needed**

If any query files fail, fix and commit.

---

### Task 9: Update README

**Files:**
- Modify: `README.md` (if it documents color scheme options)

- [ ] **Step 1: Check if README mentions dim_comments**

Search for `dim_comments` or `flamaster_dim_comments` in README. If present, update to document the new `g:flamaster_bright_comments` option for dark mode while keeping `g:flamaster_dim_comments` for light mode.

- [ ] **Step 2: Document the new semantic color mapping**

If README has a color/highlighting section, add the updated dark mode color table:
- Blue = definitions
- Purple = keywords (NEW)
- Magenta = constants (decorators, symbols)
- Orange = literals (booleans, numbers, nil) (NEW)
- Green = strings
- Muted grey = comments (CHANGED) + punctuation

- [ ] **Step 3: Commit**

```bash
git add README.md
git commit -m "docs: update README for new dark mode highlighting changes"
```
