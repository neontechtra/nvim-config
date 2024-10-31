-- Installing lazy plugin manager

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "rebelot/kanagawa.nvim", 
        -- set a function to ensure that theme is installed before setting scheme 
        config = function()
            vim.cmd.colorscheme("kanagawa-wave")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "c", "c_sharp", "vim", "vimdoc", "query", "lua", "python", "rust", "cpp" },
                auto_install = true,
                highlight = {
                    enable = true,
                },
                incremental_selection = {
                  enable = true,
                  keymaps = {
                      init_selection = "<Leader>ss", 
                      node_incremental = "<Leader>si",
                      scope_incremental = "<Leader>sc",
                      node_decremental = "<Leader>sd",
                  },
              },
                textobjects = {
                    select = {
                      enable = true,

                      -- Automatically jump forward to textobj, similar to targets.vim
                      lookahead = true,

                      keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        -- You can optionally set descriptions to the mappings (used in the desc parameter of
                        -- nvim_buf_set_keymap) which plugins like which-key display
                        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                        -- You can also use captures from other query groups like `locals.scm`
                        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                      },
                      -- You can choose the select mode (default is charwise 'v')
                      --
                      -- Can also be a function which gets passed a table with the keys
                      -- * query_string: eg '@function.inner'
                      -- * method: eg 'v' or 'o'
                      -- and should return the mode ('v', 'V', or '<c-v>') or a table
                      -- mapping query_strings to modes.
                      selection_modes = {
                        ['@parameter.outer'] = 'v', -- charwise
                        ['@function.outer'] = 'v', -- linewise
                        ['@class.outer'] = '<c-v>', -- blockwise
                      },
                      -- If you set this to `true` (default is `false`) then any textobject is
                      -- extended to include preceding or succeeding whitespace. Succeeding
                      -- whitespace has priority in order to act similarly to eg the built-in
                      -- `ap`.
                      --
                      -- Can also be a function which gets passed a table with the keys
                      -- * query_string: eg '@function.inner'
                      -- * selection_mode: eg 'v'
                      -- and should return true or false
                      include_surrounding_whitespace = true,
                    },
                },
            })
      end,
    },
       {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",   -- LSP source for nvim-cmp
            "hrsh7th/cmp-buffer",     -- Buffer source for nvim-cmp
            "hrsh7th/cmp-path",       -- Path source for nvim-cmp
            "hrsh7th/cmp-cmdline",    -- Command line source for nvim-cmp
            "L3MON4D3/LuaSnip",       -- Snippet engine
            "saadparwaiz1/cmp_luasnip" -- Snippet completion source
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body) -- For LuaSnip users
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-e>"] = cmp.mapping.close(),
                    ["<C-y>"] = cmp.mapping.confirm ({
                        behavior = cmp.ConfirmBehavior.Insert,
                        
                        select = true,
                    }),
                    ["<C-space>"] = cmp.mapping.complete(),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                    { name = "path" },
                })
            })

            -- Enable `/` and `:` autocomplete for search and command mode
            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = { { name = "buffer" } }
            })
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" }
                }, {
                    { name = "cmdline" }
                })
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    { 
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.clangd.setup({})
            lspconfig.pyright.setup({})
        end,
    },
})

-- end of plugin setup

