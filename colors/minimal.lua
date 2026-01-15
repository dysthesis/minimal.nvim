vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "minimal"

-- Palette lifted from lackluster.nvim (kept locally to stay self-contained)
local palette = {
  lack = "#708090",
  luster = "#deeeed",
  orange = "#ffaa88",
  yellow = "#abab77",
  green = "#789978",
  blue = "#7788AA",
  red = "#D70000",
  lavender = "#A6A1C2",
  none = "none",
  black = "#000000",
  gray1 = "#080808",
  gray2 = "#191919",
  gray3 = "#2a2a2a",
  gray4 = "#444444",
  gray5 = "#555555",
  gray6 = "#7a7a7a",
  gray7 = "#aaaaaa",
  gray8 = "#cccccc",
  gray9 = "#DDDDDD",
}

local special = {
  main_background = "#101010",
  menu_background = "#191919",
  popup_background = "#1A1A1A",
  statusline = "#242424",
  comment = "#3A3A3A",
  exception = "#505050",
  keyword = "#666666",
  param = "#8E8E8E",
  whitespace = "#202020",
}

local dim_comments_opt = vim.g.minimal_dim_comments
if dim_comments_opt == nil then
  dim_comments_opt = vim.g.alabaster_dim_comments
end

local bold_intro_opt = vim.g.minimal_bold_introductions
if bold_intro_opt == nil then
  bold_intro_opt = vim.g.minimal_bold_defs
end
if bold_intro_opt == nil then
  bold_intro_opt = vim.g.alabaster_bold_defs
end

local transparent_opt = vim.g.minimal_transparent
if transparent_opt == nil then
  transparent_opt = vim.g.alabaster_transparent
end

local floatborder_opt = vim.g.minimal_floatborder
if floatborder_opt == nil then
  floatborder_opt = vim.g.alabaster_floatborder
end

