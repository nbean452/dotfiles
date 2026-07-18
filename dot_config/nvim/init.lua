vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.wrap = false
vim.o.scrolloff = 999
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.smartindent = true

-- https://github.com/kdheepak/lazygit.nvim#usage
vim.g.lazygit_floating_window_scaling_factor = 0.95

vim.o.hlsearch = true
vim.o.incsearch = true

vim.g.mapleader = " "
vim.o.clipboard = "unnamedplus"
vim.o.signcolumn = "yes"
vim.o.winborder = "single"
vim.o.pumborder = "single"

vim.o.ttimeout = true
vim.o.timeoutlen = 0

vim.keymap.set("n", "<leader>ri", function()
    vim.cmd.restart()
end)

vim.keymap.set("n", "<leader>so", function()
    vim.cmd.update()
    vim.cmd.source()
    vim.notify("reloaded configuration!")
end)

vim.keymap.del("n", "]d")
vim.keymap.del("n", "[d")
vim.keymap.del("n", "]D")
vim.keymap.del("n", "[D")

vim.keymap.set("n", "]d", function()
    vim.diagnostic.jump({ count = 1, float = true })
end)
vim.keymap.set("n", "[d", function()
    vim.diagnostic.jump({ count = -1, float = true })
end)

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.cursorcolumn = true -- to enable cursorcolumn!
vim.o.lazyredraw = true -- equivalent to 'set lazyredraw'
vim.o.ttyfast = true -- equivalent to 'set ttyfast'

vim.o.colorcolumn = "80"

vim.o.cursorline = true
vim.o.cursorlineopt = "both" -- to enable cursorline!

vim.pack.add({
    -- Use for stability; omit to use `main` branch for the latest features
    { src = "https://github.com/tpope/vim-surround" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },
    { src = "https://github.com/folke/lazydev.nvim" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },

    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },

    { src = "https://github.com/shrynx/line-numbers.nvim" },

    { src = "https://github.com/chenasraf/text-transform.nvim" },

    { src = "https://github.com/christoomey/vim-tmux-navigator" },

    { src = "https://github.com/windwp/nvim-autopairs" },
    { src = "https://github.com/alvan/vim-closetag" },

    { src = "https://github.com/ibhagwan/fzf-lua" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/danhat1020/silence.nvim" },

    { src = "https://github.com/kdheepak/lazygit.nvim" },
    { src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" },

    { src = "https://github.com/nvim-mini/mini.notify", version = "stable" },
    { src = "https://github.com/djoshea/vim-autoread" },

    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/stefandtw/quickfix-reflector.vim" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },

    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/ThePrimeagen/harpoon", branch = "harpoon2" },
    { src = "https://github.com/folke/which-key.nvim" },
    { src = "https://github.com/haya14busa/is.vim" },
    { src = "https://github.com/kshenoy/vim-signature" },
    { src = "https://github.com/hat0uma/csvview.nvim" },
    { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
    { src = "https://github.com/akinsho/toggleterm.nvim" },
    { src = "https://github.com/rktjmp/lush.nvim" },
    { src = "https://github.com/zenbones-theme/zenbones.nvim" },
})

require("ibl").setup()
require("csvview").setup()
require("nvim-autopairs").setup()
require("which-key").setup({
    preset = "modern",
})

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
        globalstatus = true,
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
require("oil").setup()
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
        "ts_ls",
        "lua_ls",
        "stylua",
    },
})

vim.o.termguicolors = true

vim.o.background = "dark"
vim.cmd("colorscheme neobones")

require("tiny-inline-diagnostic").setup({
    -- Available: "modern", "classic", "minimal", "powerline", "ghost", "simple", "nonerdfont", "amongus"
    preset = "nonerdfont",
    options = {
        multilines = {
            enabled = true,
        },
        add_messages = {
            display_count = true,
        },
    },
})
vim.diagnostic.config({ virtual_text = false })

-- require("silence").setup({
--     -- options here (see configuration)
-- })
-- vim.cmd("colorscheme silence")

vim.lsp.enable({ "lua_lsp", "ts_ls" })

-- buffer format
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

-- new and close buffers
vim.keymap.set("n", "<leader>b", "<CMD>enew<CR>")
vim.keymap.set("n", "<leader>x", "<CMD>bd<CR>")
vim.keymap.set("n", "<leader>dab", "<CMD>%bd<CR>")

vim.keymap.set("n", "<Tab>", "<CMD>bnext<CR>")
vim.keymap.set("n", "<S-Tab>", "<CMD>bprev<CR>")

