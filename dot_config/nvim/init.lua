vim.g.mapleader = " "
vim.g.maplocalleader = " "

local undodir = vim.fn.expand("~/.vim/undodir")
if
    vim.fn.isdirectory(undodir) == 0 -- create undodir if nonexistent
then
    vim.fn.mkdir(undodir, "p")
end

vim.opt.backup = false -- do not create a backup file
vim.opt.writebackup = false -- do not write to a backup file
vim.opt.swapfile = false -- do not create a swapfile
vim.opt.undofile = true -- do create an undo file
vim.opt.undodir = undodir -- Set the directory to store undo files
vim.opt.updatetime = 300 -- faster completion
vim.opt.timeoutlen = 500 -- timeout duration
vim.opt.ttimeoutlen = 50 -- key code timeout
vim.opt.autoread = true -- auto-reload changes if outside of neovim
vim.opt.autowrite = false -- do not auto-save

-- Folding: requires treesitter available at runtime; safe fallback if not
vim.opt.foldmethod = "expr" -- use expression for folding
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- use treesitter for folding
vim.opt.foldlevel = 99 -- start with all folds open

vim.opt.shortmess:append("I") -- no splash screen
vim.opt.number = true -- line number
vim.opt.relativenumber = true -- relative line numbers
vim.opt.cursorline = true -- highlight current line
vim.opt.wrap = false -- do not wrap lines by default
vim.opt.scrolloff = 999 -- keep 10 lines above/below cursor
vim.opt.sidescrolloff = 10 -- keep 10 lines to left/right of cursor

vim.opt.tabstop = 4 -- tabwidth
vim.opt.shiftwidth = 4 -- indent width
vim.opt.softtabstop = 4 -- soft tab stop not tabs on tab/backspace
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.smartindent = true -- smart auto-indent
vim.opt.autoindent = true -- copy indent from current line

vim.opt.ignorecase = true -- case insensitive search
vim.opt.smartcase = true -- case sensitive if uppercase in string
vim.opt.hlsearch = true -- highlight search matches
vim.opt.incsearch = true -- show matches as you type

vim.opt.signcolumn = "yes" -- always show a sign column
vim.opt.colorcolumn = "80" -- show a column at 100 position chars
vim.opt.showmatch = true -- highlights matching brackets
vim.opt.cmdheight = 1 -- single line command line
vim.opt.completeopt = "menuone,noinsert,noselect" -- completion options
vim.opt.showmode = false -- do not show the mode, instead have it in statusline
vim.opt.pumheight = 10 -- popup menu height
vim.opt.pumblend = 0 -- popup menu transparency
-- vim.opt.winblend = 0 -- floating window transparency
vim.opt.concealcursor = "" -- do not hide cursorline in markup
vim.opt.synmaxcol = 300 -- syntax highlighting limit
vim.opt.fillchars = { eob = " " } -- hide "~" on empty lines

-- https://github.com/kdheepak/lazygit.nvim#usage
vim.g.lazygit_floating_window_scaling_factor = 0.95

vim.opt.winborder = "single"
vim.opt.pumborder = "single"

vim.opt.hidden = true -- allow hidden buffers
vim.opt.errorbells = false -- no error sounds
vim.opt.backspace = "indent,eol,start" -- better backspace behaviour
vim.opt.autochdir = false -- do not autochange directories
vim.opt.iskeyword:append("-") -- include - in words
vim.opt.path:append("**") -- include subdirs in search
vim.opt.selection = "inclusive" -- include last char in selection
vim.opt.mouse = "a" -- enable mouse support
vim.opt.clipboard:append("unnamedplus") -- use system clipboard
vim.opt.modifiable = true -- allow buffer modifications

vim.opt.splitbelow = true -- horizontal splits go below
vim.opt.splitright = true -- vertical splits go right

vim.opt.wildmenu = true -- tab completion
vim.opt.wildmode = "longest:full,full" -- complete longest common match, full completion list, cycle through with Tab
vim.opt.diffopt:append("linematch:60") -- improve diff display
vim.opt.redrawtime = 10000 -- increase neovim redraw tolerance
vim.opt.maxmempattern = 20000 -- increase max memory

