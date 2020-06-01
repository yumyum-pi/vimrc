call plug#begin('~/.vim/plugged')
Plug 'preservim/NERDTree'
Plug 'vim-airline/vim-airline'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'fatih/molokai'                " theme
Plug 'ycm-core/YouCompleteMe'       " Auto complete
Plug 'pangloss/vim-javascript'      " JavaScript support
Plug 'leafgarland/typescript-vim'   " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'     " JS and JSX syntax
Plug 'dense-analysis/ale'           " Asynchronous Lint Engine
Plug 'Xuyuanp/nerdtree-git-plugin'  " Git Integration for NerdTree
Plug 'airblade/vim-gitgutter'       " Git Gutter
Plug 'ctrlpvim/ctrlp.vim'           " Fuzzy File Search
Plug 'mhinz/vim-startify'
Plug 'pope/vim-surround' 	    " auto parentheses etc.
call plug#end()

" Theme
syntax enable
let g:srehash256 = 1
let g:molokai_original = 1
colorscheme molokai

autocmd bufnewfile,bufread *.tsx set filetype=typescript
autocmd bufnewfile,bufread *.jsx set filetype=javascript

" Indentation for Go
autocmd FileType go setlocal expandtab shiftwidth=3 softtabstop=3

" Indentation for TypeScript
autocmd FileType typescript setlocal expandtab shiftwidth=4 softtabstop=4

" Indentation for JavaScript
autocmd FileType javascript setlocal expandtab shiftwidth=4 softtabstop=4

" Indentation for HTML
autocmd FileType html setlocal expandtab shiftwidth=4 softtabstop=4

" Indentation for CSS
autocmd FileType css setlocal expandtab shiftwidth=4 softtabstop=4

" enable multiple vimrc for different filetype
filetype plugin on

" set Lead
let mapleader =';' 

"Color of indent
let g:indentLine_color_term = 239

" style for different level of indent
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" take backup
" if not, specify [ set nobackup ]
set backup

" directory for backup file(.sap)
set directory^=$HOME/.vim/tmp//

" take 50 search histories
set history=50

setlocal spell spelllang=en_us
 
" show the cursor position all the time
set ruler         

" ignore Case
"set ignorecase

" distinct Capital if you mix it in search words
set smartcase

" highlights matched words
" if not, specify [ set nohlsearch ]
set hlsearch

" use incremental search
" if not, specify [ set noincsearch ]
set incsearch

" turn hybrid line numbers on
set number relativenumber
set nu rnu

" highlights parentheses
set showmatch

" show color display
" if not, specify [ syntax off ]
syntax on

" change colors for comments if [ syntax on ] is set
" highlight Comment ctermfg=LightCyan

" wrap lines
" if not, specify [ set nowrap ]
set wrap

" toggle NERDTree
:nnoremap <C-g> :NERDTreeToggle<CR>

map <C-q> :GoImports<CR>

let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_list_type = "quickfix"

map <C-n> :cn<CR>
map <C-m> :cp<CR>
nnoremap <leader>a :cclose<CR>

" shortcuts to build and run a Go program
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

autocmd FileType go nmap <Leader>i <Plug>(go-info)
let g:go_auto_type_info = 1

" better movement in slip view
nnoremap <Left> <C-w>h<CR>
nnoremap <Right> <C-w>l<CR>
nnoremap <Up> <C-w>k<CR>
nnoremap <Down> <C-w>j<CR>

"better page movements
map <C-j> <C-f><CR>
map <C-k> <C-b><CR>

" Map Ctrl + p to open fuzzy find (FZF)
nnoremap <c-p> :Files<cr>

" display incomplete commands`
set showcmd      

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1


" FORMATTERS
au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css

" Linting
let g:ale_fixers = {
\    'javascript': ['eslint'],
\    'typescript': ['prettier'],
\    'vue': ['eslint'],
\    'css': ['prettier'],
\    'html': ['prettier']
\}
let g:ale_fix_on_save = 1


let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }


let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

" Ignore these file extensions
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


" jump to definition for typescript 
autocmd FileType typescript nnoremap <leader>j :ALEGoToDefinition <cr>

" jump back to the function for typescript 
autocmd FileType typescript nnoremap <leader>k <c-t>

" jump to the staring of the line
map <leader>h 0

" jump to the end of the line
map <leader>l $
