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

-- vim.api.nvim_set_keymap('n', '[', '<Plug>VimwikiNextLink', {silent = true})
-- vim.api.nvim_set_keymap('n', ']', '<Plug>VimwikiNextLink', {silent = true})

