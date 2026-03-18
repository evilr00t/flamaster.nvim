vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
end

vim.g.colors_name = "flamaster"

local theme
---@diagnostic disable: undefined-global
if vim.o.background == "dark" then
    -- terminal colors (Tokyo Night palette)
    vim.g.terminal_color_0 = "#1a1b26"
    vim.g.terminal_color_1 = "#f7768e"
    vim.g.terminal_color_2 = "#9ece6a"
    vim.g.terminal_color_3 = "#e0af68"
    vim.g.terminal_color_4 = "#7aa2f7"
    vim.g.terminal_color_5 = "#bb9af7"
    vim.g.terminal_color_6 = "#7dcfff"
    vim.g.terminal_color_7 = "#c0caf5"
    vim.g.terminal_color_8 = "#414868"
    vim.g.terminal_color_9 = "#f7768e"
    vim.g.terminal_color_10 = "#9ece6a"
    vim.g.terminal_color_11 = "#e0af68"
    vim.g.terminal_color_12 = "#7aa2f7"
    vim.g.terminal_color_13 = "#bb9af7"
    vim.g.terminal_color_14 = "#7dcfff"
    vim.g.terminal_color_15 = "#c0caf5"

    -- colors (Tokyo Night palette mapped to Flamaster's 4-role structure)
    local bg = "#1a1b26"
    local fg = "#c0caf5"
    local punct_fg = "#565f89"
    local def_fg = "#7aa2f7"
    local const_fg = "#bb9af7"
    local active = "#e0af68"
    local string_fg = "#9ece6a"
    local darker_fg = "#737aa2"
    local diffadd = "#449dab"
    local diffdelete = "#914c54"
    local diffchange = "#6183bb"
    local statusline = "#16161e"
    local comment = "#e0af68"
    local dim_comment = "#414868"
    local bracket_fg = "#a9b1d6"
    local mistake = {
        fg = "#f7768e",
        bg = "#2d202f",
    }
    local error = "#db4b4b"
    local warn = "#ff9e64"
    local hint = "#7dcfff"
    local info = "#9ece6a"
    local ansi = {
        black = "#414868",
        blue = "#7aa2f7",
        brightyellow = "#e0af68",
        cyan = "#7dcfff",
        green = "#9ece6a",
        magenta = "#bb9af7",
        red = "#f7768e",
        white = "#c0caf5",
        yellow = "#e0af68",
    }
    local comment_fg = vim.g.flamaster_dim_comments and dim_comment or comment
    local pmenu_bg = "#1f2335"
    local selection_bg = "#283457"
    local split_fg = "#3b4261"
    local lsp_ref_bg = "#2d3f76"
    local float_bg = vim.g.flamaster_floatborder and bg or pmenu_bg
    local floatborder = vim.g.flamaster_floatborder and { bg = bg, fg = "#333333" }
        or {
            bg = float_bg,
            fg = float_bg,
        }
    theme = {
        Comment = { fg = comment_fg },
        ColorColumn = { bg = pmenu_bg },
        Conceal = { fg = "#b0b0b0" },
        Cursor = { bg = active, fg = "#000000" },
        -- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
        -- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|
        CursorColumn = { bg = pmenu_bg },
        CursorLine = { bg = pmenu_bg },
        Directory = { fg = ansi.blue },
        DiffAdd = { bg = "#1a3344", fg = "#9ece6a" },
        DiffDelete = { bg = "#3b1a1e", fg = "#f7768e" },
        DiffText = { fg = "#c0caf5", bg = "#394b70" },
        DiffChange = { bg = "#1e2a45", fg = "#7aa2f7" },
        EndOfBuffer = { fg = split_fg },
        -- TermCursor   { }, -- cursor in a focused terminal
        TermCursorNC = { fg = bg, bg = fg },
        ErrorMsg = { fg = error, bg = mistake.bg },
        VertSplit = { fg = split_fg },
        WinSeparator = { fg = split_fg },
        Folded = { bg = pmenu_bg, fg = darker_fg },
        FoldColumn = { bg = bg, fg = punct_fg },
        SignColumn = {},
        IncSearch = { bg = ansi.yellow, fg = bg },
        -- Substitute   { }, -- |:substitute| replacement text highlighting
        LineNr = { fg = punct_fg },
        CursorLineNr = { fg = ansi.blue, bold = true },
        MatchParen = { underline = true, sp = active },
        -- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
        -- MsgArea      { }, -- Area for messages and cmdline
        -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
        MoreMsg = { fg = ansi.green, bold = true },
        NonText = { fg = dim_comment },
        Normal = { bg = bg, fg = fg },
        NormalFloat = { bg = float_bg },
        -- NormalNC     { }, -- normal text in non-current windows
        FloatBorder = floatborder,
        FloatTitle = { fg = ansi.blue, bold = true },
        FloatFooter = { fg = darker_fg },
        Pmenu = { bg = pmenu_bg },
        PmenuSel = { bg = selection_bg },
        PmenuSbar = { bg = pmenu_bg },
        PmenuThumb = { bg = split_fg },
        Question = { fg = diffadd },
        QuickFixLine = { bg = pmenu_bg },
        Search = { bg = selection_bg },
        CurSearch = { bg = ansi.yellow, fg = bg },
        SpecialKey = { fg = ansi.cyan },
        SpellBad = { undercurl = true, sp = ansi.red },
        SpellCap = { undercurl = true, sp = ansi.blue },
        SpellLocal = { undercurl = true, sp = ansi.cyan },
        SpellRare = { undercurl = true, sp = ansi.magenta },
        StatusLine = { bg = statusline, fg = fg },
        StatusLineNC = { bg = statusline, fg = darker_fg },
        TabLine = { bg = statusline, fg = darker_fg },
        TabLineFill = { bg = statusline },
        TabLineSel = { bg = statusline, fg = ansi.blue },
        Title = { fg = const_fg },
        Visual = { bg = selection_bg },
        VisualNOS = { bg = selection_bg },
        WarningMsg = { fg = warn },
        WildMenu = { bg = selection_bg },
        WinBar = { bg = bg, fg = ansi.white, bold = true },
        WinBarNC = { bg = bg, fg = darker_fg },

        --- SYNTAX I: TS groups link to these
        Constant = { fg = const_fg },
        String = { fg = string_fg },
        Character = { fg = const_fg },
        Number = { fg = const_fg },
        Boolean = { fg = const_fg },
        Float = { fg = const_fg },
        Operator = { fg = punct_fg },

        --- SYNTAX II: TS groups have their own definition, the below are defined to have somewhat working hl w/o treesitter
        Identifier = { fg = ansi.white },
        Function = { fg = def_fg },
        Statement = { fg = ansi.white },
        Conditional = { fg = ansi.white },
        Repeat = { fg = ansi.white },
        Label = { fg = def_fg },
        Keyword = { fg = ansi.white },
        Exception = { fg = ansi.white },
        PreProc = { fg = ansi.white },
        Include = { fg = ansi.white },
        Define = { fg = ansi.white },
        Macro = { fg = ansi.white },
        PreCondit = { fg = ansi.white },
        Type = { fg = ansi.white },
        StorageClass = { fg = ansi.white },
        Structure = { fg = def_fg },
        Typedef = { fg = def_fg },

        Special = { fg = ansi.yellow },
        -- TODO better color than diffchange, try reddish
        -- SpecialChar = { fg = diffchange }, --  special character in a constant
        -- Tag            { }, --    you can use CTRL-] on this
        -- Delimiter      { },
        SpecialComment = { bg = pmenu_bg, fg = ansi.blue },
        debugPc = { bg = "#0f2234" },
        debugBreakpoint = { bg = "#3b1a1e" },
        helpHyperTextJump = { fg = ansi.magenta },
        helpSectionDelim = { fg = ansi.magenta },
        helpExample = { fg = ansi.cyan },
        helpCommand = { fg = ansi.cyan },
        helpHeadline = { fg = ansi.blue },
        helpHeader = { fg = ansi.magenta },

        Underlined = { underline = true }, -- (preferred) text that stands out, HTML links
        Italic = { italic = true },

        -- ("Ignore", below, may be invisible...)
        -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

        Error = { bg = mistake.bg, fg = mistake.fg },

        Todo = { bg = active, fg = bg },

        --- Diagnostic
        LspReferenceText = { bg = lsp_ref_bg },
        LspReferenceRead = { bg = lsp_ref_bg },
        LspReferenceWrite = { bg = lsp_ref_bg, underline = true, sp = active },
        LspCodeLens = { fg = punct_fg },
        LspCodeLensSeparator = { fg = punct_fg },

        --- Diagnostic
        DiagnosticError = { fg = error },
        DiagnosticWarn = { fg = warn },
        DiagnosticHint = { fg = hint },
        DiagnosticInfo = { fg = info },
        DiagnosticVirtualTextError = { bg = "#2d1b1e", fg = "#f7768e" },
        DiagnosticVirtualTextWarn = { bg = "#2d2208", fg = warn },
        DiagnosticVirtualTextHint = { bg = "#1a2535", fg = "#7dcfff" },
        DiagnosticVirtualTextInfo = { bg = "#1a2a1a", fg = "#9ece6a" },

        ["@attribute"] = {},
        ["@constructor"] = { fg = ansi.white },
        ["@keyword.conditional"] = { fg = ansi.white },
        ["@constant.builtin"] = { fg = const_fg },
        ["@constant.macro"] = { fg = ansi.white },
        ["@keyword.exception"] = { fg = ansi.white },
        ["@variable.member"] = { fg = ansi.white },
        ["@function"] = { fg = ansi.white },
        ["@function.builtin"] = { fg = ansi.white },
        ["@function.macro"] = { fg = ansi.white },
        ["@keyword"] = { fg = ansi.white },
        ["@keyword.function"] = { fg = ansi.white },
        ["@keyword.operator"] = { fg = ansi.white },
        ["@label"] = { fg = ansi.white },
        ["@function.method"] = { fg = ansi.white },
        ["@module"] = { fg = ansi.white },
        ["@variable.parameter"] = { fg = ansi.white },
        ["@property"] = { fg = ansi.white },
        ["@punctuation.delimiter"] = { fg = punct_fg },
        ["@punctuation.bracket"] = { fg = bracket_fg },
        ["@punctuation.special"] = { fg = punct_fg },
        ["@keyword.repeat"] = { fg = ansi.white },
        ["@string"] = { fg = string_fg },
        ["@string.regexp"] = { bg = pmenu_bg, fg = const_fg },
        ["@string.escape"] = { bg = pmenu_bg, fg = const_fg },
        ["@symbol"] = {},
        ["@type"] = { fg = ansi.white },
        ["@type.builtin"] = { fg = ansi.white },
        ["@variable"] = { fg = ansi.white },
        ["@variable.builtin"] = { fg = ansi.white },
        ["@tag"] = { fg = ansi.white },
        ["@tag.delimiter"] = { fg = punct_fg },
        ["@markup"] = { fg = ansi.white },
        ["@markup.note"] = { bg = pmenu_bg, fg = ansi.blue },
        ["@markup.warning"] = { bg = active, fg = bg },
        ["@markup.heading"] = { fg = ansi.blue, bold = true },
        ["@markup.heading.1"] = { fg = ansi.blue, bold = true },
        ["@markup.heading.2"] = { fg = const_fg, bold = true },
        ["@markup.heading.3"] = { fg = ansi.cyan, bold = true },
        ["@markup.heading.4"] = { fg = ansi.green },
        ["@markup.heading.5"] = { fg = ansi.yellow },
        ["@markup.heading.6"] = { fg = darker_fg },
        ["@markup.strong"] = { bold = true },
        ["@markup.italic"] = { italic = true },
        ["@markup.strikethrough"] = { strikethrough = true },
        ["@markup.underline"] = { underline = true },
        ["@markup.link"] = { fg = ansi.blue, underline = true },
        ["@markup.link.url"] = { fg = ansi.cyan, underline = true },
        ["@markup.link.label"] = { fg = ansi.blue },
        ["@markup.raw"] = { fg = ansi.green },
        ["@markup.raw.block"] = { fg = fg },
        ["@markup.list"] = { fg = punct_fg },
        ["@markup.list.checked"] = { fg = ansi.green },
        ["@markup.list.unchecked"] = { fg = punct_fg },
        ["@markup.quote"] = { fg = darker_fg, italic = true },

        --- Theme specific
        ["@FlamasterBase"] = { fg = ansi.white },
        ["@FlamasterConstant"] = { fg = const_fg },
        ["@FlamasterDefinition"] = { fg = def_fg },
        ["@FlamasterPunct"] = { fg = punct_fg },
        ["@FlamasterString"] = { fg = string_fg },
        ["@FlamasterHashbang"] = { fg = dim_comment },
        --- Gitsigns
        GitSignsAdd = { fg = diffadd },
        GitSignsChange = { fg = diffchange },
        GitSignsDelete = { fg = diffdelete },
        --- Telescope
        TelescopeBorder = { fg = split_fg },
        TelescopeMatching = { fg = ansi.yellow },
        TelescopeMultiSelection = { fg = ansi.magenta },
        TelescopePromptPrefix = { fg = ansi.blue },
        TelescopeSelectionCaret = { fg = mistake.fg },
        TelescopeTitle = { fg = ansi.brightyellow },
        TelescopeResultsTitle = { fg = ansi.yellow },
        --- fzf-lua
        FzfLuaBorder = { fg = split_fg },
        --- mini.nvim
        MiniPickMatchCurrent  = { fg = ansi.yellow },
        --- Neogit
        NeogitPopupActionDisabled = { fg = darker_fg },
        NeogitPopupActionKey = { fg = ansi.magenta },
        NeogitPopupOptionDisabled = { fg = darker_fg },
        NeogitPopupOptionKey = { fg = ansi.blue },
        NeogitPopupSwitchDisabled = { fg = darker_fg },
        NeogitPopupSwitchEnabled = { fg = ansi.cyan },
        NeogitPopupSwitchKey = { fg = ansi.magenta },
        --- Fugitive
        diffAdded = { link = "DiffAdd" },
        diffRemoved = { link = "DiffDelete" },
        --- Startify
        StartifyBracket = { fg = darker_fg },
        StartifyFile = { fg = ansi.white },
        StartifySection = { fg = ansi.green },
        StartifySlash = { fg = punct_fg },
        StartifyPath = { fg = punct_fg },
        --- Statusline
        StatuslineAdd = { fg = diffadd, bg = statusline },
        StatuslineErr = { fg = error, bg = statusline },
        StatuslineHint = { fg = hint, bg = statusline },
        StatuslineInfo = { fg = info, bg = statusline },
        StatuslineWarn = { fg = warn, bg = statusline },
        StatuslineBlue = { fg = ansi.blue, bg = statusline },
        StatuslineRed = { fg = ansi.red, bg = statusline },
        StatuslineGreen = { fg = ansi.green, bg = statusline },
        StatuslineCyan = { fg = ansi.cyan, bg = statusline },
        StatuslineMagenta = { fg = ansi.magenta, bg = statusline },
        --- ALE
        ALEWarningSign = { fg = warn },
        --- vim-matchup
        MatchupVirtualText = { fg = ansi.yellow },
        --- For `highlight link`
        FlamasterBlack = { fg = ansi.black },
        FlamasterBlue = { fg = ansi.blue },
        FlamasterBrightYellow = { fg = ansi.brightyellow },
        FlamasterCyan = { fg = ansi.cyan },
        FlamasterGreen = { fg = ansi.green },
        FlamasterDarkGreen = { fg = ansi.green },
        FlamasterMagenta = { fg = ansi.magenta },
        FlamasterRed = { fg = ansi.red },
        FlamasterWhite = { fg = ansi.white },
        FlamasterYellow = { fg = ansi.yellow },
        --- Hop
        HopNextKey = { fg = ansi.brightyellow },
        HopNextKey1 = { fg = ansi.cyan },
        HopNextKey2 = { fg = "#41a6b5" },
        HopUnmatched = { fg = dim_comment },
        --- Lightspeed
        LightspeedGreyWash = { fg = dim_comment },
        --- checkhealth
        healthSuccess = { fg = ansi.green, bg = bg },
        --- cmp
        CmpItemMenuDefault = { fg = ansi.magenta },
        --- nvim-ts-rainbow
        rainbowcol1 = { fg = ansi.yellow },
        rainbowcol2 = { fg = ansi.magenta },
        rainbowcol3 = { fg = ansi.blue },
        rainbowcol4 = { fg = ansi.green },
        rainbowcol5 = { fg = ansi.brightyellow },
        rainbowcol6 = { fg = ansi.red },
        rainbowcol7 = { fg = ansi.cyan },
        --- Iswap
        ISwapSnipe = { bg = ansi.yellow, fg = bg },
        ISwapGrey = { fg = dim_comment },
        --- vim-dadbod-ui
        dbui_help = { fg = dim_comment },
        dbui_connection_source = { fg = dim_comment },
        --- nvim-dap-virtual-text
        NvimDapVirtualText = { bg = pmenu_bg, fg = ansi.cyan },
        --- Noice
        NoiceCmdlineIcon = { link = "FlamasterDarkGreen" },
        NoiceCmdlinePopupBorder = { link = "FlamasterDarkGreen" },
        NoiceConfirmBorder = { link = "FlamasterDarkGreen" },
        NoiceCmdlinePopupBorderCmdline = { link = "FlamasterDarkGreen" },
        NoiceCmdlineIconCmdline = { link = "FlamasterDarkGreen" },
        NoiceCmdlinePopupBorderFilter = { link = "FlamasterDarkGreen" },
        NoiceCmdlineIconFilter = { link = "FlamasterDarkGreen" },
        NoiceCmdlinePopupBorderLua = { link = "FlamasterDarkGreen" },
        NoiceCmdlineIconLua = { link = "FlamasterDarkGreen" },
        NoiceCmdlinePopupBorderSearch = { link = "FlamasterYellow" },
        NoiceCmdlineIconSearch = { link = "FlamasterYellow" },
        --- snacks.nvim
        SnacksNormal = { bg = float_bg, fg = fg },
        SnacksDashboardHeader = { fg = ansi.blue },
        SnacksDashboardFooter = { fg = darker_fg },
        SnacksDashboardDesc = { fg = fg },
        SnacksDashboardIcon = { fg = ansi.blue },
        SnacksDashboardKey = { fg = ansi.magenta },
        SnacksDashboardSpecial = { fg = ansi.green },
        SnacksDashboardDir = { fg = punct_fg },
        SnacksNotifierInfo = { fg = info },
        SnacksNotifierWarn = { fg = warn },
        SnacksNotifierError = { fg = error },
        SnacksNotifierDebug = { fg = darker_fg },
        SnacksNotifierTrace = { fg = const_fg },
        SnacksIndent = { fg = "#292e42" },
        SnacksIndentScope = { fg = ansi.blue },
        --- blink.cmp
        BlinkCmpMenu = { bg = pmenu_bg },
        BlinkCmpMenuBorder = { fg = split_fg, bg = pmenu_bg },
        BlinkCmpMenuSelection = { bg = selection_bg },
        BlinkCmpLabel = { fg = fg },
        BlinkCmpLabelMatch = { fg = ansi.yellow },
        BlinkCmpLabelDescription = { fg = darker_fg },
        BlinkCmpLabelDetail = { fg = darker_fg },
        BlinkCmpKind = { fg = ansi.magenta },
        BlinkCmpDoc = { bg = pmenu_bg },
        BlinkCmpDocBorder = { fg = split_fg, bg = pmenu_bg },
        BlinkCmpDocSeparator = { fg = split_fg },
        BlinkCmpSignatureHelp = { bg = pmenu_bg },
        BlinkCmpSignatureHelpBorder = { fg = split_fg, bg = pmenu_bg },
        --- render-markdown.nvim
        RenderMarkdownH1Bg = { bg = "#1c2a4a", fg = ansi.blue, bold = true },
        RenderMarkdownH2Bg = { bg = "#1f1f35", fg = const_fg, bold = true },
        RenderMarkdownH3Bg = { bg = "#1a2a35", fg = ansi.cyan, bold = true },
        RenderMarkdownH4Bg = { bg = "#1a2a1a", fg = ansi.green },
        RenderMarkdownH5Bg = { bg = "#2a2518", fg = ansi.yellow },
        RenderMarkdownH6Bg = { bg = "#1e1e2e", fg = darker_fg },
        RenderMarkdownCode = { bg = pmenu_bg },
        RenderMarkdownCodeInline = { bg = pmenu_bg },
        RenderMarkdownBullet = { fg = ansi.blue },
        RenderMarkdownQuote = { fg = darker_fg },
        RenderMarkdownDash = { fg = split_fg },
        RenderMarkdownLink = { fg = ansi.blue, underline = true },
        RenderMarkdownChecked = { fg = ansi.green },
        RenderMarkdownUnchecked = { fg = punct_fg },
        RenderMarkdownTableHead = { fg = ansi.blue, bold = true },
        RenderMarkdownTableRow = { fg = fg },
        -- Languages
        --- asm
        asmDirective = { fg = dim_comment },
        nasmLabel = { link = "@FlamasterDefinition" },

        ["@lsp.mod.declaration"] = { fg = fg },
        ["@lsp.type.enumMember"] = { fg = fg },
        ["@lsp.type.function"] = { fg = fg },
        ["@lsp.type.method"] = { fg = fg },
        ["@lsp.type.selfKeyword"] = { fg = fg },
        ["@lsp.typemod.class.declaration"] = { fg = def_fg },
        ["@lsp.typemod.class.definition"] = { fg = def_fg },
        ["@lsp.typemod.enum.declaration"] = { fg = def_fg },
        ["@lsp.typemod.enumMember.defaultLibrary"] = { fg = fg },
        ["@lsp.typemod.function.declaration"] = { fg = def_fg },
        ["@lsp.typemod.function.definition"] = { fg = def_fg },
        ["@lsp.typemod.macro.declaration"] = { fg = def_fg },
        ["@lsp.typemod.method.declaration"] = { fg = def_fg },
        ["@lsp.typemod.selfKeyword"] = { fg = fg },
        ["@lsp.typemod.struct.declaration"] = { fg = def_fg },
        ["@lsp.typemod.type.declaration"] = { fg = def_fg },
        ["@lsp.type.namespace"] = { fg = fg },
        ["@lsp.type.type"] = { fg = fg },
        ["@lsp.type.class"] = { fg = fg },
        ["@lsp.type.enum"] = { fg = fg },
        ["@lsp.type.interface"] = { fg = fg },
        ["@lsp.type.struct"] = { fg = fg },
        ["@lsp.type.parameter"] = { fg = fg },
        ["@lsp.type.variable"] = { fg = fg },
        ["@lsp.type.property"] = { fg = fg },
        ["@lsp.type.keyword"] = { fg = fg },
        ["@lsp.type.modifier"] = { fg = fg },
        ["@lsp.type.comment"] = { link = "Comment" },
        ["@lsp.type.string"] = { link = "String" },
        ["@lsp.type.number"] = { link = "Number" },
        ["@lsp.type.regexp"] = { bg = pmenu_bg, fg = const_fg },
        ["@lsp.type.operator"] = { fg = punct_fg },
        ["@lsp.type.decorator"] = { fg = const_fg },
        ["@lsp.type.lifetime"] = { fg = const_fg, italic = true },
        ["@lsp.typemod.variable.declaration"] = { fg = def_fg },
        ["@lsp.typemod.variable.definition"] = { fg = def_fg },
        ["@lsp.typemod.parameter.declaration"] = { fg = fg },
        ["@lsp.typemod.interface.declaration"] = { fg = def_fg },
        ["@lsp.typemod.typeParameter.declaration"] = { fg = def_fg },
    }
