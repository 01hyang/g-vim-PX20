" vim: ts=4 sw=4 sts=4 noet foldenable foldmethod=marker foldcolumn=4
"
" hugh's vimrc
" hugh.hyyang@gmail.com
"
" Inspired by https://github.com/vgod/vimrc
"


" For pathogen.vim: auto load all plugins in .vim/bundle {{{
"<--call pathogen#runtime_append_all_bundles()
"<--call pathogen#infect()
"<--call pathogen#helptags()
" }}}


" Launch vim and run :PluginInstall
" To install from command line: vim +PluginInstall +qall {{{
set nocompatible				" be iMproved, required
filetype off					" required
								" http://stackoverflow.com/questions/14642956/why-vundle-requires-filetype-off
								" necessary to make ftdetect work on Linux

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'https://github.com/luochen1990/rainbow.git'
Plugin 'https://github.com/majutsushi/tagbar.git'
Plugin 'https://github.com/wesleyche/SrcExpl.git'
"Plugin 'https://github.com/ervandew/supertab.git'
Plugin 'https://github.com/mileszs/ack.vim.git'
Plugin 'https://github.com/Valloric/YouCompleteMe.git'
Plugin 'https://github.com/vasconcelloslf/vim-interestingwords.git'
Plugin 'https://github.com/bling/vim-airline.git'
Plugin 'https://github.com/powerline/fonts.git'
Plugin 'https://github.com/kien/ctrlp.vim.git'
Plugin 'https://github.com/vim-scripts/Visual-Mark.git'
Plugin 'https://github.com/easymotion/vim-easymotion.git'
Plugin 'https://github.com/Yggdroot/indentLine.git'
Plugin 'https://github.com/terryma/vim-expand-region'
Plugin 'https://github.com/terryma/vim-multiple-cursors.git'
Plugin 'https://github.com/airblade/vim-gitgutter.git'
"Plugin 'https://github.com/scrooloose/syntastic.git'


" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on   " required
" To ignore plugin indent changes, instead use:
filetype on
filetype plugin on
"?? filetype indent on
syntax on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}


