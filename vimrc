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
Bundle 'junegunn/seoul256.vim'
Bundle 'reedes/vim-colors-pencil'
"Bundle 'xoria256.vim'

" ---- Tim Pope's plugins ----
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-characterize'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-sleuth'
Bundle 'tpope/vim-obsession'
Bundle 'tpope/vim-abolish'

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
"Bundle 'juanpabloaj/ShowMarks'
Bundle 'majutsushi/tagbar'
Bundle 'jceb/vim-orgmode'
Bundle 'tmhedberg/matchit'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'mattn/calendar-vim'
"Bundle 'rosenfeld/conque-term'
"Bundle 'myusuf3/numbers.vim'
Bundle 'vimoutliner/vimoutliner'
Bundle 'vim-pandoc/vim-pandoc'
Bundle 'vim-pandoc/vim-pandoc-syntax'
Bundle 'vim-scripts/RST-Tables'
"Bundle 'lambdalisue/shareboard.vim'

" Marks of diffs
Bundle 'mhinz/vim-signify'

" Merge tool
Bundle "sjl/splice.vim"

" Statusline
"Bundle 'Lokaltog/powerline'
Bundle 'bling/vim-airline'

" Autocomplete
Bundle 'Valloric/YouCompleteMe'
"Bundle 'davidhalter/jedi-vim'
"Bundle 'Shougo/neocomplcache.vim'

" JavaScript Assistance
Bundle 'marijnh/tern_for_vim'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'walm/jshint.vim'


" ---- plugins not from GitHub ---- 
Bundle 'Align'
Bundle 'utl.vim'
Bundle 'vcscommand.vim'
Bundle 'AutoClose'
Bundle 'IndentAnything'
Bundle 'LaTeX-Suite-aka-Vim-LaTeX'

" ---- Distraction Free Writing ----
Bundle 'junegunn/goyo.vim'
Bundle 'junegunn/limelight.vim'

"---- For Writing ----
Bundle "reedes/vim-wordy"
Bundle 'kana/vim-textobj-user'
Bundle 'reedes/vim-textobj-sentence'

Bundle 'terryma/vim-multiple-cursors'

"---- For Unit Testing ----
Bundle 'alfredodeza/pytest.vim'

"---- For full screen toggle ----
Bundle "lambdalisue/vim-fullscreen"

"Plugin 'file:///home/omri/.vim/bundle/HiLinkTrace'

Bundle 'vim-scripts/toggle_words.vim'

Bundle 'embear/vim-foldsearch'

Bundle 'vifm/vifm.vim'

filetype plugin indent on

" ---- COLOR SCHEME ----
" Decide which color scheme to use based on file type and fonts, etc...
" Once a colorscheme is set, it should not be changed when creating new
" windows, etc... It can be very annoying when using, e.g. :h
fun! ChooseColorScheme()
  if !exists("g:colorscheme_set")
    let g:colorscheme_set=1
    if &ft =~ 'tex\|pandoc'
      let g:pencil_higher_contrast_ui = 1
      let g:pencil_neutral_code_bg = 1
      let g:airline_theme='pencil'
      colorscheme pencil
      set background=light
      hi Conceal guifg=#424242 guibg=#F1F1F1
      set guifont=Cousine\ 14
    else
      let g:seoul256_background=233
      colorscheme seoul256
      set guifont=CamingoCode\ 14
    endif
  endif
endfun

let g:seoul256_background=233
colorscheme seoul256
"set guifont=DejaVu\ Sans\ Mono\ 14
set guifont=CamingoCode\ 14

" Vifm setup
let g:vifm_term="gnome-terminal --disable-factory -x"
"let g:vifm_term="xterm -e "

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

" Easily add newline from normal mode
nmap <CR> o<Esc>k
nmap <S-CR> O<Esc>j

nmap <leader>) ys$)

" Make window navigation easy!
set wmh=0
set wmw=0

" When opening anew document - keep all folds open
let foldlevelstart=99

" because it collides with c-j in vim-latex I only define it for non-tex files
" TODO: find out how this can be achieved!
"map <c-j> <c-w>j<c-w>_
"map <c-k> <c-w>k<c-w>_
"map <c-h> <c-w>h<c-w><Bar>
"map <c-l> <c-w>l<c-w><Bar>

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

" Disable ex mode - never use it and its confusing
map Q <Nop>

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

" Vimcast #1: show invisibles
set listchars=tab:▸\ ,eol:¬

