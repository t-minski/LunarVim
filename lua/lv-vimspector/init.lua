vim.cmd([[
    fun! GotoWindow(id)
        call win_gotoid(a:id)
        MaximizerToggle
    endfun
]])
--
-- " Debugger remaps
-- nnoremap <leader>m :MaximizerToggle!<CR>
-- nnoremap <leader>Dd :call vimspector#Launch()<CR>
-- nnoremap <leader>Dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
-- nnoremap <leader>Dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
-- nnoremap <leader>Dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
-- nnoremap <leader>Dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
-- nnoremap <leader>Ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
-- nnoremap <leader>Do :call GotoWindow(g:vimspector_session_windows.output)<CR>
-- nnoremap <leader>De :call vimspector#Reset()<CR>
--
-- nnoremap <leader>Dtcb :call vimspector#CleanLineBreakpoint()<CR>
--
-- nmap <leader>Dl <Plug>VimspectorStepInto
-- nmap <leader>Dj <Plug>VimspectorStepOver
-- nmap <leader>Dk <Plug>VimspectorStepOut
-- nmap <leader>D_ <Plug>VimspectorRestart
-- nnoremap <leader>D<space> :call vimspector#Continue()<CR>
--
-- nmap <leader>Drc <Plug>VimspectorRunToCursor
-- nmap <leader>Dbp <Plug>VimspectorToggleBreakpoint
-- nmap <leader>Dcbp <Plug>VimspectorToggleConditionalBreakpoint
--
--
-- " <Plug>VimspectorPause
-- " <Plug>VimspectorAddFunctionBreakpoint