vim.opt.ttimeout = true

vim.keymap.set("n", "<Esc>", "<CMD>nohlsearch<CR>")

vim.keymap.set("n", "<leader>ri", function()
    vim.cmd.restart()
end)

vim.keymap.set("n", "<leader>so", function()
    vim.cmd.update()
    vim.cmd.source()
    vim.notify("reloaded configuration!")
end)

-- vim.keymap.del("n", "]d")
-- vim.keymap.del("n", "[d")
-- vim.keymap.del("n", "]D")
-- vim.keymap.del("n", "[D")
-- vim.keymap.set("n", "]d", function()
--     vim.diagnostic.jump({ count = 1, float = true })
-- end)
-- vim.keymap.set("n", "[d", function()
--     vim.diagnostic.jump({ count = -1, float = true })
-- end)

vim.opt.cursorcolumn = true -- to enable cursorcolumn!
vim.opt.lazyredraw = true -- equivalent to 'set lazyredraw'
vim.opt.ttyfast = true -- equivalent to 'set ttyfast'
vim.opt.cursorline = true
vim.opt.cursorlineopt = "both" -- to enable cursorline!

vim.pack.add({
    { src = "https://github.com/tpope/vim-repeat" },
    { src = "https://github.com/christoomey/vim-tmux-navigator" },
    { src = "https://github.com/tpope/vim-surround" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/djoshea/vim-autoread" },
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        branch = "d0bf5ff2b00939eab39c6572aec7cf232f843b1f",
        build = ":TSUpdate",
    },
    { src = "https://github.com/folke/lazydev.nvim" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
    { src = "https://github.com/shrynx/line-numbers.nvim" },
    { src = "https://github.com/chenasraf/text-transform.nvim" },
    { src = "https://github.com/easymotion/vim-easymotion" },
    { src = "http://github.com/windwp/nvim-ts-autotag" },
    { src = "https://github.com/windwp/nvim-autopairs" },
    { src = "https://github.com/alvan/vim-closetag" },
    { src = "https://github.com/ibhagwan/fzf-lua" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/kdheepak/lazygit.nvim" },
    { src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" },
    { src = "https://github.com/nvim-mini/mini.notify", version = "stable" },
    { src = "https://github.com/nvim-mini/mini.icons" },
    { src = "https://github.com/nvim-mini/mini.cursorword" },
    { src = "https://github.com/nvim-mini/mini.trailspace" },
    { src = "https://github.com/stefandtw/quickfix-reflector.vim" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/ThePrimeagen/harpoon", branch = "harpoon2" },
    { src = "https://github.com/folke/which-key.nvim" },
    { src = "https://github.com/kshenoy/vim-signature" },
    { src = "https://github.com/hat0uma/csvview.nvim" },
    { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
    { src = "https://github.com/akinsho/toggleterm.nvim" },
    { src = "https://github.com/rktjmp/lush.nvim" },
    { src = "https://github.com/zenbones-theme/zenbones.nvim" },
    { src = "https://github.com/refractalize/oil-git-status.nvim" },
    { src = "https://github.com/JezerM/oil-lsp-diagnostics.nvim" },
    { src = "https://github.com/vim-scripts/dbext.vim" },
    { src = "https://github.com/rafamadriz/friendly-snippets" },
    { src = "https://github.com/L3MON4D3/LuaSnip" },
    {
        src = "https://github.com/saghen/blink.cmp",
        version = vim.version.range("1.*"),
    },
    { src = "https://github.com/stevearc/conform.nvim" },
    { src = "https://github.com/mfussenegger/nvim-lint" },
})

require("ibl").setup()
require("csvview").setup()
require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        dart = { "dart_format" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        html = { "prettier" },
        markdown = { "prettier" },
        javascript = { "eslint", "prettier", stop_after_first = true },
        javascriptreact = { "eslint", "prettier", stop_after_first = true },
        typescript = { "eslint", "prettier", stop_after_first = true },
        typescriptreact = { "eslint", "prettier", stop_after_first = true },
        php = { "phpcbf" },
        python = { "ruff_fix", "ruff_format" },

        xml = { "xmlformatter" },
        yaml = { "yamlfmt" },

        css = { "prettier" },

        sh = { "shfmt" },
        sql = { "sleek" },
        -- Conform will run multiple formatters sequentially
        -- python = { "isort", "black" },
        -- -- You can customize some of the format options for the filetype (:help conform.format)
        -- rust = { "rustfmt", lsp_format = "fallback" },
        -- -- Conform will run the first available formatter
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
    },
    default_format_opts = {
        lsp_format = "fallback",
    },
})
require("lint").linters_by_ft = {
    c = { "cpplint" },
    cpp = { "cpplint" },
    -- dart = {"dart"}
    html = { "htmlhint" },

    -- javascript = { "eslint" },
    -- javascriptreact = { "eslint" },
    typescript = { "eslint" },
    typescriptreact = { "eslint" },

    json = { "jsonlint", "eslint" },
    jsonc = { "eslint" },

    lua = { "luacheck" },

    php = { "phpcs" },
    -- markdown = {}

    -- python = { "basedpyright" },

    sh = { "shellcheck" },

    sql = { "sqlfluff" },
}

require("nvim-autopairs").setup()
require("luasnip.loaders.from_vscode").lazy_load()
require("which-key").setup({
    preset = "modern",
})
require("nvim-ts-autotag").setup()
require("lualine").setup({
    options = {
        icons_enabled = false,
        theme = "auto",
        component_separators = { left = " ", right = " " },
        section_separators = { left = " ", right = " " },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
            refresh_time = 16, -- ~60fps
            events = {
                "WinEnter",
                "BufEnter",
                "BufWritePost",
                "SessionLoadPost",
                "FileChangedShellPost",
                "VimResized",
                "Filetype",
                "CursorMoved",
                "CursorMovedI",
                "ModeChanged",
            },
        },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {
            {
                "filename",
                file_status = true, -- Displays file status (readonly status, modified status)
                newfile_status = false, -- Display new file status (new file means no write after created)
                path = 1, -- 0: Just the filename
                -- 1: Relative path
                -- 2: Absolute path
                -- 3: Absolute path, with tilde as the home directory
                -- 4: Filename and parent dir, with tilde as the home directory

                shorting_target = 40, -- Shortens path to leave 40 spaces in the window
                -- for other components. (terrible name, any suggestions?)
                -- It can also be a function that returns
                -- the value of `shorting_target` dynamically.
                symbols = {
                    modified = "[+]", -- Text to show when the file is modified.
                    readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
                    unnamed = "[No Name]", -- Text to show for unnamed buffers.
                    newfile = "[New]", -- Text to show for newly created file before first write
                },
            },
        },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
})

require("gitsigns").setup()
require("lazydev").setup()
require("mini.notify").setup()
require("mini.icons").setup()
require("mini.cursorword").setup()
require("mini.trailspace").setup({})

-- helper function to parse output
local function parse_output(proc)
    local result = proc:wait()
    local ret = {}
    if result.code == 0 then
        for line in vim.gsplit(result.stdout, "\n", { plain = true, trimempty = true }) do
            -- Remove trailing slash
            line = line:gsub("/$", "")
            ret[line] = true
        end
    end
    return ret
end

-- build git status cache
local function new_git_status()
    return setmetatable({}, {
        __index = function(self, key)
            local ignore_proc = vim.system(
                { "git", "ls-files", "--ignored", "--exclude-standard", "--others", "--directory" },
                {
                    cwd = key,
                    text = true,
                }
            )
            local tracked_proc = vim.system({ "git", "ls-tree", "HEAD", "--name-only" }, {
                cwd = key,
                text = true,
            })
            local ret = {
                ignored = parse_output(ignore_proc),
                tracked = parse_output(tracked_proc),
            }

            rawset(self, key, ret)
            return ret
        end,
    })
end
local git_status = new_git_status()

-- Clear git status cache on refresh
local refresh = require("oil.actions").refresh
local orig_refresh = refresh.callback
refresh.callback = function(...)
    git_status = new_git_status()
    orig_refresh(...)
end

require("oil").setup({
    -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
    -- Set to false if you want some other plugin (e.g. netrw) to open when you edit directories.
    default_file_explorer = true,
    -- Id is automatically added at the beginning, and name at the end
    -- See :help oil-columns
    columns = {
        "icon",
        -- "permissions",
        -- "size",
        -- "mtime",
    },
    -- Buffer-local options to use for oil buffers
    buf_options = {
        buflisted = false,
        bufhidden = "hide",
    },
    -- Window-local options to use for oil buffers
    win_options = {
        signcolumn = "yes:2",
        wrap = false,
        cursorcolumn = false,
        foldcolumn = "0",
        spell = false,
        list = false,
        conceallevel = 3,
        concealcursor = "nvic",
    },
    -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
    delete_to_trash = false,
    -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
    skip_confirm_for_simple_edits = false,
    -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
    -- (:help prompt_save_on_select_new_entry)
    prompt_save_on_select_new_entry = true,
    -- Oil will automatically delete hidden buffers after this delay
    -- You can set the delay to false to disable cleanup entirely
    -- Note that the cleanup process only starts when none of the oil buffers are currently displayed
    cleanup_delay_ms = 2000,
    lsp_file_methods = {
        -- Enable or disable LSP file operations
        enabled = true,
        -- Time to wait for LSP file operations to complete before skipping
        timeout_ms = 1000,
        -- Set to true to autosave buffers that are updated with LSP willRenameFiles
        -- Set to "unmodified" to only save unmodified buffers
        autosave_changes = false,
    },
    -- Constrain the cursor to the editable parts of the oil buffer
    -- Set to `false` to disable, or "name" to keep it on the file names
    constrain_cursor = "editable",
    -- Set to true to watch the filesystem for changes and reload oil
    watch_for_changes = false,
    -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
    -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
    -- Additionally, if it is a string that matches "actions.<name>",
    -- it will use the mapping at require("oil.actions").<name>
    -- Set to `false` to remove a keymap
    -- See :help oil-actions for a list of all available actions
    keymaps = {
        ["g?"] = { "actions.show_help", mode = "n" },
        ["<CR>"] = "actions.select",
        ["<C-s>"] = { "actions.select", opts = { vertical = true } },
        ["<C-v>"] = { "actions.select", opts = { horizontal = true } },
        ["<C-t>"] = { "actions.select", opts = { tab = true } },
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = { "actions.close", mode = "n" },
        ["<C-l>"] = "actions.refresh",
        ["-"] = { "actions.parent", mode = "n" },
        ["_"] = { "actions.open_cwd", mode = "n" },
        ["`"] = { "actions.cd", mode = "n" },
        ["g~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
        ["gs"] = { "actions.change_sort", mode = "n" },
        ["gx"] = "actions.open_external",
        ["g."] = { "actions.toggle_hidden", mode = "n" },
        ["g\\"] = { "actions.toggle_trash", mode = "n" },
    },
    -- Set to false to disable all of the above keymaps
    use_default_keymaps = true,
    view_options = {
        -- Show files and directories that start with "."
        show_hidden = false,
        -- This function defines what is considered a "hidden" file
        is_hidden_file = function(name, bufnr)
            local m = name:match("^%.")
            return m ~= nil
        end,
        -- This function defines what will never be shown, even when `show_hidden` is set
        is_always_hidden = function(name, bufnr)
            return false
        end,
        -- Sort file names with numbers in a more intuitive order for humans.
        -- Can be "fast", true, or false. "fast" will turn it off for large directories.
        natural_order = "fast",
        -- Sort file and directory names case insensitive
        case_insensitive = false,
        sort = {
            -- sort order can be "asc" or "desc"
            -- see :help oil-columns to see which columns are sortable
            { "type", "asc" },
            { "name", "asc" },
        },
        -- Customize the highlight group for the file name
        highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
            return nil
        end,
    },
    -- Extra arguments to pass to SCP when moving/copying files over SSH
    extra_scp_args = {},
    -- Configuration for the file preview window
    preview_win = {
        -- Whether the preview window is automatically updated when the cursor is moved
        update_on_cursor_moved = true,
        -- How to open the preview window "load"|"scratch"|"fast_scratch"
        preview_method = "fast_scratch",
        -- A function that returns true to disable preview on a file e.g. to avoid lag
        disable_preview = function(filename)
            return false
        end,
        -- Window-local options to use for preview window buffers
        win_options = {},
    },
})

require("oil-git-status").setup({})
require("line-numbers").setup({})
require("text-transform").setup({
    popup_type = "select",
    keymap = {
        telescope_popup = nil,
    },
})
vim.keymap.set({ "n", "v" }, "<leader>cc", "<CMD>TextTransform<CR>", { silent = true, desc = "Trigger Text Transform" })

require("mason").setup()
require("mason-lspconfig").setup({
    --[[
     this plugin:
     - automatically enables the lsp features, so this needs to be disabled
     - helps ensure LSPs are installed, this excludes both linter and formatters
     - allows `mason-tool-installer` to accept `lspconfig` package names

     link: https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim#configuration
    ]]
    automatic_enable = false,
})
require("mason-tool-installer").setup({
    ensure_installed = {
        "xmlformatter",
        "yamlls",
        "yamlfmt",
        "yamllint",
        "lemminx",
        "sqlfluff",
        "sqls",
        "codespell",
        "bashls",
        "shfmt",
        "shellcheck",
        "tailwindcss",
        "clangd",
        "clang-format",
        "cpplint",
        "sleek",
        "yamlfix",
        "eslint",
        "prettier",
        "ruff",
        "basedpyright",
        "intelephense",
        "ts_ls",
        "jsonlint",
        "htmlhint",
        "lua_ls",
        "phpcs",
        "phpcbf",
        "luacheck",
        "stylua",
        "jsonls",
    },
})

vim.opt.termguicolors = true

vim.opt.background = "dark"
vim.cmd("colorscheme default")

vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "Move to left window/pane" })
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "Move to bottom window/pane" })
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "Move to top window/pane" })
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "Move to right window/pane" })

