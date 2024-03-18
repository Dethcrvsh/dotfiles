lvim.plugins = {

    { "nyoom-engineering/oxocarbon.nvim", name = "oxocarbon", lazy = false, priority = 1000 },

    { "psliwka/vim-smoothie" },

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
        }
    },

    {
        "giusgad/pets.nvim",
        dependencies = { "MunifTanjim/nui.nvim", "giusgad/hologram.nvim" },
        require("pets").setup({
        })
    }
}

lvim.colorscheme = "oxocarbon"
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
