"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

"set diffexpr=MyDiff()
"function MyDiff()
"  let opt = '-a --binary '
"  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"  let arg1 = v:fname_in
"  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"  let arg2 = v:fname_new
"  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"  let arg3 = v:fname_out
"  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"  if $VIMRUNTIME =~ ' '
"    if &sh =~ '\<cmd'
"      if empty(&shellxquote)
"        let l:shxq_sav = ''
"        set shellxquote&
"      endif
"      let cmd = '"' . $VIMRUNTIME . '\diff"'
"    else
"      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"    endif
"  else
"    let cmd = $VIMRUNTIME . '\diff'
"  endif
"  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
"  if exists('l:shxq_sav')
"    let &shellxquote=l:shxq_sav
"  endif
"endfunction

"vimscript filesettings ----- {{{
:augroup filetypevim
:autocmd!
:autocmd FileType vim setlocal foldmethod=marker
:augroup END
" }}}

"local leader and dropbox vimrc ----- {{{
:let maplocalleader = " "
:nnoremap <localleader>ev :vsplit $dropbox/vim/.vimrc<cr>
:nnoremap <localleader>sv :source $dropbox/vim/.vimrc<cr>
:set nocompatible
"}}}

"editor format settings ----- {{{
:set number
:set tabstop=4
:set softtabstop=4
:set expandtab
:set showcmd
"}}}

:inoremap jk <esc>
:inoremap <esc> <nop>

:nnoremap <localleader>" viw<esc>a"<esc>bi"<esc>lel
:nnoremap <localleader>' viw<esc>a'<esc>bi'<esc>lel
:nnoremap <localleader>[ viw<esc>a]<esc>bi[<esc>lel
:nnoremap <localleader>( viw<esc>a)<esc>bi(<esc>lel
:nnoremap <localleader>{ viw<esc>a}<esc>bi{<esc>lel

:nnoremap <localleader>rs viw<esc>lxbhxlel

:nnoremap <localleader>h <c-w>h
:nnoremap <localleader>j <c-w>j
:nnoremap <localleader>k <c-w>k
:nnoremap <localleader>l <c-w>l

:nnoremap H 0
:nnoremap L $

" javascript settings ----- {{{
:autocmd filetype javascript nnoremap <buffer> <localleader>c I//<esc>
" }}}
"
" python settings ----- {{{
:autocmd filetype python nnoremap <buffer> <localleader>c I#<esc>
" }}}

"cin( = change in parens
:onoremap in( :<c-u>normal! f(vi(<cr>
"cil( = change in last parens
:onoremap il( :<c-u>normal! F)vi(<cr>

" color formatting ----- {{{
:set cursorline
:highlight cursorline ctermbg=lightyellow ctermfg=black
:highlight Normal ctermbg=0 ctermfg=white
:highlight Comment ctermfg=darkgrey
:highlight Constant ctermfg=lightcyan
:highlight Label ctermfg=lightgreen
:highlight Identifier ctermfg=red
:highlight Statement ctermfg=lightmagenta
:highlight special ctermfg=lightgrey
:highlight Function ctermfg=lightgreen
" }}}