" Make vim copy and paste using the "* register so that it yanks directly into
" the clipboard
set clipboard=unnamedplus

" To display the difference in word count since beginning of editing
" session.
function! WordCount()
  let s:old_status = v:statusmsg
  let position = getpos(".")
  exe ":silent normal g\<c-g>"
  let stat = v:statusmsg
  let s:word_count = 0
  if stat != '--No lines in buffer--'
    let s:word_count = str2nr(split(v:statusmsg)[11])
    let v:statusmsg = s:old_status
  end
  call setpos('.', position)
  if exists("b:original_wc")
    let s:word_count =  s:word_count - b:original_wc
  else
    let b:original_wc = s:word_count
  endif
  return "wc diff: " . s:word_count 
endfunction

call airline#parts#define_function('wc', 'WordCount')


" ---- DEFINE SOME AUTOCOMMANDS ----
" Grouped together so they won't be defined twice. (see :help autocmd)

if has('autocmd') && !exists("autocommands_loaded")
  let autocommands_loaded = 1

  " Save the buffer on loose focus. The silent! command allows me not to know
  " about files without a filename which cannot be saved using wa.
  au FocusLost * :silent! wa

  " Always use the ShowMarks plugin
  " Disabled this since it gave annoying warnings!
  "au BufRead * ShowMarksOn

  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif

  " To enable omnicomplete
  " set omnifunc=syntaxcomplete#Complete
  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType python set foldlevelstart=99
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

  " By default, open all python folds, but keep them defined.
  au FileType python normal zR

  " Redefine some macros for vim-latex
  augroup MyIMAPs
      au!
      au VimEnter * call IMAP('SSE', "\\section{<++>}\<CR><++>", "tex")
      au VimEnter * call IMAP('SSS', "\\subsection{<++>}\<CR><++>", "tex")
      au VimEnter * call IMAP('SS2', "\\subsubsection{<++>}\<CR><++>", "tex")
  augroup END

  " Turn off alt keys so that I can use them in vim-latex
  au FileType *.tex set winaltkeys=no

  au FileType tex,md let g:airline_section_z = airline#section#create(['wc'])

" For synctex support
"function! Synctex()
  ""execute "silent !zathura --synctex-forward " . line('.') . ":" . col('.') . ":" . " " g:syncpdf
  "execute "!vimura %:r.pdf" line('.') col('.') "%> /dev/null" <cr>
"endfunction
"map <F8> :call Synctex()<cr>
nnoremap <F8>  :exec "!vimura %:r.pdf --synctex-forward" line('.')  col('.') "% > /dev/null"<cr><cr>


  " Closes the scratch window after autocompletion has occurred.
  autocmd CursorMovedI *  if pumvisible() == 0|silent! pclose|endif
  autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif


  " This is a little shabby but I don't want the mapping in Fugitive Gstatus
  " window
  fun! DefineMyMinusMapping()
      if exists('b:noMapping')
          return
      endif
      " Toggle folding using '-'
      nmap <buffer> - za
  endfun

  autocmd FileType conf let b:noMapping=1
  autocmd BufEnter * call DefineMyMinusMapping()

  "--- For Distraction-free writing ---
  "au User GoyoEnter Limelight
  "au User GoyoLeave Limelight!
  au FileType * call ChooseColorScheme()
  "au FileType tex,pandoc Goyo 90

  function! s:goyo_enter()
    let b:quitting = 0
    let b:quitting_bang = 0
    autocmd QuitPre <buffer> let b:quitting = 1
    cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
  endfunction

  function! s:goyo_leave()
    " Quit Vim if this is the only remaining buffer
    if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
      if b:quitting_bang
        qa!
      else
        qa
      endif
    endif
  endfunction

  autocmd User GoyoEnter nested call <SID>goyo_enter()
  autocmd User GoyoLeave nested call <SID>goyo_leave()
  " Make vim stop beeping
  set noeb vb t_vb=
  au GUIEnter * set vb t_vb=
  au VimEnter tex Goyo 90
endif

" ---- PLUGIN CONFIGURATION ----

" Tell vim-pandoc I use hard wraps
"let g:pandoc_use_hard_wraps = 1
let g:pandoc#biblio#bibs = ['/home/omri/repos/writings/library.bib']
let g:pandoc#biblio#use_bibtool=1
let g:pandoc#formatting#mode = 'h'
let g:SuperTabDefaultCompletionType = "context"



