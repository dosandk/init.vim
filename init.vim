call plug#begin('~/.config/nvim/plugged')

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
  \ { 'header': ['   Sessions'],      'type': 'sessions' },
  \ { 'header': ['   MRU'],            'type': 'files' },
  \ { 'header': ['   MRU '. getcwd()], 'type': 'dir' },
  \ ]

" Edit vimr configuration file
nnoremap <Leader>ve :e ~/.config/nvim/init.vim<CR>
" " Reload vimr configuration file
nnoremap <Leader>vr :source ~/.config/nvim/init.vim<CR>

" Colorschemas"
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Colors for CSS
Plug 'ap/vim-css-color'

" =================================================================
Plug 'sheerun/vim-polyglot'
" =================================================================

Plug 'vim-syntastic/syntastic'

let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" =================================================================
" Vim Clipboard history
Plug 'junegunn/vim-peekaboo'

" =================================================================

Plug 'vifm/vifm.vim'

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

let g:UltiSnipsSnippetDirectories=["my-snippets"]

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
"Plug 'airblade/vim-gitgutter'
Plug 'lewis6991/gitsigns.nvim'
Plug 'rbong/vim-flog'
Plug 'tpope/vim-fugitive'
"Plug 'kdheepak/lazygit.nvim'

set diffopt+=vertical

nmap <leader>gs :G<CR>
nmap <leader>gd :Gvdiffsplit<CR>
nmap <leader>gp :Git push<CR>
nmap <leader>g> :diffget //2<CR>
nmap <leader>g< :diffget //3<CR>

nmap <C-d> :DiffviewOpen<CR>

Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" =================================================================

" Autocomplite
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" list of CoC extensions needed
let g:coc_global_extensions =  ['coc-eslint', 'coc-prettier', 'coc-css', 'coc-html', 'coc-json', 'coc-snippets', 'coc-emmet', 'coc-pairs']

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

let g:UltiSnipsExpandTrigger='<Nop>'
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" =================================================================

"this will auto close ( [ {
"Plug 'jiangmiao/auto-pairs'

" =================================================================
" Comments
Plug 'preservim/nerdcommenter' 

"Plug 'yuezk/vim-js'
"Plug 'HerringtonDarkholme/yats.vim'

" JavaScript
Plug 'jonsmithers/vim-html-template-literals'
let g:htl_all_templates = 1
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
" =================================================================
 
" PLUGIN: FZF
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

command! -nargs=* W w

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
Plug 'unblevable/quick-scope'

" WARNING: Put it before colorscheme option
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" =================================================================

" Airline
 Plug 'vim-airline/vim-airline'

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" =================================================================
 
" Editorconfig support
Plug 'editorconfig/editorconfig-vim'

" HTML
Plug 'mattn/emmet-vim'

let g:user_emmet_install_global=0
autocmd FileType html,css,jsx EmmetInstall

" Markdown
Plug 'godlygeek/tabular'

Plug 'plasticboy/vim-markdown'
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_conceal = 0

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

Plug 'ferrine/md-img-paste.vim'
let g:mdip_imgdir = '.'
autocmd FileType markdown nmap <buffer><silent> <leader>i :call mdip#MarkdownClipboardImage()<CR>

" Undo plugin
Plug 'mbbill/undotree'

" Vim tests
Plug 'vim-test/vim-test'
Plug 'rcarriga/vim-ultest', { 'do': ':UpdateRemotePlugins' }

let g:test#javascript#runner = 'jest'
let test#javascript#jest#options = "--color=always"
let g:ultest_use_pty = 1

" Indent plugin
Plug 'Yggdroot/indentLine'

set list
set lcs=tab:»_,trail:·
highlight SpecialKey ctermfg=8 guifg=DimGrey

" Tagbar
Plug 'preservim/tagbar'
nmap <leader>t :TagbarToggle<CR>

" Jump to location
Plug 'justinmk/vim-sneak'

nmap <leader>g <Plug>Sneak_s
nmap <leader>G <Plug>Sneak_S

" Surround
Plug 'tpope/vim-surround'

" Initialize plugin system
call plug#end()

" https://github.com/folke/tokyonight.nvim/issues/14
lua << EOS
require('gitsigns').setup{
  signs = {
    add = {hl = "DiffAdd", numhl = "GitSignsAddNr"},
    change = {hl = "DiffChange", numhl = "GitSignsChangeNr"},
    delete = {hl = "DiffDelete", numhl = "GitSignsDeleteNr"},
    topdelete = {hl = "DiffDelete", numhl = "GitSignsDeleteNr"},
    changedelete = {hl = "DiffChange", numhl = "GitSignsChangeNr"}
  },
  on_attach = function(bufnr)
    local function map(mode, lhs, rhs, opts)
        opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    end

    -- Navigation
    map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
    map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

    -- Actions
    map('n', '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map('v', '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map('n', '<leader>hr', ':Gitsigns reset_hunk<CR>')
    map('v', '<leader>hr', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
    map('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
    map('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
    map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
    map('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
    map('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
    map('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
    map('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
    map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')

    -- Text object
    map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
EOS

" Remap leader
let g:delimitMate_expand_cr = 1
noremap <Space> <Nop> 
map <Space> <Leader>

" Map quit from buffer
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" Initialize theme
colorscheme gruvbox
"colorscheme tokyonight
"colorscheme tokyonight

set ttyfast
set cursorline
set updatetime=100
set colorcolumn=120
set number
set encoding=utf-8
set spell spelllang=en_us
set mouse=a

" Identation settings
set tabstop=8
set shiftwidth=2
set softtabstop=2
set expandtab
set number
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
set termguicolors
" share clipboard across vim sessions
set clipboard=unnamed

command! BufOnly execute '%bdelete|edit #|normal `"'

" Commentary Plugin
nmap <C-_>   <Plug>NERDCommenterToggle<CR>
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

"function! GitStatus()
  "let [a,m,r] = GitGutterGetHunkSummary()
  "return printf('+%d ~%d -%d', a, m, r)
"endfunction

"set statusline+=%{GitStatus()}

" =================================================================
" Buffers
autocmd BufRead * normal zR

" next buffer;
nnoremap  <Tab> :bnext<CR>
" previous buffer;
nnoremap  <S-Tab> :bprevious<CR>

" =================================================================
 
" Windows
"map <silent> <C-h> :call WinMove('h')<CR>
"map <silent> <C-j> :call WinMove('j')<CR>
"map <silent> <C-k> :call WinMove('k')<CR>
"map <silent> <C-l> :call WinMove('l')<CR>

"function! WinMove(key)
"  let t:curwin = winnr()
"  exec "wincmd ".a:key
"  if (t:curwin == winnr())
"    if(match(a:key, '[jk]'))
"      wincmd v
"    else
"      wincmd s
"    endif
"    exec "wincmd ".a:key
"  endif
"endfunction
	
" =================================================================
 
" mbbill/undotree
nnoremap <silent> <C-u> :UndotreeToggle<CR>

set grepprg=rg\ --vimgrep\ --smart-case\ --follow

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


" terminal
"tnoremap <leader><Esc> <C-\><C-n>:q!<CR>
"nmap <leader>ls <Plug>NERDCommenterToggle<CR>

nmap <leader>tt :term<CR>
nmap <leader>tp :term live-server %:p:h
tnoremap <Esc> <C-\><C-n>:q!<CR>

highlight DiffAdd guifg=NONE guibg=#4b5632
highlight DiffDelete  guifg=NONE guibg=#453028
highlight DiffChange  guifg=NONE guibg=#385570
highlight DiffText    guifg=NONE guibg=#557A9E
