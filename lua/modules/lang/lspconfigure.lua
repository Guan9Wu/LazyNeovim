-- ================= mason ==============================
require("mason").setup({
    -- The directory in which to install packages.
    install_root_dir = vim.fn.stdpath("data") .. "mason",

    -- Where Mason should put its bin location in your PATH. Can be one of:
    -- - "prepend" (default, Mason's bin location is put first in PATH)
    -- - "append" (Mason's bin location is put at the end of PATH)
    -- - "skip" (doesn't modify PATH)
    ---@type '"prepend"' | '"append"' | '"skip"'
    PATH = "prepend",

    pip = {
        -- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
        -- and is not recommended.
        --
        -- Example: { "--proxy", "https://proxyserver" }
        install_args = {},
    },

    -- Controls to which degree logs are written to the log file. It's useful to set this to vim.log.levels.DEBUG when
    -- debugging issues with package installations.
    log_level = vim.log.levels.INFO,

    -- Limit for the maximum amount of packages to be installed at the same time. Once this limit is reached, any further
    -- packages that are requested to be installed will be put in a queue.
    max_concurrent_installers = 4,

    github = {
        -- The template URL to use when downloading assets from GitHub.
        -- The placeholders are the following (in order):
        -- 1. The repository (e.g. "rust-lang/rust-analyzer")
        -- 2. The release version (e.g. "v0.3.0")
        -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
        download_url_template = "https://github.com/%s/releases/download/%s/%s",
    },

    ui = {
        -- Whether to automatically check for new versions when opening the :Mason window.
        check_outdated_packages_on_open = true,

        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        border = "none",

        icons = {
            -- The list icon to use for installed packages.
            package_installed = "✓",
            -- The list icon to use for packages that are installing, or queued for installation.
            package_pending = "➜",
            -- The list icon to use for packages that are not installed.
            package_uninstalled = "✗",
        },

        keymaps = {
            -- Keymap to expand a package
            toggle_package_expand = "<CR>",
            -- Keymap to install the package under the current cursor position
            install_package = "i",
            -- Keymap to reinstall/update the package under the current cursor position
            update_package = "u",
            -- Keymap to check for new version for the package under the current cursor position
            check_package_version = "c",
            -- Keymap to update all installed packages
            update_all_packages = "U",
            -- Keymap to check which installed packages are outdated
            check_outdated_packages = "C",
            -- Keymap to uninstall a package
            uninstall_package = "X",
            -- Keymap to cancel a package installation
            cancel_installation = "<C-c>",
            -- Keymap to apply language filter
            apply_language_filter = "<C-f>",
        },
    },
})
require("mason-lspconfig").setup({
    -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "sumneko_lua" }
    -- This setting has no relation with the `automatic_installation` setting.
    ensure_installed = {
        "sumneko_lua",
        "clangd",
        "pyright",
        --"stylua",
        --"black",
        --"clang-format",
        --"codelldb",
        --"debugpy",
    },
    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
    -- This setting has no relation with the `ensure_installed` setting.
    -- Can either be:
    --   - false: Servers are not automatically installed.
    --   - true: All servers set up via lspconfig are automatically installed.
    --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
    --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
    automatic_installation = true,
})

-- ================= lspconfig ==========================
local nvim_lsp = require("lspconfig")
local isWindows = vim.loop.os_uname().version:match("Windows")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
--     -- Enable completion triggered by <c-x><c-o>
--     -- vim.api.nvim_buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

--     -- Mappings.
--     -- See `:help vim.lsp.*` for documentation on any of the below functions
--     local bufopts = { noremap = true, silent = true, buffer=bufnr }
--     vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
--     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--     vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
--     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
--     vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
--     vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
--     vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
--     vim.keymap.set('n', '<space>wl', function()
--         print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--     end, bufopts)
--     vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
--     vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
--     vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
--     vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
--     vim.keymap.set('n', '<space>lt', function() vim.lsp.buf.format { async = true } end, bufopts)
-- end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                lsp_formatting(bufnr)
            end,
        })
    end
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

local servers = { "sumneko_lua", "clangd", "pyright" }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        flags = lsp_flags,
    })
end

-- setup for lua language server
nvim_lsp.sumneko_lua.setup({
    cmd = { "lua-language-server", "-E" },
    --on_attach = on_attach,
    --capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                path = vim.split(package.path, ";"),
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = { library = vim.api.nvim_get_runtime_file("", true) },
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})

-- setup for python language server
nvim_lsp.pyright.setup({
    cmd = { "pyright-langserver", "--stdio" },
})

-- setup for C/C++ by langd
if isWindows then
    nvim_lsp.clangd.setup({
        cmd = {
            "clangd",
            "--query-driver",
            "D:\\Development\\Scoop\\apps\\gcc\\current\\include\\c++\\11.2.0",
            "--pretty",
        },
    })
else
    nvim_lsp.clangd.setup({
        cmd = {
            "clangd",
            "--pretty",
            "--offset-encoding=utf-16",
            "--background-index",
        },
    })
end
