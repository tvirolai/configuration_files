" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
" Required for operations modifying multiple buffers like rename.
set hidden
set nocompatible              " be iMproved, required
set nofoldenable

set clipboard=unnamedplus " Use system clipboard by default

" Plugins are defined here using plug-vim
call plug#begin('~/.config/nvim/bundle')

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhartington/oceanic-next'
" Intellisense Engine
Plug 'neoclide/coc.nvim', { 'do': 'yarn install' }
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'guns/vim-clojure-highlight'
Plug 'SevereOverfl0w/vim-replant', { 'do': ':UpdateRemotePlugins' }
Plug 'luochen1990/rainbow'
Plug 'scrooloose/nerdtree'
Plug 'NLKNguyen/papercolor-theme'
Plug 'inside/vim-search-pulse'
Plug 'alvan/vim-closetag'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'matze/vim-move'
Plug 'vim-airline/vim-airline'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Plug 'clojure-vim/acid.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'liquidz/vim-iced', {'for': 'clojure'}
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-salve'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'tpope/vim-repeat'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mxw/vim-jsx'
Plug 'kshenoy/vim-signature'
Plug 'neovimhaskell/haskell-vim'
Plug 'mfukar/robotframework-vim'
Plug 'elixir-editors/vim-elixir'
Plug 'jacoborus/tender.vim'
" Plug 'kovisoft/slimv', { 'for': 'lisp' }
Plug 'reasonml-editor/vim-reason-plus'
Plug 'wellle/targets.vim'
Plug 'rust-lang/rust.vim'
Plug 'jpalardy/vim-slime'
Plug 'tpope/vim-fugitive'
Plug 'ElmCast/elm-vim'
Plug 'junegunn/gv.vim'
Plug 'ap/vim-css-color'
Plug 'dracula/vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'mbbill/undotree'
Plug 'unblevable/quick-scope'
Plug 'sainnhe/vim-color-forest-night'
Plug 'l04m33/vlime', {'rtp': 'vim/'}
Plug 'dense-analysis/ale'
" Plug 'Olical/conjure', { 'tag': 'v0.23.0', 'do': 'bin/compile'  }
call plug#end()


"""""""""""""""""""
" PLUGIN SETTINGS "
"""""""""""""""""""
let g:python_highlight_all = 0
let g:rainbow_active = 0 "enable via :RainbowToggle


" coc.nvim related settings

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"

let g:ale_linters = {'clojure': ['clj-kondo']}

" Remap s and S to EasyMotion movements
map s <Plug>(easymotion-s)
map S <Plug>(easymotion-s2)

" Configure vim-slime to be able to send data from the editor window
" to the REPL. Here Vim is assumed to be run on the left side of a vertically
" split tmux window, with the repl on the right.
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}

let g:coc_node_path = "/Users/tuomo.virolainen/.nvm/versions/node/v10.15.0/bin/node"

let g:LanguageClient_settingsPath=".lsp/settings.json"

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Only the search pattern will pulse
let g:vim_search_pulse_mode = 'cursor_line'

let g:clojure_maxlines = 700

let g:clojure_syntax_keywords = {
    \ 'clojureMacro': ["defproject", "defquery", "defapi", "defroutes", "defrule"]
    \ }

map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Close vim if NerdTree is the last open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Autocomplete settings
"
" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'reason': ['/usr/local/bin/reason-language-server.exe']
    \ }

nnoremap ¨ /
nnoremap ^ :

cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> gj :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" Get the results of previous fzf search using Ctrl-N / Ctrl-P
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
nnoremap <c-p> :FZF<cr>

let g:closetag_filenames = "*.xml,*.html,*.xhtml,*.phtml,*.php,*.jsx,*.js"
let g:javascript_plugin_jsdoc = 1

au FileType xml,html,phtml,php,xhtml,js let b:delimitMate_matchpairs = "(:),[:],{:}"

"""""""""""""""""""
" APPEARANCE      "
"""""""""""""""""""
syntax enable
"set termguicolors
" Enable true color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_contrast_light = 'medium'

" set background=light

colorscheme gruvbox
set background=dark

set cursorline " - Valitun rivin korostus
set colorcolumn=80

" " Enable the list of buffers
let g:airline#extensions#tabline#enabled                      = 1
let g:airline#extensions#tabline#buffer_min_count             = 1
let g:airline#extensions#tabline#tab_min_count                = 1
let g:airline#extensions#tabline#buffer_idx_mode              = 1
let g:airline#extensions#tabline#buffer_nr_show               = 1
let g:airline#extensions#tabline#show_buffers                 = 1
let g:airline#extensions#branch#enabled                       = 1
let g:airline#extensions#tagbar#enabled                       = 1
let g:airline_powerline_fonts                                 = 1
let g:airline#extensions#whitespace#enabled       = 0
let g:airline#extensions#tabline#fnamemod         = ':t'
let g:airline_section_c                           = '%{fnamemodify(expand("%"), ":~:.")}'
let g:airline_section_x                           = '%{fnamemodify(getcwd(), ":t")}'
let g:airline_section_y                           = airline#section#create(['filetype'])

