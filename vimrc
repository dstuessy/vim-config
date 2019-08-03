execute pathogen#infect()

" let s:filepath = expand('%')


""""""""""""""""""""""""""
" Vim settings
""""""""""""""""""""""""""
syntax on
filetype plugin indent on
set relativenumber
" set colorscheme
colorscheme hybrid_reverse
" go to next tab
map <S-H> gT 
" go to previous tab
map <S-L> gt
" open terminal in vim
map ~ :!gnome-terminal & disown<CR>
" enable mouse for xterm
set mouse=a
" force clearer highlighting for selected paren
hi MatchParen cterm=bold ctermfg=white
" open new splits at bottom
set splitbelow
" run eslint on save of javascript files
" autocmd BufWritePost *.es,*.js call asynccommand#run('eslint --fix %', function('s:Eslinthandler'))
" autocmd BufReadPost *.es,*.js call s:UpdateFilePath()


""""""""""""""""""""""""""
" Plugin Settings
""""""""""""""""""""""""""

" NERDTree
autocmd vimenter * NERDTree
map <S-TAB> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""

function! s:Eslinthandler(tempfilepath)
	exec 'e! ' . s:filepath
endfunction

function! s:UpdateFilePath()
	let s:filepath = expand('%')
endfunction
