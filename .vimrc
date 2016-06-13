"setting vim default,not vi
set nocompatible

"backspace_option
"set backspace = start,eol,indent
set mouse=a
set number
set cursorline
set laststatus=2
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
set scrolloff=8
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set encoding=utf-8
set wildmenu
set hlsearch
set incsearch
set listchars=tab:>-,trail:-,eol:$,extends:>,precedes:<,nbsp:.
set clipboard=unnamed,unnamedplus
set foldmethod=marker
"set foldtext=FoldCCtext()
set foldcolumn=2
set fillchars=vert:\|
hi Folded gui=bold term=standout ctermbg=white ctermfg=LightBlue guibg=white guifg=black
hi FoldColum gui=bold term=standout ctermbg=LightGray ctermfg=DarkBlue guibg=Grey guifg=DarkBule

inoremap jj <ESC>
nnoremap j gj
nnoremap k gk

" nmap	:write:make
" imap :write:make
"
" nmap	:make run
" imap :make run
"
" let s:quickfixwindow = "close"
" function! b:openCloseQuickfix()
" if "open" ==? s:quickfixwindow
" let s:quickfixwindow = "close"
" cclose
" else
" let s:quickfixwindow = "open"
" copen
" endif 
" endfunction
"
" nmap	:call b:openCloseQuickfix()
" imap :call b:openCloseQuickfix()

syntax on

filetype plugin indent off

"plugin set up
"
if has('vim_starting')
	set nocompatible
	set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

"unsynclonized process plugin
NeoBundle 'Shougo/vimproc', {
	\ 'build' : {
		\'windows' : 'make -f make_mingw32.mak',
		\ 'cygwin' : 'make -f make_cygwin.mak',
		\ 'mac' : 'make -f make_mac.mak',
		\ 'unix' : 'make -f make_unix.mak',
	\ },
\ }
"neocomplete or neocomplcache setting
"
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'
if neobundle#is_installed('neocomplete')
	"for neocomplete setting
	let g:neocomplete#enable_at_startup = 1
	let g:neocomplete#enable_ignore_case = 1
	let g:neocomplete#enable_smart_case = 1
"	let g:neocomplete#use_vimproc = 1
	if !exists('g:neocomplete#keyword_patterns')
		let g:neocomplete#keyword_patterns = {}
	endif
	let g:neocomplete#keyword_patterns._ = '\h\w*'
	" Plugin key-mappings.
	inoremap <expr><C-g>     neocomplete#undo_completion()
	inoremap <expr><C-l>     neocomplete#complete_common_string()
	"
	" Recommended key-mappings.
	" <CR>: close popup and save indent.
	inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	function! s:my_cr_function()
		return neocomplete#smart_close_popup() . "\<CR>"
		" For no inserting <CR> key.
		"return pumvisible() ? neocomplete#close_popup() : "\<CR>"
	endfunction
	" <TAB>: completion.
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
	" <C-h>, <BS>: close popup and delete backword char.
	inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
	inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
	inoremap <expr><C-y>  neocomplete#close_popup()
	inoremap <expr><C-e>  neocomplete#cancel_popup()
	" Close popup by <Space>.
	"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"