require("tiny-inline-diagnostic").setup({
    -- Available: "modern", "classic", "minimal", "powerline", "ghost", "simple", "nonerdfont", "amongus"
    preset = "nonerdfont",
    options = {
        multilines = {
            enabled = true,
        },
        add_messages = {
            display_count = false,
        },
    },
})
vim.diagnostic.config({ signs = false, virtual_text = false })

local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

-- return to last cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
    group = augroup,
    desc = "Restore last cursor position",
    callback = function()
        if vim.o.diff then -- except in diff mode
            return
        end

        local last_pos = vim.api.nvim_buf_get_mark(0, '"') -- {line, col}
        local last_line = vim.api.nvim_buf_line_count(0)

        local row = last_pos[1]
        if row < 1 or row > last_line then
            return
        end

        pcall(vim.api.nvim_win_set_cursor, 0, last_pos)
    end,
})

-- highlight yanked text
-- vim.api.nvim_create_autocmd("TextYankPost", {
--     group = augroup,
--     callback = function()
--         vim.hl.on_yank()
--     end,
-- })

require("blink.cmp").setup({
    keymap = {
        preset = "none",
        ["<C-k>"] = { "show", "hide" },
        ["<CR>"] = { "accept", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },
        -- ["<Tab>"] = { "snippet_forward", "fallback" },
        -- ["<S-Tab>"] = { "snippet_backward", "fallback" },
    },
    appearance = { nerd_font_variant = "mono" },
    completion = {
        documentation = { auto_show = true },
        menu = {
            auto_show = function()
                return vim.bo.filetype ~= "markdown"
            end,
        },
    },
    sources = { default = { "lsp", "path", "buffer", "snippets" } },
    snippets = {
        expand = function(snippet)
            require("luasnip").lsp_expand(snippet)
        end,
    },
    fuzzy = {
        implementation = "prefer_rust",
        prebuilt_binaries = { download = true },
    },
})
vim.lsp.config["*"] = {
    capabilities = require("blink.cmp").get_lsp_capabilities(),
}