local theme
---@diagnostic disable: undefined-global
if vim.o.background == "dark" then
  -- terminal colors
  vim.g.terminal_color_0 = palette.black
  vim.g.terminal_color_1 = palette.red
  vim.g.terminal_color_2 = palette.green
  vim.g.terminal_color_3 = palette.yellow
  vim.g.terminal_color_4 = palette.blue
  vim.g.terminal_color_5 = palette.orange
  vim.g.terminal_color_6 = palette.lack
  vim.g.terminal_color_7 = palette.gray8
  vim.g.terminal_color_8 = palette.gray3
  vim.g.terminal_color_9 = palette.red
  vim.g.terminal_color_10 = palette.green
  vim.g.terminal_color_11 = palette.orange
  vim.g.terminal_color_12 = palette.blue
  vim.g.terminal_color_13 = palette.orange
  vim.g.terminal_color_14 = palette.lack
  vim.g.terminal_color_15 = palette.gray9

  -- colors
  local bg = special.main_background
  local fg = palette.gray8
  local punct_fg = palette.gray6
  local def_fg = palette.lack
  local const_fg = palette.gray6
  local active = palette.gray7
  local string_fg = palette.lavender
  local darker_fg = palette.gray6
  local diffadd = palette.green
  local diffdelete = palette.orange
  local diffchange = palette.gray6
  local statusline = special.statusline
  local comment = palette.yellow
  local dim_comment = special.comment
  local virtual_fg = palette.gray6
  local virtual_bg = special.whitespace
  local mistake = {
    fg = palette.red,
    bg = special.exception,
  }
  local error = palette.red
  local warn = palette.orange
  local hint = palette.gray6
  local info = palette.lack
  local ansi = {
    black = palette.black,
    blue = palette.blue,
    brightyellow = palette.yellow,
    cyan = palette.lack,
    green = palette.green,
    magenta = palette.blue,
    red = palette.red,
    white = palette.gray8,
    yellow = palette.yellow,
  }
  local comment_fg = dim_comments_opt and dim_comment or comment
  local pmenu_bg = special.popup_background
  local float_bg = floatborder_opt and bg or pmenu_bg
  local floatborder = floatborder_opt and { bg = bg, fg = palette.gray4 }
      or {
        bg = float_bg,
        fg = float_bg,
      }
  if transparent_opt then
    bg = palette.none
    float_bg = palette.none
    virtual_bg = palette.none
    floatborder = floatborder_opt and { bg = bg, fg = palette.gray4 }
        or {
          bg = float_bg,
          fg = float_bg,
        }
  end
  local blink_menu = transparent_opt and { bg = bg, fg = fg } or { link = "Pmenu" }
  local menu_border = transparent_opt and { bg = bg, fg = palette.gray4 } or { link = "FloatBorder" }
  local todo_colors = {
    FIX = error,
    TODO = info,
    HACK = warn,
    WARN = warn,
    PERF = palette.lack,
    NOTE = hint,
    TEST = palette.yellow,
  }
  theme = {
    Comment                                    = { fg = comment_fg },
    ColorColumn                                = { bg = special.whitespace },
    Conceal                                    = { fg = palette.gray7 },
    Cursor                                     = { bg = active, fg = palette.black },
    -- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn                               = { bg = special.whitespace },
    CursorLine                                 = { bg = special.whitespace },
    Directory                                  = { fg = ansi.blue },
    DiffAdd                                    = { bg = special.whitespace, fg = diffadd },
    DiffDelete                                 = { bg = special.whitespace, fg = diffdelete },
    DiffText                                   = { fg = bg, bg = palette.gray6 },
    DiffChange                                 = { bg = special.whitespace, fg = diffchange },
    EndOfBuffer                                = { fg = special.main_background },
    -- TermCursor   { }, -- cursor in a focused terminal
    TermCursorNC                               = { fg = bg, bg = fg },
    ErrorMsg                                   = { fg = error, bg = mistake.bg },
    VertSplit                                  = { fg = palette.gray3 },
    WinSeparator                               = { link = "VertSplit" },
    Folded                                     = { bg = pmenu_bg, fg = darker_fg },
    FoldColumn                                 = { bg = bg, fg = palette.gray4 },
    SignColumn                                 = {},
    IncSearch                                  = { bg = ansi.yellow, fg = bg },
    -- Substitute   { }, -- |:substitute| replacement text highlighting
    LineNr                                     = { fg = palette.gray4 },
    CursorLineNr                               = { fg = ansi.blue, bold = 1 },
    MatchParen                                 = { underline = 1, sp = active },
    -- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea      { }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg                                    = { fg = ansi.blue, bold = 1 },
    NonText                                    = { fg = ansi.cyan },
    Normal                                     = { bg = bg, fg = fg },
    NormalFloat                                = { bg = float_bg },
    -- NormalNC     { }, -- normal text in non-current windows
    FloatBorder                                = floatborder,
    Pmenu                                      = { bg = pmenu_bg },
    PmenuSel                                   = { bg = palette.gray3 },
    PmenuSbar                                  = { bg = palette.gray2 },
    PmenuThumb                                 = { bg = palette.gray4 },
    Question                                   = { fg = ansi.blue },
    QuickFixLine                               = { bg = special.whitespace },
    Search                                     = { bg = palette.gray4, fg = fg },
    SpecialKey                                 = { fg = ansi.cyan },
    SpellBad                                   = { undercurl = 1, sp = ansi.red },
    SpellCap                                   = { undercurl = 1, sp = ansi.blue },
    SpellLocal                                 = { undercurl = 1, sp = ansi.cyan },
    SpellRare                                  = { undercurl = 1, sp = ansi.magenta },
    StatusLine                                 = { bg = statusline, fg = fg },
    StatusLineNC                               = { bg = statusline, fg = palette.gray6 },
    TabLine                                    = { bg = statusline, fg = palette.gray6 },
    TabLineFill                                = { bg = statusline },
    TabLineSel                                 = { bg = statusline, fg = ansi.blue },
    Title                                      = { fg = const_fg },
    Visual                                     = { bg = palette.gray8, fg = palette.black },
    VisualNOS                                  = { bg = palette.gray8, fg = palette.black },
    WarningMsg                                 = { fg = warn },
    WildMenu                                   = { bg = palette.gray3, fg = fg },
    WinBar                                     = { bg = bg, fg = ansi.white, bold = true },
    WinBarNC                                   = { bg = bg, fg = darker_fg },

    --- SYNTAX I: TS groups link to these
    Constant                                   = { fg = const_fg },
    String                                     = { fg = string_fg },
    Character                                  = { fg = const_fg },
    Number                                     = { fg = const_fg },
    Boolean                                    = { fg = const_fg },
    Float                                      = { fg = const_fg },
    Operator                                   = { fg = punct_fg },
    Delimiter                                  = { fg = punct_fg },

    --- SYNTAX II: TS groups have their own definition, the below are defined to have somewhat working hl w/o treesitter
    Identifier                                 = { fg = ansi.white },
    Function                                   = { fg = def_fg, bold = bold_intro_opt and 1 or nil },
    Statement                                  = { fg = ansi.white },
    Conditional                                = { fg = ansi.white },
    Repeat                                     = { fg = ansi.white },
    Label                                      = { fg = def_fg },
    Keyword                                    = { fg = ansi.white },
    Exception                                  = { fg = ansi.white },
    PreProc                                    = { fg = ansi.white },
    Include                                    = { fg = ansi.white },
    Define                                     = { fg = ansi.white },
    Macro                                      = { fg = ansi.white },
    PreCondit                                  = { fg = ansi.white },
    Type                                       = { fg = ansi.white },
    StorageClass                               = { fg = ansi.white },
    Structure                                  = { fg = def_fg, bold = bold_intro_opt and 1 or nil },
    Typedef                                    = { fg = def_fg, bold = bold_intro_opt and 1 or nil },

    Special                                    = { fg = ansi.yellow },
    -- TODO better color than diffchange, try reddish
    -- SpecialChar = { fg = diffchange }, --  special character in a constant
    -- Tag            { }, --    you can use CTRL-] on this
    -- Delimiter      { },
    SpecialComment                             = { bg = special.whitespace, fg = ansi.blue },
    debugPc                                    = { bg = special.whitespace },
    debugBreakpoint                            = { bg = palette.gray4, fg = fg },
    helpHyperTextJump                          = { fg = ansi.magenta },
    helpSectionDelim                           = { fg = ansi.magenta },
    helpExample                                = { fg = ansi.cyan },
    helpCommand                                = { fg = ansi.cyan },
    helpHeadline                               = { fg = ansi.blue },
    helpHeader                                 = { fg = ansi.magenta },

    Underlined                                 = { underline = 1 }, -- (preferred) text that stands out, HTML links
    Italic                                     = { italic = 1 },

    -- ("Ignore", below, may be invisible...)
    -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error                                      = { bg = mistake.bg, fg = mistake.fg },

    Todo                                       = { bg = palette.yellow, fg = bg },

    --- Diagnostic
    LspReferenceText                           = { bg = special.whitespace },
    LspReferenceRead                           = { bg = special.whitespace },
    LspReferenceWrite                          = { bg = special.whitespace, underline = 1, sp = active },
    LspCodeLens                                = { fg = palette.gray5 },
    LspCodeLensSeparator                       = { fg = palette.gray5 },

    --- Diagnostic
    DiagnosticError                            = { fg = error },
    DiagnosticWarn                             = { fg = warn },
    DiagnosticHint                             = { fg = hint },
    DiagnosticInfo                             = { fg = info },
    DiagnosticVirtualTextError                 = { bg = virtual_bg, fg = error },
    DiagnosticVirtualTextWarn                  = { bg = virtual_bg, fg = warn },
    DiagnosticVirtualTextHint                  = { bg = virtual_bg, fg = virtual_fg },
    DiagnosticVirtualTextInfo                  = { bg = virtual_bg, fg = virtual_fg },
    DiagnosticUnderlineError                   = { underline = 1, sp = error },
    DiagnosticUnderlineWarn                    = { underline = 1, sp = warn },
    DiagnosticUnderlineHint                    = { underline = 1, sp = hint },
    DiagnosticUnderlineInfo                    = { underline = 1, sp = info },
    LspDiagnosticsUnderlineError               = { link = "DiagnosticUnderlineError" },
    LspDiagnosticsUnderlineWarning             = { link = "DiagnosticUnderlineWarn" },
    LspDiagnosticsUnderlineHint                = { link = "DiagnosticUnderlineHint" },
    LspDiagnosticsUnderlineInformation         = { link = "DiagnosticUnderlineInfo" },

    --- Treesitter
    TSAttribute                                = {},
    TSConstructor                              = { fg = punct_fg },
    TSConditional                              = { fg = ansi.white },
    TSConstBuiltin                             = { fg = const_fg },
    TSConstMacro                               = { fg = ansi.white },
    TSError                                    = { bg = mistake.bg, fg = mistake.fg },
    TSException                                = { fg = ansi.white },
    TSField                                    = { fg = ansi.white },
    TSFunction                                 = { fg = ansi.white },
    TSFuncBuiltin                              = { fg = ansi.white },
    TSFuncMacro                                = { fg = ansi.white },
    TSKeyword                                  = { fg = ansi.white },
    TSKeywordFunction                          = { fg = ansi.white },
    TSLabel                                    = { fg = ansi.white },
    TSMethod                                   = { fg = ansi.white },
    TSNamespace                                = { fg = ansi.white },
    TSNone                                     = { fg = const_fg },
    TSParameter                                = { fg = ansi.white, bold = bold_intro_opt and 1 or nil },
    TSParameterReference                       = { fg = ansi.white },
    TSProperty                                 = { fg = ansi.white },
    TSPunctDelimiter                           = { fg = punct_fg },
    TSPunctBracket                             = { fg = punct_fg },
    TSPunctSpecial                             = { fg = punct_fg },
    TSRepeat                                   = { fg = ansi.white },
    TSString                                   = { fg = string_fg },
    TSStringRegex                              = { bg = special.whitespace, fg = const_fg },
    TSStringEscape                             = { bg = special.whitespace, fg = const_fg },
    TSSymbol                                   = {},
    TSType                                     = { fg = ansi.white },
    TSTypeBuiltin                              = { fg = ansi.white },
    TSVariable                                 = { fg = ansi.white },
    TSVariableBuiltin                          = { fg = ansi.white },
    TSTag                                      = { fg = ansi.white },
    TSTagDelimiter                             = { fg = punct_fg },
    TSText                                     = { fg = ansi.white },
    ["@attribute"]                             = {},
    ["@constructor"]                           = { fg = punct_fg },
    ["@conditional"]                           = { fg = ansi.white },
    ["@constant.builtin"]                      = { fg = const_fg },
    ["@constant.macro"]                        = { fg = ansi.white },
    ["@error"]                                 = { bg = mistake.bg, fg = mistake.fg },
    ["@exception"]                             = { fg = ansi.white },
    ["@field"]                                 = { fg = ansi.white },
    ["@function"]                              = { fg = ansi.white },
    ["@function.builtin"]                      = { fg = ansi.white },
    ["@function.macro"]                        = { fg = ansi.white },
    ["@keyword"]                               = { fg = ansi.white },
    ["@keyword.function"]                      = { fg = ansi.white },
    ["@keyword.operator"]                      = { fg = punct_fg },
    ["@label"]                                 = { fg = ansi.white },
    ["@method"]                                = { fg = ansi.white },
    ["@module"]                                = { fg = ansi.white },
    ["@namespace"]                             = { fg = ansi.white },
    ["@none"]                                  = { fg = const_fg },
    ["@parameter"]                             = { fg = ansi.white, bold = bold_intro_opt and 1 or nil },
    ["@variable.parameter"]                    = { fg = ansi.white, bold = bold_intro_opt and 1 or nil },
    ["@parameter.reference"]                   = { fg = ansi.white },
    ["@property"]                              = { fg = ansi.white },
    ["@punctuation.delimiter"]                 = { fg = punct_fg },
    ["@punctuation.bracket"]                   = { fg = punct_fg },
    ["@punctuation.special"]                   = { fg = punct_fg },
    ["@repeat"]                                = { fg = ansi.white },
    ["@string"]                                = { fg = string_fg },
    ["@string.regex"]                          = { bg = special.whitespace, fg = const_fg },
    ["@string.escape"]                         = { bg = special.whitespace, fg = const_fg },
    ["@symbol"]                                = {},
    ["@type"]                                  = { fg = ansi.white },
    ["@type.builtin"]                          = { fg = ansi.white },
    ["@variable"]                              = { fg = ansi.white },
    ["@variable.builtin"]                      = { fg = ansi.white },
    ["@tag"]                                   = { fg = ansi.white },
    ["@tag.delimiter"]                         = { fg = punct_fg },
    ["@text"]                                  = { fg = ansi.white },
    ["@text.note"]                             = { bg = special.whitespace, fg = ansi.blue },
    ["@text.warning"]                          = { bg = palette.yellow, fg = bg },

    --- Theme specific
    ["@MinimalBase"]                           = { fg = ansi.white },
    ["@MinimalConstant"]                       = { fg = const_fg },
    ["@MinimalDefinition"]                     = { fg = def_fg, bold = bold_intro_opt and 1 or nil },
    ["@MinimalPunctuation"]                    = { fg = punct_fg },
    ["@MinimalPunct"]                          = { link = "@MinimalPunctuation" },
    ["@MinimalString"]                         = { fg = string_fg },
    ["@MinimalHashbang"]                       = { fg = dim_comment },
    --- Gitsigns
    GitSignsAdd                                = { fg = diffadd },
    GitSignsChange                             = { fg = diffchange },
    GitSignsDelete                             = { fg = diffdelete },
    --- Telescope
    TelescopeBorder                            = { fg = palette.gray3 },
    TelescopeMatching                          = { fg = palette.gray6, bold = true },
    TelescopeMultiSelection                    = { fg = ansi.magenta },
    TelescopePromptPrefix                      = { fg = ansi.blue },
    TelescopeSelectionCaret                    = { fg = mistake.fg },
    TelescopeTitle                             = { fg = ansi.brightyellow },
    TelescopeResultsTitle                      = { fg = ansi.yellow },
    --- fzf-lua
    FzfLuaBorder                               = { fg = palette.gray3 },
    --- mini.nvim
    MiniPickMatchCurrent                       = { fg = palette.gray6, bold = true },
    MiniPickPrompt                             = { fg = palette.lack },
    MiniPickPromptCaret                        = { fg = palette.lack },
    MiniPickPromptPrefix                       = { fg = palette.lack },
    MiniPickBorder                             = menu_border,
    -- mini.clue
    MiniClueDescGroup                          = { fg = palette.lack },
    MiniClueSeparator                          = { fg = palette.lack },
    MiniClueBorder                             = menu_border,
    --- Neogit
    NeogitPopupActionDisabled                  = { fg = darker_fg },
    NeogitPopupActionKey                       = { fg = ansi.magenta },
    NeogitPopupOptionDisabled                  = { fg = darker_fg },
    NeogitPopupOptionKey                       = { fg = ansi.blue },
    NeogitPopupSwitchDisabled                  = { fg = darker_fg },
    NeogitPopupSwitchEnabled                   = { fg = ansi.cyan },
    NeogitPopupSwitchKey                       = { fg = ansi.magenta },
    --- Fugitive
    diffAdded                                  = { link = "DiffAdd" },
    diffRemoved                                = { link = "DiffDelete" },
    --- Startify
    StartifyBracket                            = { fg = darker_fg },
    StartifyFile                               = { fg = ansi.white },
    StartifySection                            = { fg = ansi.blue },
    StartifySlash                              = { fg = palette.lack },
    StartifyPath                               = { fg = palette.lack },
    --- Statusline
    StatuslineAdd                              = { fg = diffadd, bg = statusline },
    StatuslineErr                              = { fg = error, bg = statusline },
    StatuslineHint                             = { fg = hint, bg = statusline },
    StatuslineInfo                             = { fg = info, bg = statusline },
    StatuslineWarn                             = { fg = warn, bg = statusline },
    StatuslineBlue                             = { fg = ansi.blue, bg = statusline },
    StatuslineRed                              = { fg = ansi.red, bg = statusline },
    StatuslineGreen                            = { fg = ansi.green, bg = statusline },
    StatuslineCyan                             = { fg = ansi.cyan, bg = statusline },
    StatuslineMagenta                          = { fg = ansi.magenta, bg = statusline },
    --- ALE
    ALEWarningSign                             = { fg = warn },
    --- vim-matchup
    MatchupVirtualText                         = { fg = ansi.yellow },
    --- For `highlight link`
    MinimalBlack                               = { fg = ansi.black },
    MinimalBlue                                = { fg = ansi.blue },
    MinimalBrightYellow                        = { fg = ansi.brightyellow },
    MinimalCyan                                = { fg = ansi.cyan },
    MinimalGreen                               = { fg = ansi.green },
    MinimalDarkGreen                           = { fg = palette.green },
    MinimalMagenta                             = { fg = ansi.magenta },
    MinimalRed                                 = { fg = ansi.red },
    MinimalWhite                               = { fg = ansi.white },
    MinimalYellow                              = { fg = ansi.yellow },
    --- Hop
    HopNextKey                                 = { fg = ansi.brightyellow },
    HopNextKey1                                = { fg = ansi.cyan },
    HopNextKey2                                = { fg = palette.blue },
    HopUnmatched                               = { fg = palette.gray4 },
    --- Lightspeed
    LightspeedGreyWash                         = { fg = palette.gray4 },
    --- checkhealth
    healthSuccess                              = { fg = ansi.green, bg = bg },
    --- cmp
    CmpItemMenuDefault                         = { fg = ansi.magenta },
    BlinkCmpMenu                               = blink_menu,
    BlinkCmpMenuBorder                         = menu_border,
    BlinkCmpDoc                                = { link = "NormalFloat" },
    BlinkCmpDocBorder                          = menu_border,
    --- todo-comments.nvim
    TodoBgFIX                                  = { bg = todo_colors.FIX, fg = palette.black },
    TodoBgTODO                                 = { bg = todo_colors.TODO, fg = palette.black },
    TodoBgHACK                                 = { bg = todo_colors.HACK, fg = palette.black },
    TodoBgWARN                                 = { bg = todo_colors.WARN, fg = palette.black },
    TodoBgPERF                                 = { bg = todo_colors.PERF, fg = palette.black },
    TodoBgNOTE                                 = { bg = todo_colors.NOTE, fg = palette.black },
    TodoBgTEST                                 = { bg = todo_colors.TEST, fg = palette.black },
    TodoFgFIX                                  = { fg = todo_colors.FIX },
    TodoFgTODO                                 = { fg = todo_colors.TODO },
    TodoFgHACK                                 = { fg = todo_colors.HACK },
    TodoFgWARN                                 = { fg = todo_colors.WARN },
    TodoFgPERF                                 = { fg = todo_colors.PERF },
    TodoFgNOTE                                 = { fg = todo_colors.NOTE },
    TodoFgTEST                                 = { fg = todo_colors.TEST },
    TodoSignFIX                                = { fg = todo_colors.FIX },
    TodoSignTODO                               = { fg = todo_colors.TODO },
    TodoSignHACK                               = { fg = todo_colors.HACK },
    TodoSignWARN                               = { fg = todo_colors.WARN },
    TodoSignPERF                               = { fg = todo_colors.PERF },
    TodoSignNOTE                               = { fg = todo_colors.NOTE },
    TodoSignTEST                               = { fg = todo_colors.TEST },
    --- nvim-ts-rainbow
    rainbowcol1                                = { fg = ansi.yellow },
    rainbowcol2                                = { fg = ansi.magenta },
    rainbowcol3                                = { fg = ansi.blue },
    rainbowcol4                                = { fg = palette.lavender },
    rainbowcol5                                = { fg = ansi.brightyellow },
    rainbowcol6                                = { fg = ansi.red },
    rainbowcol7                                = { fg = ansi.cyan },
    --- Iswap
    ISwapSnipe                                 = { bg = ansi.yellow, fg = bg },
    ISwapGrey                                  = { fg = palette.gray4 },
    --- vim-dadbod-ui
    dbui_help                                  = { fg = dim_comment },
    dbui_connection_source                     = { fg = dim_comment },
    --- nvim-dap-virtual-text
    NvimDapVirtualText                         = { bg = virtual_bg, fg = virtual_fg },
    --- gitsigns blame
    GitSignsCurrentLineBlame                   = { fg = virtual_fg },
    --- inlay hints
    LspInlayHint                               = { bg = virtual_bg, fg = virtual_fg },
    --- Noice
    NoiceCmdlineIcon                           = { link = "MinimalBlue" },
    NoiceCmdlinePopupBorder                    = { link = "MinimalBlue" },
    NoiceConfirmBorder                         = { link = "MinimalBlue" },
    NoiceCmdlinePopupBorderCmdline             = { link = "MinimalBlue" },
    NoiceCmdlineIconCmdline                    = { link = "MinimalBlue" },
    NoiceCmdlinePopupBorderFilter              = { link = "MinimalBlue" },
    NoiceCmdlineIconFilter                     = { link = "MinimalBlue" },
    NoiceCmdlinePopupBorderLua                 = { link = "MinimalBlue" },
    NoiceCmdlineIconLua                        = { link = "MinimalBlue" },
    NoiceCmdlinePopupBorderSearch              = { link = "MinimalYellow" },
    NoiceCmdlineIconSearch                     = { link = "MinimalYellow" },
    -- Languages
    --- asm
    asmDirective                               = { fg = dim_comment },
    nasmLabel                                  = { link = "@MinimalDefinition" },

    ["@lsp.mod.declaration"]                   = { fg = fg, bold = bold_intro_opt and 1 or nil },
    ["@lsp.type.enumMember"]                   = { fg = fg },
    ["@lsp.type.function"]                     = { fg = fg },
    ["@lsp.type.method"]                       = { fg = fg },
    ["@lsp.type.selfKeyword"]                  = { fg = fg },
    ["@lsp.typemod.class.declaration"]         = { fg = def_fg, bold = bold_intro_opt and 1 or nil },
    ["@lsp.typemod.class.definition"]          = { fg = def_fg, bold = bold_intro_opt and 1 or nil },
    ["@lsp.typemod.enum.declaration"]          = { fg = def_fg, bold = bold_intro_opt and 1 or nil },
    ["@lsp.typemod.enumMember.defaultLibrary"] = { fg = fg },
    ["@lsp.typemod.function.declaration"]      = { fg = def_fg, bold = bold_intro_opt and 1 or nil },
    ["@lsp.typemod.function.definition"]       = { fg = def_fg, bold = bold_intro_opt and 1 or nil },
    ["@lsp.typemod.macro.declaration"]         = { fg = def_fg, bold = bold_intro_opt and 1 or nil },
    ["@lsp.typemod.method.declaration"]        = { fg = def_fg, bold = bold_intro_opt and 1 or nil },
    ["@lsp.typemod.selfKeyword"]               = { fg = fg },
    ["@lsp.typemod.struct.declaration"]        = { fg = def_fg, bold = bold_intro_opt and 1 or nil },
    ["@lsp.typemod.type.declaration"]          = { fg = def_fg, bold = bold_intro_opt and 1 or nil },
    ["@lsp.type.parameter"]                    = { fg = fg, bold = bold_intro_opt and 1 or nil },
    ["@lsp.typemod.parameter.declaration"]     = { fg = fg, bold = bold_intro_opt and 1 or nil },
    ["@lsp.typemod.parameter.definition"]      = { fg = fg, bold = bold_intro_opt and 1 or nil },
    ["@lsp.typemod.variable.declaration"]      = { fg = fg, bold = bold_intro_opt and 1 or nil },
    ["@lsp.typemod.variable.definition"]       = { fg = fg, bold = bold_intro_opt and 1 or nil },
    ["@lsp.type.parameter"]                    = { fg = fg, bold = bold_intro_opt and 1 or nil },
    ["@lsp.typemod.parameter.declaration"]     = { fg = fg, bold = bold_intro_opt and 1 or nil },
    ["@lsp.typemod.parameter.definition"]      = { fg = fg, bold = bold_intro_opt and 1 or nil },
    ["@lsp.typemod.variable.declaration"]      = { fg = fg, bold = bold_intro_opt and 1 or nil },
    ["@lsp.typemod.variable.definition"]       = { fg = fg, bold = bold_intro_opt and 1 or nil },
  }
