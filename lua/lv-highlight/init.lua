vim.api.nvim_set_keymap(
    "v",
    "<F3>",
    ":<c-u>HSHighlight 1<CR>",
    {
        noremap = true,
        silent = true
    }
)

vim.api.nvim_set_keymap(
    "v",
    "<F4>",
    ":<c-u>HSRmHighlight<CR>",
    {
        noremap = true,
        silent = true
    }
)


