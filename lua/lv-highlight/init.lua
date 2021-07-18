local high_str = require("high-str")

high_str.setup({
	verbosity = 0,
	highlight_colors = {
		-- color_id = {"bg_hex_code",<"fg_hex_code"/"smart">}
		color_0 = {"#0c0d0e", "smart"},	-- Cosmic charcoal
		color_1 = {"#C7CEEA", "smart"},	-- Crayola's Periwinkle
		color_2 = {"#B5EAD7", "smart"},	-- Magic Mint
		color_3 = {"#E2F0CB", "smart"},	-- Dirty White
		color_4 = {"#FFDAC1", "smart"},	-- Very Pale Orange
		color_5 = {"#FFB7B2", "smart"},	-- Melon
		color_6 = {"#FF9AA2", "smart"},	-- Light Salmon Pink
		color_7 = {"#FFF9E3", "smart"},	-- Cosmic latte
	}
})

vim.api.nvim_set_keymap(
    "v",
    "<F1>",
    ":<c-u>HSHighlight 1<CR>",
    {
        noremap = true,
        silent = true
    }
)

vim.api.nvim_set_keymap(
    "v",
    "<F2>",
    ":<c-u>HSHighlight 2<CR>",
    {
        noremap = true,
        silent = true
    }
)

vim.api.nvim_set_keymap(
    "v",
    "<F3>",
    ":<c-u>HSHighlight 3<CR>",
    {
        noremap = true,
        silent = true
    }
)

vim.api.nvim_set_keymap(
    "v",
    "<F4>",
    ":<c-u>HSHighlight 4<CR>",
    {
        noremap = true,
        silent = true
    }
)

vim.api.nvim_set_keymap(
    "v",
    "<F5>",
    ":<c-u>HSRmHighlight<CR>",
    {
        noremap = true,
        silent = true
    }
)