else
  -- terminal colors
  vim.g.terminal_color_0 = palette.black
  vim.g.terminal_color_1 = palette.red
  vim.g.terminal_color_2 = palette.green
  vim.g.terminal_color_3 = palette.yellow
  vim.g.terminal_color_4 = palette.blue
  vim.g.terminal_color_5 = palette.orange
  vim.g.terminal_color_6 = palette.lack
  vim.g.terminal_color_7 = palette.luster
  vim.g.terminal_color_8 = palette.gray6
  vim.g.terminal_color_9 = palette.red
  vim.g.terminal_color_10 = palette.green
  vim.g.terminal_color_11 = palette.orange
  vim.g.terminal_color_12 = palette.blue
  vim.g.terminal_color_13 = palette.orange
  vim.g.terminal_color_14 = palette.lack
  vim.g.terminal_color_15 = palette.gray9

  -- colors
  local bg = palette.luster
  local fg = palette.black
  local punct_fg = palette.gray6
  local def_fg = palette.blue
  local const_fg = palette.orange
  local active = palette.gray5
  local active_blue = palette.blue
  local string_fg = palette.lavender
  local darker_fg = palette.gray6
  local diffadd = palette.green
  local diffdelete = palette.red
  local diffchange = palette.orange
  local statusline = palette.gray9
  local comment = palette.yellow
  local dim_comment = palette.gray6
  local virtual_fg = palette.gray6
  local virtual_bg = palette.gray9
  local mistake = {
    fg = palette.red,
    bg = palette.gray9,
  }
  local ansi = {
    black = palette.black,
    blue = palette.blue,
    brightyellow = palette.yellow,
    cyan = palette.lack,
    green = palette.green,
    magenta = palette.blue,
    red = palette.red,
    white = palette.luster,
    yellow = palette.yellow,
  }
  local error = palette.red
  local warn = palette.orange
  local hint = palette.lack
  local info = palette.lack
  local comment_fg = dim_comments_opt and dim_comment or comment
  local pmenu_bg = palette.gray9
  local float_bg = floatborder_opt and bg or pmenu_bg
  local floatborder = floatborder_opt and { bg = bg, fg = palette.gray6 }
      or {
        bg = float_bg,
        fg = float_bg,
      }
  if transparent_opt then
    bg = palette.none
    float_bg = palette.none
    virtual_bg = palette.none
    floatborder = floatborder_opt and { bg = bg, fg = palette.gray6 }
        or {
          bg = float_bg,
          fg = float_bg,
        }
  end
  local blink_menu = transparent_opt and { bg = bg, fg = fg } or { link = "Pmenu" }
  local blink_menu_border = transparent_opt and { bg = bg, fg = palette.gray6 } or { link = "FloatBorder" }
  local todo_colors = {
    FIX = error,
    TODO = info,
    HACK = warn,
    WARN = warn,
    PERF = palette.lack,
    NOTE = hint,
    TEST = palette.yellow,
  }
  theme = {
    Comment = { fg = comment_fg },
    ColorColumn = { bg = palette.gray9 },
    Conceal = { fg = palette.gray6 },
    Cursor = { bg = active_blue, fg = palette.gray9 },
    -- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn = { bg = palette.gray9 },
    CursorLine = { bg = palette.gray9 },
    Directory = { fg = ansi.blue },
    DiffAdd = { bg = palette.gray9, fg = diffadd },
    DiffDelete = { bg = palette.gray9, fg = diffdelete },
    DiffText = { fg = fg, bg = palette.gray8 },
    DiffChange = { bg = palette.gray9, fg = diffchange },
    EndOfBuffer = { fg = palette.gray6 },
    -- TermCursor   { }, -- cursor in a focused terminal
    TermCursorNC = { fg = bg, bg = fg },
    ErrorMsg = { fg = error, bg = mistake.bg },
    VertSplit = { fg = palette.gray6 },
    WinSeparator = { link = "VertSplit" },
    Folded = { bg = pmenu_bg, fg = darker_fg },
    FoldColumn = { bg = bg, fg = palette.gray5 },
    SignColumn = {},
    IncSearch = { bg = active, fg = fg },
    -- Substitute   { }, -- |:substitute| replacement text highlighting
    LineNr = { fg = palette.gray6 },
    CursorLineNr = { fg = ansi.blue, bold = 1 },
    MatchParen = { underline = 1, sp = active },
    -- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea      { }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg = { fg = ansi.blue, bold = 1 },
    NonText = { fg = palette.gray6 },
    Normal = { bg = bg, fg = fg },
    NormalFloat = { bg = float_bg },
    -- NormalNC     { }, -- normal text in non-current windows
    FloatBorder = floatborder,
    Pmenu = { bg = pmenu_bg },
    PmenuSel = { bg = palette.gray7 },
    PmenuSbar = { bg = palette.gray7 },
    PmenuThumb = { bg = palette.gray6 },
    Question = { fg = ansi.blue },
    QuickFixLine = { bg = palette.gray9 },
    Search = { bg = palette.yellow, fg = fg },
    SpecialKey = { fg = ansi.cyan },
    SpellBad = { undercurl = 1, sp = ansi.red },
    SpellCap = { undercurl = 1, sp = ansi.blue },
    SpellLocal = { undercurl = 1, sp = ansi.cyan },
    SpellRare = { undercurl = 1, sp = ansi.magenta },
    StatusLine = { bg = statusline, fg = fg },
    StatusLineNC = { bg = statusline, fg = palette.gray6 },
    TabLine = { bg = statusline, fg = palette.gray6 },
    TabLineFill = { bg = statusline },
    TabLineSel = { bg = statusline, fg = ansi.blue },
    Title = { fg = const_fg },
    Visual = { bg = palette.gray7, fg = fg },
    VisualNOS = { bg = palette.gray7, fg = fg },
    WarningMsg = { fg = warn },
    WildMenu = { bg = palette.gray6, fg = fg },
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
    Delimiter = { fg = punct_fg },

    --- SYNTAX II: TS groups have their own definition, the below are defined to have somewhat working hl w/o treesitter
    Identifier = { fg = ansi.black },
    Function = { fg = def_fg, bold = bold_intro_opt and 1 or nil },
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
    Structure = { fg = def_fg, bold = bold_intro_opt and 1 or nil },
    Typedef = { fg = def_fg, bold = bold_intro_opt and 1 or nil },

    Special = { fg = ansi.yellow },
    -- TODO better color than diffchange, try reddish
    -- SpecialChar = { fg = diffchange }, --  special character in a constant
    -- Tag            { }, --    you can use CTRL-] on this
    -- Delimiter      { },
    SpecialComment = { bg = palette.gray9, fg = ansi.blue },
    debugPc = { bg = palette.gray8 },
    debugBreakpoint = { bg = palette.gray6, fg = fg },
    helpHyperTextJump = { fg = ansi.magenta },
    helpSectionDelim = { fg = ansi.magenta },
    helpExample = { fg = ansi.cyan },
    helpCommand = { fg = ansi.cyan },
    helpHeadline = { fg = ansi.blue },
    helpHeader = { fg = ansi.magenta },

    Underlined = { underline = 1 }, -- (preferred) text that stands out, HTML links
    Italic = { italic = 1 },

    -- ("Ignore", below, may be invisible...)
    -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error = { bg = mistake.bg, fg = mistake.fg },

    Todo = { bg = palette.gray9, fg = ansi.blue, bold = true },

    --- Diagnostic
    LspReferenceText = { bg = palette.gray9 },
    LspReferenceRead = { bg = palette.gray9 },
    LspReferenceWrite = { bg = palette.gray9, underline = 1, sp = active_blue },
    LspCodeLens = { fg = palette.gray6 },
    LspCodeLensSeparator = { fg = palette.gray6 },

    --- Diagnostic
    DiagnosticError = { fg = error },
    DiagnosticWarn = { fg = warn },
    DiagnosticHint = { fg = hint },
    DiagnosticInfo = { fg = info },
    DiagnosticVirtualTextError = { bg = virtual_bg, fg = error },
    DiagnosticVirtualTextWarn = { bg = virtual_bg, fg = warn },
    DiagnosticVirtualTextHint = { bg = virtual_bg, fg = virtual_fg },
    DiagnosticVirtualTextInfo = { bg = virtual_bg, fg = virtual_fg },
    DiagnosticUnderlineError = { underline = 1, sp = error },
    DiagnosticUnderlineWarn = { underline = 1, sp = warn },
    DiagnosticUnderlineHint = { underline = 1, sp = hint },
    DiagnosticUnderlineInfo = { underline = 1, sp = info },
    LspDiagnosticsUnderlineError = { link = "DiagnosticUnderlineError" },
    LspDiagnosticsUnderlineWarning = { link = "DiagnosticUnderlineWarn" },
    LspDiagnosticsUnderlineHint = { link = "DiagnosticUnderlineHint" },
    LspDiagnosticsUnderlineInformation = { link = "DiagnosticUnderlineInfo" },

    --- Treesitter
    TSAttribute = {},
    TSConstructor = { fg = punct_fg },
    TSConditional = { fg = ansi.black },
    TSConstBuiltin = { fg = const_fg },
    TSConstMacro = { fg = ansi.black },
    TSError = { bg = mistake.bg, fg = mistake.fg },
    TSException = { fg = ansi.black },
    TSField = { fg = ansi.black },
    TSFunction = { fg = ansi.black },
    TSFuncBuiltin = { fg = ansi.black },
    TSFuncMacro = { fg = ansi.black },
    TSKeyword = { fg = ansi.black },
    TSKeywordFunction = { fg = ansi.black },
    TSLabel = { fg = ansi.black },
    TSMethod = { fg = ansi.black },
    TSNamespace = { fg = ansi.black },
    TSNone = { fg = const_fg },
    TSParameter = { fg = ansi.black, bold = bold_intro_opt and 1 or nil },
    TSParameterReference = { fg = ansi.black },
    TSProperty = { fg = ansi.black },
    TSPunctDelimiter = { fg = punct_fg },
    TSPunctBracket = { fg = punct_fg },
    TSPunctSpecial = { fg = punct_fg },
    TSRepeat = { fg = ansi.black },
    TSString = { fg = string_fg },
    TSStringRegex = { bg = bg, fg = punct_fg },
    TSStringEscape = { bg = bg, fg = punct_fg },
    TSSymbol = {},
    TSType = { fg = ansi.black },
    TSTypeBuiltin = { fg = ansi.black },
    TSVariable = { fg = ansi.black },
    TSVariableBuiltin = { fg = ansi.black },
    TSTag = { fg = ansi.black },
    TSTagDelimiter = { fg = punct_fg },
    TSText = { fg = ansi.black },

    ["@attribute"] = {},
    ["@constructor"] = { fg = punct_fg },
    ["@conditional"] = { fg = ansi.black },
    ["@constant.builtin"] = { fg = const_fg },
    ["@constant.macro"] = { fg = ansi.black },
    ["@error"] = { bg = mistake.bg, fg = mistake.fg },
    ["@exception"] = { fg = ansi.black },
    ["@field"] = { fg = ansi.black },
    ["@function"] = { fg = ansi.black },
    ["@function.builtin"] = { fg = ansi.black },
    ["@function.macro"] = { fg = ansi.black },
    ["@keyword"] = { fg = ansi.black },
    ["@keyword.function"] = { fg = ansi.black },
    ["@label"] = { fg = ansi.black },
    ["@method"] = { fg = ansi.black },
    ["@module"] = { fg = ansi.black },
    ["@namespace"] = { fg = ansi.black },
    ["@none"] = { fg = const_fg },
    ["@parameter"] = { fg = ansi.black, bold = bold_intro_opt and 1 or nil },
    ["@variable.parameter"] = { fg = ansi.black, bold = bold_intro_opt and 1 or nil },
    ["@parameter.reference"] = { fg = ansi.black },
    ["@property"] = { fg = ansi.black },
    ["@punctuation.delimiter"] = { fg = punct_fg },
    ["@punctuation.bracket"] = { fg = punct_fg },
    ["@punctuation.special"] = { fg = punct_fg },
    ["@repeat"] = { fg = ansi.black },
    ["@string"] = { fg = string_fg },
    ["@string.regex"] = { bg = bg, fg = punct_fg },
    ["@string.escape"] = { bg = bg, fg = punct_fg },
    ["@symbol"] = {},
    ["@type"] = { fg = ansi.black },
    ["@type.builtin"] = { fg = ansi.black },
    ["@variable"] = { fg = ansi.black },
    ["@variable.builtin"] = { fg = ansi.black },
    ["@tag"] = { fg = ansi.black },
    ["@tag.delimiter"] = { fg = punct_fg },
    ["@text"] = { fg = ansi.black },
    ["@text.note"] = { bg = palette.gray9, fg = ansi.blue },
    ["@text.warning"] = { bg = palette.yellow, fg = ansi.blue },

    --- Theme specific
    ["@MinimalBase"] = { fg = ansi.black },
    ["@MinimalConstant"] = { fg = const_fg },
    ["@MinimalDefinition"] = { fg = def_fg, bold = bold_intro_opt and 1 or nil },
    ["@MinimalPunctuation"] = { fg = punct_fg },
    ["@MinimalPunct"] = { link = "@MinimalPunctuation" },
    ["@MinimalString"] = { fg = string_fg },
    ["@MinimalHashbang"] = { fg = dim_comment },
    --- Gitsigns
    GitSignsAdd = { fg = diffadd },
    GitSignsChange = { fg = diffchange },
    GitSignsDelete = { fg = diffdelete },
    --- Telescope
    TelescopeBorder = { fg = palette.gray6 },
    TelescopeMatching = { fg = palette.orange },
    TelescopeMultiSelection = { fg = ansi.magenta },
    TelescopePromptPrefix = { fg = ansi.blue },
    TelescopeSelectionCaret = { fg = mistake.fg },
    TelescopeTitle = { fg = ansi.yellow },
    TelescopeResultsTitle = { fg = ansi.yellow },
    --- fzf-lua
    FzfLuaBorder = { fg = palette.gray6 },
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
    StartifySection = { fg = ansi.blue },
    StartifySlash = { fg = palette.lack },
    StartifyPath = { fg = palette.lack },
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
    MinimalBlack = { fg = ansi.black },
    MinimalBlue = { fg = ansi.blue },
    MinimalBrightYellow = { fg = ansi.brightyellow },
    MinimalCyan = { fg = ansi.cyan },
    MinimalGreen = { fg = ansi.green },
    MinimalBrightGreen = { fg = palette.green },
    MinimalMagenta = { fg = ansi.magenta },
    MinimalRed = { fg = ansi.red },
    MinimalWhite = { fg = ansi.black },
    MinimalYellow = { fg = ansi.yellow },
    --- Hop
    HopNextKey = { fg = ansi.yellow },
    HopNextKey1 = { fg = ansi.blue },
    HopNextKey2 = { fg = palette.blue },
    HopUnmatched = { fg = palette.gray7 },
    --- Lightspeed
    LightspeedGreyWash = { fg = palette.gray7 },
    --- checkhealth
    healthSuccess = { fg = ansi.green, bg = bg },
    --- cmp
    CmpItemMenuDefault = { fg = ansi.magenta },
    BlinkCmpMenu = blink_menu,
    BlinkCmpMenuBorder = blink_menu_border,
    CmpDocumentation = { link = "NormalFloat" },
    CmpDocumentationBorder = blink_menu_border,
    --- todo-comments.nvim
    TodoBgFIX = { bg = todo_colors.FIX, fg = palette.black },
    TodoBgTODO = { bg = todo_colors.TODO, fg = palette.black },
    TodoBgHACK = { bg = todo_colors.HACK, fg = palette.black },
    TodoBgWARN = { bg = todo_colors.WARN, fg = palette.black },
    TodoBgPERF = { bg = todo_colors.PERF, fg = palette.black },
    TodoBgNOTE = { bg = todo_colors.NOTE, fg = palette.black },
    TodoBgTEST = { bg = todo_colors.TEST, fg = palette.black },
    TodoFgFIX = { fg = todo_colors.FIX },
    TodoFgTODO = { fg = todo_colors.TODO },
    TodoFgHACK = { fg = todo_colors.HACK },
    TodoFgWARN = { fg = todo_colors.WARN },
    TodoFgPERF = { fg = todo_colors.PERF },
    TodoFgNOTE = { fg = todo_colors.NOTE },
    TodoFgTEST = { fg = todo_colors.TEST },
    TodoSignFIX = { fg = todo_colors.FIX },
    TodoSignTODO = { fg = todo_colors.TODO },
    TodoSignHACK = { fg = todo_colors.HACK },
    TodoSignWARN = { fg = todo_colors.WARN },
    TodoSignPERF = { fg = todo_colors.PERF },
    TodoSignNOTE = { fg = todo_colors.NOTE },
    TodoSignTEST = { fg = todo_colors.TEST },
    --- nvim-ts-rainbow
    rainbowcol1 = { fg = ansi.yellow },
    rainbowcol2 = { fg = ansi.magenta },
    rainbowcol3 = { fg = ansi.blue },
    rainbowcol4 = { fg = palette.lavender },
    rainbowcol5 = { fg = ansi.brightyellow },
    rainbowcol6 = { fg = ansi.red },
    rainbowcol7 = { fg = ansi.cyan },
    --- Iswap
    ISwapSnipe = { bg = ansi.yellow, fg = bg },
    ISwapGrey = { fg = palette.gray7 },
    --- vim-dadbod-ui
    dbui_help = { fg = dim_comment },
    dbui_connection_source = { fg = dim_comment },
    --- nvim-dap-virtual-text
    NvimDapVirtualText = { bg = virtual_bg, fg = virtual_fg },
    --- gitsigns blame
    GitSignsCurrentLineBlame = { fg = virtual_fg },
    --- inlay hints
    LspInlayHint = { bg = virtual_bg, fg = virtual_fg },
    --- Noice
    NoiceCmdlineIcon = { link = "MinimalBlue" },
    NoiceCmdlinePopupBorder = { link = "MinimalBlue" },
    NoiceConfirmBorder = { link = "MinimalBlue" },
    NoiceCmdlinePopupBorderCmdline = { link = "MinimalBlue" },
    NoiceCmdlineIconCmdline = { link = "MinimalBlue" },
    NoiceCmdlinePopupBorderFilter = { link = "MinimalBlue" },
    NoiceCmdlineIconFilter = { link = "MinimalBlue" },
    NoiceCmdlinePopupBorderLua = { link = "MinimalBlue" },
    NoiceCmdlineIconLua = { link = "MinimalBlue" },
    NoiceCmdlinePopupBorderSearch = { link = "MinimalYellow" },
    NoiceCmdlineIconSearch = { link = "MinimalYellow" },
    -- Languages
    --- asm
    asmDirective = { fg = dim_comment },
    nasmLabel = { link = "@MinimalDefinition" },
    ["@lsp.mod.declaration"] = { fg = fg, bold = bold_intro_opt and 1 or nil },
    ["@lsp.type.enumMember"] = { fg = fg },
    ["@lsp.type.function"] = { fg = fg },
    ["@lsp.type.method"] = { fg = fg },
    ["@lsp.type.selfKeyword"] = { fg = fg },
    ["@lsp.typemod.class.declaration"] = { fg = def_fg, bold = bold_intro_opt and 1 or nil },
    ["@lsp.typemod.class.definition"] = { fg = def_fg, bold = bold_intro_opt and 1 or nil },
    ["@lsp.typemod.enum.declaration"] = { fg = def_fg, bold = bold_intro_opt and 1 or nil },
    ["@lsp.typemod.enumMember.defaultLibrary"] = { fg = fg },
    ["@lsp.typemod.function.declaration"] = { fg = def_fg, bold = bold_intro_opt and 1 or nil },
    ["@lsp.typemod.function.definition"] = { fg = def_fg, bold = bold_intro_opt and 1 or nil },
    ["@lsp.typemod.macro.declaration"] = { fg = def_fg, bold = bold_intro_opt and 1 or nil },
    ["@lsp.typemod.method.declaration"] = { fg = def_fg, bold = bold_intro_opt and 1 or nil },
    ["@lsp.typemod.selfKeyword"] = { fg = fg },
    ["@lsp.typemod.struct.declaration"] = { fg = def_fg, bold = bold_intro_opt and 1 or nil },
    ["@lsp.typemod.type.declaration"] = { fg = def_fg, bold = bold_intro_opt and 1 or nil },
  }
end

for group, hl in pairs(theme) do
  vim.api.nvim_set_hl(0, group, hl)
end

-- vi:nowrap
