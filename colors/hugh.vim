" Color setting {
   hi SignColumn    ctermfg=White	    ctermbg=black
   hi FoldColumn    ctermfg=cyan	    ctermbg=black
   hi Folded        ctermfg=7 ctermbg=4
   hi SpecialKey     term=bold  cterm=bold  ctermfg=4
   hi NonText        term=bold  cterm=bold  ctermfg=4
   hi Directory      term=bold  cterm=bold  ctermfg=6
   hi ErrorMsg       term=standout  cterm=bold  ctermfg=7  ctermbg=1
   hi IncSearch      term=reverse  cterm=reverse
   hi Search         term=reverse  ctermfg=0  ctermbg=6
   hi MoreMsg        term=bold  cterm=bold  ctermfg=2
   hi ModeMsg        term=bold  cterm=bold
   hi LineNr         term=underline  cterm=bold  ctermfg=3
   hi Question       term=standout  cterm=bold  ctermfg=2
   hi StatusLine     term=bold,reverse  cterm=bold,reverse
   hi StatusLineNC   term=reverse  cterm=reverse
   hi Title          term=bold  cterm=bold  ctermfg=5
   hi Visual         term=reverse  cterm=reverse
   hi VisualNOS      term=bold,underline  cterm=bold,underline
   hi WarningMsg     term=standout  cterm=bold  ctermfg=1
   hi WildMenu       term=standout  ctermfg=0  ctermbg=3

	hi Comment        		cterm=bold		ctermfg=4
	hi Constant			cterm=bold		ctermfg=1 "
	hi Identifier			cterm=bold		ctermfg=6
" if else, while
	hi Statement			cterm=none		ctermfg=1
	hi PreProc			cterm=bold		ctermfg=5
	hi Type				cterm=bold		ctermfg=2
" <
	hi Special			cterm=bold		ctermfg=3
	hi underlined			cterm=none		ctermfg=7
	hi Error			cterm=bold		ctermfg=7       ctermbg=1

	hi Ignore						ctermfg=0
	hi Todo							ctermfg=0	ctermbg=6

	hi Macro			cterm=none		ctermfg=3
	hi Function			cterm=none		ctermfg=3
	hi Delimiter			cterm=none		ctermfg=3
	hi Operator			cterm=none		ctermfg=3

"	hi cBracket			cterm=none		ctermfg=5
	hi cCommentL			cterm=bold		ctermfg=6
	hi cFunction			cterm=none		ctermfg=2 "
	hi cPointerOperator		cterm=bold		ctermfg=2 "
	hi cStatement			cterm=none              ctermfg=1
	hi cLabel			cterm=none              ctermfg=1
	hi cConditional			cterm=none              ctermfg=1
	hi cRepeat			cterm=none              ctermfg=1
	hi cMathOperator		cterm=none		ctermfg=5 "
	hi cLogicOperator		cterm=none		ctermfg=5 "
	hi cBinaryOperator		cterm=none		ctermfg=5 "
"sizeof
	hi cOperator			cterm=bold		ctermfg=3 "
	hi cParen						ctermfg=3
" %08x	
	hi cFormat			cterm=bold		ctermfg=0 "
" void, uint32_t	
	hi cType			cterm=bold		ctermfg=2 "
	hi cMultiGroup						ctermfg=3
	hi cNumber			cterm=none		ctermfg=1 "
	hi cCharacter			cterm=inverse		ctermfg=7 "
	hi cString			cterm=bold		ctermfg=0 "
	hi cConstant			cterm=bold		ctermfg=1 "
" #include
	hi cIncluded			cterm=none		ctermfg=4 "
	hi cInclude			cterm=bold		ctermfg=2 "
" #define
	hi cDefine			cterm=bold		ctermfg=2 "
" #ifdef
	hi cPrecondit			cterm=bold		ctermfg=5 "

    hi TabLine guibg=#566676 guifg=fg gui=underline ctermbg=7
    hi TabLineFill guibg=#c0d0e0 guifg=bg gui=none
    hi TabLineSel guibg=bg guifg=fg gui=bold ctermbg=1
    hi Cursor guibg=#cd4e00 guifg=bg gui=none ctermbg=3
    hi CursorColumn guibg=#dbdbdb gui=none ctermbg=yellow
    hi CursorLine guibg=#dbdbdb gui=none
    "highlight Pmenu ctermfg=1 ctermbg=4 guibg=grey30
    hi PmenuSel     ctermfg=1 ctermbg=7 guibg=grey30
"}

