set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
set nobackup " ��ֹ���������ļ�
set autoindent " �����Զ�����
set ts=4 "������tab���Ĵ�С
set guifont=Monaco:h13 " ��������
set nu! " �����к�

" ���ù������һ��ģʽ�������ʽ
"highlight MyCursorNVC gui=reverse guifg=RED guibg=NONE
"set guicursor=n-v-c:hor10-MyCursorNVC
"" ���ù�����ڲ���ģʽ�������ʽ
"highlight MyCursorNVC gui=reverse guifg=RED guibg=NONE
"set guicursor=i:hor10-MyCursorNVC

" ���ñ����ʽ
if has("multi_byte") 
    " UTF-8 ���� 
    set encoding=utf-8 
    set termencoding=utf-8 
    set formatoptions+=mM 
    set fencs=utf-8,gbk 
    if v:lang =~? '^/(zh/)/|/(ja/)/|/(ko/)' 
        set ambiwidth=double 
    endif 
    if has("win32") 
        source $VIMRUNTIME/delmenu.vim 
        source $VIMRUNTIME/menu.vim 
        language messages zh_CN.utf-8 
    endif 
else 
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte" 
endif


set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

filetype off
"Vundle��·��
set rtp+=$VIM/vimfiles/bundle/Vundle.vim
"����İ�װ·��
call vundle#begin('$VIM/vimfiles/bundle/')
 
" ����İ�װ
Plugin 'gmarik/Vundle.vim' " �������Ĳ��
Plugin 'L9' " L9��һ��vim-script�Ŀ�
Bundle 'taglist.vim'  
Bundle 'bling/vim-airline' 
Bundle 'Valloric/ListToggle'
Bundle 'scrooloose/syntastic' 
Bundle 'plasticboy/vim-markdown' 
Bundle 'javacomplete.vim' 
Bundle 'java_parser.vim' 

"Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'
Bundle 'OmniCppComplete'
"Bundle 'c.vim'
Bundle 'a.vim'
Bundle 'The-NERD-tree'
Bundle 'neocomplcache'
Bundle 'scrooloose/nerdcommenter'


" ����һ�ε�ǰĿ¼�����tags
map <F12> :!ctags -R --c++-kinds=+px --fields=+iaS --extra=+q .<CR>
"����Tlist�Ŀ�ݰ���
map <F4> :Tlist<CR>
"Taglist����
let Tlist_Show_One_File=1               " only show current file��s taglist
let Tlist_Exit_OnlyWindow=1             " if taglist is of the last windows, exit vim
let Tlist_Use_Right_Window=1            " show taglist at right
let Tlist_File_Fold_Auto_Close=1        " hide taglist if it��s not for current file
"����NERDtree�Ŀ�ݰ���
map <F3> :NERDTree<CR>
"a.vim������
nnoremap <silent> <F2> :A<CR>
call vundle#end()
filetype plugin indent on

" ͻ����ʾ��ǰ��
set cursorline              

"Toggle Menu and Toolbar ���ز˵���������
set guioptions-=m
set guioptions-=T
map <silent> <F5> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>
"full screenthe gvim ȫ����ʾ
if has('gui_running') && has("win32")
    map <F11> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
endif
imap <F11> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
au GUIEnter * simalt ~x


if has("gui_running")
    au GUIEnter * simalt ~x  " ��������ʱ�Զ����
    "winpos 20 20            " ָ�����ڳ��ֵ�λ�ã�����ԭ������Ļ���Ͻ�
    "set lines=20 columns=90 " ָ�����ڴ�С��linesΪ�߶ȣ�columnsΪ���
    "set guioptions-=m       " ���ز˵���
    "set guioptions-=T        " ���ع�����
    set guioptions-=L       " ������������
    set guioptions-=r       " �����Ҳ������
    set guioptions-=b       " ���صײ�������
    set showtabline=0       " ����Tab��
endif

"����cscope
if has("cscope")
"	set csprg=/usr/bin/cscope
	set csto=1
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	endif
	set csverb
endif
"set cscopequickfix=s-,c-,d-,i-,t-,e-
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
"omniComplete ����
"-- omnicppcomplete setting --
set completeopt=longest,menu,menuone
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype  in popup window
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_DisplayMode=1
"��ʾ�˵���Ĭ����ɫ��������
"highlight Pmenu guibg=darkgrey guifg=red
"highlight PmenuSel guibg=lightred guifg=black 

"nerdcommenter ע��
let g:mapleader = ","

"neocomplacache
let g:neocomplcache_enable_at_startup = 1  
let g:neocomplcache_enable_auto_select = 1 

"���omniComplete��cpp��׼��·��
set tags+=~/cppTags/cppTags
set tags+=~/cppTags/qtTags
set tags+=~/cppTags/cppunitTags

"powerline
set laststatus=2
let g:Powerline_symbols='unicode'
"�������������
set cursorline
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"�������������
set cursorcolumn
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white


" �����µ�����
"syntax enable
"set background=dark
"colorscheme solarized
colorscheme molokai 

"�Զ���ȫ������
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascr��pt set omnifunc=javascr��ptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

"vim airline ����
let g:airline_powerline_fonts = 1