vim.lsp.enable({
    "docker_compose_language_service",
    "yamlls",
    "lemminx",
    "bashls",
    "clangd",
    "lua_ls",
    "ts_ls",
    "intelephense",
    "sqls",
    "basedpyright",
    "ruff",
    "jsonls",
    "dartls", -- found in :help lspconfig-all
})

-- buffer format
vim.keymap.set("n", "<leader>lf", function()
    require("conform").format()
end)

-- new and close buffers
vim.keymap.set("n", "<leader>b", "<CMD>enew<CR>")
vim.keymap.set("n", "<leader>x", "<CMD>bd<CR>")

vim.keymap.set("n", "<Tab>", "<CMD>bnext<CR>")
vim.keymap.set("n", "<S-Tab>", "<CMD>bprev<CR>")

vim.keymap.set("n", "<leader>ff", "<CMD>FzfLua files<CR>")
vim.keymap.set("n", "<leader>fo", "<CMD>FzfLua oldfiles<CR>")
vim.keymap.set("n", "<leader>fd", "<CMD>FzfLua diagnostics_document<CR>")
vim.keymap.set("n", "<leader>fD", "<CMD>FzfLua diagnostics_workspace<CR>")
vim.keymap.set("n", "<leader>fw", "<CMD>FzfLua grep_project<CR>")
vim.keymap.set("n", "<leader>fh", "<CMD>FzfLua helptags<CR>")
vim.keymap.set("n", "<leader><leader>", "<CMD>FzfLua buffers<CR>")
vim.keymap.set("n", "<leader>fz", "<CMD>FzfLua grep_curbuf<CR>")
vim.keymap.set("n", "<leader>fg", "<CMD>FzfLua git_status<CR>")
vim.keymap.set("n", "<leader>fk", "<CMD>FzfLua keymaps<CR>")
vim.keymap.set("n", "<leader>fr", "<CMD>FzfLua registers<CR>")
vim.keymap.set("n", "<leader>fm", "<CMD>FzfLua marks<CR>")
vim.keymap.set("n", "<leader>fi", "<CMD>FzfLua lsp_implementations<CR>")
vim.keymap.set("n", "<leader>fs", "<CMD>FzfLua lsp_document_symbols<CR>")
vim.keymap.set("n", "<leader>fc", "<CMD>FzfLua colorschemes<CR>")

