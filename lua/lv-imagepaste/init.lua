vim.cmd([[
    autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
    let g:mdip_imgdir = '.img'
]])
