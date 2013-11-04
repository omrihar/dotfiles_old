set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles
"
" repos on github
" ---- Color Themes ----
Bundle 'tomasr/molokai'
"Bundle 'xoria256.vim'

" ---- Tim Pope's plugins ----
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-characterize'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-sleuth'
Bundle 'tpope/vim-obsession'

" ---- Other Plugins on GitHub -----
Bundle 'kien/ctrlp.vim'
Bundle 'jasoncodes/ctrlp-modified.vim'
Bundle 'tacahiroy/ctrlp-funky'
Bundle 'sgur/ctrlp-extensions.vim'
Bundle 'ivalkeen/vim-ctrlp-tjump'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'mileszs/ack.vim'
Bundle 'sjl/gundo.vim'
Bundle 'klen/python-mode'
Bundle 'juanpabloaj/ShowMarks'
Bundle 'majutsushi/tagbar'
Bundle 'jceb/vim-orgmode'
Bundle 'tsaleh/vim-matchit'
Bundle 'SirVer/ultisnips'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'mattn/calendar-vim'
Bundle 'Shougo/neocomplcache.vim'

" JavaScript Assistance
Bundle 'marijnh/tern_for_vim'
Bundle 'pangloss/vim-javascript'
Bundle 'walm/jshint.vim'

" ---- plugins not from GitHub ---- 
Bundle 'Align'
Bundle 'utl.vim'
Bundle 'vcscommand.vim'
Bundle 'AutoClose'
Bundle 'IndentAnything'
Bundle 'LaTeX-Suite-aka-Vim-LaTeX'


filetype plugin indent on

" ---- COLOR THEME ----
"colorscheme koehler
silent! colorscheme molokai

" ---- EDITOR CONFIGURATION ---- "

" My <Leader> key is ','
let mapleader=","

" use ; instead of : in normal mode (saves one shift press many many times...)
nnoremap ; :

" Save with C-S and switch to normal mode
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>

" Traverse long lines intuitively
nnoremap j gj
nnoremap k gk

" Make window navigation easy!
set wmh=0
set wmw=0

" because it collides with c-j in vim-latex I only define it for non-tex files
" TODO: find out how this can be achieved!
map <c-j> <c-w>j<c-w>_
map <c-k> <c-w>k<c-w>_
map <c-h> <c-w>h<c-w><Bar>
map <c-l> <c-w>l<c-w><Bar>

" Makes the newly created vsp window open on the right
set splitright

" Whitespace settings which enfore always 4 spaces instead of tabs
set tabstop=4 
set shiftwidth=4 
set softtabstop=4 
set expandtab

" Search defaults (extra ones in vim-sensible)
set ignorecase 
set smartcase 
set gdefault   " when doing search and replace, add the g flag automatically
set hlsearch

set nowrap
set linebreak
"set nolist
set formatoptions+=l
set textwidth=79

" History and file management
set history=1000
set undolevels=1000
set wildignore+=*.swp,*.bak,*.pyc,*.class,*.svn,*.png,*.jpg,*.gif,*.orig
set title
set nobackup
set noswapfile

" toggle search highlight
nnoremap <leader><space> :set hlsearch! hlsearch?<CR>

" Show line number
set number

" Highlight line where cursor is
set cursorline

" Show the row and column position of the cursor
set ruler

" Hide buffers instead of closing them (preserves history)
set hidden

set ttyfast

set laststatus=2

" Toggle folding using '-'
nnoremap - za

"open .vimrc fast
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<CR>

" Enable the use of mouse in terminal
set mouse=a

" Reformat a paragraph fast (i.e. to respect textwidth)
vnoremap Q gq
nnoremap Q gqap

" Make ctrl-backspace delete the word before the cursor (also in insert mode).
inoremap <C-BS> <C-O>b<C-O>dw 
noremap <C-BS> bdw

" Enable spell checking
set spell
set spelllang=en

" Mappings and options for diff
if &diff
    set diffopt+=iwhite
    map <leader>1 :diffget LOCAL<CR>
    map <leader>2 :diffget BASE<CR>
    map <leader>3 :diffget REMOTE<CR>
endif


" ---- DEFINE SOME AUTOCOMMANDS ----
" Grouped together so they won't be defined twice. (see :help autocmd)