vim.keymap.set("n", "<leader>ts", function()
    require("mini.trailspace").trim()
end)

vim.keymap.set("n", "<leader>gb", "<CMD>Gitsigns blame_line<CR>")

vim.keymap.set("n", "<leader>lg", "<CMD>LazyGit<CR>")
vim.keymap.set("n", "<leader>lc", "<CMD>LazyGitFilterCurrentFile<CR>")

vim.keymap.set("n", "<leader>ld", function()
    vim.diagnostic.setloclist({ open = true })
end, { desc = "Open diagnostic list" })

vim.keymap.set("n", "<leader>ld", "<CMD>copen<CR>", { desc = "Open quickfix list" })

vim.keymap.set("n", "<C-s>", "<CMD>w<CR>")
vim.keymap.set("n", "<C-w>q", "<CMD>wq<CR>")
vim.keymap.set("n", "<C-c>", "<CMD>%y+<CR>")

vim.keymap.set("n", "<C-n>", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("n", "]c", "<CMD>Gitsigns nav_hunk next<CR>", { desc = "Next git hunk" })
vim.keymap.set("n", "[c", "<CMD>Gitsigns nav_hunk prev<CR>", { desc = "Previous git hunk" })

vim.keymap.set("n", "<leader>gd", "<CMD>Gitsigns diffthis<CR>", { desc = "Diff this" })

vim.keymap.set("n", "<leader>cse", "<CMD>CsvViewEnable<CR>", { desc = "Enable CSV view" })
vim.keymap.set("n", "<leader>csd", "<CMD>CsvViewDisable<CR>", { desc = "Disable CSV view" })

-- Enable persistent undo
vim.opt.undofile = true

vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)