" Easier tab/buffer switching
nmap <leader>1 :b1<CR>
nmap <leader>2 :b2<CR>
nmap <leader>3 :b3<CR>
nmap <leader>4 :b4<CR>
nmap <leader>5 :b5<CR>
nmap <leader>6 :b6<CR>
nmap <leader>7 :b7<CR>
nmap <leader>8 :b8<CR>
nmap <leader>9 :b9<CR>


"""""""""""""""""""""""""""""
" GENERAL EDITOR SETTINGS   "
"""""""""""""""""""""""""""""
filetype plugin indent on    " required
" set maxmempattern=2000000
set timeoutlen=500
set regexpengine=1
set lazyredraw
set showcmd
set encoding=utf-8
set fileencoding=utf-8
set magic
" set showmatch
set smarttab
set shiftwidth=2
set tabstop=2
set expandtab
set nolinebreak
set nolist
set textwidth=0
set wrapmargin=0
set autoread
set ignorecase
set smartcase
set ai
set nu
set pastetoggle=<F2>
set mouse=
set backup
set swapfile
"" Text Wrapping
"set textwidth=79
set wrap
set nolist  " list disables linebreak

" set autochdir " Set working directory to the currently open file

" enable autocomplete
" let g:deoplete#enable_at_startup = 1

let g:python_host_prog = $HOME."/.pyenv/versions/2.7.11/envs/neovim2/bin/python"
let g:python3_host_prog = $HOME."/.pyenv/versions/3.7.1/envs/neovim3/bin/python3"

" Format JSX also in files with .js suffix
let g:jsx_ext_required = 0

" Disable netrw for NerdTree
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

au BufNewFile,BufRead *.boot set filetype=clojure
autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 expandtab

" Save temporary/backup files not in the local directory, but in your ~/.vim
" directory, to keep them out of git repos.
" But first mkdir backup, swap, and undo first to make this work
call system('mkdir ~/.vim')
call system('mkdir ~/.vim/backup')
call system('mkdir ~/.vim/swap')
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    call system('mkdir ~/.vim/undo')
    set undodir=~/.vim/undo//
    set undofile
    set undolevels=1000
    set undoreload=10000
endif


"""""""""""""""""""""""
" CUSTOM KEYBINDINGS  "
"""""""""""""""""""""""

let mapleader = "\<Space>"
let maplocalleader=","

let g:NumberToggleTrigger="<F3>"

let g:move_key_modifier = 'C'

" Rebind arrow keys. Up and down circle through to spots in the buffer where
" text has been last inserted, right goes to the line that was last edited.
" Left jumps to the last edit point and switches in insert mode.
nnoremap <Up> g;<CR>
nnoremap <Down> g,<CR>
nnoremap <Right> `.
nnoremap <Left> gi

" Escape insert mode quickly by typing 'kj'
inoremap kj <Esc>

" Also remap Ctrl-C to work similarly to Esc
inoremap <C-c> <Esc>

" To open a new empty buffer
nmap <leader>T :enew<CR>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
" nmap <leader>bl :ls<CR>

" Close all other splits except the focused one
nmap ä :only<CR>

" Open Silver Searcher with key Ä
nmap Ä :Ag<CR>

" List open buffers by pressing å
nmap å :Buffers<CR>

" Save by pressing ö
nmap ö :w<CR>

" Close a buffer quickly by pressing å in normal mode (without closing open
" windows!)
nmap Å :bp<bar>sp<bar>bn<bar>bd<CR>
" This version closes splits:
nmap ´ :bd!<CR>

" Switch buffers by name/number the same way as in Spacemacs - space b b.
nmap <leader>b :b<Space>

" Clojure-specific bindings

" Compile Clojure namespace by pressing §
nmap § :Require<CR>
" Evaluate a Clojure form by °
nmap ° :Eval<CR>

" Jump to definition by pressing Ö on symbol
nmap Ö ]<C-d>
" nmap ° cpp<CR>
" Run tests by pressing °

function SwitchBuffer()
  b#
endfunction

" Toggle between two latest buffers by pressing TAB
" nmap <Tab> :call SwitchBuffer()<CR>
nmap <Tab> :call SwitchBuffer()<CR>

" fugitive git bindings
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :Git reflog<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gbr :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Gpush<CR>
nnoremap <leader>gpl :Gpull<CR>

nnoremap <leader>gv :GV<CR>

""""""""""""
" VARIOUS  "
""""""""""""

set wildmode=list:full
set wildignore=*.swp,*.bak
set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
set wildignore+=tags
set wildignore+=*.tar.*

set wildignorecase
set wildignore+=*/node_modules/*     " MacOSX/Linux

" Trim unwanted whitespaces by :call TrimWhiteSpace()
fun! TrimWhitespace()
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfun

" A shorter way: :Siivous
command! Siivous call TrimWhitespace()

fun! StartVlime()
  execute "!rlwrap sbcl --load /Users/tuomo.virolainen/.config/nvim/bundle/vlime/lisp/start-vlime.lisp"
endfun

command! Vlime call StartVlime()

augroup LocalVlimeKeys
  autocmd!
  autocmd FileType lisp nnoremap <silent> <buffer> §
        \ :call vlime#plugin#SendToREPL(vlime#ui#CurExprOrAtom())<cr>
augroup end