if has('autocmd') && !exists("autocommands_loaded")
    let autocommands_loaded = 1

    " Save the buffer on loose focus. The silent! command allows me not to know
    " about files without a filename which cannot be saved using wa.
    au FocusLost * :silent! wa

    " Always use the ShowMarks plugin
    au BufRead * ShowMarksOn

    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal g'\"" |
      \ endif
    
    " To enable omnicomplete
    " set omnifunc=syntaxcomplete#Complete
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    "autocmd FileType python setlocal omnifunc=pysmell#Complete
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html set omnifunc=htmlcomplete#Complete
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS

    " To make shift-enter ignore the rest of the sentence (brackets) and
    " ctrl-enter to do the same, but add : or ; depending on filetype
    inoremap <s-CR> <Esc>o
    let b:delimiter = ""
    au FileType python let b:delimiter = ":"
    au FileType javascript let b:delimiter = ";"
    inoremap <c-CR> <Esc>A<c-r>=b:delimiter<CR><Esc>o

    " Redefine some macros for vim-latex
    augroup MyIMAPs
        au!
        au VimEnter * call IMAP('SSE', "\\section{<++>}\<CR><++>", "tex")
        au VimEnter * call IMAP('SSS', "\\subsection{<++>}\<CR><++>", "tex")
        au VimEnter * call IMAP('SS2', "\\subsubsection{<++>}\<CR><++>", "tex")
    augroup END

    " Turn off alt keys so that I can use them in vim-latex
    au FileType *.tex set winaltkeys=no
endif


" ---- PLUGIN CONFIGURATION ----

" Ack - tell Ack which program to use
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" Quick call plugins (F button mappings)
map               <F2> :NERDTreeToggle <CR>
noremap           <F5> :RainbowParenthesesToggle <CR>
map               <F6> :Gstatus<CR>
map               <leader>f :Gstatus<CR>
nnoremap<silent>  <F7> :TagbarToggle<CR>
nnoremap          <F9> :set wrap!<CR>
inoremap          <F9> <Esc>:set wrap! <CR>a

" Gundo plugin can only work with vim > 7.2
if v:version > 702
    " Add keymapping for gundo plugin
    nnoremap <F3> :GundoToggle<CR>
    let g:gundo_preview_bottom=1
    set undofile
    set colorcolumn=85
endif

" ---- PYMODE OPTIONS ----
" disable python folding
let g:pymode_folding=1
" don't open quickfix window for code errors
let g:pymode_lint_cwindow=0
" open a new split when going to definition
let g:pymode_rope_goto_def_newwin="new"


" ---- EASY MOTION ----
let EasyMotion_keys="abcdefghijklmnopqrstuvwxyz"
let EasyMotion_grouping=2


" ---- ULTISNIPTS ----
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["UltiSnips","Snippets"]

" ---- VIM-LATEX ----
let g:tex_flavor='latex'
set grepprg=grep\ -nH\ $*
let g:Tex_FoldedMisc="slide,preamble,<<<"
let g:Tex_Folding=0
" the last line prevents Latex-Suite from folding \item elements
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf, aux'
let g:Tex_ViewRule_pdf = 'okular'
let g:Tex_CompileRule_pdf = "/usr/bin/latexmk -e '$pdflatex=q/pdflatex -interaction=nonstopmode -file-line-error -hatl-on-error -synctex=1/' -pdf -bibtex $*"

" Make cool replacement of latex symbols with Unicode ones!
set cole=2
let g:tex_conceal="adgm"
" make  colors of conceal better fit Molokai (for some reason needs autocommand)
au FileType tex hi Conceal guibg=#272822 guifg=#F8F8F2

" ---- VCSCOMMAND ---
nnoremap <leader>d :VCSDiff<CR>

" ---- SYNTASTIC ----
" Makes syntastic not check python files (because it hangs when saving
" controllers/default.py in my sdh_db)
let g:syntastic_mode_map = {'mode' : 'active',
                        \   'active_filetypes' : [],
                        \   'passive_filetypes': ['python']}


" ---- NEOCOMPLCACHE SETTINGS (TAKEN FROM GITHUB README) ----

" Disable AutoComplPop. Comment out this line if AutoComplPop is not installed.
"let g:acp_enableAtStartup = 0
" Launches neocomplcache automatically on vim startup.
let g:neocomplcache_enable_at_startup = 0
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underscore completion.
let g:neocomplcache_enable_underbar_completion = 1
" Sets minimum char length of syntax keyword.
let g:neocomplcache_min_syntax_length = 3
" buffer file name pattern that locks neocomplcache. e.g. ku.vim or fuzzyfinder 
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define file-type dependent dictionaries.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword, for minor languages
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
"imap <C-k>     <Plug>(neocomplcache_snippets_expand)
"smap <C-k>     <Plug>(neocomplcache_snippets_expand)
"inoremap <expr><C-g>     neocomplcache#undo_completion()
"inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion. Not required if they are already set elsewhere in .vimrc
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion, which require computational power and may stall the vim. 
"if !exists('g:neocomplcache_omni_patterns')
"  let g:neocomplcache_omni_patterns = {}
"endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
""autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
"let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