vim.keymap.set("n", "gr", function()
    vim.lsp.buf.references()
end)

require("toggleterm").setup()

vim.keymap.set("n", "<A-i>", "<CMD>ToggleTerm size=40 direction=float<CR>")
vim.keymap.set("t", "<A-i>", "<CMD>ToggleTerm<CR>")
vim.keymap.set("t", "<C-x>", "<C-\\><C-n>")

-- wrap, linebreak and spellcheck on markdown and text files
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "text", "gitcommit" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
        vim.opt_local.spell = true
    end,
})

vim.keymap.set("n", "<leader>gh", function()
    -- Define your list of selectable choices
    local values = { "1", "2", "3" }
    local labels = {
        ["1"] = "Open current buffer in GitHub",
        ["2"] = "Open current buffer in GitHub in current branch",
        ["3"] = "Browse current branch",
    }

    -- Prompt the user
    vim.ui.select(values, {
        prompt = "Pick an action:",
        -- Optional formatting (e.g., prefixing options)
        format_item = function(value)
            return "-> " .. labels[value]
        end,
    }, function(choice)
        -- Handle the callback after selection
        if choice == "1" then
            vim.cmd("silent !gh browse %:.")
        elseif choice == "2" then
            vim.cmd("silent !gh browse %:. --branch $(git rev-parse HEAD)")
        elseif choice == "3" then
            vim.cmd("silent !gh browse $(git rev-parse HEAD)")
        else
        end
    end)
end)

