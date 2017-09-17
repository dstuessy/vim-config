execute pathogen#infect()


""""""""""""""""""""""""""
" Vim settings
""""""""""""""""""""""""""
syntax on
filetype plugin indent on
set relativenumber
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

""""""""""""""""""""""""""
" Plugin Settings
""""""""""""""""""""""""""

" NERDTree
autocmd vimenter * NERDTree
map <S-TAB> :NERDTreeToggle<CR>