" Change shareboard port:
let g:shareboard_port = 8082


" Ack - tell Ack which program to use
let g:ackprg="ack -H --nocolor --nogroup --column"

" Toggle real fullscreen (no buttons and menu)
"function ToggleFullScreen()
  "call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
  ""if &guioptions =~# 'm'
      ""set guioptions-=m
      ""set guioptions-=r
      """set guioptions-=T
  ""else
      ""set guioptions+=m
      ""set guioptions+=r
      """set guioptions+=T
  ""endif
"endfunction

" By default, don't need the buttons in the top row
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=L

" Quick call plugins (F button mappings)
map               <F2> :NERDTreeToggle <CR>
nnoremap          <F3> :GundoToggle<CR>
nnoremap          <F4> :ToggleWord<CR> 
noremap           <F5> :RainbowParenthesesToggle <CR>
map               <F6> :Gstatus<CR>
map               <leader>f :Gstatus<CR>
nnoremap<silent>  <F7> :TagbarToggle<CR>
nnoremap          <F9> :set wrap!<CR>
inoremap          <F9> <Esc>:set wrap! <CR>a
map <silent>      <F12> :FullscreenToggle<CR>

" Definitions to make gundo work
let g:gundo_preview_bottom=1
set undofile
set colorcolumn=80

" ---- PYMODE OPTIONS ----
" disable python folding
let g:pymode_folding=0
" open a new split when going to definition
"let g:pymode_rope_goto_def_newwin="new"
" disable rope
let g:pymode_rope=0
"let g:pymode_doc=1
"let g:pymode_key='K'
"let g:pymode_lint=1
"let g:pymode_lint_checker="pyflakes,pep8"
"let g:pymode_lint_write=1

"Python-mode
" Activate rope
" Keys:
" K             Show python docs
"   Rope autocomplete
" g     Rope goto definition
" d     Rope show documentation
" f     Rope find occurrences
" b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
"let g:pymode_rope = 0
let g:pymode_rope_completion = 0

" don't open quickfix window for code errors
let g:pymode_lint_cwindow=0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore = "E"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
"let g:pymode_breakpoint = 1
"let g:pymode_breakpoint_key = 'b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
"let g:pymode_folding = 0


" ---- EASY MOTION ----
let EasyMotion_keys="abcdefghijklmnopqrstuvwxyz"
let EasyMotion_grouping=2


" ---- ULTISNIPTS ----
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories=["UltiSnips","Snippets"]
let g:ultisnips_python_style="google"
let g:UltiSnipsEditSplit="vertical"

" ---- YCM ----
"let g:ycm_filetype_blacklist={}

" ---- ULTISNIPS + YCM INTEGRATION ----
"function! g:UltiSnips_Complete()
"    call UltiSnips_ExpandSnippet()
"    if g:ulti_expand_res == 0
"        if pumvisible()
"            return "\<C-n>"
"        else
"            call UltiSnips_JumpForwards()
"            if g:ulti_jump_forwards_res == 0
"                return "\<TAB>"
"            endif
"        endif
"    endif
"    return ""
"endfunction

"au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsListSnippets="<c-e>"

" YCM Binding for jumping to definition
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Adding a latex completer for cite and ref commands to YCM.
let g:ycm_semantic_triggers = {
\   'tex': ['\ref{', '\cite{'],
\ }

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

" Make the ctrl-j mapping be c-space instead
imap <C-space> <Plug>IMAP_JumpForward

" Make cool replacement of latex symbols with Unicode ones!
set cole=2
let g:tex_conceal="adgm"
" make  colors of conceal better fit Molokai (for some reason needs autocommand)
"au FileType tex,pandoc hi Conceal guibg=#272822 guifg=#F8F8F2
"au FileType tex,pandoc hi Folded guifg=#468eb3 guibg=#000000
"au FileType tex,pandoc let g:seoul256_background=233
"au FileType tex,pandoc hi Conceal guifg=#424242 guibg=#F1F1F1
"au FileType tex,pandoc set guifont=Cousine\ 14


" ---- VCSCOMMAND ---
nnoremap <leader>d :VCSDiff<CR>

" ---- SYNTASTIC ----
" Makes syntastic not check python files (because it hangs when saving
" controllers/default.py in my sdh_db)
let g:syntastic_mode_map = {'mode' : 'active',
                        \   'active_filetypes' : [],
                        \   'passive_filetypes': ['python']}