"-------------------------------------------------------------------------------
" General Settings
"-------------------------------------------------------------------------------
set path=$PWD/**		" Set path variable to current directory and to all 
						" directories under current directory recursively
set nu
set mouse=a				" <S-mouse_left> <S-mouse_right>
"<--set splitbelow
"set formatoptions=ql	" -=cro: Disable automatic comment insertion
						" :set paste to turn it on and :set nopaste to turn it
						" off
au Filetype * set fo-=c fo-=r fo-=o

" Fold {{{
set foldmethod=syntax
set foldlevel=3
set foldcolumn=4
set foldlevelstart=1	" 99

"let comment = substitute(getline(v:foldstart), '/\*\|\*/\|{{{\d\=', '', 'g')
"let linetext = substitute(getline(v:foldstart+1),"^ *","",1)
function! MyFoldText()
	let i = indent(v:foldstart)
	let indent_level = i - i / &tabstop		" &: get current value of a setting
	let indent = repeat(' ', indent_level)
	let nl = v:foldend - v:foldstart + 1
	let comment = substitute(getline(v:foldstart), "^ *\" *", "", "g")
"	let txt = comment . ' --- ' . nl . ' lines '
	let txt = comment . ' --- ' . nl . ' lines ' . '                                                                                                                                                    '
	return indent . txt
endfunction

set fillchars=fold:-
set foldtext=MyFoldText()
" }}}

set showbreak=\

set nocompatible        " not compatible with the old-fashion vi mode
set bs=2                " allow backspacing over everything in insert mode
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set autoread            " auto read when file is changed from outside
"set autowrite
set hidden

set hlsearch            " search highlighting

" terminal color settings
set t_Co=256
	colors hugh

set clipboard=unnamed   " yank to the system register (*) by default
set showmatch           " Cursor shows matching ) and }
set showmode            " Show current mode
set wildchar=<TAB>      " start wild expansion in the command line using <TAB>
set wildmenu            " wild char completion menu

" ignore these files while expanding wild chars
set wildignore=*.o,*.a,*.bin,*.img,*.hex,*.s19,*.class,*.pyc
set wildignore+=tags,*~,*.patch,*.rej,*.orig,*.su
" list but give low priority, that is, list at end
"set suffixes+=.o

"<--set autoindent		" auto indentation
set incsearch			" incremental search
set nobackup			" no *~ backup files
"<--set copyindent		" copy the previous indentation on autoindenting
set ignorecase			" ignore case when searching
set smartcase			" ignore case if search pattern is all lowercase,case-sensitive otherwise
"set list
"set listchars=tab:|\ 
set list lcs=tab:\|\ 
set timeout timeoutlen=1500 " ttimeoutlen=0

" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" TAB setting {{{
"set expandtab
set tabstop=8
set softtabstop=8
set shiftwidth=0
"set smarttab

au FileType Makefile set noexpandtab
" }}}

" Status line {{{
set laststatus=2
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \
set statusline+=\ \ \ [%{&ff}/%Y]
set statusline+=\ \ \ %<%20.30(%{hostname()}翻>:%{CurDir()}%)\
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction
" }}}

" Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

" Runtime syntax/colortest.vim
highlight Pmenu			guibg=brown			gui=bold
highlight Pmenu			ctermbg=darkgray	gui=bold
highlight PmenuSel		ctermfg=yellow		ctermbg=brown
highlight PmenuSbar		ctermfg=7			ctermbg=0
highlight PmenuThumb	ctermfg=0			ctermbg=7

" Visual block color
highlight Visual ctermfg=grey ctermbg=black guibg=grey

" Configure vimdiff color
"set scrollbind
hi DiffAdd		term=reverse cterm=bold ctermbg=168		ctermfg=88
hi DiffChange	term=reverse cterm=bold ctermbg=75		ctermfg=20
hi DiffText		term=reverse cterm=bold ctermbg=gray	ctermfg=black
hi DiffDelete	term=reverse cterm=bold ctermbg=108		ctermfg=darkgray

" Configure fold color
hi Folded		ctermbg=0 ctermfg=240
hi FoldColumn	ctermfg=240

" Configure lcs
hi SpecialKey	ctermfg=235




"-------------------------------------------------------------------------------
" USEFUL SHORTCUTS
"-------------------------------------------------------------------------------
" Set leader to ,
let mapleader=","
let g:mapleader=","

" Window controls {{{
" Move to the left split
nmap <C-h> <C-w>h
" Move to the left split and maximize it; or, <bar>
"<--nmap <C-H> <C-w>h<C-w>|
" Moves the current window to full-height at far left
"<--nmap <C-H> <C-w>H

" Move to the right split
nmap <C-l> <C-w>l
" Move to the right split and maximize it
"<--nmap <C-L> <C-w>l<C-w>|
"<--nmap <C-L> <C-w>L

" Move to the below split
nnoremap <Down> <C-w>j
nmap <C-j> <C-w>j
" Move to the below split and maximize it
"<--nmap <C-J> <C-w>j<C-w>_
"<--nmap <C-J> <C-w>J

" Move to the above split
nnoremap <Up> <C-w>k
nmap <C-k> <C-w>k
" Move to the above split and maximize it
"<--nmap <C-K> <C-w>k<C-w>_
" Moves the current window to full-width at the very top
"<--nmap <C-K> <C-w>K

" hsplit: <C-w> <+|->
" vsplit: <C-w> <<|>>
" e.g.: 10 <C-w> +
nnoremap <leader><leader>h <C-w><
nnoremap <leader><leader>l <C-w>>
nnoremap <leader><leader>j <C-w>-
nnoremap <leader><leader>k <C-w>+

" Quit a window
"<--nnoremap <C-q> <C-w>q

" Set the min width of a window to 0 so we can maximize others
set wmw=0
" Set the min height of a window to 0 so we can maximize others
set wmh=0
" }}}

" Search hightlight {{{
" Toggle hiding
let s:hide_search = 0

" g:
function! ToggleHideSearch()
	"<--:set hlsearch
	if s:hide_search == 1
		let s:hide_search = 0
		:hi search term=reverse ctermfg=0 ctermbg=3 guibg=yellow
	else
		let s:hide_search = 1
		:hi search ctermbg=0 ctermfg=235 guifg=black guibg=black
	endif
endfunction

" noremap
nmap <SPACE>h :call ToggleHideSearch()<cr>
nmap <SPACE>c /\/\*\_.\{-}\*\/\n\{,1}\\|^\s*\/\/.*\n\|\s*\/\/.*\\|\/\/.*$\\|^\#if 0\_.\{-}\_.\{-}#endif<cr>

" Turn off search highlighting: ,/
"<--nmap <leader>/ :nohl<cr>
nmap <SPACE><SPACE> :noh<cr>
" }}}

" Toggle paste {{{
set pastetoggle=<leader><leader>p
" }}}

" Toggle colored right border after 80 chars {{{
set colorcolumn=81
let s:color_column_old = 0

function! s:ToggleColorColumn()
	if s:color_column_old == 0
		let s:color_column_old = &colorcolumn
		windo let &colorcolumn = 0
	else
		windo let &colorcolumn=s:color_column_old
		let s:color_column_old = 0
	endif
endfunction

nnoremap <Leader>8 :call <SID>ToggleColorColumn()<cr>
" }}}




"-------------------------------------------------------------------------------
" PROGRAMMING SHORTCUTS
"-------------------------------------------------------------------------------
" Ctrl-[ jump out of the tag stack (undo Ctrl-]) (Ctrl-T)
"map <C-[> <ESC>:po<CR>

vmap <leader><leader>f :s!^!//\\!<CR>:noh<CR>
vmap <leader><leader>d :s!^!//.!<CR>:noh<CR>
vmap <leader><leader>c :s!^!//!<CR>:noh<CR>
vmap <leader><leader>u :s!^//[\\|.]\=!!<CR>:noh<CR>




"-------------------------------------------------------------------------------
" ENCODING SETTINGS
"-------------------------------------------------------------------------------
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1

fun! ViewUTF8()
    set encoding=utf-8
    set termencoding=big5
endfun

fun! UTF8()
    set encoding=utf-8
    set termencoding=big5
    set fileencoding=utf-8
    set fileencodings=ucs-bom,big5,utf-8,latin1
endfun

fun! Big5()
    set encoding=big5
    set fileencoding=big5
endfun




"---------------------------------------------------------------------------
" PLUGIN SETTINGS
"---------------------------------------------------------------------------
" ------- Ctags {{{
set tags=./tags,tags;	"$HOME
"set tags+=$HOME/tags
"set autochdir
set noautochdir
"map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <F5> :!ctags --fields=+l --langmap=c:.c.h -L cscope.files<CR><CR>
" }}}


" ------- Taglist {{{
"<--map <F8> :Tlist<CR>
"<--let Tlist_Show_One_File=1
"<--let Tlist_Exit_OnlyWindow=1
" }}}


" ------- Cscope {{{
set cscopequickfix=s-,c-,d-,i-,t-,e-
map <F6> :!cscope -bkqR<CR>:cs reset<CR><CR>
" }}}


" ------- ToggleList {{{
let g:toggle_list_no_mappings = 1
"nnoremap <silent> <F9> :bot cwindow<cr>
nnoremap <script> <silent> <F9> :call ToggleQuickfixList()<cr>
"nnoremap <leader>n :cn<cr>
"nnoremap <leader>m :cN<cr>
map <F2> :cn<cr>
map <F1> :cN<cr>
" }}}


" ------- Customize grep {{{
" ack does not support regexes that match multiple lines
set grepprg=ack-grep\ --nogroup\ --column\ --ignore-file=is:tags\ --ignore-file=ext:map,orig,bkp,backup\ --ignore-file=match:'(cscope)+.*'\ $*
set grepformat=%f:%l:%c:%m

" $ sudo ln -s /usr/bin/ack-grep /usr/local/bin/ack
let g:ack_default_options = "
	\ -s -H --nocolor --nogroup --column
	\ --ignore-file=is:tags
	\ --ignore-file=ext:map,mod,orig,bkp,backup,dsp,dsw,ncb,opt,lst
	\ --ignore-file=match:'(cscope)+.*'
	\ "
" :Ack
" <F1> <F2>
" }}}


" ------- VisualMark {{{
" mm
" mm
" <F3> <F4>
" }}}


" ------- IndentLine {{{
" Vim
let g:indentLine_color_term = 239

"GVim
"let g:indentLine_color_gui = '#A4E57E'

" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

"let g:indentLine_loaded = 0
let g:indentLine_char = '|'
let g:indentLine_enabled = 1
let g:indentLine_showFirstIndentLevel = 0
" }}}


" ------- Rainbow {{{
" Put this on your .vimrc for loading it for specific file types:
" au FileType c,cpp,objc,objcpp call rainbow#load()
" or just this to enable it globally:
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'ctermfgs': ['darkgray', 'lightyellow', 'lightcyan', 'magenta', 'white', 'brown', 'lightgreen'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\        },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\        },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\           },
\       'css': 0,
\   }
\ }
" }}}


" ------- ExpandRegion {{{
call expand_region#custom_text_objects({
\   "\/\\n\\n\<CR>": 1,
\   'a]' :1,
\   'ab' :1,
\   'aB' :1,
\   'ii' :0,
\   'ai' :0,
\ })
" }}}