else
    -- terminal colors
    vim.g.terminal_color_0 = "#000000"
    vim.g.terminal_color_1 = "#aa3731"
    vim.g.terminal_color_2 = "#448c27"
    vim.g.terminal_color_3 = "#cb9000"
    vim.g.terminal_color_4 = "#325cc0"
    vim.g.terminal_color_5 = "#7a3e9d"
    vim.g.terminal_color_6 = "#0083b2"
    vim.g.terminal_color_7 = "#f7f7f7"
    vim.g.terminal_color_8 = "#777777"
    vim.g.terminal_color_9 = "#f05050"
    vim.g.terminal_color_10 = "#60cb00"
    vim.g.terminal_color_11 = "#ffbc5d"
    vim.g.terminal_color_12 = "#007acc"
    vim.g.terminal_color_13 = "#e64ce6"
    vim.g.terminal_color_14 = "#00aacb"
    vim.g.terminal_color_15 = "#f7f7f7"

    -- colors
    local bg = "#f7f7f7"
    local fg = "#000000"
    local punct_fg = "#777777"
    local def_fg = "#325cc0"
    local const_fg = "#7a3e9d"
    local active = "#ffbc5d"
    local active_blue = "#007acc"
    local string_fg = "#448c27"
    local darker_fg = "#7d7d7d"
    local diffadd = "#284918"
    local diffdelete = "#B40600"
    local diffchange = "#ec8013"
    local statusline = "#c9c9c9"
    local comment = "#aa3731"
    local dim_comment = "#696969"
    local mistake = {
        fg = "#c33c33",
        bg = "#f8b28f",
    }
    local ansi = {
        black = "#000000",
        blue = "#325cc0",
        brightyellow = "#ffbc5d",
        cyan = "#0083b2",
        green = "#448c27",
        magenta = "#7a3e9d",
        red = "#aa3731",
        white = "#f7f7f7",
        yellow = "#cb9000",
    }
    local error = "#d13e23"
    local warn = "#BC7500"
    local hint = ansi.blue
    local info = "#278C00"
    local comment_fg = vim.g.flamaster_dim_comments and dim_comment or comment
    local pmenu_bg = "#e7e7e7"
    local cursorline_bg = "#E2EEEE"
    local lsp_ref_bg = "#dadada"
    local split_fg = "#abbdc0"
    local muted_fg = "#999999"
    local visual_bg = "#bfdbfe"
    local float_bg = vim.g.flamaster_floatborder and bg or pmenu_bg
    local floatborder = vim.g.flamaster_floatborder and { bg = bg, fg = "#999999" }
        or {
            bg = float_bg,
            fg = float_bg,
        }
    theme = {
        Comment = { fg = comment_fg },
        ColorColumn = { bg = cursorline_bg },
        Conceal = { fg = "#b0b0b0" },
        Cursor = { bg = "#007acc", fg = visual_bg },
        -- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
        -- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|
        CursorColumn = { bg = cursorline_bg },
        CursorLine = { bg = cursorline_bg },
        Directory = { fg = ansi.blue },
        DiffAdd = { bg = "#ADFFB7", fg = "#0A7816" },
        DiffDelete = { bg = "#F8B28F", fg = "#872C28" },
        DiffText = { fg = "#fff987", bg = "#876004" },
        DiffChange = { bg = "#fff987", fg = "#341a00" },
        EndOfBuffer = { fg = "#b6b6b6" },
        -- TermCursor   { }, -- cursor in a focused terminal
        TermCursorNC = { fg = bg, bg = fg },
        ErrorMsg = { fg = error, bg = mistake.bg },
        VertSplit = { fg = split_fg },
        WinSeparator = { fg = split_fg },
        Folded = { bg = "#dddddd", fg = darker_fg },
        FoldColumn = { bg = bg, fg = "#4d4d4d" },
        SignColumn = {},
        IncSearch = { bg = active, fg = fg },
        -- Substitute   { }, -- |:substitute| replacement text highlighting
        LineNr = { fg = "#7d7c7c" },
        CursorLineNr = { fg = ansi.blue, bold = true },
        MatchParen = { underline = true, sp = active },
        -- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
        -- MsgArea      { }, -- Area for messages and cmdline
        -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
        MoreMsg = { fg = ansi.green, bold = true },
        NonText = { fg = dim_comment },
        Normal = { bg = bg, fg = fg },
        NormalFloat = { bg = float_bg },
        -- NormalNC     { }, -- normal text in non-current windows
        FloatBorder = floatborder,
        FloatTitle = { fg = ansi.blue, bold = true },
        FloatFooter = { fg = darker_fg },
        Pmenu = { bg = pmenu_bg },
        PmenuSel = { bg = "#c7c7c7" },
        PmenuSbar = { bg = "#777777" },
        PmenuThumb = { bg = "#333333" },
        Question = { fg = ansi.green },
        QuickFixLine = { bg = cursorline_bg },
        Search = { bg = "#fae9b7", fg = fg },
        CurSearch = { bg = active, fg = fg },
        SpecialKey = { fg = ansi.cyan },
        SpellBad = { undercurl = true, sp = ansi.red },
        SpellCap = { undercurl = true, sp = ansi.blue },
        SpellLocal = { undercurl = true, sp = ansi.cyan },
        SpellRare = { undercurl = true, sp = ansi.magenta },
        StatusLine = { bg = statusline, fg = fg },
        StatusLineNC = { bg = statusline, fg = "#9f9f9f" },
        TabLine = { bg = statusline, fg = darker_fg },
        TabLineFill = { bg = statusline },
        TabLineSel = { bg = statusline, fg = ansi.blue },
        Title = { fg = const_fg },
        Visual = { bg = visual_bg },
        VisualNOS = { bg = visual_bg },
        WarningMsg = { fg = "#e1ad4c" },
        WildMenu = { bg = muted_fg },
        WinBar = { bg = bg, fg = ansi.black, bold = true },
        WinBarNC = { bg = bg, fg = darker_fg },

        --- SYNTAX I: TS groups link to these
        Constant = { fg = const_fg },
        String = { fg = string_fg },
        Character = { fg = const_fg },
        Number = { fg = const_fg },
        Boolean = { fg = const_fg },
        Float = { fg = const_fg },
        Operator = { fg = punct_fg },

        --- SYNTAX II: TS groups have their own definition, the below are defined to have somewhat working hl w/o treesitter
        Identifier = { fg = ansi.black },
        Function = { fg = def_fg },
        Statement = { fg = ansi.black },
        Conditional = { fg = ansi.black },
        Repeat = { fg = ansi.black },
        Label = { fg = def_fg },
        Keyword = { fg = ansi.black },
        Exception = { fg = ansi.black },
        PreProc = { fg = ansi.black },
        Include = { fg = ansi.black },
        Define = { fg = ansi.black },
        Macro = { fg = ansi.black },
        PreCondit = { fg = ansi.black },
        Type = { fg = ansi.black },
        StorageClass = { fg = ansi.black },
        Structure = { fg = def_fg },
        Typedef = { fg = def_fg },

        Special = { fg = ansi.yellow },
        -- TODO better color than diffchange, try reddish
        -- SpecialChar = { fg = diffchange }, --  special character in a constant
        -- Tag            { }, --    you can use CTRL-] on this
        -- Delimiter      { },
        SpecialComment = { bg = "#FFDEAA", fg = ansi.blue },
        debugPc = { bg = "#C7C7EE" },
        debugBreakpoint = { bg = "#F8B28F" },
        helpHyperTextJump = { fg = ansi.magenta },
        helpSectionDelim = { fg = ansi.magenta },
        helpExample = { fg = ansi.cyan },
        helpCommand = { fg = ansi.cyan },
        helpHeadline = { fg = ansi.blue },
        helpHeader = { fg = ansi.magenta },

        Underlined = { underline = true }, -- (preferred) text that stands out, HTML links
        Italic = { italic = true },

        -- ("Ignore", below, may be invisible...)
        -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

        Error = { bg = mistake.bg, fg = mistake.fg },

        Todo = { bg = "#FFDEAA", fg = ansi.blue },

        --- Diagnostic
        LspReferenceText = { bg = lsp_ref_bg },
        LspReferenceRead = { bg = lsp_ref_bg },
        LspReferenceWrite = { bg = lsp_ref_bg, underline = true, sp = active_blue },
        LspCodeLens = { fg = muted_fg },
        LspCodeLensSeparator = { fg = muted_fg },

        --- Diagnostic
        DiagnosticError = { fg = error },
        DiagnosticWarn = { fg = warn },
        DiagnosticHint = { fg = hint },
        DiagnosticInfo = { fg = info },
        DiagnosticVirtualTextError = { bg = "#F8B28F", fg = "#411414" },
        DiagnosticVirtualTextWarn = { bg = "#fff987", fg = fg },
        DiagnosticVirtualTextHint = { fg = "#0F171D", bg = "#C3D0DA" },
        DiagnosticVirtualTextInfo = { bg = "#ADFFB7", fg = "#042F09" },


        ["@attribute"] = {},
        ["@constructor"] = { fg = ansi.black },
        ["@keyword.conditional"] = { fg = ansi.black },
        ["@constant.builtin"] = { fg = const_fg },
        ["@constant.macro"] = { fg = ansi.black },
        ["@keyword.exception"] = { fg = ansi.black },
        ["@variable.member"] = { fg = ansi.black },
        ["@function"] = { fg = ansi.black },
        ["@function.builtin"] = { fg = ansi.black },
        ["@function.macro"] = { fg = ansi.black },
        ["@keyword"] = { fg = ansi.black },
        ["@keyword.function"] = { fg = ansi.black },
        ["@keyword.operator"] = { fg = punct_fg },
        ["@label"] = { fg = ansi.black },
        ["@function.method"] = { fg = ansi.black },
        ["@module"] = { fg = ansi.black },
        ["@variable.parameter"] = { fg = ansi.black },
        ["@property"] = { fg = ansi.black },
        ["@punctuation.delimiter"] = { fg = punct_fg },
        ["@punctuation.bracket"] = { fg = punct_fg },
        ["@punctuation.special"] = { fg = punct_fg },
        ["@keyword.repeat"] = { fg = ansi.black },
        ["@string"] = { fg = string_fg },
        ["@string.regexp"] = { bg = bg, fg = "#777777" },
        ["@string.escape"] = { bg = bg, fg = "#777777" },
        ["@symbol"] = {},
        ["@type"] = { fg = ansi.black },
        ["@type.builtin"] = { fg = ansi.black },
        ["@variable"] = { fg = ansi.black },
        ["@variable.builtin"] = { fg = ansi.black },
        ["@tag"] = { fg = ansi.black },
        ["@tag.delimiter"] = { fg = punct_fg },
        ["@markup"] = { fg = ansi.black },
        ["@markup.note"] = { bg = "#dddddd", fg = ansi.blue },
        ["@markup.warning"] = { bg = "#FFDEAA", fg = ansi.blue },
        ["@markup.heading"] = { fg = ansi.blue, bold = true },
        ["@markup.heading.1"] = { fg = ansi.blue, bold = true },
        ["@markup.heading.2"] = { fg = const_fg, bold = true },
        ["@markup.heading.3"] = { fg = ansi.cyan, bold = true },
        ["@markup.heading.4"] = { fg = ansi.green },
        ["@markup.heading.5"] = { fg = ansi.yellow },
        ["@markup.heading.6"] = { fg = darker_fg },
        ["@markup.strong"] = { bold = true },
        ["@markup.italic"] = { italic = true },
        ["@markup.strikethrough"] = { strikethrough = true },
        ["@markup.underline"] = { underline = true },
        ["@markup.link"] = { fg = ansi.blue, underline = true },
        ["@markup.link.url"] = { fg = ansi.cyan, underline = true },
        ["@markup.link.label"] = { fg = ansi.blue },
        ["@markup.raw"] = { fg = ansi.green },
        ["@markup.raw.block"] = { fg = fg },
        ["@markup.list"] = { fg = punct_fg },
        ["@markup.list.checked"] = { fg = ansi.green },
        ["@markup.list.unchecked"] = { fg = punct_fg },
        ["@markup.quote"] = { fg = darker_fg, italic = true },

        --- Theme specific
        ["@FlamasterBase"] = { fg = ansi.black },
        ["@FlamasterConstant"] = { fg = const_fg },
        ["@FlamasterDefinition"] = { fg = def_fg },
        ["@FlamasterPunct"] = { fg = punct_fg },
        ["@FlamasterString"] = { fg = string_fg },
        ["@FlamasterHashbang"] = { fg = dim_comment },
        --- Gitsigns
        GitSignsAdd = { fg = "#6abf40" }, -- brighter green for gutter sign visibility
        GitSignsChange = { fg = diffchange },
        GitSignsDelete = { fg = diffdelete },
        --- Telescope
        TelescopeBorder = { fg = split_fg },
        TelescopeMatching = { fg = "#CC6F14" },
        TelescopeMultiSelection = { fg = ansi.magenta },
        TelescopePromptPrefix = { fg = ansi.blue },
        TelescopeSelectionCaret = { fg = mistake.fg },
        TelescopeTitle = { fg = ansi.yellow },
        TelescopeResultsTitle = { fg = ansi.yellow },
        --- fzf-lua
        FzfLuaBorder = { fg = split_fg },
        --- Neogit
        NeogitPopupActionDisabled = { fg = darker_fg },
        NeogitPopupActionKey = { fg = ansi.magenta },
        NeogitPopupOptionDisabled = { fg = darker_fg },
        NeogitPopupOptionKey = { fg = ansi.blue },
        NeogitPopupSwitchDisabled = { fg = darker_fg },
        NeogitPopupSwitchEnabled = { fg = ansi.cyan },
        NeogitPopupSwitchKey = { fg = ansi.magenta },
        --- Fugitive
        diffAdded = { link = "DiffAdd" },
        diffRemoved = { link = "DiffDelete" },
        --- Startify
        StartifyBracket = { fg = darker_fg },
        StartifyFile = { fg = ansi.black },
        StartifySection = { fg = ansi.green },
        StartifySlash = { fg = "#4e6e75" },
        StartifyPath = { fg = "#4e6e75" },
        --- Statusline
        StatuslineAdd = { fg = diffadd, bg = statusline },
        StatuslineErr = { fg = "#8E1410", bg = statusline },
        StatuslineHint = { fg = hint, bg = statusline },
        StatuslineInfo = { fg = info, bg = statusline },
        StatuslineWarn = { fg = warn, bg = statusline },
        StatuslineBlue = { fg = ansi.blue, bg = statusline },
        StatuslineRed = { fg = ansi.red, bg = statusline },
        StatuslineGreen = { fg = ansi.green, bg = statusline },
        StatuslineCyan = { fg = ansi.cyan, bg = statusline },
        StatuslineMagenta = { fg = ansi.magenta, bg = statusline },
        --- ALE
        ALEWarningSign = { fg = warn },
        --- vim-matchup
        MatchupVirtualText = { fg = ansi.yellow },
        --- For `highlight link`
        FlamasterBlack = { fg = ansi.black },
        FlamasterBlue = { fg = ansi.blue },
        FlamasterBrightYellow = { fg = ansi.brightyellow },
        FlamasterCyan = { fg = ansi.cyan },
        FlamasterGreen = { fg = ansi.green },
        FlamasterBrightGreen = { fg = "#60cb00" },
        FlamasterMagenta = { fg = ansi.magenta },
        FlamasterRed = { fg = ansi.red },
        FlamasterWhite = { fg = ansi.black },
        FlamasterYellow = { fg = ansi.yellow },
        --- Hop
        HopNextKey = { fg = ansi.yellow },
        HopNextKey1 = { fg = ansi.blue },
        HopNextKey2 = { fg = "#17A2D6" },
        HopUnmatched = { fg = "#bfbfbf" },
        --- Lightspeed
        LightspeedGreyWash = { fg = "#bfbfbf" },
        --- checkhealth
        healthSuccess = { fg = ansi.green, bg = bg },
        --- cmp
        CmpItemMenuDefault = { fg = ansi.magenta },
        --- nvim-ts-rainbow
        rainbowcol1 = { fg = ansi.yellow },
        rainbowcol2 = { fg = ansi.magenta },
        rainbowcol3 = { fg = ansi.blue },
        rainbowcol4 = { fg = ansi.green },
        rainbowcol5 = { fg = ansi.brightyellow },
        rainbowcol6 = { fg = ansi.red },
        rainbowcol7 = { fg = ansi.cyan },
        --- Iswap
        ISwapSnipe = { bg = ansi.yellow, fg = bg },
        ISwapGrey = { fg = "#bfbfbf" },
        --- vim-dadbod-ui
        dbui_help = { fg = dim_comment },
        dbui_connection_source = { fg = dim_comment },
        --- nvim-dap-virtual-text
        NvimDapVirtualText = { bg = "#78D2C9", fg = fg },
        --- Noice
        NoiceCmdlineIcon = { link = "FlamasterBrightGreen" },
        NoiceCmdlinePopupBorder = { link = "FlamasterBrightGreen" },
        NoiceConfirmBorder = { link = "FlamasterBrightGreen" },
        NoiceCmdlinePopupBorderCmdline = { link = "FlamasterBrightGreen" },
        NoiceCmdlineIconCmdline = { link = "FlamasterBrightGreen" },
        NoiceCmdlinePopupBorderFilter = { link = "FlamasterBrightGreen" },
        NoiceCmdlineIconFilter = { link = "FlamasterBrightGreen" },
        NoiceCmdlinePopupBorderLua = { link = "FlamasterBrightGreen" },
        NoiceCmdlineIconLua = { link = "FlamasterBrightGreen" },
        NoiceCmdlinePopupBorderSearch = { link = "FlamasterYellow" },
        NoiceCmdlineIconSearch = { link = "FlamasterYellow" },
        --- snacks.nvim
        SnacksNormal = { bg = float_bg, fg = fg },
        SnacksDashboardHeader = { fg = ansi.blue },
        SnacksDashboardFooter = { fg = darker_fg },
        SnacksDashboardDesc = { fg = fg },
        SnacksDashboardIcon = { fg = ansi.blue },
        SnacksDashboardKey = { fg = ansi.magenta },
        SnacksDashboardSpecial = { fg = ansi.green },
        SnacksDashboardDir = { fg = punct_fg },
        SnacksNotifierInfo = { fg = info },
        SnacksNotifierWarn = { fg = warn },
        SnacksNotifierError = { fg = error },
        SnacksNotifierDebug = { fg = darker_fg },
        SnacksNotifierTrace = { fg = const_fg },
        SnacksIndent = { fg = "#e0e0e0" },
        SnacksIndentScope = { fg = ansi.blue },
        --- blink.cmp
        BlinkCmpMenu = { bg = pmenu_bg },
        BlinkCmpMenuBorder = { fg = split_fg, bg = pmenu_bg },
        BlinkCmpMenuSelection = { bg = "#c7c7c7" },
        BlinkCmpLabel = { fg = fg },
        BlinkCmpLabelMatch = { fg = "#CC6F14" },
        BlinkCmpLabelDescription = { fg = darker_fg },
        BlinkCmpLabelDetail = { fg = darker_fg },
        BlinkCmpKind = { fg = ansi.magenta },
        BlinkCmpDoc = { bg = pmenu_bg },
        BlinkCmpDocBorder = { fg = split_fg, bg = pmenu_bg },
        BlinkCmpDocSeparator = { fg = split_fg },
        BlinkCmpSignatureHelp = { bg = pmenu_bg },
        BlinkCmpSignatureHelpBorder = { fg = split_fg, bg = pmenu_bg },
        --- render-markdown.nvim
        RenderMarkdownH1Bg = { bg = "#d6e4f0", fg = ansi.blue, bold = true },
        RenderMarkdownH2Bg = { bg = "#e8dff0", fg = const_fg, bold = true },
        RenderMarkdownH3Bg = { bg = "#d6eef0", fg = ansi.cyan, bold = true },
        RenderMarkdownH4Bg = { bg = "#d6f0d6", fg = ansi.green },
        RenderMarkdownH5Bg = { bg = "#f0ead6", fg = ansi.yellow },
        RenderMarkdownH6Bg = { bg = "#e8e8e8", fg = darker_fg },
        RenderMarkdownCode = { bg = "#e7e7e7" },
        RenderMarkdownCodeInline = { bg = "#e7e7e7" },
        RenderMarkdownBullet = { fg = ansi.blue },
        RenderMarkdownQuote = { fg = darker_fg },
        RenderMarkdownDash = { fg = split_fg },
        RenderMarkdownLink = { fg = ansi.blue, underline = true },
        RenderMarkdownChecked = { fg = ansi.green },
        RenderMarkdownUnchecked = { fg = punct_fg },
        RenderMarkdownTableHead = { fg = ansi.blue, bold = true },
        RenderMarkdownTableRow = { fg = fg },
        -- Languages
        --- asm
        asmDirective = { fg = dim_comment },
        nasmLabel = { link = "@FlamasterDefinition" },
        ["@lsp.mod.declaration"] = { fg = fg },
        ["@lsp.type.enumMember"] = { fg = fg },
        ["@lsp.type.function"] = { fg = fg },
        ["@lsp.type.method"] = { fg = fg },
        ["@lsp.type.selfKeyword"] = { fg = fg },
        ["@lsp.typemod.class.declaration"] = { fg = def_fg },
        ["@lsp.typemod.class.definition"] = { fg = def_fg },
        ["@lsp.typemod.enum.declaration"] = { fg = def_fg },
        ["@lsp.typemod.enumMember.defaultLibrary"] = { fg = fg },
        ["@lsp.typemod.function.declaration"] = { fg = def_fg },
        ["@lsp.typemod.function.definition"] = { fg = def_fg },
        ["@lsp.typemod.macro.declaration"] = { fg = def_fg },
        ["@lsp.typemod.method.declaration"] = { fg = def_fg },
        ["@lsp.typemod.selfKeyword"] = { fg = fg },
        ["@lsp.typemod.struct.declaration"] = { fg = def_fg },
        ["@lsp.typemod.type.declaration"] = { fg = def_fg },
        ["@lsp.type.namespace"] = { fg = fg },
        ["@lsp.type.type"] = { fg = fg },
        ["@lsp.type.class"] = { fg = fg },
        ["@lsp.type.enum"] = { fg = fg },
        ["@lsp.type.interface"] = { fg = fg },
        ["@lsp.type.struct"] = { fg = fg },
        ["@lsp.type.parameter"] = { fg = fg },
        ["@lsp.type.variable"] = { fg = fg },
        ["@lsp.type.property"] = { fg = fg },
        ["@lsp.type.keyword"] = { fg = fg },
        ["@lsp.type.modifier"] = { fg = fg },
        ["@lsp.type.comment"] = { link = "Comment" },
        ["@lsp.type.string"] = { link = "String" },
        ["@lsp.type.number"] = { link = "Number" },
        ["@lsp.type.regexp"] = { bg = bg, fg = "#777777" },
        ["@lsp.type.operator"] = { fg = punct_fg },
        ["@lsp.type.decorator"] = { fg = const_fg },
        ["@lsp.type.lifetime"] = { fg = const_fg, italic = true },
        ["@lsp.typemod.variable.declaration"] = { fg = def_fg },
        ["@lsp.typemod.variable.definition"] = { fg = def_fg },
        ["@lsp.typemod.parameter.declaration"] = { fg = fg },
        ["@lsp.typemod.interface.declaration"] = { fg = def_fg },
        ["@lsp.typemod.typeParameter.declaration"] = { fg = def_fg },
    }
end

for group, hl in pairs(theme) do
    vim.api.nvim_set_hl(0, group, hl)
end

-- vi:nowrap
