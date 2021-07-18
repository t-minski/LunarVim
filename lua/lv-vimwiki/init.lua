vim.g.vimwiki_list = {
    {
        path = '/home/minski/Documents',
        diary_rel_path = 'Zettelkasten/Journal',
        auto_diary_index = 1,
        diary_header = 'Journal',
        diary_sort = 'desc',
        list_margin = 2,
        auto_generate_links = 1,
        syntax = 'markdown',
        ext = '.md',
        path_html = ''
    }
}

vim.g.vimwiki_markdown_link_ext = 1
vim.g.vimwiki_key_mappings = {all_maps = 0}
vim.g.vimwiki_folding = 'list'

vim.api.nvim_set_keymap('n', '<F11>', '<Plug>VimwikiNextLink', {silent = true})
vim.api.nvim_set_keymap('n', '<F12>', '<Plug>VimwikiPrevLink', {silent = true})
vim.api.nvim_set_keymap('n', '<CR>', '<Plug>VimwikiFollowLink', {silent = true})
vim.api.nvim_set_keymap('n', '<Backspace>', '<Plug>VimwikiGoBackLink', {silent = true})
vim.api.nvim_set_keymap('n', '<C-Space>', '<Plug>VimwikiToggleListItem', {silent = true})