" ------- NERDTree {{{
nnoremap <silent> <F7> :NERDTreeToggle<CR>
" *source insight
let NERDTreeWinPos='left'
" }}}


" ------- MiniBufExplorer {{{
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1
"
"let g:miniBufExplMinSize = 1
"let g:miniBufExplMaxSize = 2
"map <Leader>mbe :MBEOpen<cr>
"map <Leader>mbc :MBEClose<cr>
"map <Leader>mbt :MBEToggle<cr>
" }}}


" ------- Command-T
"<--let g:CommandTMaxHeight = 15


" ------- TagBar {{{
" Toggle TagBar with F8
nmap <F8> :TagbarToggle<CR> 
"<--nnoremap <silent> <F8> :TagbarToggle<CR>
" Set focus to TagBar when opening it
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_sort = 0

let g:tagbar_ctags_bin='/usr/bin/ctags'
"<--let g:tagbar_left = 1
"<--let g:tagbar_vertical = 1

let g:tagbar_autopreview = 0
let g:tagbar_split = 1
" 'rightbelow', 'splitbelow'
let g:tagbar_previewwin_pos = 'rightbelow'
" }}}


" ------- SrcExpl {{{
" The switch of the Source Explorer 
nmap <F10> :SrcExplToggle<CR> 
"<--nnoremap <silent> <F10> :SrcExplToggle<CR>