local function set_register_and_print(value)
    vim.fn.setreg("+", value)
    vim.notify(string.format('Copied "%s" to clipboard', value))
end

-- params -> "absolute" or "relative"
local function get_path(params)
    local path

    if params == "absolute" then
        path = vim.fn.expand("%:p")
    else
        path = vim.fn.expand("%:.")
    end

    return path
end

-- params -> "normal" for normal mode, "visual" for visual mode
local function get_line_selection(mode)
    local line_str
    if mode == "visual" then
        local start_line = vim.fn.line("v")
        local end_line = vim.fn.line(".")
        if start_line > end_line then
            start_line, end_line = end_line, start_line
        end
        if start_line == end_line then
            line_str = string.format("L%d", start_line)
        else
            line_str = string.format("L%d-L%d", start_line, end_line)
        end
    else
        line_str = string.format("L%d", vim.fn.line("."))
    end

    return line_str
end

vim.keymap.set("n", "<leader>co", function()
    local path = get_path("absolute")
    set_register_and_print(path)
end, { desc = "Copy absolute buffer path to clipboard" })
vim.keymap.set("n", "<leader>cp", function()
    local path = get_path("relative")
    set_register_and_print(path)
end, { desc = "Copy relative buffer path to clipboard" })
vim.keymap.set("n", "<leader>cl", function()
    local line_str = get_line_selection("normal")
    set_register_and_print(line_str)
end, { desc = "Copy current line number to clipboard" })

vim.keymap.set("v", "<leader>co", function()
    local path = get_path("absolute")
    local line_str = get_line_selection("visual")

    local combined_str = string.format("%s:%s", path, line_str)
    set_register_and_print(combined_str)
end, { desc = "Copy absolute buffer path with selected lines to clipboard" })
vim.keymap.set("v", "<leader>cp", function()
    local path = get_path("relative")
    local line_str = get_line_selection("visual")

    local combined_str = string.format("%s:%s", path, line_str)
    set_register_and_print(combined_str)
end, { desc = "Copy relative buffer path with selected lines to clipboard" })
vim.keymap.set("v", "<leader>cl", function()
    local line_str = get_line_selection("visual")
    set_register_and_print(line_str)
end, { desc = "Copy selection line range to clipboard" })

local harpoon = require("harpoon")

harpoon:setup()

