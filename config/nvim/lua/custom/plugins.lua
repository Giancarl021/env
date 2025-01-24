local plugins = {
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
    },
    {
        "alexghergh/nvim-tmux-navigation",
        lazy = false
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    {
        "nvimtools/none-ls.nvim",
        event = "VeryLazy",
        opts = function()
            return require "custom.configs.null-ls"
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "lua-language-server",
                "typescript-language-server",
                "tailwindcss-language-server",
                "eslint-lsp",
                "prettierd"
            }
        }
    },
    {
        "windwp/nvim-ts-autotag",
        ft = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "html",
            config = function ()
                require("nvim-ts-autotag").setup()
            end
        }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function()
            local opts = require("plugins.configs.treesitter")
            opts.ensure_installed = {
                "lua",
                "javascript",
                "typescript",
                "tsx",
                "css",
                "markdown",
                "html",
                "json"
            }

            return opts
        end
    }
}

return plugins
