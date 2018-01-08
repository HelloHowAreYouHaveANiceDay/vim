" came with vim ----- {{{
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction
" }}}

"vundle ----- {{{
set nocompatible
filetype off

set rtp+=$dropbox/vim/bundle/Vundle.vim/

call vundle#begin('$dropbox/vim/plugins/')
let g:vundle#bundle_dir='$dropbox/vim/bundle/'

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-fugitive'
Plugin 'easymotion/vim-easymotion'
Plugin 'mtscout6/syntastic-local-eslint.vim'
Plugin 'posva/vim-vue'
" call vundle#configure#require(g:bundles)

call vundle#end()
filetype plugin indent on
"}}}

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
"}}}

"editor format settings ----- {{{
:set number
:set tabstop=2
:set softtabstop=2
:set shiftwidth=2
:set expandtab
:set showcmd
"}}}

" key remaps ----- {{{
:inoremap jk <esc>
:inoremap <esc> <nop>
:noremap <up> <nop>
:noremap <down> <nop>
:noremap <left> <nop>
:noremap <right> <nop>

:nnoremap <localleader>" viw<esc>a"<esc>bi"<esc>lel
:nnoremap <localleader>' viw<esc>a'<esc>bi'<esc>lel
:nnoremap <localleader>[ viw<esc>a]<esc>bi[<esc>lel
:nnoremap <localleader>( viw<esc>a)<esc>bi(<esc>lel
:nnoremap <localleader>{ viw<esc>a}<esc>bi{<esc>lel
:nnoremap <localleader>< viw<esc>a><esc>bi<<esc>lel

:nnoremap <localleader>rs viw<esc>lxbhxlel

:nnoremap <localleader>/ :noh<cr>

:nnoremap <localleader>h <c-w>h
:nnoremap <localleader>j <c-w>j
:nnoremap <localleader>k <c-w>k
:nnoremap <localleader>l <c-w>l

:nnoremap <localleader>sf 0f{a<cr><esc>O

:nnoremap H 0
:nnoremap L $
" }}}


" python settings ----- {{{
:autocmd filetype python nnoremap <buffer> <localleader>c I#<esc>
" }}}

"cin( = change in parens
:onoremap in( :<c-u>normal! f(vi(<cr>
"cil( = change in last parens
:onoremap il( :<c-u>normal! F)vi(<cr>

map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" color formatting ----- {{{
if !has("gui_running")
    set term=pcansi
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    set bs=indent,eol,start
    let g:airline_theme='base16'
    colorscheme gruvbox
endif
" }}}

" StatusLine Settings ----- {{{
set statusline+=%#warningmsg# 
set statusline+=%{SyntasticStatuslineFlag()} 
set statusline+=%*  
let g:syntastic_always_populate_loc_list = 1 
let g:syntastic_auto_loc_list = 1 
let g:syntastic_check_on_open = 1 
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
:nmap <localleader><localleader> <Plug>(easymotion-overwin-f)
" }}}
