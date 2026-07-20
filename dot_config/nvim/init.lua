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
    { src = "https://github.com/christoomey/vim-tmux-navigator" },
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
    { src = "https://github.com/creativenull/efmls-configs-nvim" },
    {
        src = "https://github.com/saghen/blink.cmp",
        version = vim.version.range("1.*"),
    },
})

require("ibl").setup()
require("csvview").setup()
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
    win_options = {
        signcolumn = "yes:2",
    },
    view_options = {
        is_hidden_file = function(name, bufnr)
            local dir = require("oil").get_current_dir(bufnr)
            local is_dotfile = vim.startswith(name, ".") and name ~= ".."
            -- if no local directory (e.g. for ssh connections), just hide dotfiles
            if not dir then
                return is_dotfile
            end
            -- dotfiles are considered hidden unless tracked
            if is_dotfile then
                return not git_status[dir].tracked[name]
            else
                -- Check if file is gitignored
                return git_status[dir].ignored[name]
            end
        end,
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
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
    ensure_installed = {
        "sqls",
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
        "php-cs-fixer",
        "luacheck",
        "stylua",
        "jsonls",
        "efm",
    },
})

vim.opt.termguicolors = true

vim.opt.background = "dark"
-- vim.cmd("colorscheme neobones")

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
vim.diagnostic.config({ virtual_text = false })

do
    local php_cs_fixer = require("efmls-configs.formatters.php_cs_fixer")

    local luacheck = require("efmls-configs.linters.luacheck")
    local stylua = require("efmls-configs.formatters.stylua")

    local ruff = require("efmls-configs.formatters.ruff")

    local prettier = require("efmls-configs.formatters.prettier")
    local eslint = require("efmls-configs.linters.eslint")

    local shellcheck = require("efmls-configs.linters.shellcheck")
    local shfmt = require("efmls-configs.formatters.shfmt")

    local cpplint = require("efmls-configs.linters.cpplint")
    local clangfmt = require("efmls-configs.formatters.clang_format")

    local htmlhint = require("efmls-configs.linters.htmlhint")
    local jsonlint = require("efmls-configs.linters.jsonlint")

    local command = "sleek ${INPUT}"

    local sleek = {
        formatCommand = command,
        formatStdin = true,
    }

    local efmls_config = {
        filetypes = {
            "c",
            "cpp",
            "css",
            "go",
            "html",
            "javascript",
            "javascriptreact",
            "json",
            "jsonc",
            "lua",
            "markdown",
            "python",
            "sh",
            "typescript",
            "php",
            "typescriptreact",
            "angular",
            "sql",
        },
        init_options = {
            documentFormatting = true,
            documentRangeFormatting = true,
        },
        settings = {
            rootMarkers = { ".git/" },
            languages = {
                c = { clangfmt, cpplint },
                cpp = { clangfmt, cpplint },
                css = { prettier },
                html = { htmlhint, prettier },
                javascript = { eslint, prettier },
                javascriptreact = { eslint, prettier },
                json = { jsonlint, eslint, prettier },
                jsonc = { eslint, prettier },
                lua = { luacheck, stylua },
                php = { php_cs_fixer },
                markdown = { prettier },
                python = { ruff },
                sh = { shellcheck, shfmt },
                typescript = { eslint, prettier },
                typescriptreact = { eslint, prettier },
                vue = { eslint, prettier },
                svelte = { eslint, prettier },
                sql = { sleek },
            },
        },
    }

    vim.lsp.config(
        "efm",
        vim.tbl_extend("force", efmls_config, {
            cmd = { "efm-langserver" },

            -- Pass your custom lsp config below like on_attach and capabilities
            --
            -- on_attach = on_attach,
            -- capabilities = capabilities,
        })
    )
end

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
    "bashls",
    "clangd",
    "lua_ls",
    "eslint",
    "ts_ls",
    "intelephense",
    "sqls",
    "basedpyright",
    "ruff",
    "jsonls",
    "efm",
})

-- buffer format
vim.keymap.set("n", "<leader>lf", function()
    vim.lsp.buf.format({
        name = "efm",
        async = false,
    })
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
        -- "rust",
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
