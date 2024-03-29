execute pathogen#infect()

" let s:filepath = expand('%')


""""""""""""""""""""""""""
" Vim settings
""""""""""""""""""""""""""
syntax on
filetype plugin indent on
set modeline
set modelines=5
set relativenumber
set nowrap
" set the colorscheme
" colorscheme hybrid_reverse
colorscheme onedark
" go to next tab
map <S-H> gT
" go to previous tab
map <S-L> gt
" open terminal in vim
map ~ :!gnome-terminal & disown<CR>
map <C-L> :syntax sync fromstart<CR>
map <C-T> :s:\s\+$::g<CR>
map <C-H> :call HTMLSanitize()<CR>
" enable mouse for xterm
set mouse=a
" force clearer highlighting for selected paren
hi MatchParen cterm=bold ctermfg=white
" open new splits at bottom
set splitbelow
set foldenable
set foldmethod=indent
set dir=$VIM_SWAP_DIR
" run eslint on save of javascript files
" autocmd BufWritePost *.es,*.js call asynccommand#run('eslint --fix %', function('s:Eslinthandler'))
" autocmd BufReadPost *.es,*.js call s:UpdateFilePath()


""""""""""""""""""""""""""
" Plugin Settings
""""""""""""""""""""""""""

" NERDTree
" autocmd vimenter * NERDTree
map <S-TAB> :NERDTreeToggle<CR>
map <C-T> :NERDTreeToggle %<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" YCM
" see lsp/readme for more examples
let g:cm_language_server = [
  \   { 'name': 'vue',
  \     'filetypes': [ 'vue' ],
  \     'cmdline': [ expand( '$HOME/.vim/lsp/vue/node_modules/.bin/vls' ) ]
  \   },
  \   {
  \     'name': 'php',
  \     'cmdline': [ 'php', expand( '/home/daniel/.vim/lsp/php/vendor/bin/php-language-server.php' ) ],
  \     'filetypes': [ 'php' ],
  \   },
  \  ]

" CtrlP
" let g:ctrlp_max_files = 20000
" let g:ctrlp_custom_ignore = '.git$|vendor$|node_modules$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|node_modules|vendor)$',
  \  }
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

source ~/.vim/coc.vim


""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""

function! s:Eslinthandler(tempfilepath)
	exec 'e! ' . s:filepath
endfunction

function! s:UpdateFilePath()
	let s:filepath = expand('%')
endfunction

function! g:HTMLSanitize()
	exec "'<,'>s:<:\\&lt;:ge | '<,'>s:>:\\&gt;:ge"
endfunction
