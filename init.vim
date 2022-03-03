call plug#begin('~/.vim/plugged')

Plug 'mhinz/vim-startify'

autocmd VimEnter *
  \   if !argc()
  \ |   Startify
  \ |   NERDTree
  \ |   wincmd w
  \ | endif

let g:startify_bookmarks = [
  \ { 'z': '~/.zshrc' },
  \ { 'v': '~/.config/nvim/init.vim' },
  \ { 'j': '/Users/Shared/js-20220209' },
  \ ]

let g:startify_lists = [
  \ { 'header': ['   Bookmarks'],      'type': 'bookmarks' },
  \ { 'header': ['   MRU'],            'type': 'files' },
  \ { 'header': ['   MRU '. getcwd()], 'type': 'dir' },
  \ ]

" Colorschemas"
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'

" =================================================================
Plug 'sheerun/vim-polyglot'
" =================================================================
 
" Smooth scrolling
Plug 'psliwka/vim-smoothie'
" =================================================================

" Vimux
Plug 'preservim/vimux'

" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
" =================================================================

" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"" Vimux

" =================================================================

" Vim expand 
Plug 'terryma/vim-expand-region'

" =================================================================

" NERDTree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'https://github.com/tiagofumo/vim-nerdtree-syntax-highlight'

" Show dotted hidden files in NERDTree
let NERDTreeShowHidden=1

nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" =================================================================
" Git plugins
Plug 'airblade/vim-gitgutter'
Plug 'rbong/vim-flog'
Plug 'tpope/vim-fugitive'
Plug 'kdheepak/lazygit.nvim'

nmap <leader>gs :G<CR>
nmap <leader>gd :Gvdiffsplit<CR>
nmap <leader>gp :Git push<CR>
" =================================================================

" Autocomplite
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" list of CoC extensions needed
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-snippets']

"this will auto close ( [ {
Plug 'jiangmiao/auto-pairs'

" =================================================================

" Comments
Plug 'preservim/nerdcommenter' 

" these two plugins will add highlighting and indenting to JSX and TSX files.
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

" =================================================================
 
" PLUGIN: FZF
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>

" =================================================================
" Navigation
Plug 'easymotion/vim-easymotion'

map <Leader>j <Plug>(easymotion-prefix)
" =================================================================

" Airline
Plug 'vim-airline/vim-airline'

" =================================================================
 
" Editorconfig support
Plug 'editorconfig/editorconfig-vim'

" HTML
Plug 'mattn/emmet-vim'

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Undo plugin
Plug 'mbbill/undotree'

" Vim tests
Plug 'vim-test/vim-test'

" Initialize plugin system
call plug#end()

let g:delimitMate_expand_cr = 1
noremap <Space> <Nop> 
map <Space> <Leader>

" Initialize gruvbox theme
" colorscheme gruvbox
colorscheme solarized

set ttyfast
set cursorline
set updatetime=120
set colorcolumn=120
set number
set encoding=utf-8
set spell spelllang=en_us
set mouse=a

" Identation settings
"filetype plugin indent on
set tabstop=8
set shiftwidth=2
set softtabstop=2
set expandtab 
" set relativenumber
set number
"set nohlsearch
"set incsearch 
set hidden
set nowrap
set scrolloff=8
set signcolumn=yes
set nofoldenable
set foldlevelstart=99
set foldmethod=indent
set smartcase 
set noswapfile
set nobackup
" share clipboard across vim sessions
set clipboard=unnamed

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

command! BufOnly execute '%bdelete|edit #|normal `"'

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'


" Commentary Plugin
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window left.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
"   \ quit | endif

" Emmet settings
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction

set statusline+=%{GitStatus()}

" =================================================================
" Buffers
autocmd BufRead * normal zR

" next buffer;
nnoremap  <silent> <Tab>    :bnext<CR>
" previous buffer;
nnoremap  <silent> <S-Tab>  :bprevious<CR>

" =================================================================
 
" Windows
map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>

function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if(match(a:key, '[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction
	
" =================================================================
 
" mbbill/undotree
nnoremap <silent> <C-u> :UndotreeToggle<CR>

set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" =================================================================
" Lines highlighting
" nnoremap <leader>l :call matchadd('LineHighlight', '\%'.line('.').'l')<cr>

" highlight LineHighlight ctermbg=8 guibg=#000000
" vnoremap <leader>l :<c-u>call HiglightVisualLines()
" nnoremap <leader>c :call clearmatches()

" HiglightVisualLines()
" loop throough visually selected lines and give them highlighting
" function! HiglightVisualLines()
"    for i in range(line('v'),line("'>"))
"        call matchadd('LineHighlight', '\%'.i.'l')
"    endfor
" endfunction
" =================================================================

nmap <silent> t<C-n> :TestNearest<CR>
function! DebugNearest()
  let g:test#go#runner = 'delve'
  TestNearest
  unlet g:test#go#runner
endfunction
nmap <silent> t<C-d> :call DebugNearest()<CR>

" =================================================================
" Cursor shape in normal edit and replace modes
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
endif
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