require("fzf-lua").setup({
    "telescope",
    fzf_opts = {
        ["--layout"] = "reverse",
    },
    defaults = {
        cwd_prompt = false,
    },
})

-- Add/remove current buffer to Harpoon list
vim.keymap.set("n", "<C-q>f", function()
    -- get current buffer name
    local bufname = vim.fn.bufname("%")

    -- get buffer value given the buffer name that we provided
    -- if `name` is empty, add to harpoon
    local name, _ = harpoon:list():get_by_value(bufname)

    if name == nil then
        harpoon:list():add()

        vim.notify(string.format('Added "%s" to harpoon list', bufname))
    else
        harpoon:list():remove()
        vim.notify(string.format('Removed "%s" from harpoon list', bufname))
    end
end, { desc = "Add/remove current buffer to harpoon list" })

-- Toggle Harpoon menu
vim.keymap.set("n", "<C-e>", function()
    local fzf_lua = require("fzf-lua")
    local file_paths = {}
    for _, item in ipairs(harpoon:list().items) do
        table.insert(file_paths, item.value)
    end
    if #file_paths == 0 then
        vim.notify("Harpoon list is empty")
        return
    end
    fzf_lua.fzf_exec(file_paths, {
        prompt = "Harpoon> ",
        actions = fzf_lua.defaults.actions.files,
        fzf_opts = {
            ["--layout"] = "reverse",
        },
        previewer = "builtin",
    })
end, { desc = "Open harpoon menu" })

-- Select buffers stored within Harpoon list
vim.keymap.set("n", "<C-f>", function()
    harpoon:list():select(1)
end, { desc = "Select harpoon file 1" })
vim.keymap.set("n", "<C-x>", function()
    harpoon:list():select(2)
end, { desc = "Select harpoon file 2" })
vim.keymap.set("n", "<C-b>", function()
    harpoon:list():select(3)
end, { desc = "Select harpoon file 3" })
vim.keymap.set("n", "<C-p>", function()
    harpoon:list():select(4)
end, { desc = "Select harpoon file 4" })

vim.keymap.set("n", "<leader>ss", "<cmd>set shiftwidth=2 tabstop=2 expandtab<CR>", { desc = "Set 2 tabs" })
vim.keymap.set("n", "<leader>sl", "<cmd>set shiftwidth=4 tabstop=4 expandtab<CR>", { desc = "Set 4 tabs" })

local setup_treesitter = function()
    local treesitter = require("nvim-treesitter")
    treesitter.setup({})
    local ensure_installed = {
        "vim",
        "vimdoc",
        "rust",
        "c",
        "cpp",
        "go",
        "html",
        "css",
        "javascript",
        "json",
        "lua",
        "markdown",
        "python",
        "typescript",
        "bash",
        "angular",
        "php",
        "tsx",
        "dart",
    }

    local config = require("nvim-treesitter.config")

    local already_installed = config.get_installed()
    local parsers_to_install = {}

    for _, parser in ipairs(ensure_installed) do
        if not vim.tbl_contains(already_installed, parser) then
            table.insert(parsers_to_install, parser)
        end
    end

    if #parsers_to_install > 0 then
        treesitter.install(parsers_to_install)
    end

    local group = vim.api.nvim_create_augroup("TreeSitterConfig", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
        group = group,
        callback = function(args)
            if vim.list_contains(config.get_installed(), vim.treesitter.language.get_lang(args.match)) then
                vim.treesitter.start(args.buf)
            end
        end,
    })
end

setup_treesitter()

-- trigger linting
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "CursorMoved", "InsertLeave" }, {
    callback = function()
        -- try_lint without arguments runs the linters defined in `linters_by_ft`
        -- for the current filetype
        require("lint").try_lint()

        -- You can call `try_lint` with a linter name or a list of names to always
        -- run specific linters, independent of the `linters_by_ft` configuration
        require("lint").try_lint("codespell")
    end,
})

vim.g.EasyMotion_do_mapping = 0
vim.g.EasyMotion_smartcase = 1
vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(easymotion-s2)")