" Set the height of Source Explorer window 
let g:SrcExpl_winHeight = 10

" // Set 100 ms for refreshing the Source Explorer 
let g:SrcExpl_refreshTime = 500

" // Set "Enter" key to jump into the exact definition context 
let g:SrcExpl_jumpKey = "<ENTER>" 

" // Set "Space" key for back from the definition context 
let g:SrcExpl_gobackKey = "<SPACE>" 

" // In order to avoid conflicts, the Source Explorer should know what plugins
" // except itself are using buffers. And you need add their buffer names into
" // below listaccording to the command ":buffers!"
" __Tagbar__, __Taglist__ 
let g:SrcExpl_pluginList = [
\   "__Tagbar__",
\   "_NERD_tree_",
\   "Source_Explorer"
\ ] 

" // Enable/Disable the local definition searching, and note that this is not 
" // guaranteed to work, the Source Explorer doesn't check the syntax for now. 
" // It only searches for a match with the keyword according to command 'gd' 
let g:SrcExpl_searchLocalDef = 1 

" // Do not let the Source Explorer update the tags file when opening 
let g:SrcExpl_isUpdateTags = 0 

" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to 
" // create/update the tags file 
"let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 
let g:SrcExpl_updateTagsCmd = "ctags -L cscope.files"

" // Set "<F5>" key for updating the tags file artificially 
let g:SrcExpl_updateTagsKey = "<C-F5>" 

" // Set "<F11>" key for displaying the previous definition in the jump list 
let g:SrcExpl_prevDefKey = "<F11>" 

" // Set "<F12>" key for displaying the next definition in the jump list 
let g:SrcExpl_nextDefKey = "<F12>" 
" }}}


" ------- SnipMate
"<--let g:snipMateAllowMatchingDot = 0


" ------- Syntastic {{{
"<--set statusline+=%#warningmsg#
"<--set statusline+=%{SyntasticStatuslineFlag()}
"<--set statusline+=%*
"<--let g:syntastic_always_populate_loc_list = 1
"<--let g:syntastic_auto_loc_list = 1
"<--let g:syntastic_check_on_open = 1
"<--let g:syntastic_check_on_wq = 0
"<--let g:syntastic_enable_signs = 1
"<--let g:syntastic_enable_highlighting = 1
" set error or warning signs
"<--let g:syntastic_error_symbol = "✗"
"<--let g:syntastic_warning_symbol = "w>"
" }}}