elseif neobundle#is_installed('neocomplcache')
	"for neocomplcache setting

	"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
	" Disable AutoComplPop.
	let g:acp_enableAtStartup = 0
	" Use neocomplcache.
	let g:neocomplcache_enable_at_startup = 1
	" Use smartcase.
	let g:neocomplcache_enable_smart_case = 1
	" Set minimum syntax keyword length.
	let g:neocomplcache_min_syntax_length = 3
	let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
	" Enable heavy features.
	" Use camel case completion.
	"let g:neocomplcache_enable_camel_case_completion = 1
	" Use underbar completion.
	"let g:neocomplcache_enable_underbar_completion = 1

	" Define dictionary.
	let g:neocomplcache_dictionary_filetype_lists = {
				\ 'default' : '',
				\ 'vimshell' : $HOME.'/.vimshell_hist',
				\ 'scheme' : $HOME.'/.gosh_completions'
				\ }

	" Define keyword.
	if !exists('g:neocomplcache_keyword_patterns')
		let g:neocomplcache_keyword_patterns = {}
	endif
	let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
	" Plugin key-mappings.
	inoremap <expr><C-g>     neocomplcache#undo_completion()
	inoremap <expr><C-l>     neocomplcache#complete_common_string()

	" Recommended key-mappings.
	" <CR>: close popup and save indent.
	inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	function! s:my_cr_function()
		return neocomplcache#smart_close_popup() . "\<CR>"
		" For no inserting <CR> key.
		"return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
	endfunction
	" <TAB>: completion.
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
	" <C-h>, <BS>: close popup and delete backword char.
	inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
	inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
	inoremap <expr><C-y>  neocomplcache#close_popup()
	inoremap <expr><C-e>  neocomplcache#cancel_popup()
	" Close popup by <Space>.
	"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"
endif

"
"
"
"
"unite.vim setting"
NeoBundleLazy 'Shougo/unite.vim.git', {
\	'autoload' : { 'commands' : ['UniteVim']},
\ }

"NeoBundle 'ujihisa/unite-colorscheme'
"

"line indent on
"But,this plugin umaku ugokanai.
" NeoBundleLazy 'Yggdroot/indentLine',{
" \	'autoload' : {'commands' : ['indentLine']},
" \}
" let g:indentLine_color_term = 111
" let g:indentLine_char = '|'
"
"
"color indent on 
"But this plug-in was not enable to use on cygwin. So,I comment out.
"
"NeoBundle 'nathanaelkane/vim-indent-guides'
" let g:indent_guides_enable_on_vim_startup = 1 
" let g:indent_guides_auto_colors = 0 
" autocmd VimEnter,ColorScheme * :hi IndentGuidesOdd	ctermbg=black
" autocmd VimEnter,ColorScheme * :hi IndentGuidesEven ctermbg=darkgrey 
" let g:indent_guides_guide_size=1 
"
"
"coment on/off plugin
NeoBundle 'tomtom/tcomment_vim'
"
"
"vim-latex
NeoBundleLazy 'vim-latex/vim-latex',{
\	"autoload" : { "filetypes" : ["tex"]}
\}
""
"
"折り畳みの変化
NeoBundle 'LeafCage/foldCC'
"
"アウトラインプロセッサにしたい
"tagばー
"NeoBundle 'majutsushi/tagbar'
"
"
"カラースキーム
"NeoBundle 'vim-scripts/twilight'
"NeoBundle 'nanotech/jellybeans.vim'

call neobundle#end()
filetype plugin indent on
"NeoBundleCheck

""vim-LaTeX
"write under setting of vim-LaTeX"
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Imap_UsePlaceHolders = 1
let g:Imap_DeleteEmptyPlaceHolders = 1
let g:Imap_StickyPlaceHolders = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='dvi,pdf'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
let g:Tex_FormatDependency_ps = 'dvi,ps'
let g:Tex_CompileRule_pdf = 'ptex2pdf -u -l -ot "-synctex=1 -interaction=nonstopmode -file-line-error-style" $*'
let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_CompileRule_dvi = 'uplatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_BibtexFlavor = 'upbibtex'
let g:Tex_MakeIndexFlavor = 'upmendex $*.idx'
let g:Tex_UseEditorSettingInDVIViewer = 1
let g:Tex_ViewRule_pdf = 'texworks'
"
"jellybeans
let g:jellybeans_overrides = {
\	'Todo': { 'guifg': '303030', 'guibg': 'f0f000',
\				'ctermfg': 'Black', 'ctermbg': 'Yellow',
\				'attr': 'bold' },
\}

colorscheme desert
"colorscheme Twilight
"colorscheme jellybeans
"tagbar 設定
"nmap <F8> :TagbarToggle<CR>
