require("which-key").setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = true, -- adds help for operators like d, y, ...
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true -- bindings for prefixed with g
        }
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+" -- symbol prepended to a group
    },
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
        padding = {2, 2, 2, 2} -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = {min = 4, max = 25}, -- min and max height of the columns
        width = {min = 20, max = 50}, -- min and max width of the columns
        spacing = 3 -- spacing between columns
    },
    hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true -- show help message on the command line when the popup is visible
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false -- use `nowait` when creating keymaps
}

-- Set leader
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- no hl
vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', {noremap = true, silent = true})

-- explorer
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- telescope
vim.api.nvim_set_keymap('n', '<Leader>f', ':Telescope find_files<CR>', {noremap = true, silent = true})

-- dashboard
vim.api.nvim_set_keymap('n', '<Leader>;', ':Dashboard<CR>', {noremap = true, silent = true})

-- Comments
vim.api.nvim_set_keymap("n", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})

-- close buffer
vim.api.nvim_set_keymap("n", "<leader>c", ":BufferClose<CR>", {noremap = true, silent = true})

-- open projects
vim.api.nvim_set_keymap('n', '<leader>p', ":lua require'telescope'.extensions.project.project{}<CR>",
                        {noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "<leader>r", ":Rename<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>m", ":MaximizerToggle!<CR>", {noremap = true, silent = true})
-- TODO create entire treesitter section

local mappings = {
    ["/"] = "Comment",
    ["c"] = "Close Buffer",
    ["e"] = "Explorer",
    ["f"] = "Find File",
    ["h"] = "No Highlight",
    ["p"] = "Projects",
    ["r"] = "Rename",
    ["m"] = "Maximize",
    d = {
        name = "+Diagnostics",
        t = {"<cmd>TroubleToggle<cr>", "trouble"},
        w = {"<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "workspace"},
        d = {"<cmd>TroubleToggle lsp_document_diagnostics<cr>", "document"},
        q = {"<cmd>TroubleToggle quickfix<cr>", "quickfix"},
        l = {"<cmd>TroubleToggle loclist<cr>", "loclist"},
        r = {"<cmd>TroubleToggle lsp_references<cr>", "references"},
    },
    D = {
        name = "+Debug",
        d = {"<cmd>call vimspector#Launch()<cr>", "Launch"},
        c = {"<cmd>call GotoWindow(g:vimspector_session_windows.code)<cr>", "Code"},
        t = {"<cmd>call GotoWindow(g:vimspector_session_windows.tagpage)<cr>", "Tagpage"},
        v = {"<cmd>call GotoWindow(g:vimspector_session_windows.variables)<cr>", "Variables"},
        w = {"<cmd>call GotoWindow(g:vimspector_session_windows.watches)<cr>", "Watches"},
        s = {"<cmd>call GotoWindow(g:vimspector_session_windows.stack_trace)<cr>", "Stack Trace"},
        o = {"<cmd>call GotoWindow(g:vimspector_session_windows.output)<cr>", "Output"},
        r = {"<cmd>call vimspector#Reset()<cr>", "Reset"},
        e = {"<cmd>VimspectorEval<cr>", "Eval"},

        b = {"<cmd>VimspectorToggleBreakpoint<cr>", "Toggle Breakpoint"},
        p = {"<cmd>call vimspector#Continue()<cr>", "Proceed"},
        l = {"<cmd>VimspectorStepInto<cr>", "Step Into"},
        j = {"<cmd>VimspectorStepOver<cr>", "Step Over"},
        k = {"<cmd>VimspectorStepOut<cr>", "Step Out"},
        R = {"<cmd>VimspectorRestart<cr>", "Restart"},
        C = {"<cmd>VimspectorRunToCursor<cr>", "Run to Cursor"},
        -- r = {"<cmd>DebugToggleRepl<cr>", "Toggle Repl"},
        -- s = {"<cmd>DebugStart<cr>", "Start"}
    },
    g = {
        name = "+Git",
        j = {"<cmd>NextHunk<cr>", "Next Hunk"},
        k = {"<cmd>PrevHunk<cr>", "Prev Hunk"},
        p = {"<cmd>PreviewHunk<cr>", "Preview Hunk"},
        r = {"<cmd>ResetHunk<cr>", "Reset Hunk"},
        R = {"<cmd>ResetBuffer<cr>", "Reset Buffer"},
        s = {"<cmd>StageHunk<cr>", "Stage Hunk"},
        u = {"<cmd>UndoStageHunk<cr>", "Undo Stage Hunk"},
        o = {"<cmd>Telescope git_status<cr>", "Open changed file"},
        b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
        c = {"<cmd>Telescope git_commits<cr>", "Checkout commit"},
        C = {"<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)"},
        l = {"<cmd>lua _lazygit_toggle()<CR>", "lazygit"},
    },
    l = {
        name = "+LSP",
        a = {"<cmd>Lspsaga code_action<cr>", "Code Action"},
        A = {"<cmd>Lspsaga range_code_action<cr>", "Selected Action"},
        d = {"<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics"},
        D = {"<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics"},
        f = {"<cmd>LspFormatting<cr>", "Format"},
        i = {"<cmd>LspInfo<cr>", "Info"},
        l = {"<cmd>Lspsaga lsp_finder<cr>", "LSP Finder"},
        L = {"<cmd>Lspsaga show_line_diagnostics<cr>", "Line Diagnostics"},
        p = {"<cmd>Lspsaga preview_definition<cr>", "Preview Definition"},
        q = {"<cmd>Telescope quickfix<cr>", "Quickfix"},
        r = {"<cmd>Lspsaga rename<cr>", "Rename"},
        t = {"<cmd>LspTypeDefinition<cr>", "Type Definition"},
        x = {"<cmd>cclose<cr>", "Close Quickfix"},
        s = {"<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols"},
        S = {"<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols"}
    },
    s = {
        name = "+Search",
        B = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
        c = {"<cmd>Telescope colorscheme<cr>", "Colorscheme"},
        d = {"<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics"},
        D = {"<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics"},
        f = {"<cmd>Telescope find_files<cr>", "Find File"},
        m = {"<cmd>Telescope marks<cr>", "Marks"},
        M = {"<cmd>Telescope man_pages<cr>", "Man Pages"},
        r = {"<cmd>Telescope oldfiles<cr>", "Open Recent File"},
        R = {"<cmd>Telescope registers<cr>", "Registers"},
        t = {"<cmd>Telescope live_grep<cr>", "Text"},
        w = {"<cmd>VimwikiSearch<cr>", "wiki"},
        b = {"<cmd>JABSOpen<cr>", "buffers"},
    },
    S = {name = "+Session", s = {"<cmd>SessionSave<cr>", "Save Session"}, l = {"<cmd>SessionLoad<cr>", "Load Session"}},

    -- extras
    z = {
        name = "+Zen",
        -- s = {"<cmd>TZBottom<cr>", "toggle status line"},
        -- t = {"<cmd>TZTop<cr>", "toggle tab bar"},
        s = {"<cmd>lua _spotify_toggle()<cr>", "spt"},
        z = {"<cmd>TZAtaraxis<cr>", "toggle zen"},
    },

    w = {
        name = "+Wiki",
        x = {"<cmd> VimwikiIndex<cr>", "to index"},
        j = {"<cmd> VimwikiDiaryIndex<cr>", "to journal"},
        t = {"<cmd> VimwikiMakeDiaryNote<cr>", "open today's note"},
        y = {"<cmd> VimwikiDiaryPrevDay<cr>", "open yesterday's note"},
        d = {"<cmd> VimwikiDeleteFile<cr>", "delete file"},
        n = {"<cmd> VimwikiRenameFile<cr>", "rename file"},
        g = {"<cmd>lua _glow_toggle()<CR>", "glow"},
    },

    T = {
        name = "+To Do",
        q = {"<cmd> TodoQuickFix<cr>", "quick fix"},
        s = {"<cmd> TodoTelescope<cr>", "telescope"},
        t = {"<cmd> TodoTrouble<cr>", "trouble"},
    },

    t = {
        name = "+TaskWiki",
    },
}

local wk = require("which-key")
wk.register(mappings, opts)