" ------- Omnicompletion {{{
" Popup menu doesn't select the first completion item, but rather just inserts 
" the longest common text of all matches; and the menu will come up even if
" there's only one match.
"<--set completeopt=longest,menuone
" Disable doc preview in omnicomplete
"<--set cot-=preview

" Enable omni completion. (Ctrl-X Ctrl-O)
"<--autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"<--autocmd FileType c set omnifunc=ccomplete#Complete

" Use syntax complete if nothing else available
"<--if has("autocmd") && exists("+omnifunc")
"<--    autocmd Filetype *
"<--        \ if &omnifunc == "" |
"<--        \         setlocal omnifunc=syntaxcomplete#Complete |
"<--        \ endif
"<--endif
" }}}


" ------- SuperTab {{{
" A real TAB is <C-v> <TAB>
"
"<--let g:SuperTabDefaultCompletionType = "context"
"<--let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
"<--let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
"<--let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
"let g:SuperTabDefaultCompletionType = "<C-Tab>"
" }}}


" ------- Clang {{{
	let g:clang_snippets = 1
	let g:clang_conceal_snippets = 1
	let g:clang_snippets_engine='clang_complete'
" }}}


" ------- YouCompleteMe {{{
"set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion = 2
"let g:ycm_min_num_identifier_candidate_chars = 0
let g:ycm_auto_trigger =1
" { '*': 1 }
let g:ycm_filetype_whitelist = {
	\ 'c': 1,
	\ }
"let g:ycm_filetype_blacklist = {
"	\}
"let g:ycm_filetype_specific_completion_to_disable = {
"	\}
let g:ycm_show_diagnostics_ui = 0
"let g:ycm_enable_diagnostic_signs = 1
"let g:ycm_enable_diagnostic_highlighting = 1
"let g:ycm_echo_current_diagnostic = 1
let g:ycm_error_symbol = 'x>'
let g:ycm_warning_symbol = '!>'
"let g:ycm_always_populate_location_list = 0
"let g:ycm_open_loclist_on_ycm_diags = 1
"let g:ycm_allow_changing_updatetime = 1
"let g:ycm_complete_in_comments = 0
"let g:ycm_complete_in_strings = 1
"let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_collect_identifiers_from_tags_files = 1
"	ctags --fields=+l --langmap=c:.c.h -L cscope.files
"let g:ycm_seed_identifiers_with_syntax = 0
"let g:ycm_extra_conf_vim_data = ['&filetype']				" []
"let g:ycm_path_to_python_interpreter = '/usr/bin/python'	" ' '
"let g:ycm_server_keep_logfiles = 0
"let g:ycm_server_log_level = 'info'
let g:ycm_auto_start_csharp_server = 0						" 1
let g:ycm_auto_stop_csharp_server = 0						" 1
let g:ycm_csharp_server_port = 0
let g:ycm_csharp_insert_namespace_expr = ''
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 0		" 0
let g:ycm_autoclose_preview_window_after_insertion = 0		" 0
let g:ycm_max_diagnostics_to_display = 10					" 30
let g:ycm_key_list_select_completion = ['<Down>', '<C-n>']	" '<TAB>', '<Down>'
let g:ycm_key_list_previous_completion = ['<Up>', '<C-m>']	" '<S-TAB>', '<Up>'
let g:ycm_key_invoke_completion = '<C-j>'					" <C-Space>
"let g:ycm_key_detailed_diagnostics = '<leader>d'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf = 1
"let g:ycm_extra_conf_globlist = []
let g:ycm_filepath_completion_use_working_dir = 0			" 0
let g:ycm_semantic_triggers = {
	\ 'c' : ['->', '.'],
	\ 'cpp,objcpp' : ['->', '.', '::'],
	\ 'perl' : ['->'],
	\ 'vim' : ['re![_a-zA-Z]+[_\w]*\.'],
	\ }
"let g:ycm_cache_omnifunc = 1
"let g:ycm_use_ultisnips_completer = 1
"let g:ycm_goto_buffer_command = 'same-buffer'
"let g:ycm_disable_for_files_larger_than_kb = 1000
"let g:ycm_python_binary_path = '/usr/bin/python3'

"<--nmap <C-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>"
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>g  :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>"
" }}}