vim.keymap.set("n", "<leader>ff", "<CMD>FzfLua files<CR>")
vim.keymap.set("n", "<leader>fd", "<CMD>FzfLua diagnostics_document<CR>")
vim.keymap.set("n", "<leader>fw", "<CMD>FzfLua grep_project<CR>")
vim.keymap.set("n", "<leader>fh", "<CMD>FzfLua helptags<CR>")
vim.keymap.set("n", "<leader>fb", "<CMD>FzfLua buffers<CR>")
vim.keymap.set("n", "<leader>fz", "<CMD>FzfLua grep_curbuf<CR>")
vim.keymap.set("n", "<leader>fg", "<CMD>FzfLua git_status<CR>")
vim.keymap.set("n", "<leader>fk", "<CMD>FzfLua keymaps<CR>")
vim.keymap.set("n", "<leader>fr", "<CMD>FzfLua registers<CR>")
vim.keymap.set("n", "<leader>fm", "<CMD>FzfLua marks<CR>")

vim.keymap.set("n", "<leader>gb", "<CMD>Gitsigns blame_line<CR>")

vim.keymap.set("n", "<leader>lg", "<CMD>LazyGit<CR>")
vim.keymap.set("n", "<leader>lc", "<CMD>LazyGitFilterCurrentFile<CR>")

vim.keymap.set("n", "<C-s>", "<CMD>w<CR>")
vim.keymap.set("n", "<C-w>q", "<CMD>wq<CR>")
vim.keymap.set("n", "<C-c>", "<CMD>%y+<CR>")

vim.keymap.set("n", "<C-n>", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("n", "]c", "<CMD>Gitsigns nav_hunk next<CR>", { desc = "Next git hunk" })
vim.keymap.set("n", "[c", "<CMD>Gitsigns nav_hunk prev<CR>", { desc = "Previous git hunk" })

vim.keymap.set("n", "<leader>cse", "<CMD>CsvViewEnable<CR>", { desc = "Enable CSV view" })
vim.keymap.set("n", "<leader>csd", "<CMD>CsvViewDisable<CR>", { desc = "Disable CSV view" })

-- Enable persistent undo
vim.o.undofile = true

vim.keymap.set("n", "gd", function()
    vim.lsp.buf.definition()
end)

vim.keymap.set("n", "gr", function()
    vim.lsp.buf.references()
end)

-- Set the directory to store undo files
-- This keeps your main project directories clean
vim.o.undodir = vim.fn.stdpath("state") .. "/undo"

require("toggleterm").setup()

vim.o.autocomplete = true
vim.opt.complete:append("o", "f")
vim.opt.completeopt = { "menuone", "noselect" }
vim.o.pumheight = 8

vim.keymap.set("n", "<A-i>", "<CMD>ToggleTerm size=40 direction=float<CR>")
vim.keymap.set("t", "<A-i>", "<CMD>ToggleTerm<CR>")

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
        -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
        if client:supports_method("textDocument/completion") then
            -- Optional: trigger autocompletion on EVERY keypress. May be slow!
            local chars = {}
            for i = 32, 126 do
                table.insert(chars, string.char(i))
            end
            client.server_capabilities.completionProvider.triggerCharacters = chars

            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
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
            vim.cmd("silent !gh browse %")
        elseif choice == "2" then
            vim.cmd("silent !gh browse % --branch $(git rev-parse HEAD)")
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

-- Add current buffer to Harpoon list
vim.keymap.set("n", "<C-q>f", function()
    -- get current buffer name
    local bufname = vim.fn.bufname("%")

    -- get buffer value given the buffer name that we provided
    -- if `name` is empty, add to harpoon
    local name, _ = harpoon:list():get_by_value(bufname)

    if name == nil then
        harpoon:list():add()

        print(string.format('Added "%s" to harpoon list', bufname))
    else
        harpoon:list():remove()
        print(string.format('Removed "%s" from harpoon list', bufname))
    end
end, { desc = "Add/remove current buffer to harpoon list" })

-- Add current buffer to Harpoon
vim.keymap.set("n", "<C-q>f", function()
    harpoon:list():add()
    vim.notify("Added to Harpoon")
end, { desc = "Add to harpoon list" })

-- Toggle Harpoon menu
vim.keymap.set("n", "<C-e>", function()
    local fzf_lua = require("fzf-lua")
    local file_paths = {}
    for _, item in ipairs(harpoon:list().items) do
        table.insert(file_paths, item.value)
    end
    if #file_paths == 0 then
        print("Harpoon list is empty")
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