" ------- vim-clang {{{
"set completeopt+=preview
"let g:clang_c_completeopt = 'longest,menuone,preview'
"let g:clang_cpp_completeopt = ''
"let g:clang_include_sysheaders = 0							" 1
"let g:clang_c_options = '-std=gnu99'
"let g:clang_dotfile = '.clang'								" '.clang'
"let g:clang_dotfile_overwrite = '.clang.ow'					" '.clang.ow'
"let g:clang_diagsopt = ''									" 'rightbelow'
"let g:clang_load_if_clang_dotfile = 1						" 0
" }}}


" ------- InsterestingWords {{{
let g:interestingWordsRandomiseColors = 0
let g:interestingWordsTermColors = ['154', '121', '211', '137', '214', '228']

"nnoremap <silent> <leader>m :call InterestingWords('n')<cr>
"nnoremap <silent> <leader>M :call UncolorAllWords()<cr>
"nnoremap <silent> n :call WordNavigation('forward')<cr>
"nnoremap <silent> N :call WordNavigation('backward')<cr>
" }}}


" ------- Airline {{{
" set status line
set laststatus=2

" enable tabline
let g:airline#extensions#tabline#enabled = 1
" set left separator
let g:airline#extensions#tabline#left_sep = ' '
" set left separator which are not editting
let g:airline#extensions#tabline#left_alt_sep = '|'
" show buffer number
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='wombat'

" enable powerline-fonts
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" switch buffers
"function! SwitchToNextBuffer(incr)
"	let help_buffer = (&filetype == 'help')
"	let current = bufnr("%")
"	let last = bufnr("$")
"	let new = current + a:incr
"	while 1
"		if new != 0 && bufexists(new) && ((getbufvar(new, "&filetype") == 'help') == help_buffer)
"			execute ":buffer ".new
"			break
"		else
"			let new = new + a:incr
"			if new < 1
"				let new = last
"			elseif new > last
"				let new = 1
"			endif
"			if new == current
"				break
"			endif
"		endif
"	endwhile
"endfunction
nnoremap <leader>l :ls<cr>
nnoremap <leader>d :bd<cr>
nnoremap <leader>D :bd!<cr>
nnoremap <silent> <leader>n :bn<cr>
nnoremap <silent> <leader>p :bp<cr>
nnoremap <silent> <Right> :bn<cr>
nnoremap <silent> <Left> :bp<cr>
"nnoremap <leader>n <C-n>
"nnoremap <leader>p <C-N>
"nnoremap <silent> <leader>n :call SwitchToNextBuffer(1)<cr>
"nnoremap <silent> <leader>p :call SwitchToNextBuffer(-1)<cr>
"nnoremap <leader>bd :bd<cr>
"nnoremap <leader>bb :b
" }}}


" ------- WinManager {{{
"let g:AutoOpenWinManager = 1
"let g:winManagerWindowLayout="NERDTree|TagBar"
"let g:NERDTree_title="[NERDTree]"
"
"nmap <C-m> :WMToggle<CR>
"
"function! NERDTree_Start()  
"    exec 'NERDTree'  
"endfunction
"
"function! NERDTree_IsValid()  
"        return 1  
"endfunction
" }}}


" ------- CtrlP {{{
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.tar,*.tgz,*.gz,*.xz,*.7z
set wildignore+=*.in,*.out,*.CAP,*.mci
set wildignore+=tags

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'ra'
"<--let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_user_command = ['cscope.files', 'cat %s/cscope.files']
let g:ctrlp_root_markers = ['cscope.files']
"<--let g:ctrlp_root_markers = '..'
let g:ctrlp_match_window_bottom=1
"<--let g:ctrlp_max_height=16
"<--let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=256
let g:ctrlp_follow_symlinks=1
"<--let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
\   'dir':  '\v[\/]\.(git|hg|svn)$',
\   'file': '\v\.(exe|so|dll)$',
\   'link': 'some_bad_symbolic_links',
\ }
" }}}


" ------- EasyMotion {{{
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
"nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
"<--nmap s <Plug>(easymotion-s2)
map <Leader>s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" }}}


" ------- MultipleCursors {{{
" To use I and A, switch to normal mode by pressing 'v' first
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-b>' "<C-p>: ctrlp
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"let g:multi_cursor_quit_key='<C-c>'
"nnoremap <C-c> :call multiple_cursors#quit()<cr>
" }}}
